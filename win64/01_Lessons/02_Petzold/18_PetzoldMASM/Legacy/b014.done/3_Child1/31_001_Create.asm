wmChild1Create:

;Allocate memory for window private data
call GetProcessHeap
mov rcx,rax
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,10h ;sizeof Child1DATA
call HeapAlloc
mov lpChild1Data,rax

;Spell64rax hwnd, szFrameTitle, szHeapAddress
mov rcx,hwnd
xor rdx,rdx
mov r8,lpChild1Data
call SetWindowLongPtrA
;cmp rax,0
;je errChild1WndProc

;Start the timer going
mov rcx,hwnd
mov rdx,1
mov r8,0FAh ;250 ms = 0FAh
xor r9,r9
call SetTimer

;return 0
xor rax,rax
jmp endChild1WndProc


