;lbl_MouseWheel:

mov eax,r8d ;Store wParam
bt eax,31 ;Check the Sign
jc lbl_MouseWheelNegative

;lbl_MouseWheelPositive:
mov dxCam0,0
mov dyCam0,0
mov eax,dStep
mov dzCam0,eax
Call CameraMove
jmp lbl_MouseWheel_End

lbl_MouseWheelNegative:

mov dxCam0,0
mov dyCam0,0
fld dStep
fchs
fstp dzCam0
Call CameraMove

lbl_MouseWheel_End:

