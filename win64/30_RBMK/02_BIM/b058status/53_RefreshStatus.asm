;lbl_RefreshStatus:

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
xor r8,r8
lea r9,sz_xCam
Call SendMessageA

mov ecx,xCam
mov rdx,lpsz_xCam
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,1
lea r9,sz_yCam
Call SendMessageA

mov ecx,yCam
mov rdx,lpsz_yCam
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,2
lea r9,sz_zCam
Call SendMessageA

mov ecx,zCam
mov rdx,lpsz_zCam
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,3
lea r9,sz_aXY_Model
Call SendMessageA

mov ecx,aXY_Model
mov rdx,lpsz_aXY_Model
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,4
lea r9,sz_aYZ_Cam
Call SendMessageA

mov ecx,aYZ_Cam
mov rdx,lpsz_aYZ_Cam
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,5
lea r9,sz_aXY_Cam
Call SendMessageA

mov ecx,aXY_Cam
mov rdx,lpsz_aXY_Cam
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,6
lea r9,sz_aXZ_Cam
Call SendMessageA

mov ecx,aXZ_Cam
mov rdx,lpsz_aXZ_Cam
Call FloatConvert

;lbl_RefreshStatus_End:
