;lbl_MouseWheel:

mov dxCam0,0
mov dyCam0,0
mov eax,r8d ;Store wParam
and eax,80000000h ;Extract the Sign
or eax,dStep ;Apply the Sign to 
mov dzCam0,eax
Call CameraMove

;lbl_MouseWheel_End:

