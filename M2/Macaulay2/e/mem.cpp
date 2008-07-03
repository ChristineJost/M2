// (c) 1995  Michael E. Stillman

#include "style.hpp"
#include "mem.hpp"
#include "text-io.hpp"

static int allocated_amount = 0;
static int deleted_amount = 0;

const int trace_bad_deletes = 0;

int slab::n_slabs = 0;

stash *stash::stash_list = NULL;
slab *stash::slab_freelist = NULL;
long stash::n_new_slabs = 0;

doubling_stash *doubles = NULL;

stash::stash(const char *s, size_t len)
: next(NULL), name(s), slabs(NULL), free_list(NULL),
  n_allocs(0), n_inuse(0), highwater(0), n_frees(0)
{
  // Make sure element_size is a multiple of the word size.
  if (len <= 0) len = word_size;
  element_size = word_size * ((len + word_size - 1) / word_size);
  n_per_slab = (slab_size - sizeof(void *)) / element_size;
  this->next = stash_list;
  stash_list = this;

  //  if (n_new_slabs == 0)
  //    for ( ; n_new_slabs < 855; n_new_slabs++)
  //      {
  //	slab *p = new slab;
  //	p->next = slab_freelist;
  //	slab_freelist = p;
  //      }
}

stash::~stash()
{
  while (slabs != NULL)
    {
      slab *p = slabs;
      slabs = slabs->next;
#if 1
      GC_FREE(p);		// this dramatically improves our memory usage
#else
      bzero(p,sizeof(*p));      // we clear the slab because it's free, and it may contain words that look like pointers to gc
      // ... but I don't know why this doesn't work as well!  See bugs/mike/1-gc-leak.m2
      p->next = slab_freelist;
      slab_freelist = p;
#endif
      //printf("removed %p\n", p);
    }
  assert(stash_list != NULL);
  if (stash_list == this)
    stash_list = next;
  else 
    {
      for (stash *q = stash_list; q->next != NULL; q = q->next)
	if (q->next == this)
	  {
	    q->next = next;
	    next = NULL;
	    return;
	  }
      assert(0);
    }
}


void stash::chop_slab()
{
  // grab a new slab, and chop it into element_size pieces, placing them
  // onto the free list.

  slab *new_slab;
  if (slab_freelist == NULL)
    {
      n_new_slabs++;
      new_slab = new slab;
      //      printf("new %p\n", new_slab);
      //new_slab = new slab;
      //printf("new %p\n", new_slab);
      //new_slab = new slab;
      //printf("new %p\n", new_slab);
    }
  else
    {
      new_slab = slab_freelist;
      slab_freelist = new_slab->next;
      //printf("reused %p\n", new_slab);
    }
  
  new_slab->next = slabs;
  slabs = new_slab;

  // Time to chop it up.

  char *prev = NULL;
  char *current = slabs->s;
  for (int i=0; i<n_per_slab; i++)
    {
      *(reinterpret_cast<char **>(current)) = prev;
      prev = current;
      current += element_size;
    }
  free_list = prev;
}

void stash::text_out(buffer &o) const
    // Display statistics about this stash.
{
  char s[200];
  sprintf(s, "%16s %9dk %9dk %10d %10d %10d %10d %10d%s",
	  name, 
	  static_cast<int>((element_size * highwater + 1023)/1024),
	  static_cast<int>((element_size * n_inuse + 1023)/1024),
	  static_cast<int>(element_size),
	  n_allocs,
	  n_inuse,
	  highwater,
	  n_frees,
	  newline);
  o << s;
}

unsigned int engine_allocated = 0;
unsigned int engine_highwater = 0;

int stash::num_slab_freelist() {
     int i=0;
     for (slab *p = stash::slab_freelist; p != NULL; p=p->next) i++;
     return i;
}

void stash::stats(buffer &o)
{
//  o << "total space allocated from system = " << engine_allocated << endl;
//  o << "number of global delete's  = " << engine_dealloc << endl;
  int n = (slab::n_slabs*slab_size)/1024 + 
    (allocated_amount - deleted_amount)/1024;
  o << "number of slabs = " << n_new_slabs << newline;
  o << "size of each slabs = " << sizeof(slab) << newline;
  o << "total allocated = " << n_new_slabs * sizeof(slab) << newline;
  o << "total engine space allocated = " 
    << n << "k" << newline;
  int m = num_slab_freelist();
  o << "number of free slabs = " << m << " containing " << m*slab_size << " bytes" << newline;

  char s[200];
  sprintf(s, "%16s %10s %10s %10s %10s %10s %10s %10s%s",
	  "stash",
	  "k total",
	  "k in use",
	  "size",
	  "nalloc",
	  "inuse",
	  "highwater",
	  "freed",
	  newline);
  o << s;

  for (stash *p = stash_list; p != NULL; p = p->next)
    //    if (p->n_allocs > 0)
      p->text_out(o);

}

//--------- Doubling Stashes -----------------------------------------

doubling_stash::doubling_stash()
{
  int size = 2;
  for (int i=0; i<NDOUBLES; i++)
    {
      size *= 2;
      doubles[i] = new stash("double", sizeof(int)*(size+1));
      double_size[i] = sizeof(int)*size;
    }
}

doubling_stash::~doubling_stash()
{
  for (int i=0; i<NDOUBLES; i++)
    {
      if (doubles[i] != NULL)
	emit("internal warning -- deleting a double stash");
      deleteitem(doubles[i]);
    }
}

void *doubling_stash::new_elem(size_t size)
     // size is in chars
{
  // first find the correct stash
  int st = 0;
  while (double_size[st] < size) st++;

  int *result = reinterpret_cast<int *>(doubles[st]->new_elem());
  result[0] = st;
  result++;
  return reinterpret_cast<void *>(result);
}

void doubling_stash::delete_elem(void *p)
{
  if (p == NULL) return;
  int *q = (int *) p;
  q--;
  doubles[*q]->delete_elem(q);
}

size_t doubling_stash::allocated_size(void *p)
{
  int *q = reinterpret_cast<int *>(p);
  assert(q[-1] >= 0);
  assert(q[-1] <= NDOUBLES);
  return double_size[q[-1]];
}

// Local Variables:
// compile-command: "make -C $M2BUILDDIR/Macaulay2/e "
// End:
