wmFrameClose:
	Call4 SendMessageA,hWnd,111h,IDM_CLOSEALL,0
	Call2 GetWindow,hWndClient,5 ;GW_CHILD = 5
	test rax,rax
		je defFrmProc
	xor rax,rax
	jmp endFrmProc