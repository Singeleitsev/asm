;==============================================================================================
;int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
;==============================================================================================
proc WinMain uses rbx rsi rdi, hInstance:QWORD, hPrevInstance:QWORD, szCmdLine:QWORD, iCmdShow:QWORD
;HACCEL      hAccel ;
;HWND        hwndFrame, hwndClient ;
;MSG         msg ;
;WNDCLASSEX  wndclass;

locals
    hAccel dq 0
    hwndFrame dq 0
    hwndClient dq 0
endl

;Align the Stack by 10h
    ;and rsp,-16
;Store Parameters
    mov [hInstance],rcx
    mov [hPrevInstance],rdx
    mov [szCmdLine],r8
    mov [iCmdShow],r9

;hInst = hInstance ;
    mov rcx,[hInstance]
    mov [hInst],rcx

;Register the Frame Window Class
;Fill up the WNDCLASSEX structure
    ;wndclass.cbSize = sizeof(wndclass);
        mov [wndclass.cbSize], 50h
    ;wndclass.style = CS_HREDRAW | CS_VREDRAW;
        mov [wndclass.style], 3
    ;wndclass.lpfnWndProc = FrameWndProc;
        mov rax, FrameWndProc
        mov [wndclass.lpfnWndProc], rax
    ;wndclass.cbClsExtra = 0;
        mov [wndclass.cbClsExtra], 0
    ;wndclass.cbWndExtra = 0;
        mov [wndclass.cbWndExtra], 0
    ;wndclass.hInstance = hInstance;
        mov rax, [hInstance]
        mov [wndclass.hInstance], rax
    ;wndclass.hIcon = LoadIcon(NULL, IDI_APPLICATION);
        invoke LoadIcon, 0, 7F00h
        mov [wndclass.hIcon], rax
    ;wndclass.hCursor = LoadCursor(NULL, IDC_ARROW);
        invoke LoadCursor, 0, 7F00h
        mov [wndclass.hCursor], rax
    ;wndclass.hbrBackground =(HBRUSH)(COLOR_APPWORKSPACE + 1);
        mov [wndclass.hbrBackground], 0Dh
    ;wndclass.lpszMenuName = NULL;
        mov [wndclass.lpszMenuName], 0
    ;wndclass.lpszClassName = szFrameClass;
        mov rax, szFrameClass
        mov [wndclass.lpszClassName], rax
    ;wndclass.hIconSm = LoadIcon(NULL, IDI_APPLICATION);
        invoke LoadIcon, 0, 7F00h
        mov [wndclass.hIconSm], rax
    invoke RegisterClassEx, wndclass
        test rax,rax
        jz errWinMain
;Register the Hello Child Window Class
;ReFill the WNDCLASSEX structure
    ;wndclass.cbSize = sizeof(wndclass);
        ;Already done
    ;wndclass.style = CS_HREDRAW | CS_VREDRAW;
        ;Already done
    ;wndclass.lpfnWndProc = HelloWndProc;
        mov rax, HelloWndProc
        mov [wndclass.lpfnWndProc], rax
    ;mov [wndclass.cbClsExtra], 0;
        ;Already done
    ;wndclass.cbWndExtra = sizeof(HANDLE);
        mov [wndclass.cbWndExtra], 8
    ;wndclass.hInstance = hInstance;
        ;Already done
    ;wndclass.hIcon = LoadIcon(NULL, IDI_APPLICATION);
        ;Already done
    ;wndclass.hCursor = LoadCursor(NULL, IDC_ARROW);
        ;Already done
    ;wndclass.hbrBackground =(HBRUSH) GetStockObject(WHITE_BRUSH);
        invoke GetStockObject, 0
        mov [wndclass.hbrBackground], rax
    ;wndclass.lpszMenuName = NULL;
        ;Already done
    ;wndclass.lpszClassName = szHelloClass;
        mov rax, szHelloClass
        mov [wndclass.lpszClassName], rax
    ;wndclass.hIconSm = LoadIcon(NULL, IDI_APPLICATION);
        ;Already done
    invoke RegisterClassEx, wndclass
        test rax,rax
        jz errWinMain
