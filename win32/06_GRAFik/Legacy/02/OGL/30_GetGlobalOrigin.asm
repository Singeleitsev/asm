GetGlobalOrigin proc pMtxLocal:DWORD, pVecGlobal:DWORD

;p0 = -(m00*m12 + m01*m13 + m02*m14)
;p1 = -(m04*m12 + m05*m13 + m06*m14)
;p2] = -(m08*m12 + m09*m13 + m10*m14)

mov eax,pMtxLocal
mov ecx,pVecGlobal

movaps xmm0,oword ptr[eax+00*4]
movaps xmm1,oword ptr[eax+04*4]
movaps xmm2,oword ptr[eax+08*4]
movaps xmm3,oword ptr[eax+12*4]

mulps xmm0,xmm3
mulps xmm1,xmm3
mulps xmm2,xmm3

;Horizontal addition
xorps xmm4,xmm4
subss xmm4,xmm0
;Rotate the source to set the Y component to Lane0
shufps xmm0,xmm0,00111001b ;Rotate Right
subss xmm4,xmm0
;Rotate the source to set the Z component to Lane0
shufps xmm0,xmm0,00111001b ;Rotate Right
subss xmm4,xmm0

;Rotate the destination to fill the Y component to Lane0
shufps xmm4,xmm4,00111001b ;Rotate Right

subss xmm4,xmm1
;Rotate the source to set the Y component to Lane0
shufps xmm1,xmm1,00111001b ;Rotate Right
subss xmm4,xmm1
;Rotate the source to set the Z component to Lane0
shufps xmm1,xmm1,00111001b ;Rotate Right
subss xmm4,xmm1

;Rotate the destination to fill the Z component to Lane0
shufps xmm4,xmm4,00111001b ;Rotate Right

subss xmm4,xmm2
;Rotate the source to set the Y component to Lane0
shufps xmm2,xmm2,00111001b ;Rotate Right
subss xmm4,xmm2
;Rotate the source to set the Z component to Lane0
shufps xmm2,xmm2,00111001b ;Rotate Right
subss xmm4,xmm2

;Rotate the destination to return the X component to Lane0
shufps xmm4,xmm4,01001110b ;Rotate Right

;Save the Result
movaps oword ptr[ecx],xmm4

ret
GetGlobalOrigin endp

