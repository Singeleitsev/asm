lbl_WinMain_KeyCheck:

;Rotation of the Camera
cmp key[25h],0 ;Left Arrow - Camera Left
je @f
movsd xmm0,xCam
addsd xmm0,dStep
movsd xCam,xmm0
movsd xmm0,xAim
addsd xmm0,dStep
movsd xAim,xmm0
@@:
cmp key[26h],0 ;Up Arrow -  - Camera Forward
je @f
movsd xmm0,zCam
addsd xmm0,dStep
movsd zCam,xmm0
movsd xmm0,zAim
addsd xmm0,dStep
movsd zAim,xmm0
@@:
cmp key[27h],0 ;Right Arrow - Camera Right
je @f
movsd xmm0,xCam
subsd xmm0,dStep
movsd xCam,xmm0
movsd xmm0,xAim
subsd xmm0,dStep
movsd xAim,xmm0
@@:
cmp key[28h],0 ;Down Arrow - Camera Backward
je @f
movsd xmm0,zCam
subsd xmm0,dStep
movsd zCam,xmm0
movsd xmm0,zAim
subsd xmm0,dStep
movsd zAim,xmm0

@@:
cmp key[41h],0 ;A - Rotate the Object Counter-Clockwise
je @f
movss xmm0,aXY
addss xmm0,dAngle32
movss aXY,xmm0
@@:
cmp key[44h],0 ;D - Rotate the Object Clockwise
je @f
movss xmm0,aXY
subss xmm0,dAngle32
movss aXY,xmm0
@@:
cmp key[53h],0 ;S - Camera Down
je @f
movsd xmm0,yCam
subsd xmm0,dStep
movsd yCam,xmm0
movsd xmm0,yAim
subsd xmm0,dStep
movsd yAim,xmm0
@@:
cmp key[57h],0 ;W - Camera Up
je @f
movsd xmm0,yCam
addsd xmm0,dStep
movsd yCam,xmm0
movsd xmm0,yAim
addsd xmm0,dStep
movsd yAim,xmm0

@@:
