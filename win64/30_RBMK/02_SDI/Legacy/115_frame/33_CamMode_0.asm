lbl_CameraMode0:

;Load Arguments
movss xmm0,xCam
movss xmm1,yCam
movss xmm2,zCam

;Camera Movement
cmp key[26h],0 ;Up Arrow - Move Forward
je @f
Call CameraMoveStraightProc
;xCam = xCam - dxCamY
subss xmm0,dxCam
;yCam = yCam - dyCamY
subss xmm1,dyCam
mov isSteady,0
@@:
cmp key[28h],0 ;Down Arrow - Move Backward
je @f
Call CameraMoveStraightProc
;xCam = xCam + dxCamY
addss xmm0,dxCam
;yCam = yCam + dyCamY
addss xmm1,dyCam
mov isSteady,0
@@:
cmp key[25h],0 ;Left Arrow - Strafe Left
je @f
Call CameraMoveSideProc
;xCam = xCam + dxCamX
addss xmm0,dxCam
;yCam = yCam + dyCamX
addss xmm1,dyCam
mov isSteady,0
@@:
cmp key[27h],0 ;Right Arrow - Strafe Right
je @f
Call CameraMoveSideProc
;xCam = xCam - dxCamX
subss xmm0,dxCam
;yCam = yCam - dyCamX
subss xmm1,dyCam
mov isSteady,0
@@:
cmp key[21h],0 ;Page Up - Move Up
je @f
subss xmm2,dStep
mov isSteady,0
@@:
cmp key[22h],0 ;Page Down - Move Down
je @f
addss xmm2,dStep
mov isSteady,0

@@:
;Prevent from recomputing unchanged coordinates
cmp isSteady,0
jne lbl_DrawGLScene_Refresh ;Skip if no changes

Call CheckDistance

;Store Results
movss xCam,xmm0
movss yCam,xmm1
movss zCam,xmm2

mov isSteady,1 ;All Changes Committed

jmp lbl_DrawGLScene_Refresh

