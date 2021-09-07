.486 
.model flat,stdcall
option casemap:none

include Project1.inc


.code
start:
		invoke GetModuleHandle,NULL
		mov hInstance,eax
		invoke InitCommonControls
		invoke WinMain,hInstance,NULL,NULL,SW_SHOWDEFAULT
		invoke ExitProcess,eax
		
WinMain proc hInst:HINSTANCE,hPrevInst:HINSTANCE,cmdLine:LPSTR,cmdShow:DWORD
	LOCAL wc:WNDCLASSEX
	LOCAL msg:MSG
	
	mov		wc.cbSize,SIZEOF WNDCLASSEX
	mov		wc.style,0
	mov		wc.lpfnWndProc,OFFSET WndProc
	mov		wc.cbClsExtra,NULL
	mov		wc.cbWndExtra,NULL
	push	hInst
	pop		wc.hInstance
	mov		wc.hbrBackground,COLOR_APPWORKSPACE+1
	mov		wc.lpszMenuName,IDR_MAINMENU
	mov		wc.lpszClassName,OFFSET szFrameClass
	invoke LoadIcon,NULL,IDI_APPLICATION
	mov		wc.hIcon,eax
	mov		wc.hIconSm,eax
	invoke LoadCursor,NULL,IDC_ARROW
	mov		wc.hCursor,eax
	invoke RegisterClassEx,addr wc
	
	mov		wc.lpfnWndProc,OFFSET ChildProc
	mov		wc.cbWndExtra,NULL
	mov		wc.hbrBackground,COLOR_BTNFACE+1
	mov		wc.lpszMenuName,IDR_CHILDMENU
	mov		wc.lpszClassName,OFFSET szChildClass
	invoke RegisterClassEx,addr wc
	
	invoke CreateWindowEx,NULL,addr szFrameClass,addr szAppName,\
					WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN, \
					CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,\
					CW_USEDEFAULT,NULL,0,hInst,NULL	
	mov hwndMain,eax				
	invoke LoadMenu,hInst,IDR_CHILDMENU
	mov hChildMenu,eax
	invoke ShowWindow,hwndMain,SW_MAXIMIZE
	invoke UpdateWindow,hwndMain
	.while TRUE
			invoke GetMessage,addr msg,NULL,0,0
	  		.break .if !eax
			invoke TranslateMDISysAccel,hClient,addr msg
			.if !eax
				invoke TranslateMessage,addr msg
				invoke DispatchMessage,addr msg
			.endif
	.endw
	invoke DestroyMenu,hChildMenu
	mov	eax,msg.wParam

	ret
WinMain endp
WndProc proc hwnd:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
	LOCAL clientStrc	:CLIENTCREATESTRUCT
	LOCAL rcClFrame		:RECT
	LOCAL rcTlbar		:RECT
	LOCAL rcStatus		:RECT
	LOCAL ptTlbar		:POINT
	LOCAL ptStatus		:POINT

	.if uMsg==WM_CREATE
		invoke GetMenu,hwnd
		mov hMainMenu,eax
		invoke GetSubMenu,hMainMenu,3
		mov clientStrc.hWindowMenu,eax
		mov clientStrc.idFirstChild,401
		invoke CreateWindowEx,WS_EX_CLIENTEDGE,addr szClientClass,NULL,\
						WS_CHILD or WS_VISIBLE or WS_CLIPCHILDREN or \
						WS_CLIPSIBLINGS,CW_USEDEFAULT,\
						CW_USEDEFAULT,CW_USEDEFAULT,CW_USEDEFAULT,\
						hwnd,NULL,hInstance,addr clientStrc
		mov hClient,eax
		
		mov mdiCreate.szClass,offset szChildClass
		mov mdiCreate.szTitle,offset szChildTitle
		push hInstance
		pop mdiCreate.hOwner
		mov mdiCreate.style,WS_CLIPCHILDREN or WS_CLIPSIBLINGS 
		mov mdiCreate.x,CW_USEDEFAULT
		mov mdiCreate.y,CW_USEDEFAULT
		mov mdiCreate.lx,CW_USEDEFAULT
		mov mdiCreate.ly,CW_USEDEFAULT
		
		invoke CreateToolbarEx, hwnd,WS_CHILD or WS_CLIPCHILDREN or \
						WS_CLIPSIBLINGS or TBSTYLE_TOOLTIPS,
						ID_TOOLBAR,1,hInstance,IDB_TOOLBAR,addr tbb,12,\
						16, 16, 16, 16, SizeOf TBBUTTON
		mov hToolbar,eax
		
    	invoke SendMessage,hToolbar,TB_SETSTYLE,0,TBSTYLE_FLAT or CCS_TOP
    	invoke ShowWindow,hToolbar,TRUE
	;------------------------------------
		invoke CreateStatus,hwnd
		mov hStatus,eax
