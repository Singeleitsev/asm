wmGasketActivate:

	mov r9,lParam
	cmp hwnd,r9
	jne lblMenuNotGasket

lblMenuGasket:
	;WM_MDISETMENU = 230h
	Call4 SendMessageA,hwndClientG,230h,hMenuGasket,hMenuGasketWindow
	jmp lblDrawMenu

lblMenuNotGasket:
	;WM_MDISETMENU = 230h
	Call4 SendMessageA,hwndClientG,230h,hMenuInit,hMenuInitWindow


lblDrawMenu:
	Call1 DrawMenuBar,hwndFrameG

;return 0 ;
	xor rax,rax
	jmp endGasketWndProc