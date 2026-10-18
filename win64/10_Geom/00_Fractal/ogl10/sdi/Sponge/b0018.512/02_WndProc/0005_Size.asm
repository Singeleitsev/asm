lbl_wmsize:

mov rcx,hwnd
lea rdx,rc
call GetClientRect

xor rcx,rcx
xor rdx,rdx
mov r8d,rc.right
mov r9d,rc.bottom
call glViewport

mov rcx,hwnd
xor rdx,rdx
mov r8,1
call InvalidateRect

xor eax,eax
jmp lbl_finish

