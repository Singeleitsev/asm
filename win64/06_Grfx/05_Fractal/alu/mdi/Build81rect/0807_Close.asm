wmTreeClose:

;MB_ICONQUESTION or MB_OKCANCEL = 21h
Call4 MessageBoxA,hwnd,offset szClose,offset szTreeTitle,21h
	cmp rax,1 ;IDOK
	je defTreeWndProc ;mdidemo40191B

xor rax,rax
jmp endTreeWndProc

