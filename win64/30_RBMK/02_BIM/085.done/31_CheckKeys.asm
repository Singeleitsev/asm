;lbl_CheckKeys:

;Return to Normal Speed
movss xmm0,LinearSpeed
movss dStep,xmm0
movss xmm1,AngularSpeed
movss dAngle,xmm1
;Boost
cmp key[10h],0 ;Shift
je @f
mulss xmm0,LinearBoost
movss dStep,xmm0
mulss xmm1,AngularBoost
movss dAngle,xmm1

@@:
;lbl_ModelRotation: ;Keyboard Input
cmp key[57h],0 ;W - Look Up
je @f
movss xmm0,aYZ_Model
subss xmm0,dAngle
movss aYZ_Model,xmm0
lea rcx,aYZ_Model
Call CheckAngle
@@:
cmp key[53h],0 ;S - Look Down
je @f
movss xmm0,aYZ_Model
addss xmm0,dAngle
movss aYZ_Model,xmm0
lea rcx,aYZ_Model
Call CheckAngle
@@:
cmp key[41h],0 ;A - Look Left
je @f
movss xmm0,aXY_Model
addss xmm0,dAngle
movss aXY_Model,xmm0
lea rcx,aXY_Model
Call CheckAngle
@@:
cmp key[44h],0 ;D - Look Right
je @f
movss xmm0,aXY_Model
subss xmm0,dAngle
movss aXY_Model,xmm0
lea rcx,aXY_Model
Call CheckAngle
@@:
cmp key[51h],0 ;Q - Roll Left
je @f
movss xmm0,aXZ_Model
subss xmm0,dAngle
movss aXZ_Model,xmm0
lea rcx,aXZ_Model
Call CheckAngle
@@:
cmp key[45h],0 ;E - Roll Right
je @f
movss xmm0,aXZ_Model
addss xmm0,dAngle
movss aXZ_Model,xmm0
lea rcx,aXZ_Model
Call CheckAngle

@@:
cmp nCameraMode,0
je lbl_CameraMode0
cmp nCameraMode,1
je lbl_CameraMode1

include 31_1_CameraMode0.asm
include 31_2_CameraMode1.asm

lbl_CheckKeys_End:
