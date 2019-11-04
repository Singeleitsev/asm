;mdidemo4016FF:
wmHelloCreate:

;lpHelloData = (LPHELLODATA) HeapAlloc
;(GetProcessHeap (),HEAP_ZERO_MEMORY,sizeof (HELLODATA)) ;
        sub rsp,20h
        call GetProcessHeap
        mov rcx,rax
        mov rdx,8 ;HEAP_ZERO_MEMORY
        mov r8,10h ;sizeof HELLODATA
        call HeapAlloc ;RtlAllocateHeap
        add rsp,20h
        mov lpHelloData,rax ;[ebp-58h]
        ;mov lpGlobalData,rax
        Spell64rax hwnd, szFrameTitle, szHeapAddress

;lpHelloData->iColor  = IDM_BLACK ;
        mov rax,lpHelloData
        mov qword ptr [rax],IDM_BLACK ;lpHelloData+0

;lpHelloData->clrText = RGB (0, 0, 0) ;
        mov qword ptr [rax+8],0 ;lpHelloData+8

;SetWindowLong (hwnd, 0, (long) lpHelloData) ;
        Call3 SetWindowLongPtr,hwnd,0,lpHelloData
        ;cmp rax,0
        ;je errHelloWndProc
        
        ;// Save some window handles
        ;hwndClient = GetParent (hwnd) ;
                Call1 GetParent,hwnd
                mov hwndClientH,rax ;[405EA0h]
        ;hwndFrame  = GetParent (hwndClient) ;
                Call1 GetParent,hwndClientH
                mov hwndFrameH,rax ;[405EB4h]

;return 0 ;
        xor rax,rax
        jmp endHelloWndProc ;mdidemo4019D0

