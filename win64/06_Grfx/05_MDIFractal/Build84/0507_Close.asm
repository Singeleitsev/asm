wmSieveClose:

;MB_ICONQUESTION or MB_OKCANCEL = 21h
Call4 MessageBoxA,hwnd,offset szClose,offset szSieveTitle,21h
	cmp rax,1 ;IDOK
	je defSieveWndProc ;mdidemo40191B

xor rax,rax
jmp endSieveWndProc

