wmFrameCommand:

;switch (wParam)
cmp r8,IDM_NEWSIEVE
	je idmNewSieve
cmp r8,IDM_NEWGASKET
	je idmNewGasket
cmp r8,IDM_NEWNGON
	je idmNewNgon
cmp r8,IDM_CLOSE
	je idmFrameClose
cmp r8,IDM_EXIT
	je idmFrameExit
cmp r8,IDM_TILE_VER
	je idmFrameTileVer
cmp r8,IDM_TILE_HOR
	je idmFrameTileHor
cmp r8,IDM_CASCADE
	je idmFrameCascade
cmp r8,IDM_CLOSEALL
	je idmFrameCloseAll
jmp defFrmCmd

;IDM_NEWSIEVE
idmNewSieve:
	m64addr mdicreate.szClass,szSieveClass
	m64addr mdicreate.szTitle,szSieveTitle 
	m64m64 mdicreate.hOwner,hInst
	mov rax,80000000h ;CW_USEDEFAULT = 80000000
	mov mdicreate.x,eax
	mov mdicreate.y,eax
	mov mdicreate.lx,eax
	mov mdicreate.ly,eax
	mov mdicreate.style,0
	mov mdicreate.lParam,0

	sub rsp,20h
	mov rcx,hwndClientF
	mov rdx,220h ;WM_MDICREATE = 0x0220
	xor r8,r8
	lea r9,mdicreate
	call SendMessageA
	mov hwndChild,rax
	add rsp,20h

	jmp endFrmCmd0 ;return 0

;IDM_NEWGASKET
idmNewGasket:
	m64addr mdicreate.szClass,szGasketClass
	m64addr mdicreate.szTitle,szGasketTitle
	m64m64 mdicreate.hOwner,hInst
	mov rax,80000000h ;CW_USEDEFAULT = 0
	mov mdicreate.x,eax
	mov mdicreate.y,eax
	mov mdicreate.lx,eax
	mov mdicreate.ly,eax
	mov mdicreate.style,0
	mov mdicreate.lParam,0

	sub rsp,20h
	mov rcx,hwndClientF
	mov rdx,220h ;WM_MDICREATE = 0x0220
	xor r8,r8
	lea r9,mdicreate
	call SendMessageA
	mov hwndChild,rax
	add rsp,20h

	jmp endFrmCmd0 ;return 0

;IDM_NEWNGON
idmNewNgon:
	m64addr mdicreate.szClass,szNgonClass
	m64addr mdicreate.szTitle,szNgonTitle
	m64m64 mdicreate.hOwner,hInst
	mov rax,80000000h ;CW_USEDEFAULT = 0
	mov mdicreate.x,eax
	mov mdicreate.y,eax
	mov mdicreate.lx,eax
	mov mdicreate.ly,eax
	mov mdicreate.style,0
	mov mdicreate.lParam,0

	sub rsp,20h
	mov rcx,hwndClientF
	mov rdx,220h ;WM_MDICREATE = 0x0220
	xor r8,r8
	lea r9,mdicreate
	call SendMessageA
	mov hwndChild,rax
	add rsp,20h

	jmp endFrmCmd0 ;return 0

;IDM_CLOSE
idmFrameClose:
	Call4 SendMessageA,hwndClientF,229h,0,0
	mov hwndChild,rax

	Call4 SendMessageA,hwndChild,11h,0,0
	test rax,rax
	je endFrmCmd0
	Call4 SendMessageA,hwndClientF,221h,hwndChild,0

	jmp endFrmCmd0 ;return 0

;IDM_EXIT
idmFrameExit:
	Call4 SendMessageA,hwnd,10h,0,0
	jmp endFrmCmd0 ;return 0

;IDM_TILE_VER
idmFrameTileVer:
	;WM_MDITILE = 0x0226 ;MDITILE_VERTICAL = 0
	Call4 SendMessageA,hwndClientF,226h,0,0
	jmp endFrmCmd0 ;return 0

;IDM_TILE_HOR
idmFrameTileHor:
	;WM_MDITILE = 0x0226 ;MDITILE_HORIZONTAL = 1
	Call4 SendMessageA,hwndClientF,226h,1,0
	jmp endFrmCmd0 ;return 0

;IDM_CASCADE
idmFrameCascade:
	Call4 SendMessageA,hwndClientF,227h,0,0
	jmp endFrmCmd0 ;return 0

;IDM_CLOSEALL
idmFrameCloseAll:
	Call3 EnumChildWindows,hwndClientF,offset CloseEnumProc,0
	jmp endFrmCmd0 ;return 0

;Default : // Pass to active child...
defFrmCmd:
	Call4 SendMessageA,hwndClientF,229h,0,0
	mov hwndChild,rax

	Call1 IsWindow,hwndChild
	cmp rax,0
	je defFrmProc ;Break

	Call4 SendMessageA,hwndChild,111h,wParam,lParam
	jmp defFrmProc

;return 0
endFrmCmd0:
     xor rax, rax
     jmp endFrmProc



