;lbl_CheckKeys:

;Normal Speed
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
;lbl_ObjectRotation:
cmp key[51h],0 ;Q - Counter-Clockwise
je @f
movss xmm0,aXY_Model
addss xmm0,dAngle
movss aXY_Model,xmm0
;Call CheckAngle
@@:
cmp key[45h],0 ;E - Clockwise
je @f
movss xmm0,aXY_Model
subss xmm0,dAngle
movss aXY_Model,xmm0
;Call CheckAngle

@@:
;lbl_CameraRotation:
cmp key[57h],0 ;W - Look Up
je @f
movss xmm0,aYZ_Cam
subss xmm0,dAngle
movss aYZ_Cam,xmm0
;Call CheckAngle
@@:
cmp key[53h],0 ;S - Look Down
je @f
movss xmm0,aYZ_Cam
addss xmm0,dAngle
movss aYZ_Cam,xmm0
;Call CheckAngle
@@:
cmp key[41h],0 ;A - Look Left
je @f
movss xmm0,aXY_Cam
subss xmm0,dAngle
movss aXY_Cam,xmm0
;Call CheckAngle
@@:
cmp key[44h],0 ;D - Look Right
je @f
movss xmm0,aXY_Cam
addss xmm0,dAngle
movss aXY_Cam,xmm0
;Call CheckAngle
@@:
cmp key[5Ah],0 ;Z - Counter-Clockwise
je @f
movss xmm0,aXZ_Cam
addss xmm0,dAngle
movss aXZ_Cam,xmm0
;Call CheckAngle
@@:
cmp key[43h],0 ;C - Clockwise
je @f
movss xmm0,aXZ_Cam
subss xmm0,dAngle
movss aXZ_Cam,xmm0
;Call CheckAngle

@@:
;lbl_CameraMoveFwdBck:
cmp key[26h],0 ;Up Arrow
jne @f
cmp key[28h],0 ;Down Arrow
je lbl_CameraMoveRightLeft
@@:
;dxCam = dStep * Sin(aXY_Cam * f32_PIover180)
;dyCam = dStep * Cos(aXY_Cam * f32_PIover180) * Cos((270 - aYZ_Cam) * f32_PIover180)
;dzCam = dStep * Sin((270 - aYZ_Cam) * f32_PIover180)
fld aXY_Cam
fmul f32_PIover180 ;Radians
fsincos ;st0 = cos, st1 = sin
fmul dStep
fstp dyCam ;dyCam = cos(aXY_Cam * f32_PIover180) * dStep
fmul dStep
fstp dxCam ;dxCam = sin(aXY_Cam * f32_PIover180) * dStep
fld f32_270
fsub aYZ_Cam
fmul f32_PIover180 ;Radians
fsincos ;st0 = cos, st1 = sin
fmul dyCam
fstp dyCam ;dyCam = cos(aXY_Cam * f32_PIover180) * dStep * cos((270 - aYZ_Cam) * f32_PIover180)
fmul dStep
fstp dzCam ;dzCam = sin((270 - aYZ_Cam) * f32_PIover180) * dStep

;Straight Walk
cmp key[26h],0 ;Up Arrow - Move Forward
je @f
;xCam = xCam - dxCam
movss xmm0,xCam
subss xmm0,dxCam
movss xCam,xmm0
;yCam = yCam - dyCam
movss xmm1,yCam
subss xmm1,dyCam
movss yCam,xmm1
;zCam = zCam - dzCam
movss xmm2,zCam
subss xmm2,dzCam
movss zCam,xmm2
@@:
cmp key[28h],0 ;Down Arrow - Move Backward
je @f
;xCam = xCam + dxCam
movss xmm0,xCam
addss xmm0,dxCam
movss xCam,xmm0
;yCam = yCam + dyCam
movss xmm1,yCam
addss xmm1,dyCam
movss yCam,xmm1
;zCam = zCam + dzCam
movss xmm2,zCam
addss xmm2,dzCam
movss zCam,xmm2

