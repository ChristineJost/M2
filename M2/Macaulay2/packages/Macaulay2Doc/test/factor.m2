assert( factor 100! 
     ===
     new Product from {new Power from {2,97},new Power from {3,48},new Power from {5,24},new Power from {7,16},new Power from {11,9},new Power from
     {13,7},new Power from {17,5},new Power from {19,5},new Power from {23,4},new Power from {29,3},new Power from {31,3},new Power from {37,2},new Power
     from {41,2},new Power from {43,2},new Power from {47,2},new Power from {53,1},new Power from {59,1},new Power from {61,1},new Power from {67,1},new
     Power from {71,1},new Power from {73,1},new Power from {79,1},new Power from {83,1},new Power from {89,1},new Power from {97,1}}
     )

ZZ[x..z]
f = (x+3*y-14)^15*(x^2+y^4+z^7-x*y-13*x*z^2+12)^3;
factor f
collectGarbage ()					    -- GC_check_heap_block: found smashed heap objects:

-- an example in the Dmodules package depends on this:
ZZ[s]
g = (s - 2)*(2*s - 3)*(4*s - 9)*(4*s - 7)*(6*s - 13)*(6*s - 11)*(12*s - 25)*(12*s - 23)*(12*s - 19)*(12*s - 17)*2^80*3^28
assert( g == 
     660651230990549037211189767170547549147758592*s^10-12222047773325157188407010692655129659233533952*s^9+101506308928235398946510927768391420311764992000
     *s^8-498367302739068510692073030786935096493389905920*s^7+1601817440632161983261886133193514130506069835776*s^6-
     3521630937046700719543676711431010861718423207936*s^5+5363186929439589281529115564680267681809144217600*s^4-
     5586538421157873781624671997247858146490481377280*s^3+3809049226223227357406573457631994647911472300032*s^2-
     1535036180013100998866802012477932028046514061312*s+277647002779575917914460964010185396568090214400 )
factor g
assert( # factor g == 11 )

-- factoring over finite fields
GF 4[x]
assert ( factor (x^9-1) === 
     new Product from {new Power from {x+a,1},new Power from {x+a+1,1},new
        Power from {x+1,1},new Power from {x^3+a,1},new Power from {x^3+a+1,1}}
   	)

-- factoring over extension fields
ZZ/101[x,a]
debug Core
t = rawFactor ( raw(x^4 - 2), raw(a^2 - 2) )
assert( t === ((raw (x^2-a), raw (x^2+a)), (1,1)))


-- factoring a Laurent polynomial
R=ZZ[x,MonomialOrder=>Lex,Inverses=>true];
b=(x+1+x^(-1))*(2+x^(-2)+x^(-1));
r=factor b
assert (# r == 3 )
assert (r === new Product from 
     {    new Power from {x^2+x+1,1},
	  new Power from {2*x^2+x+1,1},
	  new Power from {x^(-3),1}})

-- isPrime

R=ZZ[x];

assert(isPrime x);
assert(isPrime (3_R));
assert(not isPrime (3*x));

R=QQ[x];
assert(isPrime (3*x));
assert(not isPrime (3_R));
