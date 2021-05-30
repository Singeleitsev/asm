wmR2Activate:

;if (lParam == (LPARAM) hwnd)
	;mov r9, lParam
	cmp r9, hwnd
		jne notR2

;R2:
	Call4 SendMessageA,s_hwndClientH,230h,g_hMenuR2,g_hMenuR2Window ;WM_MDISETMENU
	Call2 GetWindowLongPtrA,hwnd,0
	mov lpR2Data,rax
	mov rax,qword ptr [rax] ;R2Data.iColor
	Call3 CheckMenuItem,g_hMenuR2,rax,8 ;MF_CHECKED = 8
	jmp drwR2MenuAndQuit

notR2:
	Call2 GetWindowLongPtrA,hwnd,0
	mov lpR2Data,rax
	mov rax,qword ptr [rax] ;R2Data.iColor
	Call3 CheckMenuItem,g_hMenuR2,rax,0 ;MF_UNCHECKED = 0
	Call4 SendMessageA,s_hwndClientH,230h,g_hMenuInit,g_hMenuInitWindow ;WM_MDISETMENU

drwR2MenuAndQuit:
	Call1 DrawMenuBar,s_hwndFrameH

;return 0 ;
	xor rax,rax
	jmp endR2WndProc


