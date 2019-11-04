wmNgonClose:

;MB_ICONQUESTION or MB_OKCANCEL = 21h
Call4 MessageBoxA,hwnd,offset szClose,offset szNgonTitle,21h
	cmp rax,1 ;IDOK
	je defNgonWndProc

xor rax,rax
jmp endNgonWndProc

