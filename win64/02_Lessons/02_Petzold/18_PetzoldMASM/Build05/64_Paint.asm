;mdidemo401BAC:
wmRectPaint:

;InvalidateRect (hwnd, NULL, TRUE) ;
	Call3 InvalidateRect,hwnd,0,1

;hdc = BeginPaint (hwnd, &ps) ;
	sub rsp,20h
	mov rcx,hwnd
	lea rdx,ps
	call BeginPaint
	mov hdc,rax
	;add rsp,20h

;EndPaint (hwnd, &ps) ;
	;sub rsp,20h
	mov rcx,hwnd
	lea rdx,ps
	call EndPaint
	add rsp,20h

;return 0 ;
	xor rax,rax
	jmp endRectWndProc ;mdidemo401CE5