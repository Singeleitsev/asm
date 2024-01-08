wmSieveActivate:

;if (lParam == (LPARAM) hwnd)
	;mov r9, lParam
	cmp r9, hwnd
		jne notSieve

;Sieve:
	Call4 SendMessageA,s_hwndClientChild[01],230h,g_hMenuChild[01],g_hSubMenuChild[01] ;WM_MDISETMENU
	Call2 GetWindowLongPtrA,hwnd,0
	mov lpSieveData,rax
	mov rax,qword ptr [rax] ;SieveData.iColor
	Call3 CheckMenuItem,g_hMenuChild[01],rax,8 ;MF_CHECKED = 8
	jmp drwSieveMenuAndQuit

notSieve:
	Call2 GetWindowLongPtrA,hwnd,0
	mov lpSieveData,rax
	mov rax,qword ptr [rax] ;SieveData.iColor
	Call3 CheckMenuItem,g_hMenuChild[01],rax,0 ;MF_UNCHECKED = 0
	Call4 SendMessageA,s_hwndClientChild[01],230h,g_hMenuInit,g_hSubMenuInit ;WM_MDISETMENU

drwSieveMenuAndQuit:
	Call1 DrawMenuBar,s_hwndFrameChild[01]

;return 0 ;
	xor rax,rax
	jmp endSieveWndProc


