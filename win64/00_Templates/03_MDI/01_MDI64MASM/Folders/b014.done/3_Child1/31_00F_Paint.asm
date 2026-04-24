wmChild1Paint:

mov rcx,hwnd
xor rdx,rdx
mov r9,1
call InvalidateRect

mov rcx,hwnd
lea rdx,ps
call BeginPaint
mov hdc,rax

mov rcx,hwnd
lea rdx,ps
call EndPaint

;return 0
xor rax,rax
jmp endChild1WndProc


