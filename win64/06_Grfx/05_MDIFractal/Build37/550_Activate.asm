wmSieveActivate:

	mov r9,lParam
	cmp hwnd,r9
	jne lblMenuNotSieve

lblMenuSieve:
	Call4 SendMessageA,hwndClientS,230h,hMenuSieve,hMenuSieveWindow
	jmp lblDrawMenu

lblMenuNotSieve:
	Call4 SendMessageA,hwndClientS,230h,hMenuInit,hMenuInitWindow


lblDrawMenu:
	Call1 DrawMenuBar,hwndFrameS

;return 0 ;
	xor rax,rax
	jmp endSieveWndProc