@@:
lbl_CameraMoveRightLeft:
cmp key[25h],0 ;Left Arrow
jne @f
cmp key[27h],0 ;Right Arrow
je lbl_CameraMoveUpDn
@@:
;dxCam = dStep * Cos(-aXY_Cam * f32_PIover180)
;dyCam = dStep * Sin(-aXY_Cam * f32_PIover180)
fld aXY_Cam
fchs
fmul f32_PIover180 ;Radians
fsincos ;st0 = cos, st1 = sin
fmul dStep
fstp dxCam ;dxCam = cos(-aXY_Cam * f32_PIover180) * dStep
fmul dStep
fstp dyCam ;dyCam = sin(-aXY_Cam * f32_PIover180) * dStep

;Side Walk
cmp key[25h],0 ;Left Arrow - Strafe Left
je @f
;xCam = xCam + dxCam
movss xmm0,xCam
addss xmm0,dxCam
movss xCam,xmm0
;yCam = yCam + dyCam
movss xmm1,yCam
addss xmm1,dyCam
movss yCam,xmm1
@@:
cmp key[27h],0 ;Right Arrow - Strafe Right
je @f
;xCam = xCam - dxCam
movss xmm0,xCam
subss xmm0,dxCam
movss xCam,xmm0
;yCam = yCam - dyCam
movss xmm1,yCam
subss xmm1,dyCam
movss yCam,xmm1

@@:
lbl_CameraMoveUpDn:
cmp key[21h],0 ;Page Up
jne @f
cmp key[22h],0 ;Page Down
je lbl_CheckKeys_End
@@:
;dxCam = dStep * Cos(-aYZ_Cam * f32_PIover180) * Sin(aXY_Cam * f32_PIover180)
;dyCam = dStep * Cos(-aYZ_Cam * f32_PIover180) * Cos(-aXY_Cam * f32_PIover180)
;dzCam = dStep * Sin(-aYZ_Cam * f32_PIover180)
fld aYZ_Cam
fchs
fmul f32_PIover180 ;Radians
fsincos ;st0 = cos, st1 = sin
fmul dStep
fst dxCam ;dxCam = cos(-aYZ_Cam * f32_PIover180) * dStep
fstp dyCam ;dyCam = cos(-aYZ_Cam * f32_PIover180) * dStep
fmul dStep
fstp dzCam ;dzCam = sin(-aYZ_Cam * f32_PIover180) * dStep
fld aXY_Cam
fmul f32_PIover180 ;Radians
fsin ;st0 = sin
fmul dxCam
fstp dxCam ;dxCam = Cos(-aYZ_Cam * f32_PIover180) * dStep * Sin(aXY_Cam * f32_PIover180)
fld aXY_Cam
fchs
fmul f32_PIover180 ;Radians
fcos ;st0 = cos
fmul dyCam
fstp dyCam ;dyCam = Cos(-aYZ_Cam * f32_PIover180) * dStep * Cos(-aXY_Cam * f32_PIover180)

;Up and Down
cmp key[21h],0 ;Page Up
je @f
;xCam = xCam - dxCam
movss xmm0,xCam
subss xmm0,dxCam
movss xCam,xmm0
;yCam = yCam - dyCam
movss xmm1,yCam
subss xmm1,dyCam
movss yCam,xmm1
;zCam = zCam - dzCam
movss xmm2,zCam
subss xmm2,dzCam
movss zCam,xmm2
@@:
cmp key[22h],0 ;Page Down
je @f
;xCam = xCam + dxCam
movss xmm0,xCam
addss xmm0,dxCam
movss xCam,xmm0
;yCam = yCam + dyCam
movss xmm1,yCam
addss xmm1,dyCam
movss yCam,xmm1
;zCam = zCam + dzCam
movss xmm2,zCam
addss xmm2,dzCam
movss zCam,xmm2

@@:
lbl_CheckKeys_End:
