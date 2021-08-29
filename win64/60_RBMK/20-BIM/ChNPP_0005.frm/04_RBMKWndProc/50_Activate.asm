wmRBMKActivate:

;if (lParam == (LPARAM) hwnd)
	;mov r9,lParam
	cmp hwnd,r9
		jne notRBMK

;RBMK:
	Call4 SendMessageA,s_hwndClientRBMK,230h,g_hMenuRBMK,g_hMenuWindowRBMK ;WM_MDISETMENU = 0x0230
	jmp drwRBMKMenuAndQuit

notRBMK:
	Call4 SendMessageA,s_hwndClientRBMK,230h,g_hMenuInit,g_hMenuWindowInit ;WM_MDISETMENU = 0x0230

drwRBMKMenuAndQuit:
	Call1 DrawMenuBar,s_hwndFrameRBMK

;return 0 ;
	xor rax,rax
	jmp endRBMKWndProc ;mdidemo401CE5

