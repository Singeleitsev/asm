wmRectActivate:

;if (lParam == (LPARAM) hwnd)
	;mov r9,lParam
	cmp hwnd,r9
		jne notRect

;Rect:
	Call4 SendMessageA,s_hwndClientR,230h,g_hMenuRect,g_hMenuRectWindow ;WM_MDISETMENU = 0x0230
	jmp drwRectMenuAndQuit

notRect:
	Call4 SendMessageA,s_hwndClientR,230h,g_hMenuInit,g_hMenuInitWindow ;WM_MDISETMENU = 0x0230

drwRectMenuAndQuit:
	Call1 DrawMenuBar,s_hwndFrameR

;return 0 ;
	xor rax,rax
	jmp endRectWndProc ;mdidemo401CE5

