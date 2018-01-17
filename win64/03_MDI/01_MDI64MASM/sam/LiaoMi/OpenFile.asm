.code


	;=========================================================================
	; Open file PROCEDURE
	;=========================================================================
OpenFileA  PROC uses esi  edi
local    ofn:OPENFILENAME
local    EditS:EDITSTREAM
local    hFile:DWORD
local    hEdit:DWORD
local    hWndChild:DWORD
local    rect:RECT	
	
	
	mov     byte ptr PathName, 0
	mov     ofn.lStructSize, sizeof ofn
	mov     eax,0
	mov     ofn.hwndOwner, eax
	mov     eax, hInstance
	mov     ofn.hInstance, eax
	mov     ofn.lpstrFilter, offset szFilter
	mov     ofn.lpstrCustomFilter, 0
	mov     ofn.nMaxCustFilter, 0
	mov     ofn.nFilterIndex, 0
	mov     ofn.lpstrFile, offset PathName
	mov     ofn.nMaxFile, lengthof PathName
	mov     ofn.lpstrFileTitle, offset FileName
	mov     ofn.nMaxFileTitle, lengthof FileName
	mov     ofn.lpstrInitialDir, 0
	mov     ofn.lpstrTitle, offset szOpenTitle
	mov     ofn.Flags, OFN_PATHMUSTEXIST or OFN_FILEMUSTEXIST
	mov     ofn.nFileOffset, 0
	mov     ofn.nFileExtension, 0
	mov     ofn.lpstrDefExt, 0
	mov     ofn.lCustData, 0
	mov     ofn.lpfnHook, 0
	mov     ofn.lpTemplateName, 0
	
	invoke     GetOpenFileName, addr ofn
	.if !eax                    ; Cancel'ed or error occurred
		jmp     EndOpen
	.endif
	
	mov mdiCreate.szTitle,  offset PathName
			invoke SendMessage, hWndClient, WM_MDICREATE, 0, addr mdiCreate 
			mov     hWndChild, eax
			.if WWrap
				invoke WrapedWindow,eax
			.else
				invoke NonWrapedWindow,eax
			.endif
            mov     hEdit, eax
            invoke    SendMessage, hEdit, WM_SETFONT, hFont, 1
            invoke    GetClientRect, hWndClient,addr rect
            invoke    MoveWindow, hEdit, rect.left, rect.top, rect.right, rect.bottom, TRUE
            add rect.left,10
            invoke     SendMessage, hEdit, EM_SETRECT, 0, addr rect
            invoke    SendMessage,hWndClient,WM_MDIMAXIMIZE,hWndChild,0
			invoke SendMessage,hEdit,EM_EXLIMITTEXT,0,2000000
			invoke    SetFocus, hEdit
			invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_UNDO, FALSE
            invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_REDO, FALSE
            invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_LEFT, TRUE
            invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_RIGHT, FALSE
			invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_CENTER, FALSE
			invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_BOLD, FALSE
			invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_ITALIC, FALSE
			invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_UNDERLINE, FALSE

	invoke      CreateFile, addr PathName,\
				GENERIC_READ or GENERIC_WRITE ,\
				FILE_SHARE_READ or FILE_SHARE_WRITE,\
				NULL, OPEN_EXISTING, FILE_ATTRIBUTE_ARCHIVE, NULL
	cmp     eax, -1            ; Error?
	jne     opcrok
	
operr:
	jmp     EndOpen
	
opcrok:
	mov     hFile,eax
	mov 	EditS.dwCookie,eax
	mov     EditS.dwError, 0
	mov     EditS.pfnCallback, offset EditStreamRead
	invoke lstrlen,addr PathName
	lea  	eax,  PathName[eax-4]
	mov		eax, [eax]		
	.if eax=='ftr.'	|| eax=='FTR.'
		invoke     SendMessage, hEdit, EM_STREAMIN, SF_RTF, addr EditS	
	.else
		invoke     SendMessage, hEdit, EM_STREAMIN, SF_TEXT, addr EditS
	.endif
	mov     bytesread, eax
	invoke     SetWindowText,hWndChild, addr PathName
	invoke     SendMessage,  hEdit, EM_SETMODIFY, FALSE, 0
	invoke     CloseHandle, hFile
	invoke SetWindowLong,hEdit,GWL_WNDPROC,addr EditProc
	mov		OldEditProc,eax
	invoke PrintStatusItems,hEdit
	invoke SetWindowLong,hEdit,GWL_USERDATA	,-1
	  invoke     BaseAscii, bytesread, offset Fsize, 8, 10, 1, 0, 1
      invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_THRE, offset fsmsg
	  invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_FOUR, offset szSucks
		invoke     SendMessage, hEdit, EM_GETCHARFORMAT, TRUE, offset charF
		invoke SendMessage, hCFont,CB_SELECTSTRING,0,addr charF.szFaceName
		mov edx,0 
		mov eax,charF.yHeight
		mov    ecx,20
		div  ecx
		invoke 	DwToAscii, eax, offset ascii
		invoke SendMessage, hCSize,CB_SELECTSTRING,0,offset ascii