;Register the Rect Child Window Class
;ReFill the WNDCLASSEX structure
    ;wndclass.cbSize = sizeof(wndclass);
        ;Already done
    ;wndclass.style = CS_HREDRAW | CS_VREDRAW;
        ;Already done
    ;wndclass.lpfnWndProc = RectWndProc;
        mov rax, RectWndProc
        mov [wndclass.lpfnWndProc], rax
    ;wndclass.cbClsExtra = 0;
        ;Already done
    ;wndclass.cbWndExtra = sizeof(HANDLE);
        ;Already done
    ;wndclass.hInstance = hInstance;
        ;Already done
    ;wndclass.hIcon = LoadIcon(NULL, IDI_APPLICATION);
        ;Already done
    ;wndclass.hCursor = LoadCursor(NULL, IDC_ARROW);
        ;Already done
    ;wndclass.hbrBackground =(HBRUSH) GetStockObject(WHITE_BRUSH);
        ;Already done
    ;wndclass.lpszMenuName = NULL;
        ;Already done
    ;wndclass.lpszClassName = szRectClass;
        mov rax, szRectClass
        mov [wndclass.lpszClassName], rax
    ;wndclass.hIconSm = LoadIcon(NULL, IDI_APPLICATION);
        ;Already done
    invoke RegisterClassEx, wndclass

;Obtain handles to three possible menus & submenus
    ;hMenuInit = LoadMenu(hInst, "MdiMenuInit");
        invoke LoadMenu, [hInst], 50 ;lpMenuName = MdiMenuInit = 50
        mov [hMenuInit], rax
    ;hMenuHello = LoadMenu(hInst, "MdiMenuHello");
        invoke LoadMenu, [hInst], 51 ;lpMenuName = MdiMenuHello = 51
        mov [hMenuHello], rax
    ;hMenuRect = LoadMenu(hInst, "MdiMenuRect");
        invoke LoadMenu, [hInst], 52 ;lpMenuName = MdiMenuRect = 52
        mov [hMenuRect], rax
    ;hMenuInitWindow = GetSubMenu(hMenuInit, INIT_MENU_POS);
        invoke GetSubMenu, [hMenuInit], INIT_MENU_POS ;Position of SubMenu in MenuInit = 0
        mov [hMenuInitWindow], rax
    ;hMenuHelloWindow = GetSubMenu(hMenuHello, HELLO_MENU_POS);
        invoke GetSubMenu, [hMenuHello], HELLO_MENU_POS ;Position of SubMenu in MenuHello = 2
        mov [hMenuHelloWindow], rax
    ;hMenuRectWindow = GetSubMenu(hMenuRect, RECT_MENU_POS);
        invoke GetSubMenu, [hMenuRect], RECT_MENU_POS ;Position of SubMenu in MenuRect = 1
        mov [hMenuRectWindow], rax

; Load accelerator table
    ;hAccel = LoadAccelerators(hInst, "MdiAccel");
        ;invoke LoadAccelerators, [hInst], 60 ;"MdiAccel" = 60
        ;mov [hAccel], rax

;Create the Frame Window
invoke CreateWindowEx, 0, szFrameClass, szFrameTitle,\
       WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN,\
       CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,\
       NULL, [hMenuInit], [hInstance], NULL
    mov [hwndFrame], rax

;hwndClient = GetWindow(hwndFrame, GW_CHILD);
    invoke GetWindow, [hwndFrame], GW_CHILD
    mov [hwndClient], rax

;ShowWindow(hwndFrame, iCmdShow);
    invoke ShowWindow, [hwndFrame], 1 ;nCmdShow = SW_SHOWNORMAL = 1
;UpdateWindow(hwndFrame);
    invoke UpdateWindow, [hwndFrame]

;Enter the modified Message loop
MsgLoop:
    invoke GetMessage, msg, 0, 0, 0
    cmp rax, 0
        je CleanUp
    ;invoke TranslateMDISysAccel, [hwndClient], msg
    ;cmp rax, 0
        ;jne MsgLoop
    ;invoke TranslateAccelerator, [hwndFrame], [hAccel], msg
    ;cmp rax, 0
        ;jne MsgLoop
    invoke TranslateMessage, msg
    invoke DispatchMessage, msg
jmp MsgLoop

errWinMain:
    invoke  MessageBox, 0, szMainErr, szFrameTitle, 10h ;MB_ICONERROR+MB_OK

;Clean up by deleting unattached menus
CleanUp:
    invoke DestroyMenu, [hMenuHello]
    invoke DestroyMenu, [hMenuRect]

;return msg.wParam;
EndAll:
    ret
endp    ;WinMain
