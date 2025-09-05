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
;lbl_ModelRotation:
cmp key[5Ah],0 ;Z - Counter-Clockwise
je @f
movss xmm0,aXY_Model
addss xmm0,dAngle
movss aXY_Model,xmm0
lea rcx,aXY_Model
Call CheckAngle
@@:
cmp key[43h],0 ;C - Clockwise
je @f
movss xmm0,aXY_Model
subss xmm0,dAngle
movss aXY_Model,xmm0
lea rcx,aXY_Model
Call CheckAngle

@@:
;lbl_CameraRotation: ;Keyboard Input
cmp key[57h],0 ;W - Look Up
je @f
movss xmm0,aYZ_Cam
subss xmm0,dAngle
movss aYZ_Cam,xmm0
lea rcx,aYZ_Cam
Call CheckAngle
@@:
cmp key[53h],0 ;S - Look Down
je @f
movss xmm0,aYZ_Cam
addss xmm0,dAngle
movss aYZ_Cam,xmm0
lea rcx,aYZ_Cam
Call CheckAngle
@@:
cmp key[41h],0 ;A - Look Left
je @f
movss xmm0,aXY_Cam
subss xmm0,dAngle
movss aXY_Cam,xmm0
lea rcx,aXY_Cam
Call CheckAngle
@@:
cmp key[44h],0 ;D - Look Right
je @f
movss xmm0,aXY_Cam
addss xmm0,dAngle
movss aXY_Cam,xmm0
lea rcx,aXY_Cam
Call CheckAngle
@@:
cmp key[51h],0 ;Q - Roll Left
je @f
movss xmm0,aXZ_Cam
addss xmm0,dAngle
movss aXZ_Cam,xmm0
lea rcx,aXZ_Cam
Call CheckAngle
@@:
cmp key[45h],0 ;E - Roll Right
je @f
movss xmm0,aXZ_Cam
subss xmm0,dAngle
movss aXZ_Cam,xmm0
lea rcx,aXZ_Cam
Call CheckAngle

@@:
;lbl_CameraMoveFwdBck:
cmp key[26h],0 ;Up Arrow - Move Forward
je @f
mov dxCam0,0
mov dyCam0,0
mov eax,dStep
mov dzCam0,eax
Call CameraMove
@@:
cmp key[28h],0 ;Down Arrow - Move Backward
je @f
mov dxCam0,0
mov dyCam0,0
fld dStep
fchs
fstp dzCam0
Call CameraMove

@@:
;lbl_CameraMoveRightLeft:
cmp key[25h],0 ;Left Arrow - Strafe Left
je @f
mov eax,dStep
mov dxCam0,eax
mov dyCam0,0
mov dzCam0,0
Call CameraMove
@@:
cmp key[27h],0 ;Right Arrow - Strafe Right
je @f
fld dStep
fchs
fstp dxCam0
mov dyCam0,0
mov dzCam0,0
Call CameraMove

@@:
;lbl_CameraMoveUpDn:
cmp key[21h],0 ;Page Up
je @f
mov dxCam0,0
fld dStep
fchs
fstp dyCam0
mov dzCam0,0
Call CameraMove
@@:
cmp key[22h],0 ;Page Down
je @f
mov dxCam0,0
mov eax,dStep
mov dyCam0,eax
mov dzCam0,0
Call CameraMove

@@:
;lbl_CheckKeys_End:
