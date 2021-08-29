;mdidemo401BE0:
wmRectActivate:

;if (lParam == (LPARAM) hwnd)
	mov r9,lParam
	cmp hwnd,r9
	jne mdidemo401C0E
	;SendMessage (hwndClient, WM_MDISETMENU, (WPARAM) hMenuRect, (LPARAM) hMenuRectWindow) ;
		;WM_MDISETMENU = 0x0230
		Call4 SendMessageA,hwndClientR,230h,hMenuRect,hMenuRectWindow
		jmp mdidemo401C2B ;Draw Menu
;else
mdidemo401C0E:
	;SendMessage (hwndClient, WM_MDISETMENU, (WPARAM) hMenuInit, (LPARAM) hMenuInitWindow) ;
		;WM_MDISETMENU = 0x0230
		Call4 SendMessageA,hwndClientR,230h,hMenuInit,hMenuInitWindow

;DrawMenuBar (hwndFrame) ;
mdidemo401C2B:
	Call1 DrawMenuBar,hwndFrameR

;return 0 ;
	xor rax,rax
	jmp endRectWndProc ;mdidemo401CE5

