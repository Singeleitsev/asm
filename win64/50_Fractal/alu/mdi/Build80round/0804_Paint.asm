wmTreePaint:

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

;Draw Tree
	sub rsp,8 ;Align Stack
	call DrawTree
	add rsp,8 ;Align Stack

;Release Graphic Context
	sub rsp,20h
	mov rcx,hwnd
	lea rdx,ps
	call EndPaint
	add rsp,20h

;return 0
	xor rax,rax
	jmp endTreeWndProc
