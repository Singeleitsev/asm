wmHelloDestroy:

;lpHelloData =(LPHELLODATA) GetWindowLong(hwnd, 0);
    invoke GetWindowLongPtrA, [hwnd], 0
    mov [lpHelloData], rax

;HeapFree(GetProcessHeap(), 0, lpHelloData);
    invoke GetProcessHeap
    invoke HeapFree, rax, 0, [lpHelloData]

;return 0 ;
    xor rax, rax
    jmp endHelloWndProc
