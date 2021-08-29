wmSievePaint:

;InvalidateRect (hwnd, NULL, TRUE)
	Call3 InvalidateRect,hwnd,0,1

;Get Graphic Context
;BeginPaint can be used for WM_PAINT only
;hdc = BeginPaint (hwnd, &ps)
	sub rsp,20h
	mov rcx,hwnd
	lea rdx,ps
	call BeginPaint
	mov hdc,rax
	add rsp,20h

;Draw Sieve
	;;sub rsp,20h
	;mov rcx,hwnd
	;mov rdx,hdc
	call DrawSieve
	;;add rsp,20h

;Release Graphic Context
	sub rsp,20h
	mov rcx,hwnd
	lea rdx,ps
	call EndPaint
	add rsp,20h

;return 0
	xor rax,rax
	jmp endSieveWndProc

