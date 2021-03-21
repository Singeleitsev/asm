wmChildSize:

;mov rcx,hwnd
mov rcx,hWndChild
lea rdx,rc
call GetClientRect

mov rcx,0
mov rdx,0
mov r8d,rc.right
mov r9d,rc.bottom
call glViewport

xor eax,eax
jmp endChildProc

