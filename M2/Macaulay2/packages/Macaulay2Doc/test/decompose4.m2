-- This one seems fixed.  10-12-09.
-- This one has been broken for a while (2013-04-03), crashing in Singular code.  Disabled for a while:
-- if version#"VERSION" <= "1.6" then 
end

kk = QQ[a..d]
I = ideal"1/2a2bc-2/3c2,a-b"
assert(
     decompose I == {ideal(a-b,c), ideal(a-b,3*b^3-4*c)}
     or
     decompose I == {ideal(a-b,3*b^3-4*c), ideal(a-b,c)}
     )

kk = QQ
R = kk[w_(4,0), w_(3,0), w_(2,2), x]
J = ideal(w_(4,0)*x-4*w_(3,0)*x+4*w_(2,2)^2-4*w_(2,2)*x-48*w_(2,2)+3*x^2+16*x+144,2*w_(4,0)*w_(2,2)-12*w_(4,0)+3*w_(3,0)*x-4*w_(3,0)-4*w_(2,2)^2+4*w_(2,2)*x+48*w_(2,2)-3*x^2-16*x-144,w_(4,0)*w_(3,0)-10*w_(3,0)*x-8*w_(3,0)+16*w_(2,2)^2-14*w_(2,2)*x-184*w_(2,2)+9*x^2+40*x+528,w_(4,0)^2-8*w_(4,0)-20*w_(3,0)*x-48*w_(3,0)+40*w_(2,2)^2-32*w_(2,2)*x-448*w_(2,2)+19*x^2+72*x+1264,(1/4)*w_(3,0)^2*x-w_(3,0)*w_(2,2)^2+(1/2)*w_(3,0)*w_(2,2)*x+10*w_(3,0)*w_(2,2)-(1/2)*w_(3,0)*x^2-4*w_(3,0)*x-24*w_(3,0)+w_(2,2)^2*x-(1/2)*w_(2,2)*x^2-10*w_(2,2)*x+(1/4)*x^3+28*x,-2*w_(3,0)*w_(2,2)-w_(3,0)*x+12*w_(3,0)+x^2+4*x,4*w_(3,0)^2-16*w_(3,0)*x+16*w_(2,2)^2-16*w_(2,2)*x-192*w_(2,2)+12*x^2+64*x+576,-(1/8)*w_(3,0)*w_(2,2)*x^2+w_(3,0)*x^2+(1/2)*w_(2,2)^3*x-(1/4)*w_(2,2)^2*x^2-9*w_(2,2)^2*x+(1/8)*w_(2,2)*x^3+2*w_(2,2)*x^2+54*w_(2,2)*x-2*x^3-3*x^2-108*x,(1/2)*w_(3,0)*w_(2,2)*x^2+(1/8)*w_(3,0)*x^3-(7/2)*w_(3,0)*x^2-w_(2,2)^3*x+(1/2)*w_(2,2)^2*x^2+18*w_(2,2)^2*x-(1/4)*w_(2,2)*x^3-4*w_(2,2)*x^2-108*w_(2,2)*x-(1/8)*x^4+(7/2)*x^3+6*x^2+216*x,(1/64)*w_(3,0)^2*x^2-(1/8)*w_(3,0)*w_(2,2)^2*x+(1/16)*w_(3,0)*w_(2,2)*x^2+(5/4)*w_(3,0)*w_(2,2)*x-(1/32)*w_(3,0)*x^3-(1/2)*w_(3,0)*x^2-(5/2)*w_(3,0)*x+(1/4)*w_(2,2)^4-(1/4)*w_(2,2)^3*x-5*w_(2,2)^3+(3/16)*w_(2,2)^2*x^2+(7/2)*w_(2,2)^2*x+36*w_(2,2)^2-(1/16)*w_(2,2)*x^3-(9/4)*w_(2,2)*x^2-17*w_(2,2)*x-108*w_(2,2)+(1/64)*x^4+(1/2)*x^3+(9/2)*x^2+30*x+108,-(1/8)*w_(3,0)*w_(2,2)*x+w_(3,0)*x+(1/2)*w_(2,2)^3-(1/4)*w_(2,2)^2*x-9*w_(2,2)^2+(1/8)*w_(2,2)*x^2+2*w_(2,2)*x+54*w_(2,2)-2*x^2-3*x-108,-(1/16)*w_(3,0)^2*x^2+(3/8)*w_(3,0)*w_(2,2)^2*x-(1/4)*w_(3,0)*w_(2,2)*x^2-4*w_(3,0)*w_(2,2)*x+(1/8)*w_(3,0)*x^3+2*w_(3,0)*x^2+10*w_(3,0)*x-(1/2)*w_(2,2)^4+(3/4)*w_(2,2)^3*x+11*w_(2,2)^3-(5/8)*w_(2,2)^2*x^2-12*w_(2,2)^2*x-90*w_(2,2)^2+(1/4)*w_(2,2)*x^3+7*w_(2,2)*x^2+65*w_(2,2)*x+324*w_(2,2)-(1/16)*x^4-2*x^3-18*x^2-120*x-432,(1/2)*w_(3,0)*w_(2,2)*x+(1/8)*w_(3,0)*x^2-(7/2)*w_(3,0)*x-w_(2,2)^3+(1/2)*w_(2,2)^2*x+18*w_(2,2)^2-(1/4)*w_(2,2)*x^2-4*w_(2,2)*x-108*w_(2,2)-(1/8)*x^3+(7/2)*x^2+6*x+216,(1/4)*w_(3,0)^2*x^2-w_(3,0)*w_(2,2)^2*x+w_(3,0)*w_(2,2)*x^2+12*w_(3,0)*w_(2,2)*x-(1/2)*w_(3,0)*x^3-7*w_(3,0)*x^2-36*w_(3,0)*x+w_(2,2)^4-2*w_(2,2)^3*x-24*w_(2,2)^3+2*w_(2,2)^2*x^2+34*w_(2,2)^2*x+216*w_(2,2)^2-w_(2,2)*x^3-22*w_(2,2)*x^2-192*w_(2,2)*x-864*w_(2,2)+(1/4)*x^4+6*x^3+61*x^2+360*x+1296,-(1/8)*w_(3,0)*w_(2,2)*x^3+w_(3,0)*x^3+(1/2)*w_(2,2)^3*x^2-(1/4)*w_(2,2)^2*x^3-9*w_(2,2)^2*x^2+(1/8)*w_(2,2)*x^4+2*w_(2,2)*x^3+54*w_(2,2)*x^2-2*x^4-3*x^3-108*x^2,(1/2)*w_(3,0)*w_(2,2)*x^3+(1/8)*w_(3,0)*x^4-(7/2)*w_(3,0)*x^3-w_(2,2)^3*x^2+(1/2)*w_(2,2)^2*x^3+18*w_(2,2)^2*x^2-(1/4)*w_(2,2)*x^4-4*w_(2,2)*x^3-108*w_(2,2)*x^2-(1/8)*x^5+(7/2)*x^4+6*x^3+216*x^2,(1/64)*w_(3,0)^2*x^4-(1/8)*w_(3,0)*w_(2,2)^2*x^3+(1/16)*w_(3,0)*w_(2,2)*x^4+(5/4)*w_(3,0)*w_(2,2)*x^3-(1/32)*w_(3,0)*x^5-(1/2)*w_(3,0)*x^4-(5/2)*w_(3,0)*x^3+(1/4)*w_(2,2)^4*x^2-(1/4)*w_(2,2)^3*x^3-5*w_(2,2)^3*x^2+(3/16)*w_(2,2)^2*x^4+(7/2)*w_(2,2)^2*x^3+36*w_(2,2)^2*x^2-(1/16)*w_(2,2)*x^5-(9/4)*w_(2,2)*x^4-17*w_(2,2)*x^3-108*w_(2,2)*x^2+(1/64)*x^6+(1/2)*x^5+(9/2)*x^4+30*x^3+108*x^2,-(1/16)*w_(3,0)^2*x^4+(3/8)*w_(3,0)*w_(2,2)^2*x^3-(1/4)*w_(3,0)*w_(2,2)*x^4-4*w_(3,0)*w_(2,2)*x^3+(1/8)*w_(3,0)*x^5+2*w_(3,0)*x^4+10*w_(3,0)*x^3-(1/2)*w_(2,2)^4*x^2+(3/4)*w_(2,2)^3*x^3+11*w_(2,2)^3*x^2-(5/8)*w_(2,2)^2*x^4-12*w_(2,2)^2*x^3-90*w_(2,2)^2*x^2+(1/4)*w_(2,2)*x^5+7*w_(2,2)*x^4+65*w_(2,2)*x^3+324*w_(2,2)*x^2-(1/16)*x^6-2*x^5-18*x^4-120*x^3-432*x^2,(1/4)*w_(3,0)^2*x^4-w_(3,0)*w_(2,2)^2*x^3+w_(3,0)*w_(2,2)*x^4+12*w_(3,0)*w_(2,2)*x^3-(1/2)*w_(3,0)*x^5-7*w_(3,0)*x^4-36*w_(3,0)*x^3+w_(2,2)^4*x^2-2*w_(2,2)^3*x^3-24*w_(2,2)^3*x^2+2*w_(2,2)^2*x^4+34*w_(2,2)^2*x^3+216*w_(2,2)^2*x^2-w_(2,2)*x^5-22*w_(2,2)*x^4-192*w_(2,2)*x^3-864*w_(2,2)*x^2+(1/4)*x^6+6*x^5+61*x^4+360*x^3+1296*x^2,-(1/8)*w_(3,0)*w_(2,2)*x^4+w_(3,0)*x^4+(1/2)*w_(2,2)^3*x^3-(1/4)*w_(2,2)^2*x^4-9*w_(2,2)^2*x^3+(1/8)*w_(2,2)*x^5+2*w_(2,2)*x^4+54*w_(2,2)*x^3-2*x^5-3*x^4-108*x^3,-(1/8)*w_(3,0)*x^5-(1/2)*w_(3,0)*x^4-w_(2,2)^3*x^3+(1/2)*w_(2,2)^2*x^4+18*w_(2,2)^2*x^3-(1/4)*w_(2,2)*x^5-4*w_(2,2)*x^4-108*w_(2,2)*x^3+(1/8)*x^6+(9/2)*x^5+6*x^4+216*x^3,(1/64)*w_(3,0)^2*x^6-(1/8)*w_(3,0)*w_(2,2)^2*x^5+(1/16)*w_(3,0)*w_(2,2)*x^6+(5/4)*w_(3,0)*w_(2,2)*x^5-(1/32)*w_(3,0)*x^7-(7/2)*w_(3,0)*x^5-12*w_(3,0)*x^4+(1/4)*w_(2,2)^4*x^4-(1/4)*w_(2,2)^3*x^5-w_(2,2)^3*x^4-24*w_(2,2)^3*x^3+(3/16)*w_(2,2)^2*x^6+(3/2)*w_(2,2)^2*x^5-24*w_(2,2)^2*x^4+432*w_(2,2)^2*x^3-(1/16)*w_(2,2)*x^7-(5/4)*w_(2,2)*x^6-7*w_(2,2)*x^5+228*w_(2,2)*x^4-2592*w_(2,2)*x^3+(1/64)*x^8-(21/2)*x^6+114*x^5-612*x^4+5184*x^3,w_(2,2)^4*x^4-24*w_(2,2)^3*x^4-2*w_(2,2)^2*x^5+216*w_(2,2)^2*x^4-4*w_(2,2)*x^6+24*w_(2,2)*x^5-864*w_(2,2)*x^4-x^7+25*x^6-72*x^5+1296*x^4)
I = ideal(2*w_(2,2)+x-12,w_(3,0)*x+4*w_(3,0))
L = I+J
C = decompose L -- used to crash
assert(
     C == {ideal(x+4,w_(3,0)^2+16*w_(3,0)+128,w_(4,0)-4*w_(3,0)-32,w_(2,2)-8), 
     ideal(x,w_(3,0),w_(4,0)-4,w_(2,2)-6)}
     )

