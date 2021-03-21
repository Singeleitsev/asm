;=======================================================================
WinMain proc ;hInst:QWORD, hPrevInst:QWORD, CmdLine:QWORD, CmdShow:QWORD
;=======================================================================
;This Procedure has parameters hence Assembler WILL add following instructions here:
	;push rbp ;<-- ;sub rsp,8
	;mov rbp,rsp ;<--
;Align the Stack by 10h
	and rsp,-16
	sub rsp,80h

;Get Application Handle
	Call1 GetModuleHandleA,0
	mov hInst,rax
	cmp rax,0
	je errWinMain
;Register the Frame Window Class
;Fill up the WNDCLASSEX structure
	mov wc.cbSize,50h ;dword ptr sizeof WNDCLASSEX64
	;mov wc.style,4003h ;CS_HREDRAW + CS_VREDRAW + CS_GLOBALCLASS
	mov wc.style,3
	m64addr wc.lpfnWndProc,WndProc
	mov wc.cbClsExtra,0
	mov wc.cbWndExtra,0
	m64m64 wc.hInstance,hInst
;Load Icon
	Call2 LoadIconA,0,7F03h ;hIcon = IDI_EXCLAMATION = 32515 = 7F03h
	mov wc.hIcon,rax
;Load Cursor
	Call2 LoadCursorA,0,7F89h ;hCursor = IDC_HAND = 32649 =7F89h
	mov wc.hCursor,rax
;Load Background Brush
	xor rcx,rcx ;WHITE_BRUSH = 0
	call GetStockObject
	mov wc.hbrBackground,1
;Fill up the rest of WNDCLASSEX64
	mov wc.lpszMenuName,MYMENU ;<-----
	m64addr wc.lpszClassName,szWndClass
	mov wc.hIconSm,0
;Now call the Function
	Call1 RegisterClassEx,offset wc
	cmp rax,0
	je errWinMain

;Create the Main Window
	xor rcx,rcx ;dwExStyle
	lea rdx,szWndClass
	lea r8,szAppTitle
	mov r9,0CF0000h ;dwStyle = WS_OVERLAPPEDWINDOW = 00CF.0000h
	mov rax,80000000h ;CW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+20h],rax ;x = CW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+28h],rax ;y = ÑW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+30h],rax ;nWidth = CW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+38h],rax ;nHeight = CW_USEDEFAULT = 8000.0000h
	mov qword ptr [rsp+40h],0 ;hWndParent 
	mov qword ptr [rsp+48h],0 ;hMenu
	m64m64 qword ptr [rsp+50h],hInst
	mov qword ptr [rsp+58h],0 ;lpParam 
	call CreateWindowExA
;Store the Handle
	mov hWndMain,rax
	cmp rax,0
	je errWndHandle


;Show and Update the Main Window
	Call2 ShowWindow,hWndMain,1 ;nCmdShow = SW_SHOWNORMAL = 1
	Call1 UpdateWindow,hWndMain

;Enter the Loop
MsgLoop: ;Critical time, don't use macros
	lea rcx,msg ;lpMsg
	xor rdx,rdx ;hWnd
	xor r8,r8 ;wMsgFilterMin
	xor r9,r9 ;wMsgFilterMax
	call GetMessageA
	cmp rax,0
	je CleanUp
	lea rcx,msg
	call TranslateMessage
	lea rcx,msg ;Re-Load is necessary
	call DispatchMessageA
jmp MsgLoop

;Error Alarms
errWndHandle:
	lea rdx,szErrFrameHandle ;lpText
	jmp errWinMainAlarm
errWinMain:
	lea rdx,szErrWinMain ;lpText
	;jmp errWinMainAlarm
errWinMainAlarm:
	;MB_OK + MB_ICONERROR = 0 + 10h = 10h
	Call4 MessageBoxA,0,rdx,offset szAppTitle,10h

CleanUp:
	Call1 ExitProcess,0
WinMain endp