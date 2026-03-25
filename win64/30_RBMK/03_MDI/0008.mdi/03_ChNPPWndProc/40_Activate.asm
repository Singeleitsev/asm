wmChNPPActivate:

;if (lParam == (LPARAM) hwnd)
	;mov r9, lParam
	cmp r9, hwnd
		jne notChNPP

;ChNPP:
	Call4 SendMessageA,s_hwndClientChNPP,230h,g_hMenuChNPP,g_hMenuWindowChNPP ;WM_MDISETMENU
	Call2 GetWindowLongPtrA,hwnd,0
	mov lpChNPPData,rax
	mov rax,qword ptr [rax] ;ChNPPData.iColor
	Call3 CheckMenuItem,g_hMenuChNPP,rax,8 ;MF_CHECKED = 8
	jmp drwChNPPMenuAndQuit

notChNPP:
	Call2 GetWindowLongPtrA,hwnd,0
	mov lpChNPPData,rax
	mov rax,qword ptr [rax] ;ChNPPData.iColor
	Call3 CheckMenuItem,g_hMenuChNPP,rax,0 ;MF_UNCHECKED = 0
	Call4 SendMessageA,s_hwndClientChNPP,230h,g_hMenuInit,g_hMenuWindowInit ;WM_MDISETMENU

drwChNPPMenuAndQuit:
	Call1 DrawMenuBar,s_hwndFrameChNPP

;return 0 ;
	xor rax,rax
	jmp endChNPPWndProc


