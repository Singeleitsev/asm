wmRectPaint:

Call3 InvalidateRect,hwnd,0,1

sub rsp,20h
mov rcx,hwnd
lea rdx,ps
call BeginPaint
mov hdc,rax
;add rsp,20h

;sub rsp,20h
mov rcx,hwnd
lea rdx,ps
call EndPaint
add rsp,20h

;return 0 ;
	xor rax,rax
	jmp endRectWndProc