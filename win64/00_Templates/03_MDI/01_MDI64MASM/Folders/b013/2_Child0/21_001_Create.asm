wmChild0Create:

call GetProcessHeap
mov rcx,rax
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,10h ;sizeof Child0DATA
call HeapAlloc ;RtlAllocateHeap
mov lpChild0Data,rax

;Spell64rax hwnd, szFrameTitle, szHeapAddress

;lpChild0Data->iColor = IDM_BLACK ;
mov rax,lpChild0Data
mov qword ptr [rax],IDM_VIEW_BLACK ;lpChild0Data+0

;lpChild0Data->clrText = RGB (0, 0, 0) ;
mov qword ptr [rax+8],0 ;lpChild0Data+8

mov rcx,hwnd
xor rdx,rdx
mov r8,lpChild0Data
call SetWindowLongPtrA
;cmp rax,0
;je errChild0WndProc
        
xor rax,rax
jmp endChild0WndProc

