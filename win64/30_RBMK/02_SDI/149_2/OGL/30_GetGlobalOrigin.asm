GetGlobalOrigin proc ;rcx = pMtxLocal:DWORD ;rdx = pVecGlobal:DWORD

;Fastcall:
;rcx = pMtxLocal
;rdx = pVecGlobal

movaps xmm10,oword ptr[rcx+00*4] ;[m03 m02 m01 m00]
movaps xmm11,oword ptr[rcx+04*4] ;[m07 m06 m05 m04]
movaps xmm12,oword ptr[rcx+08*4] ;[m11 m10 m09 m08]
movaps xmm13,oword ptr[rcx+12*4] ;[m15 m14 m13 m12]

;XMM Comment Order: little-endian

;p_local = A * p_world + t
;p_world = -A(-1) * t

;p0 = det(A0) / det(A)
;p1 = det(A1) / det(A)
;p2 = det(A2) / det(A)

;A =
;[m00 m04 m08]
;[m01 m05 m09]
;[m02 m06 m10]
movaps xmm0,xmm10 ;[m03 m02 m01 m00]
movaps xmm1,xmm11 ;[m07 m06 m05 m04]
movaps xmm2,xmm12 ;[m11 m10 m09 m08]

;det(A)
;= m00*(m05*m10 - m06*m09)
;- m04*(m01*m10 - m02*m09)
;+ m08*(m01*m06 - m02*m05)
call Determinant
movss xmm3,xmm0 ;xmm3 = detA

;t = (m12, m13, m14)
;b = -t = (-m12, -m13, -m14)
xorps xmm4,xmm4
subps xmm4,xmm13 ;xmm4 = b

;A0 = A with column 0 replaced by b
;[b0 m04 m08]
;[b1 m05 m09]
;[b2 m06 m10]
movaps xmm0,xmm4 ;[b3 b2 b1 b0]
movaps xmm1,xmm11 ;[m07 m06 m05 m04]
movaps xmm2,xmm12 ;[m11 m10 m09 m08]

;det(A0)
;= b0 *(m05*m10 - m06*m09)
;- m04*(b1*m10  - b2*m09)
;+ m08*(b1*m06  - b2*m05)
call Determinant

;p0 = det(A0) / det(A)
divss xmm0,xmm3 ;xmm0 = detA0 / detA
movss dword ptr[rdx+00],xmm0

;A1 = A with column 1 replaced by b
;[m00 b0 m08]
;[m01 b1 m09]
;[m02 b2 m10]
movaps xmm0,xmm10 ;[m03 m02 m01 m00]
movaps xmm1,xmm4 ;[b3 b2 b1 b0]
movaps xmm2,xmm12 ;[m11 m10 m09 m08]

;det(A1)
;= m00*(b1*m10  - m09*b2)
;- b0* (m01*m10 - m09*m02)
;+ m08*(m01*b2  - b1*m02)
call Determinant

;p1 = det(A1) / det(A)
divss xmm0,xmm3 ;xmm0 = detA1 / detA
movss dword ptr[rdx+04],xmm0

;A2 = A with column 2 replaced by b
;[m00 m04 b0]
;[m01 m05 b1]
;[m02 m06 b2]
movaps xmm0,xmm10 ;[m03 m02 m01 m00]
movaps xmm1,xmm11 ;[m07 m06 m05 m04]
movaps xmm2,xmm4 ;[b3 b2 b1 b0]

;det(A2)
;= m00*(m05*b2  - b1*m06)
;- m04*(m01*b2  - b1*m02)
;+ b0* (m01*m06 - m05*m02)
call Determinant

;p2 = det(A2) / det(A)
divss xmm0,xmm3 ;xmm0 = detA2 / detA
movss dword ptr[rdx+08],xmm0

ret
GetGlobalOrigin endp


