wmNgonActivate:

	mov r9,lParam
	cmp hwnd,r9
	jne lblMenuNotNgon

lblMenuNgon:
	Call4 SendMessageA,hwndClientN,230h,hMenuNgon,hMenuNgonWindow
	jmp lblDrawMenu

lblMenuNotNgon:
	Call4 SendMessageA,hwndClientN,230h,hMenuInit,hMenuInitWindow


lblDrawMenu:
	Call1 DrawMenuBar,hwndFrameN

;return 0 ;
	xor rax,rax
	jmp endNgonWndProc