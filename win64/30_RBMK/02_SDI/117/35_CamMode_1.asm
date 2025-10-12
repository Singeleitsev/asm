lbl_CameraMode_1:

;Stop the Movement
xorps xmm0,xmm0
xorps xmm1,xmm1
xorps xmm2,xmm2

;lbl_CameraMoveForward:
cmp key[26h],0 ;Up Arrow
je @f
movss xmm2,dStep ;dzCam = dStep
mov isMoved,1
@@:
;lbl_CameraMoveBack:
cmp key[28h],0 ;Down Arrow
je @f
subss xmm2,dStep ;dzCam = -dStep
mov isMoved,1
@@:
;lbl_CameraMoveLeft:
cmp key[25h],0 ;Left Arrow
je @f
movss xmm0,dStep ;dxCam = dStep
mov isMoved,1
@@:
;lbl_CameraMoveRight:
cmp key[27h],0 ;Right Arrow
je @f
subss xmm0,dStep ;dxCam = -dStep
mov isMoved,1
@@:
;lbl_CameraMoveDown:
cmp key[22h],0 ;Page Down
je @f
movss xmm1,dStep ;dyCam = dStep
mov isMoved,1
@@:
;lbl_CameraMoveUp:
cmp key[21h],0 ;Page Up
je @f
subss xmm1,dStep ;dyCam = -dStep
mov isMoved,1
 
@@:
;Prevent from recomputing unchanged coordinates
cmp isMoved,1
jne lbl_DrawGLScene_Refresh ;Skip if no changes

;Store Results
movss dxCam,xmm0
movss dyCam,xmm1
movss dzCam,xmm2

call CameraMove3D
call CheckDistance

mov isMoved,0 ;All Changes Committed
jmp lbl_DrawGLScene_Refresh

