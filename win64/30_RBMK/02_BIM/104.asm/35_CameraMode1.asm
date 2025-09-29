lbl_CameraMode1:

xorps xmm0,xmm0
xorps xmm1,xmm1
xorps xmm2,xmm2

;lbl_CameraMoveForward:
cmp key[26h],0 ;Up Arrow
je @f
movss xmm2,dStep ;dzCam = dStep
@@:
;lbl_CameraMoveBack:
cmp key[28h],0 ;Down Arrow
je @f
xorps xmm2,xmm2
subss xmm2,dStep ;dzCam = -dStep
@@:
;lbl_CameraMoveLeft:
cmp key[25h],0 ;Left Arrow
je @f
movss xmm0,dStep ;dxCam = dStep
@@:
;lbl_CameraMoveRight:
cmp key[27h],0 ;Right Arrow
je @f
xorps xmm0,xmm0
subss xmm0,dStep ;dxCam = -dStep
@@:
;lbl_CameraMoveUp:
cmp key[21h],0 ;Page Up
je @f
xorps xmm1,xmm1
subss xmm1,dStep ;dyCam = -dStep
@@:
;lbl_CameraMoveDown:
cmp key[22h],0 ;Page Down
je @f
movss xmm1,dStep ;dyCam = dStep
 
@@:
lbl_CameraMoveStoreVectors:
movss dxCam,xmm0
movss dyCam,xmm1
movss dzCam,xmm2
 
Call CameraMove3D
 

