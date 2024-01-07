lbl_wmpaint:

mov rcx, hwnd
xor rdx,rdx
mov r8,1
call InvalidateRect

mov rcx, hwnd
lea rdx,WindowRect
call BeginPaint

mov rcx, hwnd
lea rdx,WindowRect
call EndPaint

xor eax,eax
jmp lbl_finwndproc
