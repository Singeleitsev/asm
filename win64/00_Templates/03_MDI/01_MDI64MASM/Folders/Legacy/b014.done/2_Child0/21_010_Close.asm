wmChild0Close:

mov rcx,hwnd
lea rdx,szChildClose
lea r8,szTitleChild0
mov r9,21h
call MessageBoxA
cmp rax,1 ;IDOK
je defChild0WndProc

xor rax,rax
jmp endChild0WndProc

