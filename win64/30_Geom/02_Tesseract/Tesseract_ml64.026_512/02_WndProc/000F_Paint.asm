lbl_wmpaint:

mov rcx, hwnd
xor rdx,rdx
mov r8,1
call InvalidateRect

mov rcx, hwnd
lea rdx,rc
call BeginPaint

mov rcx, hwnd
lea rdx,rc
call EndPaint

xor eax,eax
jmp lbl_finish