;---------------------------------------------------------------			
	.elseif uMsg==WM_COMMAND
		mov eax,wParam
		.if ax==IDM_FILE_EXIT
			invoke SendMessage,hwnd,WM_CLOSE,0,0
		.elseif ax==IDM_WIN_TILEHORZ
			invoke SendMessage,hClient,WM_MDITILE,MDITILE_HORIZONTAL,0 
		.elseif ax==IDM_WIN_TILEVERT
			invoke SendMessage,hClient,WM_MDITILE,MDITILE_VERTICAL,0
		.elseif ax==IDM_WIN_CASCADE
			invoke SendMessage,hClient,WM_MDICASCADE,MDITILE_SKIPDISABLED,0
		.elseif ax==IDM_FILE_NEW
			invoke SendMessage,hClient,WM_MDICREATE,0,addr mdiCreate 
			invoke SendMessage,eax,WM_NCACTIVATE,TRUE,-1
			
		.elseif ax==IDM_FILE_CLOSE
			invoke SendMessage,hClient,WM_MDIGETACTIVE,0,0
			invoke SendMessage,eax,WM_CLOSE,0,0
			
		.elseif ax==IDM_HELP_ABOUT
			invoke DialogBoxParam,hInstance, addr szAboutDlg,hwnd,offset AboutDlgProc,NULL
		.else
			invoke DefFrameProc,hwnd,hClient,uMsg,wParam,lParam	
			ret
		.endif
;---------------------------------------------------------------			
	.elseif uMsg==WM_SIZE
		.if hClient!=NULL
			invoke GetClientRect,hwnd,addr rcClFrame
			invoke SendMessage,hToolbar,TB_AUTOSIZE,0,0
			invoke MoveWindow,hStatus,0,0,0,0,TRUE
;		We calculate the area in which we put the View window.		
			invoke GetWindowRect,hToolbar,addr rcTlbar
			invoke GetWindowRect,hStatus,addr rcStatus
			mov ptStatus.x,0
			mov ptTlbar.x,0
			push rcStatus.top
			pop ptStatus.y
			invoke ScreenToClient,hwnd,addr ptStatus
			push rcTlbar.bottom
			pop ptTlbar.y
			invoke ScreenToClient,hwnd,addr ptTlbar
			mov eax,ptStatus.y
			sub eax,ptTlbar.y             ;eax=Client height
			mov edx,eax
			invoke MoveWindow,hClient,0,ptTlbar.y,\
						rcClFrame.right,edx,TRUE
;		We calculate the appropriate parts of Statusbar. 	
			invoke GetClientRect,hStatus,addr rcStatus
    		mov eax,rcStatus.right
    		mov [sbParts + 12],-1
    		sub eax,120
    		mov [sbParts +  8],eax
    		sub eax,120
    		mov [sbParts +  4],eax
    		sub eax,160
    		mov [sbParts +  0],eax
    		invoke SendMessage,hStatus,SB_SETPARTS, 4,addr sbParts
		.endif
;---------------------------------------------------------------			
	.elseif uMsg==WM_DESTROY
		invoke PostQuitMessage,NULL		
