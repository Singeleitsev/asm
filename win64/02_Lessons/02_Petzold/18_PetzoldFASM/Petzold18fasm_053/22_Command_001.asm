wmFrameCommand:
;switch(wParam)
    cmp r8, IDM_NEWHELLO
        je idmFrameNewHello
    cmp r8, IDM_NEWRECT
        je idmFrameNewRect
    cmp r8, IDM_CLOSE
        je idmFrameClose
    cmp r8, IDM_EXIT
        je idmFrameExit
    cmp r8, IDM_TILE
        je idmFrameTile
    cmp r8, IDM_CASCADE
        je idmFrameCascade
    cmp r8, IDM_ARRANGE
        je idmFrameArrange
    cmp r8, IDM_CLOSEALL
        je idmFrameCloseAll
    cmp r8, IDM_ABOUT
        je idmFrameAbout
    jmp defFrameCmd

idmFrameNewHello:
    ;Create a Hello Child Window
    ;Initialize the MDICREATESTRUCT
        ;mdicreate.szClass = szHelloClass;
            mov rax, szHelloClass
            mov [mdicreate.szClass], rax
        ;mdicreate.szTitle = "Hello";
            mov rax, szHelloTitle
            mov [mdicreate.szTitle], rax
        ;mdicreate.hOwner = hInst;
            mov rax, [hInst]
            mov [mdicreate.hOwner], rax
        ;mdicreate.x = CW_USEDEFAULT;
            mov [mdicreate.x], CW_USEDEFAULT
        ;mdicreate.y = CW_USEDEFAULT;
            mov [mdicreate.y], CW_USEDEFAULT
        ;mdicreate.cx = CW_USEDEFAULT;
            mov [mdicreate.cx], CW_USEDEFAULT
        ;mdicreate.cy = CW_USEDEFAULT;
            mov [mdicreate.cy], CW_USEDEFAULT
        ;mdicreate.style = 0;
            mov [mdicreate.style], 0
        ;mdicreate.lParam = 0;
            mov [mdicreate.lParam], 0
        invoke SendMessage, [hwndClientF], WM_MDICREATE, 0, mdicreate
        mov [hwndChild], rax
        jmp endFrameWndProc

idmFrameNewRect:
    ;Create a Rect Child Window
        ;mdicreate.szClass = szRectClass;
            mov rax, szRectClass
            mov [mdicreate.szClass], rax
        ;mdicreate.szTitle = "Rectangles";
            mov rax, szRectTitle
            mov [mdicreate.szTitle], rax
        ;mdicreate.hOwner = hInst;
            mov rax, [hInst]
            mov [mdicreate.hOwner], rax
        ;mdicreate.x = CW_USEDEFAULT;
            mov [mdicreate.x], CW_USEDEFAULT
        ;mdicreate.y = CW_USEDEFAULT;
            mov [mdicreate.y], CW_USEDEFAULT
        ;mdicreate.cx = CW_USEDEFAULT;
            mov [mdicreate.cx], CW_USEDEFAULT
        ;mdicreate.cy = CW_USEDEFAULT;
            mov [mdicreate.cy], CW_USEDEFAULT
        ;mdicreate.style = 0;
            mov [mdicreate.style], 0
        ;mdicreate.lParam = 0;
            mov [mdicreate.lParam], 0
        invoke SendMessage, [hwndClientF], WM_MDICREATE, 0, mdicreate
        mov [hwndChild], rax
        jmp endFrameWndProc

idmFrameClose: ;Close the active window
    ;hwndChild =(HWND) SendMessage(hwndClient, WM_MDIGETACTIVE, 0, 0);
    ;if(SendMessage(hwndChild, WM_QUERYENDSESSION, 0, 0))
        ;SendMessage(hwndClient, WM_MDIDESTROY, (WPARAM) hwndChild, 0);
    ;return 0;
        invoke SendMessage, [hwndClientF], WM_MDIGETACTIVE, 0, 0
        mov [hwndChild], rax
        invoke SendMessage, [hwndChild], WM_QUERYENDSESSION, 0, 0
        cmp rax, 0
            je @f
        invoke SendMessage, [hwndClientF], WM_MDIDESTROY, [hwndChild], 0
        jmp @f

idmFrameExit: ;Exit the program
    ;SendMessage(hwnd, WM_CLOSE, 0, 0);
        invoke SendMessage, [hwnd], WM_CLOSE, 0, 0
        jmp @f

;messages for arranging windows
idmFrameTile:
    ;SendMessage(hwndClient, WM_MDITILE, 0, 0);
        invoke SendMessage, [hwndClientF], WM_MDITILE, 0, 0
        jmp @f
idmFrameCascade:
    ;SendMessage(hwndClient, WM_MDICASCADE, 0, 0);
        invoke SendMessage, [hwndClientF], WM_MDICASCADE, 0, 0
        jmp @f
idmFrameArrange:
    ;SendMessage(hwndClient, WM_MDIICONARRANGE, 0, 0);
        invoke SendMessage, [hwndClientF], WM_MDIICONARRANGE, 0, 0
        jmp @f

idmFrameCloseAll:
    ;EnumChildWindows(hwndClient, &CloseEnumProc, 0);
        ;mov rcx, [hwnd] ;Passing Parameters
        ;mov r9, [lParam] ;Will be passed but will not be used
        invoke EnumChildWindows, [hwndClientF], CloseEnumProc, 0
        jmp @f

idmFrameAbout:
    invoke MessageBox, [hwnd], szAbout, szFrameTitle, MB_ICONINFORMATION
    jmp @f

defFrameCmd: ;Pass to active child...
    ;hwndChild =(HWND) SendMessage(hwndClient, WM_MDIGETACTIVE, 0, 0);
    ;if(IsWindow(hwndChild))
        ;SendMessage(hwndChild, WM_COMMAND, wParam, lParam);
    ;break; // ...and then to DefFrameProc
        invoke SendMessage, [hwndClientF], WM_MDIGETACTIVE, 0, 0
        mov [hwndChild], rax
        invoke IsWindow, [hwndChild]
        cmp rax, 0
            je defFrameWndProc
        invoke SendMessage, [hwndChild], WM_COMMAND, [wParam], [lParam]
        jmp defFrameWndProc

@@:
     xor rax, rax
     jmp endFrameWndProc
