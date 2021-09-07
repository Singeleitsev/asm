wmHelloClose:

Call4 MessageBoxA,hwnd,offset szClose,offset szHelloTitle,21h
cmp rax,1 ;IDOK
	je defHelloWndProc

xor rax,rax
jmp endHelloWndProc

