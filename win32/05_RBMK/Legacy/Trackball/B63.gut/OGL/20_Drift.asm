Drift proc lParam:DWORD

;MouseNew <- lParam
GET_NEW_CURSOR_POSITION
;deltaMouse = MouseNew - MouseOld
COMPUTE_MOUSE_DELTA

;dAngleX = dyMouse*MouseSensitivity  (pitch)
mov eax,dyMouse
cvtsi2ss xmm0,eax
mulss xmm0,MouseSensitivity
movss dAngleX,xmm0

;dAngleY = dxMouse*MouseSensitivity  (yaw)
mov eax,dxMouse
cvtsi2ss xmm0,eax
mulss xmm0,MouseSensitivity
movss dAngleY,xmm0

;sinX,cosX via x87
fld dAngleX
fmul PiOver180
fsincos
fstp cosX
fstp sinX

;sinY,cosY via x87
fld dAngleY
fmul PiOver180
fsincos
fstp cosY
fstp sinY

lea ecx, mtxCameraVolatile

;Post-multiply Ry into mtxCameraVolatile (yaw)

;new_col0 = cosY*col0 - sinY*col2
;new_col2 = sinY*col0 + cosY*col2

;Broadcast sinY,cosY to all 4 lanes
movss xmm0,sinY
movss xmm1,cosY
shufps xmm0,xmm0, 0
shufps xmm1,xmm1, 0

movaps xmm2,oword ptr [ecx+0*4] ;old col0
movaps xmm3,oword ptr [ecx+8*4] ;old col2
movaps xmm4,xmm2 ;save old col0
movaps xmm5,xmm3 ;save old col2

;new_col0 = cosY*old_col0 - sinY*old_col2
mulps xmm2,xmm1 ;cosY*col0
mulps xmm3,xmm0 ;sinY*col2
subps xmm2,xmm3
movups oword ptr[ecx+0*4],xmm2

;new_col2 = sinY*old_col0 + cosY*old_col2
mulps xmm4, xmm0 ;sinY*col0
mulps xmm5, xmm1 ;cosY*col2
addps xmm4, xmm5
movaps oword ptr[ecx+8*4],xmm4

;Post-multiply Rx into mtxCameraVolatile (pitch)

;new_col1 = cosX*col1 + sinX*col2
;new_col2 = cosX*col2 - sinX*col1

;Broadcast sinX,cosX to all 4 lanes
movss xmm0,sinX
movss xmm1,cosX
shufps xmm0,xmm0,0
shufps xmm1,xmm1,0

movaps xmm2,oword ptr [ecx+4*4] ;old col1
movaps xmm3,oword ptr [ecx+8*4] ;old col2
movaps xmm4,xmm2 ;save old col1
movaps xmm5,xmm3 ;save old col2

;new_col1 = cosX*old_col1 + sinX*old_col2
mulps xmm2,xmm1
mulps xmm3,xmm0
addps xmm2,xmm3
movaps oword ptr[ecx+4*4],xmm2

;new_col2 = cosX*old_col2 - sinX*old_col1
mulps xmm5,xmm1
mulps xmm4,xmm0
subps xmm5,xmm4
movaps oword ptr[ecx+8*4],xmm5

;MouseOld <- MouseNew
SAVE_OLD_CURSOR_POSITION

;Set Flags
mov isInitialPosition,0
mov isRefreshed,0

ret
Drift endp


