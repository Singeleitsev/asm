;lbl_RefreshStatus:

mov ecx,xCam
lea rdx,sz_xCamValue
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
xor r8,r8 ;Part 0
lea r9,sz_xCamText
Call SendMessageA

mov ecx,yCam
lea rdx,sz_yCamValue
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,1 ;Part 1
lea r9,sz_yCamText
Call SendMessageA

mov ecx,zCam
lea rdx,sz_zCamValue
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,2 ;Part 2
lea r9,sz_zCamText
Call SendMessageA

mov ecx,aYZ_Model
lea rdx,sz_aYZ_ModelValue
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,3 ;Part 3
lea r9,sz_aYZ_ModelText
Call SendMessageA

mov ecx,aXY_Model
lea rdx,sz_aXY_ModelValue
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,4 ;Part 4
lea r9,sz_aXY_ModelText
Call SendMessageA

mov ecx,aXZ_Model
lea rdx,sz_aXZ_ModelValue
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,5 ;Part 5
lea r9,sz_aXZ_ModelText
Call SendMessageA

mov ecx,aYZ_Cam
lea rdx,sz_aYZ_CamValue
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,6 ;Part 6
lea r9,sz_aYZ_CamText
Call SendMessageA

mov ecx,aXY_Cam
lea rdx,sz_aXY_CamValue
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,7 ;Part 7
lea r9,sz_aXY_CamText
Call SendMessageA

mov ecx,aXZ_Cam
lea rdx,sz_aXZ_CamValue
Call FloatConvert

mov rcx,hwndStatusBar
mov rdx,401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
mov r8,8 ;Part 8
lea r9,sz_aXZ_CamText
Call SendMessageA

;lbl_RefreshStatus_End:
