WinMain proc hInstance:QWORD,hPrevInstance:QWORD,szCmdLine:QWORD,iCmdShow:QWORD

LOCAL hAccel:QWORD
LOCAL hwndFrame:QWORD, hwndClient:QWORD

LOCAL msg:MSG64
LOCAL wndclass:WNDCLASSEX64

;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

;Align the Stack by 10h
	and rsp,-16

;Store Parameters
	mov hInstance,rcx
	mov hPrevInstance,rdx
	mov szCmdLine,r8
	mov iCmdShow,r9

	cmp hPrevInstance,0
	jne lblLoadMenu ;Skip RegisterClass, Jump to LoadMenu

;Register the Frame Window Class
	mov wndclass.cbSize,50h ;sizeof (wndclass)
	mov wndclass.style,3 ;CS_HREDRAW | CS_VREDRAW
	m64addr wndclass.lpfnWndProc,FrameWndProc
	mov wndclass.cbClsExtra,0
	mov wndclass.cbWndExtra,0
	m64m64 wndclass.hInstance,hInstance
	Call2 LoadIconA,0,7F00h ;IDI_APPLICATION
	mov wndclass.hIcon,rax
	mov wndclass.hIconSm,rax
	Call2 LoadCursorA,0,7F00h ;IDC_ARROW
	mov wndclass.hCursor,rax
	mov wndclass.hbrBackground,0Dh ;COLOR_APPWORKSPACE + 1
	mov wndclass.lpszMenuName,0
	m64addr wndclass.lpszClassName,szFrameClass
	sub rsp,20h
	lea rcx,wndclass
	call RegisterClassExA
	add rsp,20h

;Register the Sieve Child Window Class
	m64addr wndclass.lpfnWndProc,SieveWndProc
	mov wndclass.cbWndExtra,8 ;sizeof.HANDLE
	;wndclass.hbrBackground = (HBRUSH)GetStockObject(BLACK_BRUSH)
		Call1 GetStockObject,4
		mov wndclass.hbrBackground,rax
	m64addr wndclass.lpszClassName,szSieveClass
	sub rsp,20h
	lea rcx,wndclass
	call RegisterClassExA
	add rsp,20h

;Register the Gasket Child Window Class
	m64addr wndclass.lpfnWndProc,GasketWndProc
	m64addr wndclass.lpszClassName,szGasketClass
	sub rsp,20h
	lea rcx,wndclass
	call RegisterClassExA
	add rsp,20h

;Register the Ngon Child Window Class
	m64addr wndclass.lpfnWndProc,NgonWndProc
	m64addr wndclass.lpszClassName,szNgonClass
	sub rsp,20h
	lea rcx,wndclass
	call RegisterClassExA
	add rsp,20h

;Register the Tree Child Window Class
	m64addr wndclass.lpfnWndProc,TreeWndProc
	m64addr wndclass.lpszClassName,szTreeClass
	sub rsp,20h
	lea rcx,wndclass
	call RegisterClassExA
	add rsp,20h

;Obtain Handles to all possible Menus & Submenus
lblLoadMenu:
        Call2 LoadMenuA,hInst,MdiMenuInit
        mov hMenuInit,rax
        Call2 LoadMenuA,hInst,MdiMenuSieve
        mov hMenuSieve,rax
        Call2 LoadMenuA,hInst,MdiMenuGasket
        mov hMenuGasket,rax
        Call2 LoadMenuA,hInst,MdiMenuNgon
        mov hMenuNgon,rax
        Call2 LoadMenuA,hInst,MdiMenuTree
        mov hMenuTree,rax
        Call2 GetSubMenu,hMenuInit,INIT_MENU_POS
        mov hMenuInitWindow,rax
        Call2 GetSubMenu,hMenuSieve,SIEVE_MENU_POS
        mov hMenuSieveWindow,rax
        Call2 GetSubMenu,hMenuGasket,GASKET_MENU_POS
        mov hMenuGasketWindow,rax
        Call2 GetSubMenu,hMenuNgon,NGON_MENU_POS
        mov hMenuNgonWindow,rax
        Call2 GetSubMenu,hMenuTree,TREE_MENU_POS
        mov hMenuTreeWindow,rax

;Load Accelerator Table
        Call2 LoadAcceleratorsA,hInst,MdiAccel
        mov hAccel,rax

;Create the Frame Window
	sub rsp,60h
	xor rcx,rcx ;dwExStyle
	lea rdx,szFrameClass ;lpClassName
	lea r8,szFrameTitle ;lpWindowName
	mov r9,2CF0000h ;dwStyle = WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN
	mov rax,80000000h ;CW_USEDEFAULT
	mov qword ptr [rsp+20h],rax ;x
	mov qword ptr [rsp+28h],rax ;y
	mov qword ptr [rsp+30h],rax ;nWidth
	mov qword ptr [rsp+38h],rax ;nHeight
	mov qword ptr [rsp+40h],0 ;hWndParent
	m64m64 qword ptr [rsp+48h],hMenuInit ;hMenu
	m64m64 qword ptr [rsp+50h],hInstance
	mov qword ptr [rsp+58h],0 ;lpParam
	call CreateWindowExA
	add rsp,60h
	mov hwndFrame,rax

;hwndClient = GetWindow (hwndFrame, GW_CHILD)
	Call2 GetWindow,hwndFrame,5 ;GW_CHILD = 5
	mov hwndClient,rax

;ShowWindow (hwndFrame, iCmdShow)
	Call2 ShowWindow,hwndFrame,1 ;nCmdShow = SW_SHOWNORMAL = 1
;UpdateWindow (hwndFrame)
	Call1 UpdateWindow,hwndFrame

;Enter the Message Loop
MsgLoop:
	;while(GetMessage(&msg,NULL,0,0))
		sub rsp,20h
		lea rcx,msg
		xor rdx,rdx
		xor r8,r8
		xor r9,r9
		call GetMessageA
		add rsp,20h
		test rax,rax
			je CleanUp
	;if(!TranslateMDISysAccel(hwndClient,&msg) &&
		sub rsp,20h
		mov rcx,hwndClient
		lea rdx,msg
	        call TranslateMDISysAccel
		add rsp,20h
		cmp rax,0
			jne MsgLoop
	;!TranslateAccelerator(hwndFrame,hAccel,&msg))
		sub rsp,20h
		mov rcx,hwndFrame
		mov rdx,hAccel
		lea r8,msg
		call TranslateAccelerator
		add rsp,20h
		cmp rax,0
			jne MsgLoop
	;TranslateMessage(&msg)
		sub rsp,20h
		lea rcx,msg
		call TranslateMessage
		;add rsp,20h
	;DispatchMessage(&msg)
		;sub rsp,20h
		lea rcx,msg
		call DispatchMessageA
		add rsp,20h
jmp MsgLoop

;Clean up by deleting unattached Menus
CleanUp:
	Call1 DestroyMenu,hMenuSieve
	Call1 DestroyMenu,hMenuGasket
	Call1 DestroyMenu,hMenuNgon
	Call1 DestroyMenu,hMenuTree

;return msg.wParam
	mov rax,msg.wParam

endWinMain:
;Assembler will add this epilogue automatically:
	;leave
	ret
WinMain endp
