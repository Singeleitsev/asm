ArcToCamera proc

;1. Compute vecCamPos from mtxCameraVolatile
lea eax,mtxCameraVolatile

;xCamPos[0] = -(m00*m12 + m01*m13 + m02*m14)
;yCamPos[1] = -(m04*m12 + m05*m13 + m06*m14)
;zCamPos[2] = -(m08*m12 + m09*m13 + m10*m14)
movaps xmm0,oword ptr[eax+00*4] ;[m00..m03]
movaps xmm1,oword ptr[eax+04*4] ;[m04..m07]
movaps xmm2,oword ptr[eax+08*4] ;[m08..m11]
movaps xmm3,oword ptr[eax+12*4] ;[m12..m15]

mulps xmm0,xmm3 ;[m00*m12..m03*m15]
mulps xmm1,xmm3 ;[m04*m12..m07*m15]
mulps xmm2,xmm3 ;[m08*m12..m11*m15]

xorps xmm3,xmm3 ;[0..0]
movaps xmm4,xmm0
subss xmm3,xmm4
shufps xmm4,xmm4,00111001b ;rotate right
subss xmm3,xmm4
shufps xmm4,xmm4,00111001b ;rotate right
subss xmm3,xmm4
movss dword ptr[xCamPos],xmm3
shufps xmm3,xmm3,0

xorps xmm4,xmm4 ;[0..0]
movaps xmm5,xmm1
subss xmm4,xmm5
shufps xmm5,xmm5,00111001b ;rotate right
subss xmm4,xmm5
shufps xmm5,xmm5,00111001b ;rotate right
subss xmm4,xmm5
movss dword ptr[yCamPos],xmm4
shufps xmm4,xmm4,0

xorps xmm5,xmm5 ;[0..0]
movaps xmm6,xmm2
subss xmm5,xmm6
shufps xmm6,xmm6,00111001b ;rotate right
subss xmm5,xmm6
shufps xmm6,xmm6,00111001b ;rotate right
subss xmm5,xmm6
movss dword ptr[zCamPos],xmm5
shufps xmm5,xmm5,0

;2. Rw*vecCamPos
lea esi,mtxArcball

;Rw*vecCamPos[0] = a0*camPosX + a4*camPosY + a08*camPosZ
;Rw*vecCamPos[1] = a1*camPosX + a5*camPosY + a09*camPosZ
;Rw*vecCamPos[2] = a2*camPosX + a6*camPosY + a10*camPosZ

movaps xmm0,oword ptr[esi+00*4] ;a[00..03]
movaps xmm1,oword ptr[esi+04*4] ;a[04..07]
movaps xmm2,oword ptr[esi+08*4] ;a[08..11]

mulps xmm0,xmm3 ;a[00..03]*[xCamPos]
mulps xmm1,xmm4 ;a[04..07]*[yCamPos]
mulps xmm2,xmm5 ;a[08..11]*[zCamPos]

addps xmm0,xmm1
addps xmm0,xmm2 ;xmm0 = Rw*vecCamPos

;3. vecTshift = vecCamPos - Rw*vecCamPos
movaps xmm1,oword ptr[xCamPos]
subps xmm1,xmm0

;Copy mtxWorld <- mtxArcball
cld
;lea esi, mtxArcball ;Already loaded
lea edi, mtxWorld
mov ecx,16
rep movsd

;Store
lea ecx,mtxWorld
movaps oword ptr[ecx+12*4],xmm1
movss xmm0,posOne
movss dword ptr[ecx+15*4],xmm0

ret
ArcToCamera endp

