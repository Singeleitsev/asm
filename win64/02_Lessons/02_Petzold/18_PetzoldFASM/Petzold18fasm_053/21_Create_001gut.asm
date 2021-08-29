wmFrameCreate: ;Create the Client Window

    ;clientcreate.hWindowMenu = hMenuInitWindow;
        mov rax, [hMenuInitWindow]
        mov [clientcreate.hWindowMenu], rax

    ;clientcreate.idFirstChild = IDM_FIRSTCHILD;
        mov [clientcreate.idFirstChild], IDM_FIRSTCHILD

    ;hwndClient = CreateWindow("MDICLIENT", NULL,
        ;WS_CHILD | WS_CLIPCHILDREN | WS_VISIBLE,
        ;0, 0, 0, 0, hwnd,(HMENU) 1, hInst,
        ;(LPSTR) &clientcreate);
    invoke CreateWindowEx, 0, szClientClass, 0,\
        WS_CHILD or WS_CLIPCHILDREN or WS_VISIBLE, \
        0, 0, 0, 0, [hwnd], 1, [hInst], \  ;Why (HMENU) = 1?
        clientcreate
    mov [hwndClientF], rax

;return 0 ;
xor rax,rax
jmp endFrameWndProc