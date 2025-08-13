;lbl_CheckKeys:

;Boost
mov eax,LinearSpeed
mov dStep,eax
mov eax,AngularSpeed
mov dAngle,eax
cmp key[10h],0 ;Shift
je @f
movss xmm0,LinearBoost
mulss xmm0,dStep
movss dStep,xmm0
movss xmm0,AngularBoost
mulss xmm0,dAngle
movss dAngle,xmm0

;Object Rotation
@@:
cmp key[51h],0 ;Q - Counter-Clockwise
je @f
movss xmm0,aXY_Model
addss xmm0,dAngle
movss aXY_Model,xmm0
@@:
cmp key[45h],0 ;E - Clockwise
je @f
movss xmm0,aXY_Model
subss xmm0,dAngle
movss aXY_Model,xmm0

;Camera Rotation
@@:
cmp key[57h],0 ;W - Look Up
je @f
movss xmm0,aYZ_Cam
subss xmm0,dAngle
movss aYZ_Cam,xmm0
@@:
cmp key[53h],0 ;S - Look Down
je @f
movss xmm0,aYZ_Cam
addss xmm0,dAngle
movss aYZ_Cam,xmm0
@@:
cmp key[41h],0 ;A - Look Left
je @f
movss xmm0,aXY_Cam
subss xmm0,dAngle
movss aXY_Cam,xmm0
@@:
cmp key[44h],0 ;D - Look Right
je @f
movss xmm0,aXY_Cam
addss xmm0,dAngle
movss aXY_Cam,xmm0

@@:
;Computing Camera Deltas
finit
;Straight Walk
;dxCamY = dStep * sin(aXY_Cam * f32_PIover180)
;dyCamY = dStep * cos(aXY_Cam * f32_PIover180)
fld aXY_Cam
fmul f32_PIover180
fsincos
fmul dStep
fstp dyCamY ;cos to dy
fmul dStep
fstp dxCamY ;sin to dx
;Side Walk
;dxCamX = dStep * sin((360-aXY_Cam) * f32_PIover180)
;dyCamX = dStep * cos((360-XY_Cam) * f32_PIover180)
fld f32_360
fsub aXY_Cam
fmul f32_PIover180
fsincos
fmul dStep
fstp dxCamX ;cos to dx
fmul dStep
fstp dyCamX ;sin to dy

;Camera Movement
cmp key[26h],0 ;Up Arrow - Move Forward
je @f
;xCam = xCam - dxCamY
;yCam = yCam - dyCamY
movss xmm0,xCam
subss xmm0,dxCamY
movss xCam,xmm0
movss xmm0,yCam
subss xmm0,dyCamY
movss yCam,xmm0
@@:
cmp key[28h],0 ;Down Arrow - Move Backward
je @f
;xCam = xCam + dxCamY
;yCam = yCam + dyCamY
movss xmm0,xCam
addss xmm0,dxCamY
movss xCam,xmm0
movss xmm0,yCam
addss xmm0,dyCamY
movss yCam,xmm0
@@:
cmp key[25h],0 ;Left Arrow - Strafe Left
je @f
;xCam = xCam + dxCamX
;yCam = yCam + dyCamX
movss xmm0,xCam
addss xmm0,dxCamX
movss xCam,xmm0
movss xmm0,yCam
addss xmm0,dyCamX
movss yCam,xmm0
@@:
cmp key[27h],0 ;Right Arrow - Strafe Right
je @f
;xCam = xCam - dxCamX
;yCam = yCam - dyCamX
movss xmm0,xCam
subss xmm0,dxCamX
movss xCam,xmm0
movss xmm0,yCam
subss xmm0,dyCamX
movss yCam,xmm0
@@:
cmp key[21h],0 ;Page Up - Move Up
je @f
movss xmm0,zCam
subss xmm0,dStep
movss zCam,xmm0
@@:
cmp key[22h],0 ;Page Down - Move Down
je @f
movss xmm0,zCam
addss xmm0,dStep
movss zCam,xmm0

@@:
