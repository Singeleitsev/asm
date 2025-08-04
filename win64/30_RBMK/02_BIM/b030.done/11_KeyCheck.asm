lbl_WinMain_KeyCheck:

;Move the Camera
cmp key[26h],0 ;Up Arrow - Camera Forward, Aim Forward
je @f
movsd xmm0,xCam
addsd xmm0,dStep64
movsd xCam,xmm0
movsd xmm0,xAim
addsd xmm0,dStep64
movsd xAim,xmm0
@@:
cmp key[28h],0 ;Down Arrow - Camera Backward, Aim Backward
je @f
movsd xmm0,xCam
subsd xmm0,dStep64
movsd xCam,xmm0
movsd xmm0,xAim
subsd xmm0,dStep64
movsd xAim,xmm0
@@:
cmp key[25h],0 ;Left Arrow - Camera Left, Aim Left
je @f
movsd xmm0,zCam
subsd xmm0,dStep64
movsd zCam,xmm0
movsd xmm0,zAim
subsd xmm0,dStep64
movsd zAim,xmm0
@@:
cmp key[27h],0 ;Right Arrow - Camera Right, Aim Right
je @f
movsd xmm0,zCam
addsd xmm0,dStep64
movsd zCam,xmm0
movsd xmm0,zAim
addsd xmm0,dStep64
movsd zAim,xmm0
@@:
cmp key[21h],0 ;Page Up - Camera Up, Aim Up
je @f
movsd xmm0,yCam
addsd xmm0,dStep64
movsd yCam,xmm0
movsd xmm0,yAim
addsd xmm0,dStep64
movsd yAim,xmm0
@@:
cmp key[22h],0 ;Page Down - Camera Down, Aim Down
je @f
movsd xmm0,yCam
subsd xmm0,dStep64
movsd yCam,xmm0
movsd xmm0,yAim
subsd xmm0,dStep64
movsd yAim,xmm0


;Turn the Camera
@@:
cmp key[41h],0 ;A - Fixed Camera, Aim Left
je @f
movsd xmm0,zAim
subsd xmm0,dStep64
movsd zAim,xmm0
@@:
cmp key[44h],0 ;D - Fixed Camera, Aim Right
je @f
movsd xmm0,zAim
addsd xmm0,dStep64
movsd zAim,xmm0


;Tilt the Camera
@@:
cmp key[57h],0 ;W - Fixed Camera, Aim Up
je @f
movsd xmm0,yAim
addsd xmm0,dStep64
movsd yAim,xmm0
@@:
cmp key[53h],0 ;S - Fixed Camera, Aim Down
je @f
movsd xmm0,yAim
subsd xmm0,dStep64
movsd yAim,xmm0


;Rotate the Object
@@:
cmp key[51h],0 ;Q - Counter-Clockwise
je @f
movss xmm0,aXY_Model
addss xmm0,dAngle32
movss aXY_Model,xmm0
@@:
cmp key[45h],0 ;E - Clockwise
je @f
movss xmm0,aXY_Model
subss xmm0,dAngle32
movss aXY_Model,xmm0


@@:
