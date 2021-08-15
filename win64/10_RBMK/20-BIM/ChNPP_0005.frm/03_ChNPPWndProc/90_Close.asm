wmChNPPClose:

Call4 MessageBoxA,hwnd,offset szClose,offset szChNPPTitle,21h
cmp rax,1 ;IDOK
	je defChNPPWndProc

xor rax,rax
jmp endChNPPWndProc

