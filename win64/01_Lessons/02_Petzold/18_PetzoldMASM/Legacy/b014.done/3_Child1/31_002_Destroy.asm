wmChild1Destroy:

mov rcx,hwnd
xor rdx,rdx
call GetWindowLongPtrA
mov lpChild1Data,rax
;cmp lpGlobalData,rax
;jne errChild1WndProc

call GetProcessHeap

mov rcx,rax ;ProcessHeap
xor rdx,rdx
mov r8,lpChild1Data
call HeapFree

mov rcx,hwnd
mov rdx,1
call KillTimer

;return 0
xor rax,rax
jmp endChild1WndProc