S = QQ[a..d]
L = ideal"2c+d-12,
    bd+4b,
    4c2+ad-4bd-4cd+3d2-48c+16d+144,
    2ac-4c2+3bd+4cd-3d2-12a-4b+48c-16d-144,
    ab+16c2-10bd-14cd+9d2-8b-184c+40d+528,
    a2+40c2-20bd-32cd+19d2-8a-48b-448c+72d+1264,
    -bc2+(1/4)b2d+(1/2)bcd+c2d-(1/2)bd2-(1/2)cd2+(1/4)d3+10bc-4bd-10cd-24b+28d,
    -2bc-bd+d2+12b+4d,
    4b2+16c2-16bd-16cd+12d2-192c+64d+576,
    (1/2)c3d-(1/8)bcd2-(1/4)c2d2+(1/8)cd3-9c2d+bd2+2cd2-2d3+54cd-3d2-108d,
    -c3d+(1/2)bcd2+(1/2)c2d2+(1/8)bd3-(1/4)cd3-(1/8)d4+18c2d-(7/2)bd2-4cd2+(7/2)d3-108cd+6d2+216d,
    (1/4)c4-(1/8)bc2d-(1/4)c3d+(1/64)b2d2+(1/16)bcd2+(3/16)c2d2-(1/32)bd3-(1/16)cd3+(1/64)d4-5c3+(5/4)bcd+(7/2)c2d-(1/2)bd2-(9/4)cd2+(1/2)d3+36c2-(5/2)bd-17cd+(9/2)d2-108c+30d+108,
    (1/2)c3-(1/8)bcd-(1/4)c2d+(1/8)cd2-9c2+bd+2cd-2d2+54c-3d-108,
    -(1/2)c4+(3/8)bc2d+(3/4)c3d-(1/16)b2d2-(1/4)bcd2-(5/8)c2d2+(1/8)bd3+(1/4)cd3-(1/16)d4+11c3-4bcd-12c2d+2bd2+7cd2-2d3-90c2+10bd+65cd-18d2+324c-120d-432,
    -c3+(1/2)bcd+(1/2)c2d+(1/8)bd2-(1/4)cd2-(1/8)d3+18c2-(7/2)bd-4cd+(7/2)d2-108c+6d+216,
    c4-bc2d-2c3d+(1/4)b2d2+bcd2+2c2d2-(1/2)bd3-cd3+(1/4)d4-24c3+12bcd+34c2d-7bd2-22cd2+6d3+216c2-36bd-192cd+61d2-864c+360d+1296,
    (1/2)c3d2-(1/8)bcd3-(1/4)c2d3+(1/8)cd4-9c2d2+bd3+2cd3-2d4+54cd2-3d3-108d2,
    -c3d2+(1/2)bcd3+(1/2)c2d3+(1/8)bd4-(1/4)cd4-(1/8)d5+18c2d2-(7/2)bd3-4cd3+(7/2)d4-108cd2+6d3+216d2,
    (1/4)c4d2-(1/8)bc2d3-(1/4)c3d3+(1/64)b2d4+(1/16)bcd4+(3/16)c2d4-(1/32)bd5-(1/16)cd5+(1/64)d6-5c3d2+(5/4)bcd3+(7/2)c2d3-(1/2)bd4-(9/4)cd4+(1/2)d5+36c2d2-(5/2)bd3-17cd3+(9/2)d4-108cd2+30d3+108d2,
    -(1/2)c4d2+(3/8)bc2d3+(3/4)c3d3-(1/16)b2d4-(1/4)bcd4-(5/8)c2d4+(1/8)bd5+(1/4)cd5-(1/16)d6+11c3d2-4bcd3-12c2d3+2bd4+7cd4-2d5-90c2d2+10bd3+65cd3-18d4+324cd2-120d3-432d2,
    c4d2-bc2d3-2c3d3+(1/4)b2d4+bcd4+2c2d4-(1/2)bd5-cd5+(1/4)d6-24c3d2+12bcd3+34c2d3-7bd4-22cd4+6d5+216c2d2-36bd3-192cd3+61d4-864cd2+360d3+1296d2,
    (1/2)c3d3-(1/8)bcd4-(1/4)c2d4+(1/8)cd5-9c2d3+bd4+2cd4-2d5+54cd3-3d4-108d3,
    -c3d3+(1/2)c2d4-(1/8)bd5-(1/4)cd5+(1/8)d6+18c2d3-(1/2)bd4-4cd4+(9/2)d5-108cd3+6d4+216d3,
    (1/4)c4d4-(1/8)bc2d5-(1/4)c3d5+(1/64)b2d6+(1/16)bcd6+(3/16)c2d6-(1/32)bd7-(1/16)cd7+(1/64)d8-c3d4+(5/4)bcd5+(3/2)c2d5-(5/4)cd6-24c3d3-24c2d4-(7/2)bd5-7cd5-(21/2)d6+432c2d3-12bd4+228cd4+114d5-2592cd3-612d4+5184d3,
    c4d4-24c3d4-2c2d5-4cd6-d7+216c2d4+24cd5+25d6-864cd4-72d5+1296d4"
