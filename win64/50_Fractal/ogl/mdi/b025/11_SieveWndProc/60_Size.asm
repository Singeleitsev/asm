wmR2Size:

;if (wParam != SIZE_MINIMIZED)
	cmp r8,1
	je defR2WndProc

;------
;OpenGL
;------


 mov rcx,hwnd
 lea rdx,rc
 call GetClientRect

 mov rcx,0
 mov rdx,0
 mov r8d,rc.right
 mov r9d,rc.bottom
 call glViewport



;break ; // WM_SIZE must be processed by DefMDIChildProc
 jmp defR2WndProc


