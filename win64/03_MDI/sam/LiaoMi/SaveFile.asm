.code


SaveEdit proc
local    hChild:HWND
local	 hEdit
local    buffer1[128]:BYTE
local    hFile :DWORD
local    tl     :DWORD
local    est   :EDITSTREAM

	invoke     SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
	mov     hChild,eax
	invoke     GetWindow, hChild, GW_CHILD           
	.if !eax
		jmp     EndSave
	.endif 
	mov     hEdit, eax
	invoke     SendMessage, hEdit , WM_GETTEXTLENGTH, 0, 0
	.if !eax
		jmp      EndSave
	.endif
	invoke GetWindowLong,hEdit,GWL_USERDATA	
	.if     !eax         
		invoke     SaveAsFile, hChild 
		cmp     eax, FALSE               ; Cancel'ed or error occurred
		je     EndSave
		invoke	    SetFocus, hEdit
		jmp     EndSave
	.else
		invoke     SendMessage, hChild , WM_GETTEXTLENGTH, 0, 0
		mov      tl, eax
		inc      tl
		invoke     GetWindowText,hChild,addr buffer1,tl
		invoke     OpenFile,addr buffer1,addr ofs,OF_CREATE
		mov     hFile, eax
		mov     est.dwCookie, eax
		mov     est.dwError, 0
		mov     eax, offset EditStreamWrite
		mov     est.pfnCallback, eax
		mov	    ecx,tl
		lea     eax,buffer1[ecx]
		mov     eax,[eax]
		.if  eax=='frt.' || eax=='FRT.'
			invoke     SendMessage, hEdit, EM_STREAMOUT, SF_RTF, addr est
		.else
			invoke     SendMessage, hEdit, EM_STREAMOUT, SF_TEXT, addr est
		.endif
		   mov     bytesread, eax
		invoke     BaseAscii, bytesread, offset Fsize, 8, 10, 1, 0, 1
      	invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_THRE, offset fsmsg
		invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_FOUR, offset szSucks
		invoke     CloseHandle,hFile
		invoke     SendMessage,hEdit,EM_SETMODIFY,FALSE,0
	.endif
EndSave:
	ret
SaveEdit endp

	
	;=========================================================================
	; SaveAs file PROCEDURE
	;=========================================================================
SaveAsFile PROC   hChild:DWORD
local    ofn:OPENFILENAME
local    EditS:EDITSTREAM
local    hFile:DWORD, hEdit
local of  :OFSTRUCT
local wndpl:WINDOWPLACEMENT

	invoke     GetWindow, hChild, GW_CHILD
	.if !eax
		jmp     EndSaveAs
	.endif
	
	mov     hEdit, eax
	invoke     SendMessage,  hEdit, WM_GETTEXTLENGTH, 0, 0
	.if !eax
		jmp     EndSaveAs
	.endif
	invoke RtlZeroMemory,addr ofn,sizeof ofn
	mov     ofn.lStructSize, sizeof ofn
	mov     eax, hChild
	mov     ofn.hwndOwner, eax
	mov     eax, hInstance
	mov     ofn.hInstance, eax
	mov     ofn.lpstrFilter, offset szSaveFilter
	mov     ofn.lpstrFile, offset PathName
	mov     ofn.nMaxFile, lengthof PathName
	mov     ofn.lpstrFileTitle, offset FileName
	mov     ofn.nMaxFileTitle, lengthof FileName
	mov     ofn.lpstrTitle, offset szSaveTitle
	mov     ofn.Flags, OFN_OVERWRITEPROMPT or OFN_CREATEPROMPT or\
						OFN_PATHMUSTEXIST or OFN_FILEMUSTEXIST or OFN_EXPLORER
	mov		ofn.lpstrDefExt, offset DefRtfExt
	invoke     GetSaveFileName, addr ofn
	cmp     eax, FALSE               ; Cancel'ed or error occurred
	je     EndSaveAs	
	invoke     CreateFile, addr PathName,\
	GENERIC_READ or GENERIC_WRITE ,\
	FILE_SHARE_READ or FILE_SHARE_WRITE,\
	NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL
	cmp     eax, -1                  ; Error?
	jne     savcrok	
saverr:
	jmp     EndSaveAs	
savcrok:
	mov     hFile, eax
	mov     EditS.dwCookie, eax
	mov     EditS.dwError, 0
	mov     EditS.pfnCallback, offset EditStreamWrite	
	invoke     GetWindow, hChild, GW_CHILD
	mov     hEdit, eax
	
	invoke lstrlen,addr PathName
	lea  	eax,  PathName[eax-4]
	mov		eax, [eax]		
	.if eax=='ftr.'	|| eax=='FTR.'
	invoke     SendMessage, hEdit, EM_STREAMOUT, SF_RTF, addr EditS
	.else
	invoke     SendMessage, hEdit, EM_STREAMOUT, SF_TEXT, addr EditS
	.endif
	mov     bytesread, eax
	invoke     SendMessage,  hEdit, EM_SETMODIFY, FALSE, 0
	invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_FOUR, offset szSucks
	invoke     BaseAscii, bytesread, offset Fsize, 8, 10, 1, 0, 1
    invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_THRE, offset fsmsg
	invoke     CloseHandle, hFile
 	invoke     SetWindowText, hChild, addr PathName 	
	invoke GetWindowPlacement,hChild,addr wndpl
	.if wndpl.showCmd == SW_SHOWMAXIMIZED	
		invoke SendMessage,hWndClient,WM_MDIRESTORE,hChild,0
	.endif
	mov closed,0

			invoke SetChildMenu
			invoke	ToolBarStatus
			invoke CoolMenu
			invoke  DrawMenuBar,hWndMain
	.if wndpl.showCmd == SW_SHOWMAXIMIZED		
		invoke SendMessage,hWndClient,WM_MDIMAXIMIZE,hChild,0
	.endif
	invoke SetFocus, hEdit
	invoke SetWindowLong,hEdit,GWL_USERDATA	,-1
	mov	 eax,TRUE
EndSaveAs:
	ret
SaveAsFile ENDP
DoYouWantToSave proc 
local	buffer[512]:BYTE
local	buffer1[2]:BYTE
	
	

		invoke     SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
		invoke     GetWindow, eax, GW_CHILD
		invoke     SendMessage,eax,EM_GETMODIFY,0,0
		.if eax
        	invoke     lstrcpy,addr buffer,addr WannaSave
        	.if  [FileName + 0]
        	      invoke lstrcat,addr buffer,addr FileName
        	.else
        	      invoke lstrcat,addr buffer,addr szChildTitle
        	.endif
        	mov		ax,'?'
        	mov		word ptr buffer1,ax
        	invoke lstrcat,addr buffer,addr buffer1
        	invoke MessageBox,hWndClient,addr buffer,addr szAppName,MB_YESNOCANCEL or MB_ICONQUESTION
        	.if eax==IDYES
        		invoke SaveEdit
        	.elseif eax==IDNO
        		mov		eax,FALSE
        	.else
        		mov		eax, TRUE
        	.endif
        .endif	
	ret
DoYouWantToSave endp
	;=========================================================================
	; Edit Stream Save Callback PROCEDURE
	;=========================================================================
EditStreamWrite PROC dwCookie:DWORD, pbBuff, cb, pcb
	invoke     WriteFile, dwCookie, pbBuff, cb, pcb, 0
	mov     eax, 0          ; File completely read
	ret
EditStreamWrite ENDP
