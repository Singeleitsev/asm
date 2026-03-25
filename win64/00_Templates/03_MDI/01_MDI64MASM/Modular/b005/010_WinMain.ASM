WinMain proc

;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp
;Stack Usage: 8(return address)+0(parameters)+8(push)+0(locals) = 10h

;Align the Stack by 10h
	and rsp,-16

        Call1 GetModuleHandleA, 0
        mov hInstance,rax
Spell64rax 0, szFrameTitle, szAppHandle

;Register the Frame Window Class
;Fill up the WNDCLASSEX structure
        ;WndClass.cbSize = sizeof(WndClass);
                mov wc.cbSize,50h ;dword ptr sizeof WNDCLASSEX64
        ;WndClass.style = CS_HREDRAW | CS_VREDRAW;
                mov wc.style, 3 ;CS_HREDRAW + CS_VREDRAW = 2 + 1 = 3
        ;WndClass.lpfnWndProc = FrameWndProc;
                m64addr wc.lpfnWndProc,FrameWndProc
        ;WndClass.cbClsExtra = 0;
                mov wc.cbClsExtra,0
        ;WndClass.cbWndExtra = 0;
                mov wc.cbWndExtra,0
        ;WndClass.hInstance = hInstance;
                m64m64 wc.hInstance,hInstance
        ;WndClass.hIcon = LoadIcon(NULL, IDI_APPLICATION);
                Call2 LoadIconA, 0, 7F00h
                mov wc.hIcon,rax
                mov wc.hIconSm,rax
        ;WndClass.hCursor = LoadCursor(NULL, IDC_ARROW);
                Call2 LoadCursorA, 0, 7F00h
                mov wc.hCursor,rax
        ;WndClass.hbrBackground =(HBRUSH)(COLOR_APPWORKSPACE + 1);
                mov wc.hbrBackground,0Dh
        ;WndClass.lpszMenuName = NULL;
                mov wc.lpszMenuName,0
        ;WndClass.lpszClassName = szFrameClass;
                m64addr wc.lpszClassName,szFrameClass
        ;WndClass.hIconSm = LoadIcon(NULL, IDI_APPLICATION);
                ;Already done
        ;invoke RegisterClassEx, WndClass
                Call1 RegisterClassExA, offset wc
cmp rax, 0
je errWinMain

;Register the Child Window Class
;There is no need to refill WNDCLASSEX again - just change some values
        ;WndClass.lpfnWndProc = ChildWndProc;
                m64addr wc.lpfnWndProc,ChildWndProc
        ;WndClass.cbWndExtra = sizeof(HANDLE);
                mov wc.cbWndExtra,8
        ;WndClass.hbrBackground =(HBRUSH) GetStockObject(WHITE_BRUSH);
                Call1 GetStockObject, 0
                mov wc.hbrBackground,rax
        ;WndClass.lpszClassName = szChildClass;
                m64addr wc.lpszClassName,szChildClass
        ;invoke RegisterClassEx, WndClass
                Call1 RegisterClassExA, offset wc
cmp rax, 0
je errWinMain

;Get Menu Handles
        Call2 LoadMenuA, hInstance, IDR_MAINMENU ;lpMenuName
        mov hMainMenu,rax
cmp rax, 0
je errMenu
        Call2 GetSubMenu, hMainMenu, 0 ;nPos = 0; 'File' Menu Position is 0
        mov hMainSubMenu,rax
cmp rax, 0
je errMenu
        Call2 LoadMenuA, hInstance, IDR_CHILDMENU
        mov hChildMenu,rax
cmp rax, 0
je errMenu
        Call2 GetSubMenu, hChildMenu, 1 ;nPos = 1; 'Window' Menu Position is 1
        mov hChildSubMenu,rax
cmp rax, 0
je errMenu

;Create the Frame Window
	sub rsp,60h
        xor rcx,rcx ;dwExStyle
        lea rdx,szFrameClass ;lpszFrameClass
        lea r8,szFrameTitle ;lpszFrameTitle
        mov r9,2CF0000h ;dwStyle = WS_OVERLAPPEDWINDOW + WS_CLIPCHILDREN
        mov rax,80000000h ;CW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+20h],rax ;x = CW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+28h],rax ;y = ÑW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+30h],rax ;nWidth = CW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+38h],rax ;nHeight = CW_USEDEFAULT = 8000.0000h
        mov qword ptr [rsp+40h],0 ;hWndParent
        m64m64 qword ptr [rsp+48h],hMainMenu
        m64m64 qword ptr [rsp+50h],hInstance
        mov qword ptr [rsp+58h],0 ;lpParam 
        call CreateWindowExA
        mov hWndFrame,rax
	add rsp,60h
Spell64rax 0, szFrameTitle, szFrameHandle

;Get Client Window Handle
        Call2 GetWindow, hWndFrame, 5 ;GW_CHILD = 5
        mov hWndClient,rax ;hWndClient

;Show and Update the Frame Window
        Call2 ShowWindow, hWndFrame, 1 ;nCmdShow = SW_SHOWNORMAL = 1
        Call1 UpdateWindow,hWndFrame

;Enter the Loop
MsgLoop:
	sub rsp,20h
        lea rcx,msg
	xor rdx,rdx
	xor r8,r8
	xor r9,r9
	call GetMessageA
	add rsp,20h
        cmp rax,0
		je CleanUp
	sub rsp,20h
	mov rcx, hWndClient
	lea rdx,msg ;Re-Load is necessary
        call TranslateMDISysAccel
	add rsp,20h
        cmp rax,0
		jne MsgLoop
	sub rsp,20h
	lea rcx,msg ;Re-Load is necessary
        call TranslateMessage
	lea rcx,msg ;Re-Load is necessary
        call DispatchMessageA
	add rsp,20h
jmp MsgLoop

;Error Alarms
errMenu:
        lea rdx,szErrMenu ;lpText
        jmp errWinMainAlarm
errWinMain:
        lea rdx,szErrWinMain ;lpText
errWinMainAlarm:
	;MB_OK + MB_ICONERROR
        Call4 MessageBoxA, 0, rdx, offset szFrameTitle, 10h
	sub rsp,20h
        call GetLastError
	add rsp,20h
        Spell64rax 0, szFrameTitle, szLastErr

CleanUp:
        Call1 DestroyMenu, hChildMenu
;There is no need to restore the Stack before exit
        Call1 FatalExit, msg.wParam
WinMain endp

