sub rsp,20h

;invoke	wglMakeCurrent,0,0
	xor rcx,rcx
	xor rdx,rdx
	call wglMakeCurrent
	
;invoke	wglDeleteContext,[hrc]
	mov rcx,hrc
	call wglDeleteContext
	
;invoke	ReleaseDC,[hwnd],[hdc]
	mov rcx,hWnd
	mov rdx,hdc
	call ReleaseDC

	xor rcx,rcx
	call PostQuitMessage

add rsp,20h


