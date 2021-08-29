wmR2Close:

Call4 MessageBoxA,hwnd,offset szClose,offset szR2Title,21h
cmp rax,1 ;IDOK
	je defR2WndProc

xor rax,rax
jmp endR2WndProc