C = decompose L
assert(C == {ideal(d+4,b^2+16*b+128,a-4*b-32,c-8), ideal(d,b,a-4,c-6)})

end
-- boiled down version of "used to crash" example above (jan 2013)
kk = QQ
S = kk[a,b,c,d]
J = ideal(4*c^2+a*d-4*b*d-4*c*d+3*d^2-48*c+16*d+144,2*a*c-4*c^2+3*b*d+4*c*d-3*d^2-12*a-4*b+48*c-16*d-144,-b*c^2+(1/4)*b^2*d+(1/2)*b*c*d+c^2*d-(1/2)*b*d^2-(1/2)*c*d^2+(1/4)*d^3+10*b*c-4*b*d-10*c*d-24*b+28*d)
irreducibleCharacteristicSeries J -- crashes

decompose J  -- crashes
decompose trim J  -- ok
debug Core

     T = kk ( monoid [ Variables => S.generatorSymbols, Degrees => (degrees S), MonomialOrder => Lex, Heft => heft S ] )
     m1 = sub(m, vars T)
     rawCharSeries raw m1

-- Here is a simple crash:
kk = QQ
S = kk[a,b,c,d, MonomialOrder=>Lex]
J = ideal(4*c^2+a*d-4*b*d-4*c*d+3*d^2-48*c+16*d+144,2*a*c-4*c^2+3*b*d+4*c*d-3*d^2-12*a-4*b+48*c-16*d-144,-b*c^2+(1/4)*b^2*d+(1/2)*b*c*d+c^2*d-(1/2)*b*d^2-(1/2)*c*d^2+(1/4)*d^3+10*b*c-4*b*d-10*c*d-24*b+28*d)
J1 = ideal(J_0, J_1, 4*J_2)
  -- the only difference between J and J1 is the factor of 4 on the last generator of J
debug Core
rawCharSeries raw gens J1 -- works
rawCharSeries raw gens J -- not so much
------------------------------
