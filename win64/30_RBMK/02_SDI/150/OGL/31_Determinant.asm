Determinant proc

;Fastcall:
;xmm0 = [a03 a02 a01 a00]
;xmm1 = [a13 a12 a11 a10]
;xmm2 = [a23 a22 a21 a20]
;Preserved
;xmm3 = [??? ??? ??? detA]
;xmm4 = [???  b2  b1  b0]
;Accessible
;xmm5..xmm7
;Output:
;xmm0 = [??? ??? ??? det]

;XMM Comment Order: little-endian

;det
;= a00*(a11*a22 - a12*a21)
;+ a01*(a12*a20 - a10*a22)
;+ a02*(a10*a21 - a11*a20)

;A = [a13, a10, a12, a11]
movaps xmm5,xmm1
shufps xmm5,xmm5,11001001b

;B = [a23, a21, a20, a22]
movaps xmm6,xmm2
shufps xmm6,xmm6,11010010b

;A*B = [a13*a23, a10*a21, a12*a20, a11*a22]
mulps xmm5,xmm6

;C = [a13, a11, a10, a12]
movaps xmm6,xmm1
shufps xmm6,xmm6,11010010b

;D = [a23, a20, a22, a21]
movaps xmm7,xmm2
shufps xmm7,xmm7,11001001b

;C*D = [a13*a23, a11*a20, a10*a22, a12*a21]
mulps xmm6,xmm7

;[0, cz, cy, cx]
subps xmm5,xmm6

;det = dot(col0, cross)

;[0, a02*cz, a01*cy, a00*cx]
mulps xmm0, xmm5 

;Horizontal sum of lanes 0..2
movaps xmm6,xmm0
shufps xmm6,xmm6,01001110b ;Rotate Right by 2 Lanes
addps xmm0,xmm6
movaps xmm6,xmm0
shufps xmm6,xmm6,10110001b ;Swap Even and Odd Lanes
addss xmm0,xmm6 ;result in xmm0[0]

ret
Determinant endp

