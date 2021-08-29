wmR3Activate:

;if (lParam == (LPARAM) hwnd)
	;mov r9,lParam
	cmp hwnd,r9
		jne notR3

;R3:
	Call4 SendMessageA,s_hwndClientR,230h,g_hMenuR3,g_hMenuR3Window ;WM_MDISETMENU = 0x0230
	jmp drwR3MenuAndQuit

notR3:
	Call4 SendMessageA,s_hwndClientR,230h,g_hMenuInit,g_hMenuInitWindow ;WM_MDISETMENU = 0x0230

drwR3MenuAndQuit:
	Call1 DrawMenuBar,s_hwndFrameR

;return 0 ;
	xor rax,rax
	jmp endR3WndProc ;mdidemo401CE5

