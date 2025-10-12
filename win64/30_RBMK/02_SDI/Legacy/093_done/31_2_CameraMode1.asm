lbl_CameraMode1:

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
jmp lbl_CheckKeys_End
