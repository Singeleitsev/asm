;mdidemo4018F5:
wmHelloClose:

;if (IDOK !=
	;MessageBox (hwnd, "OK to close window?", "Hello",
	;MB_ICONQUESTION | MB_OKCANCEL))
		;return 0 ;
;break ;   // I.e., call DefMDIChildProc

	;MB_ICONQUESTION or MB_OKCANCEL = 21h
Call4 MessageBoxA,hwnd,offset szClose,offset szHelloTitle,21h
cmp rax,1 ;IDOK
	je defHelloWndProc ;mdidemo40191B
xor rax,rax
jmp endHelloWndProc ;mdidemo4019D0

