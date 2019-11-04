;mdidemo401360:
wmFrameCommand:

;switch (wParam)
cmp r8,IDM_NEWHELLO
	je idmNewHello ;mdidemo40136B
cmp r8,IDM_NEWRECT
	je idmNewRect ;mdidemo4013CC
cmp r8,IDM_CLOSE
	je idmFrameClose ;mdidemo40142D
cmp r8,IDM_EXIT
	je idmFrameExit ;mdidemo40147B
cmp r8,IDM_TILE
	je idmFrameTile ;mdidemo401492
cmp r8,IDM_CASCADE
	je idmFrameCascade ;mdidemo4014AE
cmp r8,IDM_ARRANGE
	je idmFrameArrange ;mdidemo4014CA
cmp r8,IDM_CLOSEALL
	je idmFrameCloseAll ;mdidemo4014E6
jmp defFrmCmd ;mdidemo401500

;case IDM_NEWHELLO : // Create a Hello child window
;mdidemo40136B:
idmNewHello:
	;mdicreate.szClass = szHelloClass ;
		m64addr mdicreate.szClass,szHelloClass
	;mdicreate.szTitle = "Hello" ;
		m64addr mdicreate.szTitle,szHelloTitle
	;mdicreate.hOwner = hInst ;
		m64m64 mdicreate.hOwner,hInst
	;mdicreate.x = CW_USEDEFAULT ;
		mov rax,80000000h
		mov mdicreate.x,eax
	;mdicreate.y = CW_USEDEFAULT ;
		mov mdicreate.y,eax
	;mdicreate.cx = CW_USEDEFAULT ;
		mov mdicreate.lx,eax
	;mdicreate.cy = CW_USEDEFAULT ;
		mov mdicreate.ly,eax
	;mdicreate.style = 0 ;
		mov mdicreate.style,0
	;mdicreate.lParam = 0 ;
		mov mdicreate.lParam,0
	;hwndChild = (HWND) SendMessage
	;(hwndClient, WM_MDICREATE, 0, (LPARAM) (LPMDICREATESTRUCT) &mdicreate) ;
		sub rsp,20h
		mov rcx,hwndClientF
		mov rdx,220h ;WM_MDICREATE = 0x0220
		xor r8,r8
		lea r9,mdicreate
		call SendMessageA ;<-- Crashes Here
		mov hwndChild,rax
		add rsp,20h
	;return 0 ;
		jmp @f ;mdidemo401655

;case IDM_NEWRECT : // Create a Rect child window
;mdidemo4013CC:
idmNewRect:
;Spell64rax hwnd, szRectTitle, szHandle
	;mdicreate.szClass = szRectClass ;
		m64addr mdicreate.szClass,szRectClass
	;mdicreate.szTitle = "Rectangles" ;
		m64addr mdicreate.szTitle,szRectTitle
	;mdicreate.hOwner = hInst ;
		m64m64 mdicreate.hOwner,hInst
	;mdicreate.x = CW_USEDEFAULT ;
		mov rax,80000000h
		mov mdicreate.x,eax
	;mdicreate.y = CW_USEDEFAULT ;
		mov mdicreate.y,eax
	;mdicreate.cx = CW_USEDEFAULT ;
		mov mdicreate.lx,eax
	;mdicreate.cy = CW_USEDEFAULT ;
		mov mdicreate.ly,eax
	;mdicreate.style = 0 ;
		mov mdicreate.style,0
	;mdicreate.lParam = 0 ;
		mov mdicreate.lParam,0
	;hwndChild = (HWND) SendMessage
	;(hwndClient, WM_MDICREATE, 0, (LPARAM) (LPMDICREATESTRUCT) &mdicreate) ;
		sub rsp,20h
		mov rcx,hwndClientF
		mov rdx,220h ;WM_MDICREATE = 0x0220
		xor r8,r8
		lea r9,mdicreate
		call SendMessageA
		mov hwndChild,rax
		add rsp,20h
	;return 0 ;
		jmp @f ;mdidemo401655

;case IDM_CLOSE : // Close the active window
;mdidemo40142D:
idmFrameClose:
	;hwndChild = (HWND) SendMessage (hwndClient, WM_MDIGETACTIVE, 0, 0) ;
		Call4 SendMessageA,hwndClientF,229h,0,0
		mov hwndChild,rax
	;if (SendMessage (hwndChild, WM_QUERYENDSESSION, 0, 0))
		;In Windows NT WM_QUERYENDSESSION can be sent
		;only to the Frame Window
		Call4 SendMessageA,hwndChild,11h,0,0
		test rax,rax
			je @f ;return 0
		;SendMessage (hwndClient, WM_MDIDESTROY, (WPARAM) hwndChild, 0) ;
			Call4 SendMessageA,hwndClientF,221h,hwndChild,0
	;return 0 ;
		jmp @f ;mdidemo401655

;case IDM_EXIT : // Exit the program
;mdidemo40147B:
idmFrameExit:
	;SendMessage (hwnd, WM_CLOSE, 0, 0) ;
		Call4 SendMessageA,hwnd,10h,0,0
	;return 0 ;
		jmp @f ;mdidemo401655

;// messages for arranging windows
;case IDM_TILE :
;mdidemo401492:
idmFrameTile:
	;SendMessage (hwndClient, WM_MDITILE, 0, 0) ;
		Call4 SendMessageA,hwndClientF,226h,0,0
	;return 0 ;
		jmp @f ;mdidemo401655

;case IDM_CASCADE :
;mdidemo4014AE:
idmFrameCascade:
	;SendMessage (hwndClient, WM_MDICASCADE, 0, 0) ;
		Call4 SendMessageA,hwndClientF,227h,0,0
	;return 0 ;
		jmp @f ;mdidemo401655

;case IDM_ARRANGE :
;mdidemo4014CA:
idmFrameArrange:
	;SendMessage (hwndClient, WM_MDIICONARRANGE, 0, 0) ;
		Call4 SendMessageA,hwndClientF,228h,0,0
	;return 0 ;
		jmp @f ;mdidemo401655

;case IDM_CLOSEALL : // Attempt to close all children
;mdidemo4014E6:
idmFrameCloseAll:
	;EnumChildWindows (hwndClient, &CloseEnumProc, 0) ;
		;mov rcx, [hwnd] ;Passing Parameters
		;mov r9, [lParam] ;Will be passed but will not be used
		Call3 EnumChildWindows,hwndClientF,offset CloseEnumProc,0
	;return 0 ;
		jmp @f ;mdidemo401655

;default : // Pass to active child...
defFrmCmd: ;Default
	;hwndChild = (HWND) SendMessage (hwndClient, WM_MDIGETACTIVE, 0, 0) ;
		Call4 SendMessageA,hwndClientF,229h,0,0
		mov hwndChild,rax
	;if (IsWindow (hwndChild))
		Call1 IsWindow,hwndChild
		cmp rax,0
			je defFrmProc ;mdidemo401541 ;Break
		;SendMessage (hwndChild, WM_COMMAND, wParam, lParam) ;
			Call4 SendMessageA,hwndChild,111h,wParam,lParam
		jmp defFrmProc

@@:
     xor rax, rax
     jmp endFrmProc



