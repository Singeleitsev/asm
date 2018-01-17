.code


SetColor proc

	local cfm:CHARFORMAT2
	
	invoke     SendMessage, hREdit, EM_GETCHARFORMAT, TRUE, addr cfm
	invoke SendMessage,hREdit,EM_SETBKGNDCOLOR,0,BackgroundColor
	invoke RtlZeroMemory,addr cfm,sizeof cfm
	mov cfm.cbSize,sizeof cfm
	mov cfm.dwMask,CFM_COLOR
    m2m    cfm.crTextColor, TextColor
	invoke SendMessage,hREdit,EM_SETCHARFORMAT,SCF_SELECTION,addr cfm
	ret
SetColor endp

OptionProc proc hWnd:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD
	LOCAL clr:CHOOSECOLOR
	.if uMsg==WM_INITDIALOG
	.elseif uMsg==WM_COMMAND
		mov eax,wParam
		shr eax,16
		.if ax==BN_CLICKED
			mov eax,wParam
			.if ax==IDCANCEL
				invoke SendMessage,hWnd,WM_CLOSE,0,0
			.elseif ax==IDC_BACKCOLORBOX
				invoke RtlZeroMemory,addr clr,sizeof clr
				mov clr.lStructSize,sizeof clr
				push hWnd
				pop clr.hwndOwner
				push hInstance
				pop clr.hInstance
				push BackgroundColor
				pop clr.rgbResult
				mov clr.lpCustColors,offset CustomColors
				mov clr.Flags,CC_ANYCOLOR or CC_RGBINIT
				invoke ChooseColor,addr clr
				.if eax!=0
					push clr.rgbResult
					pop BackgroundColor
					invoke GetDlgItem,hWnd,IDC_BACKCOLORBOX
					invoke InvalidateRect,eax,0,TRUE
				.endif
			.elseif ax==IDC_TEXTCOLORBOX
				invoke RtlZeroMemory,addr clr,sizeof clr
				mov clr.lStructSize,sizeof clr
				push hWnd
				pop clr.hwndOwner
				push hInstance
				pop clr.hInstance
				push TextColor
				pop clr.rgbResult
				mov clr.lpCustColors,offset CustomColors
				mov clr.Flags,CC_ANYCOLOR or CC_RGBINIT
				invoke ChooseColor,addr clr
				.if eax!=0
					m2m TextColor,clr.rgbResult
					invoke GetDlgItem,hWnd,IDC_TEXTCOLORBOX
					invoke InvalidateRect,eax,0,TRUE
				.endif
			.elseif ax==IDOK
				; Save the modify state of the richedit control because changing the text color changes the
				; modify state of the richedit control.
				invoke SendMessage,hREdit,EM_GETMODIFY,0,0
				push eax
				invoke SetColor
				pop eax
				invoke SendMessage,hREdit,EM_SETMODIFY,eax,0
				invoke EndDialog,hWnd,0
			.endif
		.endif
	.elseif uMsg==WM_CTLCOLORSTATIC
		invoke GetDlgItem,hWnd,IDC_BACKCOLORBOX
		.if eax==lParam
			invoke CreateSolidBrush,BackgroundColor			
			ret
		.else
			invoke GetDlgItem,hWnd,IDC_TEXTCOLORBOX
			.if eax==lParam
				invoke CreateSolidBrush,TextColor
				ret
			.endif
		.endif
		mov eax,FALSE
		ret
	.elseif uMsg==WM_CLOSE
		invoke EndDialog,hWnd,0
	.else
		mov eax,FALSE
		ret
	.endif
	mov eax,TRUE
	ret
OptionProc endp
