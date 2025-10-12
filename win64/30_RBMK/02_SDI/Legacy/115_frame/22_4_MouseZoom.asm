;lbl_MouseWheel:

mov dxCam,0
mov dyCam,0
mov eax,r8d ;Store wParam
and eax,80000000h ;Extract the Sign
or eax,dStep ;Apply the Sign to dStep
mov dzCam,eax
Call CameraMove3D
Call CheckDistance

;lbl_MouseWheel_End:

