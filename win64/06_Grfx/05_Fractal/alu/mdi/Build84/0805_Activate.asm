wmTreeActivate:

	mov r9,lParam
	cmp hwnd,r9
	jne lblMenuNotTree

lblMenuTree:
	;WM_MDISETMENU = 230h
	Call4 SendMessageA,hwndClientS,230h,hMenuTree,hMenuTreeWindow
	jmp lblDrawMenu

lblMenuNotTree:
	;WM_MDISETMENU = 230h
	Call4 SendMessageA,hwndClientS,230h,hMenuInit,hMenuInitWindow


lblDrawMenu:
	Call1 DrawMenuBar,hwndFrameS

;return 0 ;
	xor rax,rax
	jmp endTreeWndProc

