;==============================================================================
;int WINAPI WinMain
;(HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
WinMain proc hInstance:QWORD,hPrevInstance:QWORD,szCmdLine:QWORD,iCmdShow:QWORD
;==============================================================================
;mdidemo401000:
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

;HACCEL hAccel;
	LOCAL hAccel:QWORD
;HWND hwndFrame, hwndClient ;
	LOCAL hwndFrame:QWORD, hwndClient:QWORD
;MSG msg;
	LOCAL msg:MSG64
;WNDCLASSEX wndclass;
	LOCAL wndclass:WNDCLASSEX64

;Align the Stack by 10h
	and rsp,-16
;Store Parameters
	mov hInstance,rcx
        mov hPrevInstance,rdx
        mov szCmdLine,r8
	mov iCmdShow,r9

;hInst = hInstance ;
	mov rcx,hInstance
	mov hInst,rcx
;if (!hPrevInstance)
	cmp hPrevInstance,0
	jne mdidemo40118B ;Skip RegisterClass, Jump to LoadMenu

;// Register the frame window class
;wndclass.cbSize = sizeof (wndclass) ;
	mov wndclass.cbSize,50h
;wndclass.style = CS_HREDRAW | CS_VREDRAW ;
	mov wndclass.style,3
;wndclass.lpfnWndProc = FrameWndProc ;
	m64addr wndclass.lpfnWndProc,FrameWndProc ;mdidemo401305
;wndclass.cbClsExtra = 0 ;
	mov wndclass.cbClsExtra,0
;wndclass.cbWndExtra = 0 ;
	mov wndclass.cbWndExtra,0
;wndclass.hInstance = hInstance ;
	m64m64 wndclass.hInstance,hInstance
;wndclass.hIcon = LoadIcon (NULL, IDI_APPLICATION) ;
	Call2 LoadIcon,0,7F00h
	mov wndclass.hIcon,rax
	mov wndclass.hIconSm,rax
;wndclass.hCursor = LoadCursor (NULL, IDC_ARROW) ;
	Call2 LoadCursorA,0,7F00h
	mov wndclass.hCursor,rax
;wndclass.hbrBackground = (HBRUSH) (COLOR_APPWORKSPACE + 1) ;
	mov wndclass.hbrBackground,0Dh
;wndclass.lpszMenuName = NULL ;
	mov wndclass.lpszMenuName,0
;wndclass.lpszClassName = szFrameClass ;
	m64addr wndclass.lpszClassName,szFrameClass ;mdidemo405030
;wndclass.hIconSm = LoadIcon (NULL, IDI_APPLICATION) ;
	;Call2 LoadIcon,0,7F00h
	;mov wndclass.hIconSm,rax
;RegisterClassEx (&wndclass) ;
	sub rsp,20h
	lea rcx,wndclass
	call RegisterClassExA
	add rsp,20h

;// Register the Hello child window class
;wndclass.cbSize = sizeof (wndclass) ;
	;mov wndclass.cbSize,50h
;wndclass.style = CS_HREDRAW | CS_VREDRAW ;
	;mov wndclass.style,3
;wndclass.lpfnWndProc = HelloWndProc ;
	m64addr wndclass.lpfnWndProc,HelloWndProc ;mdidemo4016EB
;wndclass.cbClsExtra = 0 ;
	;mov wndclass.cbClsExtra,0
;wndclass.cbWndExtra = sizeof (HANDLE) ;
	mov wndclass.cbWndExtra,8 ;sizeof.HANDLE
;wndclass.hInstance = hInstance ;
	;m64m64 wndclass.hInstance,hInstance
;wndclass.hIcon = LoadIcon (NULL, IDI_APPLICATION) ;
	;Call2 LoadIcon,0,7F00h
	;mov wndclass.hIcon,rax
;wndclass.hCursor = LoadCursor (NULL, IDC_ARROW) ;
	;Call2 LoadCursorA,0,7F00h
	;mov wndclass.hCursor,rax
;wndclass.hbrBackground = (HBRUSH) GetStockObject (WHITE_BRUSH) ;
	Call1 GetStockObject,0
	mov wndclass.hbrBackground,rax
;wndclass.lpszMenuName = NULL ;
	;mov wndclass.lpszMenuName,0
;wndclass.lpszClassName = szHelloClass ;
	m64addr wndclass.lpszClassName,szHelloClass ;mdidemo405040
;wndclass.hIconSm = LoadIcon (NULL, IDI_APPLICATION) ;
	;Call2 LoadIcon,0,7F00h
	;mov wndclass.hIconSm,rax
;RegisterClassEx (&wndclass) ;
	sub rsp,20h
	lea rcx,wndclass
	call RegisterClassExA
	add rsp,20h


;// Register the Rect child window class
;wndclass.cbSize = sizeof (wndclass) ;
	;mov wndclass.cbSize,50h
;wndclass.style = CS_HREDRAW | CS_VREDRAW ;
	;mov wndclass.style,3
;wndclass.lpfnWndProc = RectWndProc ;
	m64addr wndclass.lpfnWndProc,RectWndProc ;mdidemo4019D7
;wndclass.cbClsExtra = 0 ;
	;mov wndclass.cbClsExtra,0
;wndclass.cbWndExtra = sizeof (HANDLE) ;
	;mov wndclass.cbWndExtra,8 ;sizeof.HANDLE
;wndclass.hInstance = hInstance ;
	;m64m64 wndclass.hInstance,hInstance
;wndclass.hIcon = LoadIcon (NULL, IDI_APPLICATION) ;
	;Call2 LoadIcon,0,7F00h
	;mov wndclass.hIcon,rax
;wndclass.hCursor = LoadCursor (NULL, IDC_ARROW) ;
	;Call2 LoadCursorA,0,7F00h
	;mov wndclass.hCursor,rax
;wndclass.hbrBackground = (HBRUSH) GetStockObject (WHITE_BRUSH) ;
	;Call1 GetStockObject,0
	;mov wndclass.hbrBackground,rax
;wndclass.lpszMenuName = NULL ;
	;mov wndclass.lpszMenuName,0
;wndclass.lpszClassName = szRectClass ;
	m64addr wndclass.lpszClassName,szRectClass ;mdidemo405050
;wndclass.hIconSm = LoadIcon (NULL, IDI_APPLICATION) ;
	;Call2 LoadIcon,0,7F00h
	;mov wndclass.hIconSm,rax
;RegisterClassEx (&wndclass) ;
	sub rsp,20h
	lea rcx,wndclass
	call RegisterClassExA
	add rsp,20h


;// Obtain handles to three possible menus & submenus
mdidemo40118B:
;hMenuInit  = LoadMenu (hInst, "MdiMenuInit") ;
        Call2 LoadMenuA,hInst,MdiMenuInit
        mov hMenuInit,rax
;hMenuHello = LoadMenu (hInst, "MdiMenuHello") ;
        Call2 LoadMenuA,hInst,MdiMenuHello
        mov hMenuHello,rax
;hMenuRect = LoadMenu (hInst, "MdiMenuRect") ;
        Call2 LoadMenuA,hInst,MdiMenuRect
        mov hMenuRect,rax
;hMenuInitWindow = GetSubMenu (hMenuInit, INIT_MENU_POS) ;
        Call2 GetSubMenu,hMenuInit,INIT_MENU_POS ;Position of SubMenu in MenuInit = 0
        mov hMenuInitWindow,rax
;hMenuHelloWindow = GetSubMenu (hMenuHello, HELLO_MENU_POS) ;
        Call2 GetSubMenu,hMenuHello,HELLO_MENU_POS ;Position of SubMenu in MenuHello = 2
        mov hMenuHelloWindow,rax
;hMenuRectWindow = GetSubMenu (hMenuRect, RECT_MENU_POS) ;
        Call2 GetSubMenu,hMenuRect,RECT_MENU_POS ;Position of SubMenu in MenuRect = 1
        mov hMenuRectWindow,rax

;// Load accelerator table
;hAccel = LoadAccelerators (hInst, "MdiAccel") ;
        Call2 LoadAccelerators,hInst,MdiAccel
        mov hAccel,rax

;// Create the frame window
;hwndFrame = CreateWindow (szFrameClass, "MDI Demonstration",
	;WS_OVERLAPPEDWINDOW | WS_CLIPCHILDREN,
	;CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
	;NULL, hMenuInit, hInstance, NULL) ;
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

;hwndClient = GetWindow (hwndFrame, GW_CHILD) ;
	Call2 GetWindow,hwndFrame,5 ;GW_CHILD = 5
	mov hwndClient,rax
;ShowWindow (hwndFrame, iCmdShow) ;
	Call2 ShowWindow,hwndFrame,1 ;nCmdShow = SW_SHOWNORMAL = 1
;UpdateWindow (hwndFrame) ;
	Call1 UpdateWindow,hwndFrame

;// Enter the modified message loop
;mdidemo40127D:
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
			je CleanUp ;mdidemo4012DE
	;if(!TranslateMDISysAccel(hwndClient,&msg) &&
		sub rsp,20h
		mov rcx,hwndClient
		lea rdx,msg
	        call TranslateMDISysAccel
		add rsp,20h
		cmp rax,0
			jne MsgLoop ;mdidemo4012D9
	;!TranslateAccelerator(hwndFrame,hAccel,&msg))
		sub rsp,20h
		mov rcx,hwndFrame
		mov rdx,hAccel
		lea r8,msg
		call TranslateAccelerator
		add rsp,20h
		cmp rax,0
			jne MsgLoop ;mdidemo4012D9
	;TranslateMessage(&msg);
		sub rsp,20h
		lea rcx,msg
		call TranslateMessage
		;add rsp,20h
	;DispatchMessage(&msg);
		;sub rsp,20h
		lea rcx,msg
		call DispatchMessageA
		add rsp,20h
jmp MsgLoop ;mdidemo40127D

;// Clean up by deleting unattached menus
;mdidemo4012DE:
CleanUp:
	;DestroyMenu (hMenuHello) ;
	Call1 DestroyMenu,hMenuHello
	;DestroyMenu (hMenuRect) ;
	Call1 DestroyMenu,hMenuRect

;return msg.wParam ;
	mov rax,msg.wParam

;mdidemo4012FE: ;End Proc
endWinMain:
;Assembler will add this epilogue automatically:
	;leave
	ret ;10h
WinMain endp