;---------------------------------------------------------------			
	.else
		invoke DefFrameProc,hwnd,hClient,uMsg,wParam,lParam		
		ret
	.endif
	xor eax,eax
	ret
WndProc endp
ChildProc proc hChild:DWORD,uMsg:DWORD,wParam:DWORD,lParam:DWORD
	LOCAL szBuffer[128] :BYTE
	LOCAL szTitle[128]	:BYTE
	LOCAL nWidth		:DWORD
	LOCAL nHeight		:DWORD
	
	.if uMsg==WM_MDIACTIVATE
		mov eax,lParam
		.if eax==hChild
			invoke GetSubMenu,hChildMenu,3
			mov edx,eax
			invoke SendMessage,hClient,WM_MDISETMENU,hChildMenu,edx
		.else
			invoke GetSubMenu,hMainMenu,3   
			mov edx,eax 
			invoke SendMessage,hClient,WM_MDISETMENU,hMainMenu,edx 
		.endif
		invoke DrawMenuBar,hwndMain 
;------------------------------------------------------------	
	.elseif uMsg==WM_CREATE
		push esi
		lea ecx,szTitle
		invoke strCopy,ecx,addr szChildTitle
		invoke GetWindowLong,hChild,GWL_ID 
		mov esi,eax		;esi=ID of Child
		sub eax,400
		lea edx,szBuffer
		invoke dwtoa,eax,edx
		invoke szCatStr,addr szTitle,addr szBuffer
		invoke SetWindowText,hChild,addr szTitle
		pop esi                      
;-----------------------------------------------------------------
	.elseif uMsg==WM_SIZE
		LOWORD lParam
		mov nWidth,eax
		HIWORD lParam
		mov nHeight,eax
		
		invoke DefMDIChildProc,hChild,uMsg,wParam,lParam 
		ret 
;-----------------------------------------------------------------
	.elseif uMsg==WM_CLOSE
		invoke SendMessage,hClient,WM_MDIDESTROY,hChild,0 
;-----------------------------------------------------------------
	.else 	
		invoke DefMDIChildProc,hChild,uMsg,wParam,lParam 
		ret 
	.endif
	xor eax,eax
	ret
ChildProc endp
AboutDlgProc proc hWin:HWND,iMsg:DWORD,wParam:WPARAM, lParam:LPARAM
	.if iMsg==WM_INITDIALOG
		
	.elseif iMsg==WM_CLOSE
		invoke EndDialog,hWin,NULL
	.elseif iMsg==WM_COMMAND
		mov eax,wParam
		mov edx,eax
		shr edx,16
		.if dx==BN_CLICKED
			.if eax==IDC_BTN_OK
				invoke SendMessage,hWin,WM_CLOSE,NULL,NULL
			.endif
		.endif
	.else
		mov eax,FALSE
		ret
	.endif
	mov  eax,TRUE
	ret
AboutDlgProc endp
CreateStatus proc hParent:DWORD
	LOCAL rc			:RECT
	LOCAL hwnd			:DWORD

    invoke CreateStatusWindow,WS_CHILD or WS_VISIBLE or \
                              SBS_SIZEGRIP,NULL, hParent, 200
    mov hwnd,eax
    invoke GetClientRect,hParent,addr rc
      
    mov eax,rc.right
    mov [sbParts + 12],-1
    sub eax,120
    mov [sbParts +  8],eax
    sub eax,120
    mov [sbParts +  4],eax
    sub eax,120
    mov [sbParts +  0],eax

    invoke SendMessage,hwnd,SB_SETPARTS, 4,addr sbParts
    mov eax,hwnd
    ret

CreateStatus endp
strCopy proc pDest:DWORD,pSource:DWORD
	mov ecx, pSource	
    mov edx, pDest		
    copyLoop:
    	mov al,byte ptr [ecx]    
    	inc ecx			
    	mov byte ptr [edx],al    
    	inc edx			
    	cmp al,0		
    	jne copyLoop	
	ret
strCopy endp


end start
