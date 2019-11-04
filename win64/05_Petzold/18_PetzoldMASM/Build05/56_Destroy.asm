;mdidemo401920:
wmHelloDestroy:

;lpHelloData = (LPHELLODATA) GetWindowLong (hwnd, 0) ;
        Call2 GetWindowLongPtr,hwnd,0
        mov lpHelloData,rax
        ;cmp lpGlobalData,rax
        ;jne errHelloWndProc

;HeapFree (GetProcessHeap (), 0, lpHelloData) ;
        Call0 GetProcessHeap
        Call3 HeapFree,rax,0,lpHelloData

;return 0 ;
        xor rax,rax
        jmp endHelloWndProc ;mdidemo4019D0