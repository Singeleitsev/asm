wmRectCreate:

;Allocate memory for window private data
    ;lpRectData =(LPRECTDATA) HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, sizeof(RECTDATA));
        invoke GetProcessHeap
        invoke HeapAlloc, rax, HEAP_ZERO_MEMORY, 10h
        mov [lpRectData], rax
 
;SetWindowLong(hwnd, 0,(long) lpRectData);
        invoke SetWindowLongPtr, [hwnd], 0, [lpRectData]

;Start the timer going
    ;SetTimer(hwnd, 1, 250, NULL);
        invoke SetTimer, [hwnd], 1, 0FFh, 0

;Save some window handles
    ;hwndClient = GetParent(hwnd);
        invoke GetParent, [hwnd]
        mov [hwndClientR], rax
    ;hwndFrame = GetParent(hwndClient);
        invoke GetParent, [hwndClientR]
        mov [hwndFrameR], rax

;return 0;
xor rax, rax
jmp endRectWndProc