;mdidemo401C3E:
wmRectDestroy:

;lpRectData = (LPRECTDATA) GetWindowLong (hwnd, 0) ;
        Call2 GetWindowLongPtr,hwnd,0
        mov lpRectData,rax
        ;cmp lpGlobalData,rax
        ;jne errRectWndProc

;HeapFree (GetProcessHeap (), 0, lpRectData) ;
        Call0 GetProcessHeap
        Call3 HeapFree,rax,0,lpRectData

;KillTimer (hwnd, 1) ;
        Call2 KillTimer,hwnd,1

;return 0 ;
        xor rax,rax
        jmp endRectWndProc ;mdidemo401CE5

