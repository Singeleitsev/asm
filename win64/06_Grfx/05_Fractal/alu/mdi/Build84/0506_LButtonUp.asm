wmSieveLButtonUp:

;Get Graphic Context
;hdc = GetDC (hwnd)
	sub rsp,20h
	mov rcx,hwnd
	call GetDC
	mov hdc,rax
	add rsp,20h

;Draw Sieve
	;sub rsp,20h
	mov rcx,hwnd
	mov rdx,hdc
	call DrawSieve
	;add rsp,20h

;Release Graphic Context
	sub rsp,20h
	mov rcx,hwnd
	mov rdx,hdc
	call ReleaseDC
	add rsp,20h

;return 0
	xor rax,rax
	jmp endSieveWndProc

