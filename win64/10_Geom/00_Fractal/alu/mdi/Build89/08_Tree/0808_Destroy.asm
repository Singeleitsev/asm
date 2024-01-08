wmTreeDestroy:

;lpTreeData = (LPRECTDATA) GetWindowLong (hwnd, 0)
        Call2 GetWindowLongPtrA,hwnd,0
        mov lpTreeData,rax

;HeapFree (GetProcessHeap (), 0, lpTreeData)
        Call0 GetProcessHeap
        Call3 HeapFree,rax,0,lpTreeData

;KillTimer (hwnd, 1) ;
        ;Call2 KillTimer,hwnd,1

;return 0 ;
        xor rax,rax
        jmp endTreeWndProc

