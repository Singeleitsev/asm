SetGlobalOrigin proc pMtxLocal:DWORD, pVecGlobal:DWORD

;m12 = -(m00*p0 + m04*p1 + m08*p2)
;m13 = -(m01*p0 + m05*p1 + m09*p2)
;m14 = -(m02*p0 + m06*p1 + m10*p2)

mov eax,pMtxLocal
mov ecx,pVecGlobal

movss xmm0,dword ptr[ecx+00*4]
shufps xmm0,xmm0,0 ;Broadcast
movss xmm1,dword ptr[ecx+01*4]
shufps xmm1,xmm1,0 ;Broadcast
movss xmm2,dword ptr[ecx+02*4]
shufps xmm2,xmm2,0 ;Broadcast

mulps xmm0,oword ptr[eax+00*4]
mulps xmm1,oword ptr[eax+04*4]
mulps xmm2,oword ptr[eax+08*4]

;Vertical addition
xorps xmm3,xmm3
subps xmm3,xmm0
subps xmm3,xmm1
subps xmm3,xmm2

;Save the Result
movaps oword ptr[eax+12*4],xmm3

movss xmm0,f32_posOne
movss dword ptr[eax+15*4],xmm0

ret
SetGlobalOrigin endp