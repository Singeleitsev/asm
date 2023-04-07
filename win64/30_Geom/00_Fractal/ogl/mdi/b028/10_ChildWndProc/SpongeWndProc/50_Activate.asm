wmSpongeActivate:

;if (lParam == (LPARAM) hwnd)
	;mov r9,lParam
	cmp hwnd,r9
		jne notSponge

;Sponge:
	Call4 SendMessageA,s_hwndClientChild[06],230h,g_hMenuChild[06],g_hSubMenuChild[06] ;WM_MDISETMENU = 0x0230
	jmp drwSpongeMenuAndQuit

notSponge:
	Call4 SendMessageA,s_hwndClientChild[06],230h,g_hMenuInit,g_hSubMenuInit ;WM_MDISETMENU = 0x0230

drwSpongeMenuAndQuit:
	Call1 DrawMenuBar,s_hwndFrameChild[06]

;return 0 ;
	xor rax,rax
	jmp endSpongeWndProc ;mdidemo401CE5

