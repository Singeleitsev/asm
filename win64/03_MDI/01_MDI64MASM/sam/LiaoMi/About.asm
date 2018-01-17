.code




UrlProc proc hWin:HWND,uMsg:UINT,wParam:WPARAM,lParam:LPARAM
	LOCAL	rect:RECT
	LOCAL	buffer[128]:BYTE

	mov		eax,uMsg
	.if eax==WM_MOUSEMOVE
		invoke GetClientRect,hWin,addr rect
		invoke GetCapture
		.if eax!=hWin
			mov		fMouseOver,TRUE
			invoke SetCapture,hWin
			invoke SendMessage,hWin,WM_SETFONT,hUrlFontU,TRUE
		.endif
		mov		edx,lParam
		movzx	eax,dx
		shr		edx,16
		.if eax>rect.right || edx>rect.bottom
			mov		fMouseOver,FALSE
			invoke ReleaseCapture
			invoke SendMessage,hWin,WM_SETFONT,hUrlFont,TRUE
		.endif
	.elseif eax==WM_LBUTTONUP
		mov		fMouseOver,FALSE
		invoke ReleaseCapture
		invoke SendMessage,hWin,WM_SETFONT,hUrlFont,TRUE
		invoke GetWindowText,hWin,addr buffer,sizeof buffer
		invoke ShellExecute,hWndMain,addr szOpen,addr buffer,NULL,NULL,SW_SHOWNORMAL
	.elseif eax==WM_SETCURSOR
		invoke LoadCursor,NULL,IDC_HAND
		invoke SetCursor,eax
	.else
		invoke CallWindowProc,OldUrlProc,hWin,uMsg,wParam,lParam
		ret
	.endif
	xor		eax,eax
	ret

UrlProc endp

AboutProc proc hWin:HWND,uMsg:UINT,wParam:WPARAM,lParam:LPARAM
	LOCAL	lfnt:LOGFONT

	mov		eax,uMsg
	.if eax==WM_INITDIALOG
		invoke SetWindowText,hWin,addr szVersion
		invoke SendDlgItemMessage,hWin,IDC_EDTABOUT,WM_SETTEXT,0,addr szAboutMsg
		invoke SendDlgItemMessage,hWin,IDC_URL,WM_SETTEXT,0,addr szAboutUrl
		invoke GetDlgItem,hWin,IDC_URL
		invoke SetWindowLong,eax,GWL_WNDPROC,addr UrlProc
		mov		OldUrlProc,eax
		invoke SendMessage,hWin,WM_GETFONT,0,0
		mov		hUrlFont,eax
		invoke GetObject,hUrlFont,sizeof LOGFONT,addr lfnt
		mov	lfnt.lfUnderline, TRUE
		invoke CreateFontIndirect,addr lfnt
		mov		hUrlFontU,eax
		invoke GetSysColor,COLOR_3DFACE
		invoke CreateSolidBrush,eax
		mov		hUrlBrush,eax
	.elseif eax==WM_COMMAND
		mov		eax,wParam
		mov		edx,eax
		shr		edx,16
		and		eax,0FFFFh
		.if edx==BN_CLICKED
			.if eax==IDOK
				invoke SendMessage,hWin,WM_CLOSE,NULL,NULL
			.endif
		.endif
	.elseif eax==WM_CTLCOLORSTATIC
		invoke GetDlgItem,hWin,IDC_URL
		mov		edx,eax
		xor		eax,eax
		.if edx==lParam
			.if fMouseOver
				mov		eax,0FF0000h
			.endif
			invoke SetTextColor,wParam,eax
			invoke SetBkMode,wParam,TRANSPARENT
			mov		eax,hUrlBrush
		.endif
		ret
	.elseif eax==WM_CLOSE
		invoke DeleteObject,hUrlFontU
		invoke DeleteObject,hUrlBrush
		invoke EndDialog,hWin,NULL
	.else
		mov		eax,FALSE
		ret
	.endif
	mov		eax,TRUE
	ret

AboutProc endp