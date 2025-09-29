;lbl_CheckKeys:

;Load Normal Speed
movss xmm1,LinearSpeed
movss xmm2,AngularSpeed
;Check for Boost
cmp key[10h],0 ;Shift
je lbl_StoreSpeed
mulss xmm1,LinearBoost
mulss xmm2,AngularBoost

;Store Values for Future Computations
lbl_StoreSpeed:
movss dStep,xmm1
movss dAngle,xmm2

;Load Common Values
movss xmm14,f32_360 ;xmm14 = 360 Degrees
xorps xmm15,xmm15 ;xmm15 = 0

;lbl_ModelRotation: ;Keyboard Input
cmp key[57h],0 ;W - Look Up
je @f
movss xmm0,aYZ_Model
subss xmm0,xmm2 ;aYZ_Model-dAngle
Call CheckAngle
movss aYZ_Model,xmm0
@@:
cmp key[53h],0 ;S - Look Down
je @f
movss xmm0,aYZ_Model
addss xmm0,xmm2 ;aYZ_Model+dAngle
Call CheckAngle
movss aYZ_Model,xmm0
@@:
cmp key[41h],0 ;A - Look Left
je @f
movss xmm0,aXY_Model
addss xmm0,xmm2 ;aXY_Model+dAngle
Call CheckAngle
movss aXY_Model,xmm0
@@:
cmp key[44h],0 ;D - Look Right
je @f
movss xmm0,aXY_Model
subss xmm0,xmm2 ;aXY_Model-dAngle
Call CheckAngle
movss aXY_Model,xmm0
@@:
cmp key[51h],0 ;Q - Roll Left
je @f
movss xmm0,aXZ_Model
subss xmm0,xmm2 ;aXZ_Model-dAngle
Call CheckAngle
movss aXZ_Model,xmm0
@@:
cmp key[45h],0 ;E - Roll Right
je @f
movss xmm0,aXZ_Model
addss xmm0,xmm2 ;aXZ_Model+dAngle
Call CheckAngle
movss aXZ_Model,xmm0

@@:
cmp nCameraMode,0
je lbl_CameraMode0
cmp nCameraMode,1
je lbl_CameraMode1

include 33_CameraMode0.asm
include 35_CameraMode1.asm

lbl_CheckKeys_End:

