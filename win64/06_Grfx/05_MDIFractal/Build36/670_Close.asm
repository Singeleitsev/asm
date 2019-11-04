wmGasketClose:

;MB_ICONQUESTION or MB_OKCANCEL = 21h
Call4 MessageBoxA,hwnd,offset szClose,offset szGasketTitle,21h
	cmp rax,1 ;IDOK
	je defGasketWndProc

xor rax,rax
jmp endGasketWndProc

