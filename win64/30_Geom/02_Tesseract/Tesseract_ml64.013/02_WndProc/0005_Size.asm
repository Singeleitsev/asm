lbl_wmsize:

mov rcx,hwnd
lea rdx,rc
call GetClientRect

xor rcx,rcx
xor rdx,rdx
mov r8d,rc.right
mov r9d,rc.bottom
call glViewport

;mov rcx,hwnd
;mov rdx,113h ;WM_PAINT
;xor r8,r9
;xor r9,r9
;call PostMessage

mov rcx,hwnd
xor rdx,rdx
mov r8,1
call InvalidateRect

xor eax,eax
jmp lbl_finish