EndOpen:
	ret
OpenFileA  ENDP
	
	;=========================================================================
	; Edit Stream Read Callback PROCEDURE
	;=========================================================================
EditStreamRead PROC dwCookie:DWORD, pbBuff, cb, pcb
	invoke     ReadFile, dwCookie, pbBuff, cb, pcb, 0
	mov     eax, 0          ; Return 0
	ret
EditStreamRead ENDP
LoadFile proc uses ebx esi,lpFileName:DWORD
local   hFile:DWORD
local	EditS:EDITSTREAM
local	chrg:CHARRANGE
local    hEdit:DWORD
local    hWndChild:DWORD
local    rect:RECT

	;Open the file
	invoke CreateFile,lpFileName,GENERIC_READ or GENERIC_WRITE ,\
				FILE_SHARE_READ or FILE_SHARE_WRITE,\
				NULL, OPEN_EXISTING, FILE_ATTRIBUTE_ARCHIVE, NULL
	.if eax!=INVALID_HANDLE_VALUE
		mov		hFile,eax
		mov     EditS.dwCookie, eax
		;Copy buffer to FileName
		invoke lstrcpy,offset FileName,lpFileName
		invoke lstrcpy,offset PathName,lpFileName
		mov mdiCreate.szTitle, offset FileName
		;Set word group
			invoke SendMessage, hWndClient, WM_MDICREATE, 0, addr mdiCreate 
			mov     hWndChild, eax
			.if WWrap
				invoke WrapedWindow,eax
			.else
				invoke NonWrapedWindow,eax
			.endif
            mov     hEdit, eax
            invoke    SendMessage, hEdit, WM_SETFONT, hFont, 1
            invoke  GetClientRect, hWndClient, addr rect
            invoke  MoveWindow, hEdit, rect.left, rect.top, rect.right, rect.bottom, TRUE
            add rect.left,10
            invoke     SendMessage, hEdit, EM_SETRECT, 0, addr rect
            invoke    SendMessage,hWndClient,WM_MDIMAXIMIZE,hWndChild,0
			invoke SendMessage,hEdit,EM_EXLIMITTEXT,0,2000000
			invoke    SetFocus, hEdit
			invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_UNDO, FALSE
            invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_REDO, FALSE
            invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_LEFT, TRUE
            invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_RIGHT, FALSE
			invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_CENTER, FALSE
			invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_BOLD, FALSE
			invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_ITALIC, FALSE
			invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_UNDERLINE, FALSE

		;stream the text into the RichEdit control
		mov     EditS.dwError, 0
		mov		EditS.pfnCallback,offset EditStreamRead
		invoke lstrlen,offset FileName
		lea  	eax,  FileName[eax-4]
		mov		eax, [eax]		
		.if eax=='ftr.'	|| eax=='FTR.'
			invoke     SendMessage, hEdit, EM_STREAMIN, SF_RTF, addr EditS	
		.else
			invoke     SendMessage, hEdit, EM_STREAMIN, SF_TEXT, addr EditS
		.endif
		mov     bytesread, eax
		invoke     SetWindowText,hWndChild, offset FileName		
		invoke SendMessage,hEdit,EM_SETMODIFY,FALSE,0
		invoke CloseHandle,hFile
		invoke SetWindowLong,hEdit,GWL_WNDPROC,addr EditProc
			mov		OldEditProc,eax
		invoke PrintStatusItems,hEdit
		invoke SetWindowLong,hEdit,GWL_USERDATA	,-1
	.else
		invoke MessageBox,hWndMain,offset szOpenFileFail,offset szAppName,MB_OK or MB_ICONERROR
		mov		eax,TRUE
	.endif
	  invoke     BaseAscii, bytesread, offset Fsize, 8, 10, 1, 0, 1
      invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_THRE, offset fsmsg
	  invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_FOUR, offset szSucks
		invoke     SendMessage, hEdit, EM_GETCHARFORMAT, TRUE, offset charF
		invoke SendMessage, hCFont,CB_SELECTSTRING,0,addr charF.szFaceName
		mov edx,0 
		mov eax,charF.yHeight
		mov    ecx,20
		div  ecx
		invoke 	DwToAscii, eax, offset ascii
		invoke SendMessage, hCSize,CB_SELECTSTRING,0,offset ascii

endload:	
	ret
LoadFile endp
