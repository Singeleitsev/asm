.code



GetSelText proc lpBuff:DWORD
	LOCAL	chrg:CHARRANGE

	invoke SendMessage,hREdit,EM_EXGETSEL,0,addr chrg
	mov		eax,chrg.cpMax
	sub		eax,chrg.cpMin
	.if eax && eax<256
		invoke SendMessage,hREdit,EM_GETSELTEXT,0,lpBuff
	.endif
	ret

GetSelText endp

Find proc frType:DWORD

	;Get current selection
	invoke SendMessage,hREdit,EM_EXGETSEL,0,offset ft.chrg
	;Setup find
	mov		eax,frType
	and		eax,FR_DOWN
	.if eax
		.if fres!=-1
			inc		ft.chrg.cpMin
		.endif
		mov		ft.chrg.cpMax,-1
	.else
		mov		ft.chrg.cpMax,0
	.endif
	mov		ft.lpstrText,offset findbuff
	;Do the find
	invoke SendMessage,hREdit,EM_FINDTEXTEX,frType,offset ft
	mov		fres,eax
	.if eax!=-1
		;Mark the foud text
		invoke SendMessage,hREdit,EM_EXSETSEL,0,offset ft.chrgText
		invoke SendMessage,hREdit,REM_VCENTER,0,0
		invoke SendMessage,hREdit,EM_SCROLLCARET,0,0
	.else
		;Region searched
		invoke GetDlgItem,hFind,IDC_STATUSBAR4901
		.if eax
		invoke SetWindowText,eax,addr szSearched
		.else
		invoke     MessageBox, NULL, offset szSearched, offset szAppName, MB_OK or MB_ICONINFORMATION
		invoke SetFocus,hREdit
		.endif	

	.endif
	ret

Find endp

FindDlgProc proc hWin:HWND,uMsg:UINT,wParam:WPARAM,lParam:LPARAM
local	hCtl:DWORD

	mov		eax,uMsg
	.if eax==WM_INITDIALOG
		mov		eax,hWin
		mov		hFind,eax
		.if lParam
			mov		eax,BN_CLICKED
			shl		eax,16
			or		eax,IDC_BTN_REPLACE
			invoke PostMessage,hWin,WM_COMMAND,eax,0
		.endif
		;Put text in edit boxes
		invoke SendDlgItemMessage,hWin,IDC_FINDTEXT,EM_LIMITTEXT,255,0
		invoke SendDlgItemMessage,hWin,IDC_FINDTEXT,WM_SETTEXT,0,offset findbuff
		invoke SendDlgItemMessage,hWin,IDC_REPLACETEXT,EM_LIMITTEXT,255,0
		invoke SendDlgItemMessage,hWin,IDC_REPLACETEXT,WM_SETTEXT,0,offset replacebuff
		;Set check boxes
		mov		eax,frt
		and		eax,FR_MATCHCASE
		.if eax
			invoke CheckDlgButton,hWin,IDC_CHK_MATCHCASE,BST_CHECKED
		.endif
		mov		eax,frt
		and		eax,FR_WHOLEWORD
		.if eax
			invoke CheckDlgButton,hWin,IDC_CHK_WHOLEWORD,BST_CHECKED
		.endif
		;Set find direction
		mov		eax,frt
		and		eax,FR_DOWN
		.if eax
			mov		eax,IDC_RBN_DOWN
		.else
			mov		eax,IDC_RBN_UP
		.endif
		invoke CheckDlgButton,hWin,eax,BST_CHECKED
		
	.elseif eax==WM_COMMAND
		invoke GetDlgItem,hFind,IDC_STATUSBAR4901
		invoke SetWindowText,eax,0
		mov		eax,wParam
		mov		edx,eax
		shr		edx,16
		and		eax,0FFFFh
		.if edx==BN_CLICKED
			.if eax==IDOK
				;Find the text
				invoke Find,frt
			.elseif eax==IDCANCEL
				;Close the find dialog
				invoke SendMessage,hWin,WM_CLOSE,NULL,NULL
			.elseif eax==IDC_BTN_REPLACE
				invoke GetDlgItem,hWin,IDC_BTN_REPLACEALL
				mov		hCtl,eax
				invoke IsWindowEnabled,hCtl
				.if !eax
					;Enable Replace all button
					invoke EnableWindow,hCtl,TRUE
					;Set caption to Replace...
					invoke SetWindowText,hWin,offset szReplace
					;Show replace
					invoke GetDlgItem,hWin,IDC_REPLACESTATIC
					invoke ShowWindow,eax,SW_SHOWNA
					invoke GetDlgItem,hWin,IDC_REPLACETEXT
					invoke ShowWindow,eax,SW_SHOWNA
				.else
					.if fres!=-1
						invoke SendMessage,hREdit,EM_EXGETSEL,0,offset ft.chrg
						invoke SendMessage,hREdit,EM_REPLACESEL,TRUE,offset replacebuff
						invoke lstrlen,offset replacebuff
						add		eax,ft.chrg.cpMin
						mov		ft.chrg.cpMax,eax
						invoke SendMessage,hREdit,EM_EXSETSEL,0,offset ft.chrg
					.endif
					invoke Find,frt
				.endif
			.elseif eax==IDC_BTN_REPLACEALL
				.if fres==-1
					invoke Find,frt
				.endif
				.while fres!=-1
					mov		eax,BN_CLICKED
					shl		eax,16
					or		eax,IDC_BTN_REPLACE
					invoke SendMessage,hWin,WM_COMMAND,eax,0
				.endw
			.elseif eax==IDC_RBN_DOWN
				;Set find direction to down
				or		frt,FR_DOWN
				mov		fres,-1
			.elseif eax==IDC_RBN_UP
				;Set find direction to up
				and		frt,-1 xor FR_DOWN
				mov		fres,-1
			.elseif eax==IDC_CHK_MATCHCASE
				;Set match case mode
				invoke IsDlgButtonChecked,hWin,IDC_CHK_MATCHCASE
				.if eax
					or		frt,FR_MATCHCASE
				.else
					and		frt,-1 xor FR_MATCHCASE
				.endif
				mov		fres,-1
			.elseif eax==IDC_CHK_WHOLEWORD
				;Set whole word mode
				invoke IsDlgButtonChecked,hWin,IDC_CHK_WHOLEWORD
				.if eax
					or		frt,FR_WHOLEWORD
				.else
					and		frt,-1 xor FR_WHOLEWORD
				.endif
				mov		fres,-1
			.endif
		.elseif edx==EN_CHANGE
			;Update text buffers
			.if eax==IDC_FINDTEXT
				invoke SendDlgItemMessage,hWin,eax,WM_GETTEXT,sizeof findbuff,offset findbuff
				mov		fres,-1
			.elseif eax==IDC_REPLACETEXT
				invoke SendDlgItemMessage,hWin,eax,WM_GETTEXT,sizeof replacebuff,offset replacebuff
				mov		fres,-1
			.endif
		.endif
	.elseif eax==WM_ACTIVATE
		mov		fres,-1
	.elseif eax==WM_CLOSE
		mov		hFind,0
		invoke DestroyWindow,hWin
		invoke SetFocus,hREdit
	.else
		mov eax,FALSE
		ret
	.endif
	mov  eax,TRUE
	ret

FindDlgProc endp


