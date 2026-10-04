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

;lbl_ModelRotation: ;Keyboard Input
cmp key[57h],0 ;W - Model Tilt Down
je @f
movss xmm0,aYZ_Model
subss xmm0,xmm2 ;aYZ_Model-dAngle
Call CheckAngle
movss aYZ_Model,xmm0
@@:
cmp key[53h],0 ;S - Model Tilt Up
je @f
movss xmm0,aYZ_Model
addss xmm0,xmm2 ;aYZ_Model+dAngle
Call CheckAngle
movss aYZ_Model,xmm0
@@:
cmp key[41h],0 ;A - Model Turn Counter-Clockwise
je @f
movss xmm0,aXY_Model
addss xmm0,xmm2 ;aXY_Model+dAngle
Call CheckAngle
movss aXY_Model,xmm0
@@:
cmp key[44h],0 ;D - Model Turn Clockwise
je @f
movss xmm0,aXY_Model
subss xmm0,xmm2 ;aXY_Model-dAngle
Call CheckAngle
movss aXY_Model,xmm0
@@:
cmp key[51h],0 ;Q - Model Roll Counter-Clockwise
je @f
movss xmm0,aXZ_Model
subss xmm0,xmm2 ;aXZ_Model-dAngle
Call CheckAngle
movss aXZ_Model,xmm0
@@:
cmp key[45h],0 ;E - Model Roll Clockwise
je @f
movss xmm0,aXZ_Model
addss xmm0,xmm2 ;aXZ_Model+dAngle
Call CheckAngle
movss aXZ_Model,xmm0

@@:
cmp nCameraMode,CAMERA_MODE_PLANAR ;0
je lbl_CameraMode_0
cmp nCameraMode,CAMERA_MODE_SPATIAL ;1
je lbl_CameraMode_1

;Unknown Camera Motion Mode
jmp lbl_DrawGLScene_End
