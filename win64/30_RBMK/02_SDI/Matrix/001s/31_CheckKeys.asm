;lbl_CheckKeys:

;Load Normal Speed
movss xmm1,SpeedKeyMove
movss xmm2,SpeedKeyRotate

;Check for Boost
cmp key[10h],0 ;Shift
je lbl_StoreSpeed
mulss xmm1,BoostKeyMove
mulss xmm2,BoostKeyRotate

;Store Values for Future Computations
lbl_StoreSpeed:
movss dStep,xmm1
movss dAngle,xmm2

;lbl_KeyRotate:
cmp key[57h],0 ;W - Model Tilt Down
je @f
xorps xmm0,xmm0
subss xmm0,dAngle
movss xmm1,f32_1
xorps xmm2,xmm2
xorps xmm3,xmm3
call glRotatef
mov isRefreshed,0
@@:
cmp key[53h],0 ;S - Model Tilt Up
je @f
movss xmm0,dAngle
movss xmm1,f32_1
xorps xmm2,xmm2
xorps xmm3,xmm3
call glRotatef
mov isRefreshed,0
@@:
cmp key[41h],0 ;A - Model Turn Counter-Clockwise
je @f
xorps xmm0,xmm0
subss xmm0,dAngle
xorps xmm1,xmm1
xorps xmm2,xmm2
movss xmm3,f32_1
call glRotatef
mov isRefreshed,0
@@:
cmp key[44h],0 ;D - Model Turn Clockwise
je @f
movss xmm0,dAngle
xorps xmm1,xmm1
xorps xmm2,xmm2
movss xmm3,f32_1
call glRotatef
mov isRefreshed,0
@@:
cmp key[51h],0 ;Q - Model Roll Counter-Clockwise
je @f
movss xmm0,dAngle
xorps xmm1,xmm1
movss xmm2,f32_1
xorps xmm3,xmm3
call glRotatef
mov isRefreshed,0
@@:
cmp key[45h],0 ;E - Model Roll Clockwise
je @f
xorps xmm0,xmm0
subss xmm0,dAngle
xorps xmm1,xmm1
movss xmm2,f32_1
xorps xmm3,xmm3
call glRotatef
mov isRefreshed,0

@@:
;lbl_KeyMove:
cmp nCameraMode,CAMERA_MODE_PLANAR ;0
je lbl_CameraMode_0
cmp nCameraMode,CAMERA_MODE_SPATIAL ;1
je lbl_CameraMode_1

;Unknown Camera Motion Mode
jmp lbl_DrawGLScene_End
