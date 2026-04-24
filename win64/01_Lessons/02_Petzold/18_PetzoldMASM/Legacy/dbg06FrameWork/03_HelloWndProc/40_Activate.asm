wmHelloActivate:

;if (lParam == (LPARAM) hwnd)
	;mov r9, lParam
	cmp r9, hwnd
		jne notHello

;Hello:
	Call4 SendMessageA,s_hwndClientH,230h,g_hMenuHello,g_hMenuHelloWindow ;WM_MDISETMENU
	Call2 GetWindowLongPtrA,hwnd,0
	mov lpHelloData,rax
	mov rax,qword ptr [rax] ;HelloData.iColor
	Call3 CheckMenuItem,g_hMenuHello,rax,8 ;MF_CHECKED = 8
	jmp drwHelloMenuAndQuit

notHello:
	Call2 GetWindowLongPtrA,hwnd,0
	mov lpHelloData,rax
	mov rax,qword ptr [rax] ;HelloData.iColor
	Call3 CheckMenuItem,g_hMenuHello,rax,0 ;MF_UNCHECKED = 0
	Call4 SendMessageA,s_hwndClientH,230h,g_hMenuInit,g_hMenuInitWindow ;WM_MDISETMENU

drwHelloMenuAndQuit:
	Call1 DrawMenuBar,s_hwndFrameH

;return 0 ;
	xor rax,rax
	jmp endHelloWndProc


