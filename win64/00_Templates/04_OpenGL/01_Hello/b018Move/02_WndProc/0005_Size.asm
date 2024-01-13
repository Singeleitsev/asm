lbl_wmsize:

mov rcx,g_hWnd
lea rdx,rc
call GetClientRect

;cmp rc.bottom,0
;je ???

xor rcx,rcx
xor rdx,rdx
mov r8d,rc.right
mov r9d,rc.bottom
call glViewport

xor eax,eax
jmp lbl_finish

