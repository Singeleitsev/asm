wmFrameCommand:

;switch (wParam)
cmp r8,IDM_CLOSE
	je idmFrameClose
cmp r8,IDM_EXIT
	je idmFrameExit
cmp r8,IDM_NEWR2
	je idmNewR2
cmp r8,IDM_NEWR3
	je idmNewR3
cmp r8,IDM_TILE
	je idmFrameTile
cmp r8,IDM_CASCADE
	je idmFrameCascade
cmp r8,IDM_ARRANGE
	je idmFrameArrange
cmp r8,IDM_CLOSEALL
	je idmFrameCloseAll
;jmp defFrmCmd


defFrmCmd:
;Default - Pass to active child...
	Call4 SendMessageA,s_hwndClientF,229h,0,0 ;WM_MDIGETACTIVE
	mov hwndChild,rax
	Call1 IsWindow,hwndChild
	cmp rax,0
	je defFrmProc ;Break
	Call4 SendMessageA,hwndChild,111h,wParam,lParam ;WM_COMMAND
	jmp defFrmProc


idmNewR2:
;Fill the mdicreate Struct
	m64addr mdicreate.szClass,szR2Class
	m64addr mdicreate.szTitle,szR2Title
	m64m64 mdicreate.hOwner,g_hInst
	mov rax,80000000h ;CW_USEDEFAULT
	mov mdicreate.x,eax
	mov mdicreate.y,eax
	mov mdicreate.lx,eax
	mov mdicreate.ly,eax
	mov mdicreate.style,0
	mov mdicreate.lParam,0

	mov rcx,s_hwndClientF
	mov rdx,220h ;WM_MDICREATE = 0x0220
	xor r8,r8
	lea r9,mdicreate
	call SendMessageA
	mov hwndChild,rax

	jmp lblFrmCmdRet0


idmNewR3:
;Fill the mdicreate Struct
	m64addr mdicreate.szClass,szR3Class
	m64addr mdicreate.szTitle,szR3Title
	m64m64 mdicreate.hOwner,g_hInst
	mov rax,80000000h ;CW_USEDEFAULT
	mov mdicreate.x,eax
	mov mdicreate.y,eax
	mov mdicreate.lx,eax
	mov mdicreate.ly,eax
	mov mdicreate.style,0
	mov mdicreate.lParam,0

	mov rcx,s_hwndClientF
	mov rdx,220h ;WM_MDICREATE = 0x0220
	xor r8,r8
	lea r9,mdicreate
	call SendMessageA
	mov hwndChild,rax

	jmp lblFrmCmdRet0


idmFrameClose:
	Call4 SendMessageA,s_hwndClientF,229h,0,0 ;WM_MDIGETACTIVE
	mov hwndChild,rax
	;In Windows NT, WM_QUERYENDSESSION can be sent
	;only to the Frame Window
	Call4 SendMessageA,hwndChild,11h,0,0 ;WM_QUERYENDSESSION
	test rax,rax
	je lblFrmCmdRet0
	Call4 SendMessageA,s_hwndClientF,221h,hwndChild,0 ;WM_MDIDESTROY
	jmp lblFrmCmdRet0


idmFrameExit:
	Call4 SendMessageA,hwnd,10h,0,0 ;WM_CLOSE
	jmp lblFrmCmdRet0


idmFrameTile:
	Call4 SendMessageA,s_hwndClientF,226h,0,0 ;WM_MDITILE
	jmp lblFrmCmdRet0


idmFrameCascade:
	Call4 SendMessageA,s_hwndClientF,227h,0,0 ;WM_MDICASCADE
	jmp lblFrmCmdRet0


idmFrameArrange:
	Call4 SendMessageA,s_hwndClientF,228h,0,0 ;WM_MDIICONARRANGE
	jmp lblFrmCmdRet0


idmFrameCloseAll:
	Call3 EnumChildWindows,s_hwndClientF,offset CloseEnumProc,0
	jmp lblFrmCmdRet0


lblFrmCmdRet0:
     xor rax, rax
     jmp endFrmProc



