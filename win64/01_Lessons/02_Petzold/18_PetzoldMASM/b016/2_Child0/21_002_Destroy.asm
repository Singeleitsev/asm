wmChild0Destroy:

mov rcx,hwnd
xor rdx,rdx
call GetWindowLongPtrA
mov lpChild0Data,rax

call GetProcessHeap

mov rcx,rax ;ProcessHeap
xor rdx,rdx
mov r8,lpChild0Data
call HeapFree

xor rax,rax
jmp endChild0WndProc