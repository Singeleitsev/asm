;lbl_RefreshStatus:

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
xor r8,r8
lea r9,sz_xCam
Call SendMessageA

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,1
lea r9,sz_yCam
Call SendMessageA

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,2
lea r9,sz_zCam
Call SendMessageA

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,3
lea r9,sz_aXY_Model
Call SendMessageA

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,4
lea r9,sz_aXY_Cam
Call SendMessageA

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,5
lea r9,sz_aYZ_Cam
Call SendMessageA

;lbl_RefreshStatus_End:
