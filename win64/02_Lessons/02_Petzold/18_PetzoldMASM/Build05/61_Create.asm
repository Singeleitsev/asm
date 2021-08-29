;mdidemo4019EB:
wmRectCreate:

;// Allocate memory for window private data
;lpRectData = (LPRECTDATA) HeapAlloc
;(GetProcessHeap (), HEAP_ZERO_MEMORY, sizeof (RECTDATA)) ;
        sub rsp,20h
        call GetProcessHeap
        mov rcx,rax
        mov rdx,8 ;HEAP_ZERO_MEMORY
        mov r8,10h ;sizeof RECTDATA
        call HeapAlloc
        add rsp,20h
        mov lpRectData,rax
        ;mov lpGlobalData,rax
        Spell64rax hwnd, szFrameTitle, szHeapAddress

;SetWindowLong (hwnd, 0, (long) lpRectData) ;
        Call3 SetWindowLongPtr,hwnd,0,lpRectData
        ;cmp rax,0
        ;je errRectWndProc

;// Start the timer going
;SetTimer (hwnd, 1, 250, NULL) ;
        Call4 SetTimer,hwnd,1,0FAh,0

;// Save some window handles
;hwndClient = GetParent (hwnd) ;
        Call1 GetParent,hwnd
        mov hwndClientR,rax ;[405E9Ch]
;hwndFrame = GetParent (hwndClient) ;
        Call1 GetParent,hwndClientR
        mov hwndFrameR,rax ;[405E98h]

;return 0 ;
        xor rax,rax
        jmp endRectWndProc ;mdidemo401CE5

