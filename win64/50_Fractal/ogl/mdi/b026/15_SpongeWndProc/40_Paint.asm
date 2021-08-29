wmR3Paint:

Call3 InvalidateRect,hwnd,0,1

mov rcx,hwnd
lea rdx,ps
call BeginPaint
mov hdc,rax

mov rcx,hwnd
lea rdx,ps
call EndPaint

;return 0 ;
	xor rax,rax
	jmp endR3WndProc