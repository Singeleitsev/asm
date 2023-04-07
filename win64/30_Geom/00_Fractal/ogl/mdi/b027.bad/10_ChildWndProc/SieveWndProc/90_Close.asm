wmSieveClose:

Call4 MessageBoxA,hwnd,offset szClose,offset szTitleChild01,21h
cmp rax,1 ;IDOK
	je defSieveWndProc

xor rax,rax
jmp endSieveWndProc

