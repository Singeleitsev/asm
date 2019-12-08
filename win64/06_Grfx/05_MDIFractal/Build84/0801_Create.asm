wmTreeCreate:

;Reserve Memory for Current Child
        sub rsp,20h
        call GetProcessHeap
        mov rcx,rax
        mov rdx,8 ;HEAP_ZERO_MEMORY
;sizeof TreeData = 40h
;See '811_SetPointers.asm'
        mov r8,40h
        call HeapAlloc ;RtlAllocateHeap
        add rsp,20h
        mov lpTreeData,rax

;SetWindowLong (hwnd, 0, (long) lpTreeData)
        Call3 SetWindowLongPtrA,hwnd,0,lpTreeData

;Set TREEDATA Pointers
;lpTreeData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	call SetTreeDataPointers

;Start the timer going
        ;Call4 SetTimer,hwnd,1,0FFh,0

;Save some window handles
        Call1 GetParent,hwnd
        mov hwndClientS,rax
        Call1 GetParent,hwndClientS
        mov hwndFrameS,rax

;return 0
xor rax,rax
jmp endTreeWndProc

