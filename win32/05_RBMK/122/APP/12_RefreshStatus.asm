RefreshStatus proc

invoke FloatToANSI,dword ptr[vecCamPos+0],offset sz_xCamValue

push offset sz_xCamText
push 0 ;Part 0
push 401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
push ghWndStatusBar
call SendMessageA

invoke FloatToANSI,dword ptr[vecCamPos+4],offset sz_yCamValue

push offset sz_yCamText
push 1 ;Part 1
push 401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
push ghWndStatusBar
call SendMessageA

invoke FloatToANSI,dword ptr[vecCamPos+8],offset sz_zCamValue

push offset sz_zCamText
push 2 ;Part 2
push 401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
push ghWndStatusBar
call SendMessageA

invoke FloatToANSI,dword ptr[vecObjPos+0],offset sz_xObjValue

push offset sz_xObjText
push 3 ;Part 3
push 401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
push ghWndStatusBar
call SendMessageA

invoke FloatToANSI,dword ptr[vecObjPos+4],offset sz_yObjValue

push offset sz_yObjText
push 4 ;Part 4
push 401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
push ghWndStatusBar
call SendMessageA

invoke FloatToANSI,dword ptr[vecObjPos+8],offset sz_zObjValue

push offset sz_zObjText
push 5 ;Part 5
push 401h ;SB_SETTEXTA = WM_USER + 1 '0x0401
push ghWndStatusBar
call SendMessageA

ret
RefreshStatus endp