wmHelloCreate:

;Allocate memory for window private data
    ;lpHelloData =(LPHELLODATA) HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, sizeof(HELLODATA));
        invoke GetProcessHeap
        invoke HeapAlloc, rax, HEAP_ZERO_MEMORY, 10h
        mov [lpHelloData], rax

;lpHelloData->iColor = IDM_BLACK;
    ;mov [lpHelloData], rax
    mov qword [rax], IDM_BLACK
;lpHelloData->clrText = RGB(0, 0, 0);
    ;mov [lpHelloData], rax
    add rax, 8
    mov qword [rax], 0 ;Black by default

;SetWindowLong(hwnd, 0,(long) lpHelloData);
    invoke SetWindowLongPtr, [hwnd], 0, [lpHelloData]

;Save some window handles ;Why?!
    ;hwndClient = GetParent(hwnd);
        invoke GetParent, [hwnd]
        mov [hwndClientH], rax
    ;hwndFrame = GetParent(hwndClient);
        invoke GetParent, [hwndClientH]
        mov [hwndFrameH], rax

;return 0 ;
xor rax, rax
jmp endHelloWndProc
