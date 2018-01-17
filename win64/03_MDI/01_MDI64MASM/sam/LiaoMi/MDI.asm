
.686

.MODEL FLAT,STDCALL
OPTION CASEMAP:NONE

include MDI.inc
include Misc.asm
include Find.asm
include About.asm
include Combos.asm
include ColorPicker.asm
include OpenFile.asm
include SaveFile.asm
include Printing.asm
include HeaderProc.asm
include FormatFonts.asm
		
.CODE

Start:



      invoke     GetModuleHandle, NULL
         mov     hInstance, eax        
      invoke     GetCommandLine
         mov     CommandLine, eax
         ;Get command line filename
	invoke PathGetArgs,CommandLine
	mov		CommandLine,eax
      invoke     InitCommonControls          ; Initialize the common ctrl lib
      call SetDefaultPSD
      call SetPaper        
        mov icex.dwSize, sizeof (INITCOMMONCONTROLSEX)
        mov icex.dwICC, ICC_BAR_CLASSES
        invoke InitCommonControlsEx, ADDR icex

        mov sbView,1
        mov tbView,1
      invoke     LoadLibrary, addr RichEdDLL ; Load the Riched20.dll
         mov     hREdDll, eax
      .if !eax
         invoke     MessageBox, NULL, addr szError1, addr szAppName, MB_OK or MB_ICONERROR
            jmp     NoGo
      .endif


      invoke     WinMain, hInstance ,NULL, CommandLine, SW_SHOWDEFAULT
                 mov     MainExit, eax
	   invoke     FreeLibrary, hREdDll
NoGo:
      invoke     ExitProcess, MainExit

		
WinMain Proc uses ebx hPInstance:HINSTANCE,hPrevInst:HINSTANCE,cmdLine:LPSTR,cmdShow:DWORD
Local wc	:WNDCLASSEX
Local msg	:MSG
local left	:DWORD
local top	:DWORD


;---------- [Register the frame window class] ----------	
	mov wc.cbSize,sizeof WNDCLASSEX
	mov wc.style,CS_HREDRAW OR CS_VREDRAW
	mov wc.lpfnWndProc,offset WndProc
	mov wc.cbClsExtra,NULL
	mov wc.cbWndExtra,NULL
	m2m wc.hInstance,hPInstance
	mov wc.hbrBackground,COLOR_APPWORKSPACE+1
	mov wc.lpszMenuName,IDR_MAINMENU
	mov wc.lpszClassName,offset szClassName
	invoke LoadIcon, wc.hInstance, IDB_ICON_BITMAP
	mov wc.hIcon,eax
	mov wc.hIconSm,eax
	invoke LoadCursor, NULL, IDC_ARROW
	mov wc.hCursor,eax
	invoke RegisterClassEx, addr wc
	
;---------- [Register the MDI child window class] ----------
	
	mov wc.lpfnWndProc,offset ChildProc
	mov wc.hbrBackground,COLOR_BTNFACE+1
	mov wc.lpszClassName,offset szChildClass
	mov wc.cbWndExtra,4
	mov wc.lpszMenuName,IDR_CHILDMENU
	invoke RegisterClassEx, addr wc
	
;---------- [Center and create the main window] ----------
		invoke     GetSystemMetrics, SM_CXSCREEN
		push eax
		xor  edx,edx
		mov  ecx,6
		div  ecx
		mov edx,eax
		mov left,eax
		pop eax
		shl edx,1
		sub eax,edx
		push eax
      invoke     GetSystemMetrics, SM_CYSCREEN
		push eax
		xor  edx,edx
		mov  ecx,8
		div  ecx
		mov edx,eax
		mov top,eax
		pop eax
		shl edx,1
		sub eax,edx	
		pop edx	
	invoke CreateWindowEx, WS_EX_CLIENTEDGE or WS_EX_ACCEPTFILES, addr szClassName, addr szAppName,\
	 WS_OVERLAPPEDWINDOW OR WS_CLIPCHILDREN or WS_VISIBLE or WS_CLIPSIBLINGS, \
	 left, top, edx, eax, NULL, NULL, hPInstance,NULL
	mov hWndMain,eax
	invoke LoadMenu, hPInstance, IDR_CHILDMENU
	mov hChildMenu,eax
	invoke ShowWindow, hWndMain, SW_SHOWNORMAL
	invoke UpdateWindow, hWndMain
	invoke     LoadAccelerators, hPInstance, IDR_ACCEL
         mov     hAccel, eax
	;Get command line filename
	mov		edx,cmdLine
	.if byte ptr [edx]
		invoke OpenCommandLine,CommandLine
	.endif

;---------- [the message loop]  ----------------------

	.While TRUE
		invoke GetMessage, addr msg, NULL, 0, 0
	  	.Break .if !eax
		invoke TranslateMDISysAccel, hWndClient, addr msg
		.if !eax
			invoke TranslateMessage, addr msg
			invoke DispatchMessage, addr msg
			invoke TranslateAccelerator, hWndMain, hAccel, addr msg		
		.endif

	.Endw
	invoke DestroyMenu, hChildMenu
	invoke DestroyMenu, hPopUpMenu
	mov	eax,msg.wParam
	RET
WinMain EndP
DoToolbar Proc hWnd
		invoke CreateToolbarEx, hWnd, WS_CHILD OR WS_CLIPCHILDREN OR WS_CLIPSIBLINGS OR\
		 TBSTYLE_TOOLTIPS OR CCS_TOP, ID_TOOLBAR, 1, hInstance, IDB_TOOLBAR, \
		 addr tbb, 40, 16, 16, 16, 16, sizeof TBBUTTON
		mov hToolbar,eax
	invoke SendMessage, hToolbar,TB_SETSTYLE, 0,TBSTYLE_FLAT OR TBSTYLE_TOOLTIPS OR CCS_TOP
	invoke ImageList_LoadImage,hInstance,IDB_TOOLBAR,16,30,00FF00FFh,IMAGE_BITMAP, LR_CREATEDIBSECTION
	mov		hImlTbr,eax
	invoke SendMessage,hToolbar,TB_SETIMAGELIST,0,hImlTbr
	invoke GrayedImageList
  ;Create ToolTip Window for Combos and initiate TOOLINFO struct
	    invoke CreateWindowEx, 0, addr ToolTipClass, NULL, TTS_ALWAYSTIP,
                        CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,
                        NULL, NULL,hInstance, NULL  
    mov m_hToolTip, eax
    mov ti.cbSize, sizeof TOOLINFO
    m2m ti.hWnd, NULL
    m2m ti.hInst, hInstance 
    m2m ti.uFlags, TTF_SUBCLASS
		
	ret
DoToolbar endp 
ToolBarStatus proc uses esi
	local	chrg:CHARRANGE
;	local	val:DWORD
	local 	hEdit :DWORD
	local 	rect :RECT
	local 	textlenstruc:GETTEXTLENGTHEX
	
	
    invoke	   SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
	invoke	   GetWindow, eax, GW_CHILD
	mov	   hEdit,eax

	.if eax
		invoke EnableWindow,hCFont,TRUE
		invoke EnableWindow,hCSize,TRUE
		invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_WIN_TILEHORZ, TRUE
	    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_WIN_TILEVERT, TRUE
	    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_WIN_CASCADE, TRUE
		invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FORMAT_BOLD, TRUE
	    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FORMAT_ITALIC, TRUE
	    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FORMAT_UNDERLINE, TRUE
	    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FORMAT_LEFT, TRUE
	    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FORMAT_CENTER, TRUE
	    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FORMAT_RIGHT, TRUE
	    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FORMAT_CHOOSECOLOR, TRUE
	    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_PREVIEW, TRUE
	    mov	textlenstruc.flags,GTL_DEFAULT
	    mov	textlenstruc.codepage,CP_ACP
	    invoke     SendMessage,hEdit,EM_GETTEXTLENGTHEX,addr textlenstruc,0
	    .if eax
			invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_SETUP, TRUE
			invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_PRINT, TRUE
			invoke 		EnableMenuItem,hChildMenu,IDM_FILE_SETUP,MF_ENABLED
			invoke 		EnableMenuItem,hChildMenu,IDM_FILE_PRINT,MF_ENABLED
		.else
			invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_SETUP, FALSE
			invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_PRINT, FALSE
			invoke 		EnableMenuItem,hChildMenu,IDM_FILE_SETUP,MF_GRAYED
			invoke 		EnableMenuItem,hChildMenu,IDM_FILE_PRINT,MF_GRAYED
		.endif
			invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_FILE_SAVE,TRUE
			;invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_FILE_SAVEALL,TRUE
			invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_FIND,TRUE
			invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_REPLACE,TRUE
			;Check whether there is some text in the clipboard. If so, we enable the paste menuitem
			invoke SendMessage,hEdit,EM_CANPASTE,CF_TEXT,0
			.if eax
				;there is some text in the clipboard
				invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_PASTE,TRUE			
			.else
				;no text in the clipboard
				invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_PASTE,FALSE
			.endif
			;check whether the undo queue is empty
			invoke SendMessage,hEdit,EM_CANUNDO,0,0
			.if eax
				invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_UNDO,TRUE
				invoke EnableMenuItem,hChildMenu,IDM_EDIT_UNDO,MF_ENABLED
			.else
				invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_UNDO,FALSE
				invoke EnableMenuItem,hChildMenu,IDM_EDIT_UNDO,MF_GRAYED			
			.endif
			;check whether the redo queue is empty
			invoke SendMessage,hEdit,EM_CANREDO,0,0
			.if eax
				invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_REDO,TRUE
				invoke EnableMenuItem,hChildMenu,IDM_EDIT_REDO,MF_ENABLED
			.else
				invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_REDO,FALSE
				invoke EnableMenuItem,hChildMenu,IDM_EDIT_REDO,MF_GRAYED
			.endif
			;check whether there is a current selection in the richedit control.
			;If there is, we enable the cut/copy/delete menuitem
			invoke SendMessage,hEdit,EM_EXGETSEL,0,addr chrg
			mov eax,chrg.cpMax
			sub eax,chrg.cpMin
			.if eax
				;there is a current selection
				invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_COPY,TRUE
				invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_CUT,TRUE
				invoke SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_DELETE, TRUE
				invoke EnableMenuItem,hChildMenu,IDM_EDIT_COPY,MF_ENABLED
				invoke EnableMenuItem,hChildMenu,IDM_EDIT_CUT,MF_ENABLED
				invoke EnableMenuItem,hChildMenu,IDM_EDIT_DELETE,MF_ENABLED
			.else
				;no current selection
				invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_COPY,FALSE
				invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_CUT,FALSE
				invoke SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_DELETE, FALSE
				invoke EnableMenuItem,hChildMenu,IDM_EDIT_COPY,MF_GRAYED
				invoke EnableMenuItem,hChildMenu,IDM_EDIT_CUT,MF_GRAYED
				invoke EnableMenuItem,hChildMenu,IDM_EDIT_DELETE,MF_GRAYED			
			.endif 			 
	.else
			;no child window
	        invoke     SendMessage, [hCFont],CB_SETCURSEL, -1, 0
            invoke     SendMessage, [hCSize],CB_SETCURSEL, -1, 0
		    invoke EnableWindow,hCFont,FALSE
		    invoke EnableWindow,hCSize,FALSE
			invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_UNDO, FALSE
			invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_REDO, FALSE
			invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_CUT, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_COPY, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_PASTE, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_DELETE, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_FIND, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_REPLACE, FALSE		     
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_SETUP, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_PRINT, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_PREVIEW, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_SAVE, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FORMAT_BOLD, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FORMAT_ITALIC, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FORMAT_UNDERLINE, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FORMAT_LEFT, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FORMAT_CENTER, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FORMAT_RIGHT, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_WIN_TILEHORZ, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_WIN_TILEVERT, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_WIN_CASCADE, FALSE
		    invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FORMAT_CHOOSECOLOR, FALSE
			invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_ONE, offset szSpace
			invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_TWO, offset szSpace
			invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_THRE, offset szSpace
			invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_FOUR, offset szSpace
	.endif
	ret
ToolBarStatus endp
ShawStatusItems proc
         invoke     BaseAscii, Lnum, offset cnt1, 5, 10, 0, 1, 0
         invoke     BaseAscii, Ltot, offset cnt2, 5, 10, 0, 1, 0
            mov     eax, SBook
         .if eax != EBook               ; If selection zero out column's
               mov     SPos, 0
               mov     Llen, 0
         .endif
         invoke     BaseAscii, SPos, offset cnt3, 4, 10, 0, 1, 0
         invoke     BaseAscii, Llen, offset cnt4, 4, 10, 0, 1, 0
		 invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_ONE, offset LdataR
         invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_TWO, offset LdataC
	 	ret
ShawStatusItems endp
PrintStatusItems proc  hEdit:DWORD
         invoke     lstrcpy, offset LineBuff, offset Clear
      	 invoke     SendMessage, hEdit, EM_GETFIRSTVISIBLELINE, 0, 0
         	mov     TopLineP, eax
         invoke     SendMessage, hEdit, EM_GETSEL, offset SBook, offset EBook
         invoke     SendMessage, hEdit, EM_EXGETSEL, 0, offset cr
         invoke     SendMessage, hEdit, EM_GETLINECOUNT, 0, 0    ;returns # lines + 1
            mov     Ltot, eax
         invoke     SendMessage, hEdit, EM_GETSEL, offset SPos, offset EPos
            mov     eax, SPos
            sub     EPos, eax
         invoke     SendMessage, hEdit, EM_LINEINDEX, -1, 0
            mov     FileOff, eax
         invoke     SendMessage, hEdit, EM_EXLINEFROMCHAR, 0, FileOff
            mov     Lnum, eax
         invoke     SendMessage, hEdit, EM_GETLINE, Lnum, offset LineBuff
            inc     eax
            mov     Llen, eax
            mov     eax, FileOff
         .if eax > SPos
               and     SPos, 0
               mov     ebx, EPos
            .if EPos > 2 
                  sub     ebx, 2
            .endif
               mov     Llen, ebx
         .else
               sub     SPos, eax
         .endif
            add     SPos, 1
            mov     eax, EPos
         .if eax > Llen
               sub     Lnum, 1
         .endif
         .if Llen == 0
               and     SPos, 1
         .endif
            add     Lnum, 1
         .if Llen >= 1
               sub     Llen, 1
         .endif
         mov  eax,cr.cpMax 
         sub  eax,cr.cpMin
         invoke 	DwToAscii, eax, offset selnum
         invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_FOUR, offset selected
         call 		ShawStatusItems
		ret
PrintStatusItems endp
		
EditProc proc hWin:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD
local chrg :CHARRANGE
local textlenstruc:GETTEXTLENGTHEX
local   hEdit:DWORD
local   rect :RECT
local  XP:DWORD
local  YP:DWORD
local  msg:MSG
 
	  invoke	 SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
	  invoke	   GetWindow, eax, GW_CHILD
	  mov	   hEdit,eax
		
	.if uMsg==WM_CHAR
        mov  eax,wParam  
		.if eax == VK_TAB
			invoke SendMessage,hWin,EM_EXGETSEL,0,addr chrg
			mov eax,chrg.cpMin
			.if chrg.cpMax != eax
				invoke 		EnableMenuItem,hChildMenu,IDM_EDIT_UNDO,MF_ENABLED
				invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_UNDO, TRUE
				ret
			.endif
		.endif	
		invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_UNDO, TRUE
		invoke 		EnableMenuItem,hChildMenu,IDM_EDIT_UNDO,MF_ENABLED
		invoke  	CallWindowProc,OldEditProc,hWin,uMsg,wParam,lParam
	    ;is there anny text to print
	    mov			textlenstruc.flags,GTL_DEFAULT
	    mov			textlenstruc.codepage,CP_ACP
	    invoke     SendMessage,hWin,EM_GETTEXTLENGTHEX,addr textlenstruc,0
		    .if eax
		    ;there is some text to print
				invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_SETUP, TRUE
				invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_PRINT, TRUE
				invoke 		EnableMenuItem,hChildMenu,IDM_FILE_SETUP,MF_ENABLED
				invoke 		EnableMenuItem,hChildMenu,IDM_FILE_PRINT,MF_ENABLED	
			.else
			;no text to print
				invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_SETUP, FALSE
				invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_PRINT, FALSE
				invoke 		EnableMenuItem,hChildMenu,IDM_FILE_SETUP,MF_GRAYED
				invoke 		EnableMenuItem,hChildMenu,IDM_FILE_PRINT,MF_GRAYED
			.endif
		jmp EndEditProc 
	.elseif uMsg== WM_RBUTTONUP
	  ;show popup menu   
	      invoke 	 GetSubMenu,hChildMenu,2
			 mov	 hPopUpMenu,eax	
	      invoke     GetWindowRect,hWndMain,ADDR rect
	         mov     eax, lParam        ; x/y pos of window
	         mov     ebx, eax
	         and     ebx, 0000ffffh     ; ebx = LOWORD(lparam) = x pos
	         shr     eax, 16            ; eax = HIWORD(lparam) = y pos
	         add     ebx, rect.left
	         add     eax, rect.top
	         mov     XP, ebx            ; x position
	         mov     YP, eax            ; y position
	         add     XP, 10 
	         add     YP, 70
	      invoke     TrackPopupMenu, hPopUpMenu, TPM_LEFTALIGN or TPM_LEFTBUTTON, XP, YP, 0, hWndMain,0
             
	.elseif uMsg==WM_LBUTTONUP || uMsg == WM_KEYUP
		;check if some text was selected and set toolbar buttons
		; and the menu accordingly
		invoke SendMessage,hWin,EM_EXGETSEL,0,addr chrg
		mov 	eax,chrg.cpMax
		sub 	eax,chrg.cpMin
		.if !eax
			;no current selection
			invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_COPY,FALSE
			invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_CUT,FALSE
			invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_DELETE,FALSE
		.else
			;yes there is selected text
			invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_COPY,TRUE
			invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_CUT,TRUE
			invoke SendMessage,hToolbar,TB_ENABLEBUTTON,IDM_EDIT_DELETE,TRUE
		.endif
		;check for char effects and set toolbar buttons accordingly
		invoke     SendMessage, hEdit, EM_GETCHARFORMAT, TRUE, offset charF
		invoke SendMessage, hCFont,CB_SELECTSTRING,0,addr charF.szFaceName
		mov edx,0 
		mov eax,charF.yHeight
		mov    ecx,20
		div  ecx
		invoke 	DwToAscii, eax, offset ascii
		invoke SendMessage, hCSize,CB_SELECTSTRING,0,offset ascii
		mov		eax,charF.dwEffects
		and     eax, CFM_ITALIC
        .if 	eax
              invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_ITALIC, TRUE
        .else
      		  invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_ITALIC, FALSE
      	.endif
      	mov		eax,charF.dwEffects
		and     eax, CFM_UNDERLINE
      	.if eax
         	  invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_UNDERLINE, TRUE
        .else
       		  invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_UNDERLINE, FALSE       
        .endif
      	 mov		eax,charF.dwEffects
		 and     eax,CFM_BOLD
        .if     eax
          	  invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_BOLD, TRUE
       .else
       		  invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_BOLD, FALSE
	   .endif
		invoke PrintStatusItems,hEdit
	 .elseif uMsg == WM_VSCROLL
         invoke     SendMessage, hEdit, EM_GETFIRSTVISIBLELINE, 0, 0
            inc     eax
            mov     Lnum, eax
         invoke     SendMessage, hEdit, EM_GETLINECOUNT, 0, 0
            mov     Ltot, eax
            mov     SPos, 0
            mov     Llen, 0
            call 		ShawStatusItems  
	.endif
	invoke CallWindowProc,OldEditProc,hWin,uMsg,wParam,lParam
EndEditProc:	
			ret
EditProc endp
WndProc Proc uses ebx esi edi ,hWnd:DWORD,wMsg:DWORD,wParam:DWORD,lParam:DWORD
Local clientcreate	:CLIENTCREATESTRUCT
local hWndChild		:DWORD
local hEdit			:DWORD
local rect			:RECT
local buffer1[128]	:BYTE
local chrg			:CHARRANGE
local buffer[512]	:BYTE
local hBr			:DWORD
local mDC			:HDC		
local hCtl			:HWND
local lpLogfont:LOGFONT

	.if  wMsg == WM_ACTIVATE
                invoke	   SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
				mov	hWndChild, eax
				invoke	   GetWindow, eax, GW_CHILD
				mov	   hEdit,eax
				.if eax
					invoke SetFocus, hEdit 
				invoke     SendMessage, hEdit, EM_GETCHARFORMAT, TRUE, offset charF
				invoke SendMessage, hCFont,CB_SELECTSTRING,0,addr charF.szFaceName
				mov edx,0 
				mov eax,charF.yHeight
				mov    ecx,20
				div  ecx
				invoke 	DwToAscii, eax, offset ascii
				invoke SendMessage, hCSize,CB_SELECTSTRING,0,offset ascii
				.endif			
	.elseif wMsg==WM_SIZE

		
		;---------- [Size the Statusbar Control] ----------
		.if     sbView
			 mov	     eax, lParam	                 ; Get width
			 and	     eax, 0ffffh	                 ; Lowword
			 shr	     eax, 2		                     ; /4
			 mov	     ecx, eax		                 ; Save factor
			 mov	     [sbParts + 0], eax	     ; Make part 1 1/4 the width
			 add	     eax, ecx
			 mov	     [sbParts + 4], eax	     ; and also part2, .. etc
			 add	      eax, ecx
			 mov	     [sbParts + 8], eax
			 mov	     [sbParts + 12],-1    ; The last part extends to the end
		  invoke      	SendMessage, hStatus, SB_SETPARTS, 4, addr sbParts
		  invoke      	MoveWindow, hStatus, 0, 0, 0, 0, TRUE
		.endif
		     ;---------- [Size the Toolbar Control] ----------
		     
			 invoke SendMessage, hToolbar, TB_AUTOSIZE, 0, 0
			 invoke GetWindowRect,hToolbar,addr rect
			 mov	 eax, rect.bottom
			 sub	 eax, rect.top
			 push	 eax		                ; Save height of toolbar
			 invoke  GetWindowRect, hStatus,addr rect
			 mov	 eax, rect.bottom
			 sub	 eax, rect.top              ; eax = height of statusbar			 
			 .if     !sbView
			 	xor     eax,eax
			 .endif		
			 	pop	 edx		                ; edx = height of toolbar
			 .if     !tbView
			 	xor     edx,edx
			 .endif
			 mov	 ebx, lParam	            ; Width of new client area
			 and	 ebx, 0ffffh	            ; ebx = width
			 mov	 ecx, lParam
			 shr	 ecx, 16	                ; Height of new client area
			 sub	 ecx, eax	                ; Edit window - height of statusbar
			 sub	 ecx, edx	                ; Edit window - height of toolbar
			 sub	 edx, 2 	                ; For border
			 add	 ecx, 2 	                ; For border
			 add	 ecx, 2 	                ; For border
			 invoke  MoveWindow, hWndClient, 0, edx, ebx, ecx, TRUE
   .elseif wMsg == WM_NOTIFY
		; ---------------------------------------------------
		; The toolbar has the TBSTYLE_TOOLTIPS style enabled
		; so that a WM_NOTIFY message is sent when the mouse
		; is over the toolbar buttons.
		; ---------------------------------------------------
		
		mov		edx,lParam
		mov		eax,[edx].NMHDR.code		
		.if eax==TTN_NEEDTEXT
			;Toolbar tooltip
			mov		edx,(NMHDR ptr [edx]).idFrom
		 invoke 	LoadString,hInstance,edx,addr buffer1,sizeof buffer1
			lea		eax,buffer1
			mov		edx,lParam
			mov		(TOOLTIPTEXT ptr [edx]).lpszText,eax
		.endif
		
    .elseif wMsg==WM_CREATE
		 invoke  	lstrcpy, addr lf.lfFaceName, addr FontName
	        mov     lf.lfHeight, -16
	        mov     lf.lfWeight, 500
	     invoke  	CreateFontIndirect, addr lf
	        mov     hFont, eax
			mov     pf.cbSize, sizeof pf
	        mov     charF.cbSize, sizeof charF
			mov     eax, lf.lfWeight
	        mov     charF.wWeight, ax
	        mov     pf.dySpaceAfter, 0
	        mov     pf.dyLineSpacing, 0
		 invoke 	GetMenu,hWnd
			mov 	hMainMenu,eax
		 invoke 	GetSubMenu,hChildMenu,3
			mov		hChildMenu,eax
			mov 	clientcreate.idFirstChild,401
		
		;---------- [Create the Client window] ----------

		invoke CreateWindowEx, WS_EX_CLIENTEDGE , addr szClientName, NULL,\
		 	   WS_CHILD OR WS_VISIBLE OR WS_CLIPCHILDREN, CW_USEDEFAULT, \
		 	   CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,\
		 	    hWnd,NULL,hInstance, addr clientcreate
		mov hWndClient,eax
		
	;---------- [Initialize the MDICREATESTRUCT] ----------	

		mov		mdiCreate.szClass, offset szChildClass
	   push		hInstance
		pop		mdiCreate.hOwner
		mov		mdiCreate.x,CW_USEDEFAULT
		mov		mdiCreate.y,CW_USEDEFAULT
		mov		mdiCreate.lx,CW_USEDEFAULT
		mov		mdiCreate.ly,CW_USEDEFAULT
		
		      ; ---------- [Create the status bar window] ----------
		invoke	   CreateWindowEx, 0, addr StatClass, 0,\
			   WS_CHILD or WS_BORDER or WS_VISIBLE or SBS_SIZEGRIP,\
			   0, 0, 0, 0, hWnd, 0, hInstance, 0
		   mov	   hStatus, eax

	 ;---------- [Create the Toolbar window] ----------	 		   

		invoke		DoToolbar,hWnd
		invoke		CoolMenu
		invoke		Combos		
		invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_UNDO, FALSE
        invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_REDO, FALSE
		invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_SETUP, TRUE
		invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_FILE_PRINT, TRUE
		invoke		ShowWindow, hToolbar, TRUE
		invoke		CheckMenuItem,hMainMenu,IDM_VIEW_TOOLBAR,MF_CHECKED	
		invoke		CheckMenuItem,hMainMenu,IDM_VIEW_STATUS,MF_CHECKED
	.elseif wMsg == WM_DROPFILES
        invoke		DragQueryFile,wParam,0,addr PathName,sizeof PathName
		invoke		LoadFile, addr PathName
		
	.elseif wMsg==WM_COMMAND
		invoke     SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
		   mov     hWndChild, eax 
		invoke     GetWindow, eax, GW_CHILD 
		   mov	   hEdit,eax 
		   mov    eax,wParam
		  cwde		
		.if eax==IDM_FILE_EXIT
			invoke SendMessage, hWnd, WM_CLOSE, 0, 0
		.elseif eax==IDM_WIN_TILEHORZ
			invoke SendMessage, hWndClient, WM_MDITILE, MDITILE_HORIZONTAL, 0 
		.elseif eax==IDM_WIN_TILEVERT
			invoke SendMessage, hWndClient, WM_MDITILE, MDITILE_VERTICAL, 0
		.elseif eax==IDM_WIN_CASCADE
			invoke SendMessage, hWndClient, WM_MDICASCADE, MDITILE_SKIPDISABLED, 0
		.elseif eax>=0191h ;the window list starts with 0191h
				mov closed,2 ;not necessery to draw the menu again
				invoke	   DefFrameProc, hWnd, hWndClient, wMsg, wParam, lParam
				invoke SendMessage,hWnd,WM_ACTIVATE,0,0				
		.elseif eax==IDM_FILE_NEW
			   mov closed,0
			   inc 	chcount
	        invoke 	DwToAscii, chcount, offset ascii
	        invoke 	lstrcpy,addr tmpbuff,addr szChildTitle
	        invoke 	lstrcat,addr tmpbuff,addr ascii
	           mov  mdiCreate.szTitle,offset tmpbuff
			invoke  SendMessage, hWndClient, WM_MDICREATE, 0, addr mdiCreate 
			   mov  hWndChild, eax
			.if WWrap
				invoke WrapedWindow,eax
			.else
				invoke NonWrapedWindow,eax
			.endif
               mov		hEdit, eax
	        invoke  	SetWindowText,hWndChild,addr tmpbuff   
            invoke  	SendMessage, hEdit, WM_SETFONT, hFont, 1
            invoke  	GetClientRect, hWndClient, addr rect
            invoke  	MoveWindow, hEdit, rect.left, rect.top, rect.right, rect.bottom, TRUE
               add 		rect.left,10
            invoke		SendMessage, hEdit, EM_SETRECT, 0, addr rect
		    invoke		SendMessage, hCFont,CB_SELECTSTRING, 0, addr FontName		    
	        invoke		SendMessage, hCSize,CB_SETCURSEL, 10, 0
			invoke		SendMessage,hEdit,EM_EXLIMITTEXT,0,2000000
			
			;invoke		SendMessage,hEdit,
			invoke		SetFocus, hEdit
			;Subclass the richedit control
			invoke		SetWindowLong,hEdit,GWL_WNDPROC,addr EditProc
			   mov		OldEditProc,eax
			invoke 		PrintStatusItems,hEdit
      		invoke      SendMessage, hStatus, SB_SETTEXT, SBR_PART_THRE, offset szNoIdea
			invoke 		SetWindowLong,hEdit,GWL_USERDATA	,NULL
			invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_UNDO, FALSE
            invoke      SendMessage,hToolbar,TB_ENABLEBUTTON, IDM_EDIT_REDO, FALSE
            invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_LEFT, TRUE
            invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_RIGHT, FALSE
			invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_CENTER, FALSE
			invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_BOLD, FALSE
			invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_ITALIC, FALSE
			invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_UNDERLINE, FALSE
		.elseif eax==IDM_EDIT_UNDO
			invoke SendMessage,hEdit,EM_UNDO,0,0
		.elseif eax==IDM_EDIT_REDO
			invoke SendMessage,hEdit,EM_REDO,0,0
		.elseif eax==IDM_EDIT_CUT
			invoke SendMessage,hEdit,WM_CUT,0,0
		.elseif eax==IDM_EDIT_COPY
			invoke SendMessage,hEdit,WM_COPY,0,0
		.elseif eax==IDM_EDIT_PASTE
			invoke SendMessage,hEdit,WM_PASTE,0,0
		.elseif eax==IDM_EDIT_DELETE
			invoke SendMessage,hEdit,WM_CLEAR,0,0
		.elseif eax==IDM_EDIT_SELECTALL
			mov		chrg.cpMin,0
			mov		chrg.cpMax,-1
			invoke SendMessage,hEdit,EM_EXSETSEL,0,addr chrg
		.elseif eax == IDM_FORMAT_LEFT
                mov     pf.dwMask, PFM_ALIGNMENT
                mov     pf.wAlignment, PFA_LEFT
                invoke SendMessage,hEdit,EM_SETPARAFORMAT, 0,offset pf
                invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_LEFT, TRUE
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_RIGHT, FALSE
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_CENTER, FALSE
        .elseif eax == IDM_FORMAT_CENTER
                mov     pf.dwMask, PFM_ALIGNMENT
                mov     pf.wAlignment, PFA_CENTER
                invoke SendMessage,hEdit,EM_SETPARAFORMAT, 0,offset pf
                invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_LEFT, FALSE
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_RIGHT, FALSE
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_CENTER, TRUE
         .elseif eax == IDM_FORMAT_RIGHT
                mov     pf.dwMask, PFM_ALIGNMENT
                mov     pf.wAlignment, PFA_RIGHT
                 invoke SendMessage,hEdit,EM_SETPARAFORMAT, 0,offset pf
                invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_LEFT, FALSE
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_RIGHT, TRUE
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_CENTER, FALSE
        .elseif eax == IDM_FORMAT_BOLD
                invoke  SendMessage, hEdit, EM_GETCHARFORMAT, TRUE, offset charF
                mov     eax, charF.dwEffects
                push    eax
                xor     eax, CFE_BOLD
                mov     charF.dwEffects, eax
                invoke  SendMessage, hEdit, EM_SETCHARFORMAT, SCF_SELECTION,offset charF
				pop eax
				and eax,CFM_BOLD
				.if eax == CFE_BOLD
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_BOLD, FALSE
				.else
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_BOLD, TRUE
				.endif
        .elseif eax == IDM_FORMAT_ITALIC
                 invoke  SendMessage, hEdit, EM_GETCHARFORMAT, SCF_SELECTION,offset charF
                mov     eax, charF.dwEffects
                push    eax
                xor     eax, CFE_ITALIC
                mov     charF.dwEffects, eax
                invoke  SendMessage, hEdit, EM_SETCHARFORMAT, SCF_SELECTION,offset charF
				pop eax
				and eax,CFM_ITALIC
				.if eax == CFE_ITALIC
					invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_ITALIC, FALSE
				.else
					invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_ITALIC, TRUE
				.endif

        .elseif eax == IDM_FORMAT_UNDERLINE
                invoke  SendMessage, hEdit, EM_GETCHARFORMAT, TRUE,offset charF
                mov     eax, charF.dwEffects
                push    eax
                xor     eax, CFE_UNDERLINE
                mov     charF.dwEffects, eax
                xor    charF.dwMask, CFM_UNDERLINETYPE
                invoke  SendMessage, hEdit, EM_SETCHARFORMAT, SCF_SELECTION,offset charF
				pop eax
				and eax,CFM_UNDERLINE
				.if eax == CFE_UNDERLINE
					invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_UNDERLINE, FALSE
				.else
					invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_UNDERLINE, TRUE
				.endif
		.elseif eax == IDM_FORMAT_FONT
		invoke     SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
       		.if eax
				m2m 	hREdit,hEdit
				invoke FormatFont
				invoke SetFocus,hEdit
			.endif
		.elseif eax==IDM_VIEW_TOOLBAR
           invoke GetWindow,hToolbar,GW_CHILD
           mov  hCtl,eax
           xor  tbView,1           
           .if tbView
            invoke ShowWindow,hCtl,SW_SHOWNA


            invoke CheckMenuItem,hChildMenu,IDM_VIEW_TOOLBAR,MF_CHECKED
            invoke CheckMenuItem,hMainMenu,IDM_VIEW_TOOLBAR,MF_CHECKED
           .else
            invoke ShowWindow,hCtl,SW_HIDE

            invoke CheckMenuItem,hChildMenu,IDM_VIEW_TOOLBAR,MF_UNCHECKED
            invoke CheckMenuItem,hMainMenu,IDM_VIEW_TOOLBAR,MF_UNCHECKED
           .endif  
           invoke GetClientRect,hWnd,addr rect
               mov eax,rect.bottom
               shl eax,16
			   mov ax,word ptr rect.right
               invoke SendMessage,hWnd,WM_SIZE,0,eax		
            .elseif eax==IDM_VIEW_STATUS
				xor	sbView,1			
				.if sbView
								
					invoke CheckMenuItem,hChildMenu,IDM_VIEW_STATUS,MF_CHECKED
					invoke CheckMenuItem,hMainMenu,IDM_VIEW_STATUS,MF_CHECKED	
				     invoke ShowWindow,hStatus,SW_SHOWNA
				.else
					invoke ShowWindow,hStatus,SW_HIDE				
					invoke CheckMenuItem,hChildMenu,IDM_VIEW_STATUS,MF_UNCHECKED
					invoke CheckMenuItem,hMainMenu,IDM_VIEW_STATUS,MF_UNCHECKED
				.endif
                invoke GetClientRect,hWnd,addr rect
	               mov eax,rect.bottom
	               shl eax,16
				   mov ax,word ptr rect.right
	               invoke SendMessage,hWnd,WM_SIZE,0,eax		
		.elseif eax==IDM_FORMAT_WWRAP
				call     WordWrap
				mov hEdit,eax	
		.elseif eax==IDM_HELP_ABOUT
				invoke DialogBoxParam,hInstance,IDD_DLGABOUT,hWnd,offset AboutProc,0
				invoke SetFocus,hEdit
		.elseif eax == IDM_EDIT_FIND
					invoke     SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
      		.if eax
					m2m    hREdit,hEdit
				.if !hFind

				
						invoke GetSelText,offset findbuff
						invoke CreateDialogParam,hInstance,IDD_FINDDLG,hWnd,offset FindDlgProc,FALSE
					
				.else
					invoke SetFocus,hFind
				.endif
			.endif
		.elseif eax == IDM_EDIT_REPLACE
			 invoke     SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
      		 .if eax
					m2m    hREdit,hEdit
				.if !hFind
					
						invoke GetSelText,offset findbuff
						invoke CreateDialogParam,hInstance,IDD_FINDDLG,hWnd,offset FindDlgProc,TRUE
					
				.else
					invoke SetFocus,hFind
				.endif
			 .endif
		.elseif eax==IDM_EDIT_FINDNEXT
				m2m    hREdit,hEdit
				.if !hFind
					invoke GetSelText,offset findbuff
				.endif
					mov		al,findbuff
					.if al
						invoke Find,FR_DOWN
					.endif
				
			.elseif eax==IDM_EDIT_FINDPREV
				m2m    hREdit,hEdit
				.if !hFind
					invoke GetSelText,offset findbuff
				.endif
					mov		al,findbuff
					.if al
						invoke Find,0
					.endif
			.elseif eax==IDM_FORMAT_INDENT
				m2m    hREdit,hEdit
				invoke IndentComment,09h,TRUE
			.elseif eax==IDM_FORMAT_OUTDENT
				m2m    hREdit,hEdit
				invoke IndentComment,09h,FALSE
			.elseif eax==IDM_FORMAT_COMMENT
				m2m    hREdit,hEdit
				invoke IndentComment,';',TRUE
			.elseif eax==IDM_FORMAT_UNCOMMENT
				m2m    hREdit,hEdit
				invoke IndentComment,';',FALSE	
return0:
		.elseif eax == IDM_FILE_OPEN
			invoke     OpenFileA
		.elseif eax == IDM_FILE_SAVE
			invoke      SaveEdit
		.elseif eax == IDM_FILE_SAVEAS   
			invoke     SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
			invoke     SaveAsFile, eax	
		.elseif eax== IDM_FILE_SETUP
			invoke     PageSetUp,hWnd
		.elseif eax == IDM_FILE_PREVIEW
			m2m    hREdit,hWndChild
			invoke     PrintPreview,hWnd,hEdit
		.elseif eax == IDM_FILE_PRINT
			m2m    hREdit,hWndChild
			invoke     PrintEdit,hWnd,hEdit
		.elseif eax == IDM_FORMAT_HEADER
			m2m    hREdit,hWndChild
			invoke DialogBoxParam,hInstance,IDD_PRTHEAD,hWnd,offset HeaderDlgProc,TRUE
			;invoke SetFocus,hEdit
		.elseif eax == IDM_FORMAT_FOOTER
			m2m    hREdit,hWndChild	
			invoke DialogBoxParam,hInstance,IDD_PRTFOOT,hWnd,offset FooterDlgProc,TRUE
 		;combo boxes
      .elseif eax == ID_FONTCOMBO          ; Font Name
      invoke     SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
      .if eax
       		invoke     SendMessage, hEdit, EM_GETCHARFORMAT, TRUE, offset charF
         	invoke     SendMessage, hCFont, CB_GETDROPPEDSTATE, 0, 0
         	.if eax
            invoke     SendMessage, hCFont, CB_GETCURSEL, 0, 0
               inc 	   eax
				.if    eax
			   		dec 	   eax
		            invoke     SendMessage, hCFont, CB_GETLBTEXT, eax, addr szWork ; FontName
		            invoke     lstrcpy, addr charF.szFaceName, addr szWork
		            invoke     lstrcpy, addr lf.lfFaceName, addr szWork
		             or     charF.dwMask, CFM_FACE or CFM_SIZE or CFM_COLOR or CFM_BACKCOLOR or CFM_CHARSET
			         mov     al, lf.lfPitchAndFamily
			         mov     charF.bPitchAndFamily, al
					  invoke 	 GetDC,NULL
						 mov   	 mDC,eax
					  invoke 	 lstrcpy,addr lpLogfont.lfFaceName,addr  szWork
						 mov 	 lpLogfont.lfCharSet, DEFAULT_CHARSET
						 mov     extent,09ch
						 lea     eax,CharsetBuff
						 mov     Head,eax
						 mov     Tail,eax
						 mov     index,0
						 mov	 rval,1
					  invoke 	 EnumFontFamiliesEx, mDC,addr lpLogfont,addr EnumFontFamExProc,0,0;					 
					  invoke 	 ReleaseDC, NULL, mDC
		              invoke 	 lstrcmp,addr CharsetBuff,addr  szSymbol
		              .if eax
		             		mov lf.lfCharSet,DEFAULT_CHARSET
					  .else
		             		mov lf.lfCharSet,SYMBOL_CHARSET
		             		mov     charF.bPitchAndFamily, 0
		              .endif
		              invoke     lstrcpy, offset FontName, offset lf.lfFaceName
		              invoke 	 CreateFontIndirect,addr lf
		      		     mov 	 hFont,eax
		      		     mov     al, lf.lfCharSet
			             mov     charF.bCharSet,al
		      		  invoke     SendMessage,hEdit, EM_SETCHARFORMAT, SCF_SELECTION, offset charF
         		.endif
         		invoke     SetFocus, hEdit
         	.endif
         .endif
       .elseif eax == ID_FONTSIZECOMBO          ; Font Size
       	invoke     SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
	       .if eax
	       		invoke     SendMessage, hEdit, EM_GETCHARFORMAT, TRUE, offset charF
	         	invoke     SendMessage, hCSize, CB_GETDROPPEDSTATE, 0, 0
	         	.if eax
		            invoke     SendMessage, hCSize, CB_GETCURSEL, 0, 0
		            invoke     SendMessage, hCSize, CB_GETLBTEXT, eax, addr szBuff
		               mov     wm1, 0
		            invoke     AsciiBase, addr szBuff, addr wm1, 10  ; PointSize
		               mov     eax, wm1
		              imul     eax, 20
		               mov     charF.yHeight, eax
		            invoke     SendMessage,hEdit, EM_SETCHARFORMAT, TRUE, offset charF
		            invoke     SetFocus, hEdit
	         	.endif
      	   .endif
			  .elseif  eax == IDM_FORMAT_CHOOSECOLOR
					invoke     SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
		       		.if eax
			            m2m    hREdit,hEdit
			            invoke DialogBoxParam,hInstance,IDD_OPTIONDLG,hWnd,addr OptionProc,0
			            invoke     SetFocus, hEdit
					.endif
				.elseif eax ==	IDM_FILE_CLOSE
					  invoke SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
					     mov     hWndChild,eax
				      invoke	 GetWindow, eax, GW_CHILD
				         mov     hEdit,eax
				      .if eax
						      invoke	SendMessage,hWndChild,WM_CLOSE,0,0						      
				     .endif
				invoke  DefFrameProc, hWnd, hWndClient, wMsg, wParam, lParam
		.endif	
	.elseif wMsg == WM_CLOSE
	     @@:
			    invoke	   SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
				.if  eax 
					mov         dirty,0
				    invoke	   SendMessage, eax, WM_CLOSE, 0, 0
			        .if dirty
			             ret
			        .else 
			            jmp @B
			        .endif			        
			    .else
				    invoke	   DefFrameProc, hWnd, hWndClient, wMsg, wParam, lParam
				    ret
			    .endif	
	.elseif wMsg==WM_DESTROY
		invoke	   ImageList_Destroy, hImageList
		invoke PostQuitMessage,NULL
		
	.elseif wMsg == WM_MEASUREITEM
		mov		ebx,lParam
		.if [ebx].MEASUREITEMSTRUCT.CtlType==ODT_MENU
			mov		edx,[ebx].MEASUREITEMSTRUCT.itemData
			.if edx
				push	esi
				mov		esi,edx
				.if ![esi].MENUDATA.tpe
					lea		esi,[esi+sizeof MENUDATA]
					invoke GetDC,NULL
					push	eax
					invoke CreateCompatibleDC,eax
					mov		mDC,eax
					pop		eax
					invoke ReleaseDC,NULL,eax
					invoke SelectObject,mDC,hMnuFont
					push	eax
					mov		rect.left,0
					mov		rect.top,0
					invoke DrawText,mDC,esi,-1,addr rect,DT_CALCRECT or DT_SINGLELINE
					mov		eax,rect.right
					mov		[ebx].MEASUREITEMSTRUCT.itemWidth,eax
					invoke lstrlen,esi
					lea		esi,[esi+eax+1]
					invoke DrawText,mDC,esi,-1,addr rect,DT_CALCRECT or DT_SINGLELINE
					pop		eax
					invoke SelectObject,mDC,eax
					invoke DeleteDC,mDC
					mov		eax,rect.right
					add		eax,25
					add		[ebx].MEASUREITEMSTRUCT.itemWidth,eax
					mov		eax,20
					mov		[ebx].MEASUREITEMSTRUCT.itemHeight,eax
				.else
					mov		eax,10
					mov		[ebx].MEASUREITEMSTRUCT.itemHeight,eax
				.endif
				pop		esi
			.endif
			mov		eax,TRUE
			jmp		ExRet
		.endif	
	.elseif wMsg == WM_DRAWITEM
		mov		ebx,lParam
		.if [ebx].DRAWITEMSTRUCT.CtlType==ODT_MENU
			push	esi
			mov		esi,[ebx].DRAWITEMSTRUCT.itemData
			.if esi
				invoke CreateCompatibleDC,[ebx].DRAWITEMSTRUCT.hdc
				mov		mDC,eax
				mov		rect.left,0
				mov		rect.top,0
				mov		eax,[ebx].DRAWITEMSTRUCT.rcItem.right
				sub		eax,[ebx].DRAWITEMSTRUCT.rcItem.left
				mov		rect.right,eax
				mov		eax,[ebx].DRAWITEMSTRUCT.rcItem.bottom
				sub		eax,[ebx].DRAWITEMSTRUCT.rcItem.top
				mov		rect.bottom,eax
				invoke CreateCompatibleBitmap,[ebx].DRAWITEMSTRUCT.hdc,rect.right,rect.bottom
				invoke SelectObject,mDC,eax
				push	eax
				invoke SelectObject,mDC,hMnuFont
				push	eax
				invoke GetStockObject,WHITE_BRUSH
				invoke FillRect,mDC,addr rect,eax
				invoke FillRect,mDC,addr rect,hMenuBrushB
				.if ![esi].MENUDATA.tpe
					invoke SetBkMode,mDC,TRANSPARENT
					test	[ebx].DRAWITEMSTRUCT.itemState,ODS_SELECTED
					.if !ZERO?
						invoke CreateSolidBrush,0FFDFCFh-030303h
						mov		hBr,eax
						invoke FillRect,mDC,addr rect,hBr
						invoke DeleteObject,hBr
						invoke CreateSolidBrush,800000h
						mov		hBr,eax
						invoke FrameRect,mDC,addr rect,hBr
						invoke DeleteObject,hBr
					.endif
					test	[ebx].DRAWITEMSTRUCT.itemState,ODS_CHECKED
					.if !ZERO?
						; Check mark
						mov		edx,rect.bottom
						sub		edx,16
						shr		edx,1
						invoke ImageList_Draw,hImlTbr,21,mDC,1,edx,ILD_TRANSPARENT						
					.else
						; Image
						mov		eax,[esi].MENUDATA.img
						.if eax
							mov		edx,rect.bottom
							sub		edx,16
							shr		edx,1
							dec		eax
							test	[ebx].DRAWITEMSTRUCT.itemState,ODS_GRAYED
							.if ZERO?
								invoke ImageList_Draw,hImlTbr,eax,mDC,1,edx,ILD_TRANSPARENT
							.else
								invoke ImageList_Draw,hImlTbrGray,eax,mDC,1,edx,ILD_TRANSPARENT
							.endif
						.endif
					.endif
					; Text
					test	[ebx].DRAWITEMSTRUCT.itemState,ODS_GRAYED
					.if ZERO?
						invoke GetSysColor,COLOR_MENUTEXT
					.else
						invoke GetSysColor,COLOR_GRAYTEXT
					.endif
					invoke SetTextColor,mDC,eax
					lea		esi,[esi+sizeof MENUDATA]
					invoke lstrlen,esi
					push	eax
					add		rect.left,22
					add		rect.top,2
					sub		rect.right,2
					invoke DrawText,mDC,esi,-1,addr rect,DT_LEFT or DT_VCENTER
					pop		eax
					lea		esi,[esi+eax+1]
					; Accelerator
					invoke DrawText,mDC,esi,-1,addr rect,DT_RIGHT or DT_VCENTER
					sub		rect.left,22
					sub		rect.top,2
					add		rect.right,2
				.else
					invoke CreatePen,PS_SOLID,1,0FFDFCFh-030303h;0F5BE9Fh
					invoke SelectObject,mDC,eax
					push	eax
					add		rect.left,21
					add		rect.top,5
					invoke MoveToEx,mDC,rect.left,rect.top,NULL
					invoke LineTo,mDC,rect.right,rect.top
					sub		rect.left,21
					sub		rect.top,5
					pop		eax
					invoke SelectObject,mDC,eax
					invoke DeleteObject,eax
				.endif
				mov		eax,[ebx].DRAWITEMSTRUCT.rcItem.right
				sub		eax,[ebx].DRAWITEMSTRUCT.rcItem.left
				mov		edx,[ebx].DRAWITEMSTRUCT.rcItem.bottom
				sub		edx,[ebx].DRAWITEMSTRUCT.rcItem.top
				invoke BitBlt,[ebx].DRAWITEMSTRUCT.hdc,[ebx].DRAWITEMSTRUCT.rcItem.left,[ebx].DRAWITEMSTRUCT.rcItem.top,eax,edx,mDC,0,0,SRCCOPY
				pop		eax
				invoke SelectObject,mDC,eax
				pop		eax
				invoke SelectObject,mDC,eax
				invoke DeleteObject,eax
				invoke DeleteDC,mDC
			.endif
			pop		esi
			mov		eax,TRUE
			jmp		ExRet
		.endif		
	.else
		invoke DefFrameProc, hWnd, hWndClient, wMsg, wParam, lParam		
		ret
	.endif
	invoke ToolBarStatus
	xor eax,eax
ExRet:
	ret
WndProc EndP

SetChildMenu proc			
			invoke LoadMenu,hInstance,IDR_CHILDMENU
			push eax
			invoke SetMenu,hWndClient,eax			
			invoke DestroyMenu,hChildMenu			
			pop eax						
			mov		hChildMenu,eax
			invoke GetSubMenu,hChildMenu,3
			invoke SendMessage,hWndClient,WM_MDISETMENU,hChildMenu,eax	
			.if tbView
				invoke CheckMenuItem,hChildMenu,IDM_VIEW_TOOLBAR,MF_CHECKED	
			.else
				invoke CheckMenuItem,hChildMenu,IDM_VIEW_TOOLBAR,MF_UNCHECKED	
			.endif
			.if sbView
				invoke CheckMenuItem,hChildMenu,IDM_VIEW_STATUS,MF_CHECKED
			.else
				invoke CheckMenuItem,hChildMenu,IDM_VIEW_STATUS,MF_UNCHECKED					
			.endif
			ret
SetChildMenu endp
SetMainMenu proc
			invoke LoadMenu,hInstance,IDR_MAINMENU
			push	eax
			invoke SetMenu,hWndMain,eax
			invoke DestroyMenu,hMainMenu
			pop		eax
			mov		hMainMenu,eax
			.if tbView
				invoke CheckMenuItem,hMainMenu,IDM_VIEW_TOOLBAR,MF_CHECKED	
			.else
				invoke CheckMenuItem,hMainMenu,IDM_VIEW_TOOLBAR,MF_UNCHECKED	
			.endif
			.if sbView
				invoke CheckMenuItem,hMainMenu,IDM_VIEW_STATUS,MF_CHECKED
			.else
				invoke CheckMenuItem,hMainMenu,IDM_VIEW_STATUS,MF_UNCHECKED					
			.endif
			invoke EnableWindow,hCFont,FALSE
    		invoke EnableWindow,hCSize,FALSE
			ret
SetMainMenu endp
SetActiveButtos proc hEdit:DWORD

	invoke SendMessage,hEdit,EM_GETPARAFORMAT,0,offset pf
	     .if    pf.wAlignment == PFA_LEFT           
                invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_LEFT, TRUE
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_RIGHT, FALSE
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_CENTER, FALSE

        .elseif eax == IDM_FORMAT_CENTER
                .elseif     pf.wAlignment== PFA_CENTER
                invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_LEFT, FALSE
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_RIGHT, FALSE
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_CENTER, TRUE
         .else 
                invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_LEFT, FALSE
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_RIGHT, TRUE
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_CENTER, FALSE
		.endif
	    invoke  SendMessage, hEdit, EM_GETCHARFORMAT, TRUE, offset charF
                mov     eax, charF.dwEffects
                push    eax
				and eax,CFM_BOLD
				.if eax == CFE_BOLD
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_BOLD, TRUE
				.else
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_BOLD, FALSE
				.endif
				pop eax
				push eax
				and eax,CFM_UNDERLINE
				.if eax == CFE_UNDERLINE
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_UNDERLINE, TRUE
				.else
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_UNDERLINE, FALSE
				.endif
				pop eax
				and eax,CFM_ITALIC
				.if eax == CFE_ITALIC
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_ITALIC, TRUE
				.else
				invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_ITALIC, FALSE
				.endif

	ret
SetActiveButtos endp

ChildProc Proc hChild:DWORD,wMsg:DWORD,wParam:DWORD,lParam:DWORD
local   rect		:RECT
local   hEdit		:DWORD

		  invoke     GetWindow, hChild, GW_CHILD
            mov     hEdit, eax
	.if wMsg==WM_MDIACTIVATE 
		.if closed <2
			mov eax,lParam
			.if eax==hChild
				invoke SetChildMenu
			.else
				invoke SetMainMenu
				invoke CheckMenuItem,hMainMenu,IDM_VIEW_TOOLBAR,MF_CHECKED	
				invoke CheckMenuItem,hMainMenu,IDM_VIEW_STATUS,MF_CHECKED
			.endIf
				invoke	ToolBarStatus
				invoke CoolMenu
				invoke  DrawMenuBar,hWndMain
			.endif 
				invoke SetActiveButtos,hEdit
				invoke PrintStatusItems,hEdit
				invoke GetWindowLong,hEdit,GWL_USERDATA	
			.if	eax
				invoke     BaseAscii, bytesread, offset Fsize, 8, 10, 1, 0, 1
      			invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_THRE, offset fsmsg
      			invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_FOUR, offset szSucks
      			
      		.else
      			invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_THRE, offset szNoIdea
      			invoke     SendMessage, hStatus, SB_SETTEXT, SBR_PART_FOUR, offset szNotSaved
			.endif	
			jmp DefMDI		
	.elseif wMsg==WM_SIZE
         invoke     GetClientRect, hChild, addr rect
         invoke     MoveWindow, hEdit, rect.left, rect.top, rect.right, rect.bottom, TRUE
         jmp DefMDI
    .elseif wMsg==WM_ERASEBKGND    			
	.elseif wMsg==WM_CLOSE
				invoke	   SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
				.if  eax == 0
					jmp    DefMDI
				.else
				    invoke     DoYouWantToSave
				
					.if	eax							
					       invoke	   SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
					       invoke	   GetWindow, eax, GW_CHILD
					       mov         hEdit,eax
					       invoke      SetFocus, hEdit
					       mov         dirty,1
					.else
					invoke GetMenuState ,hChildMenu, SC_MAXIMIZE, MF_BYCOMMAND					
							.if eax == -1
			               			mov closed,0
			               		.else
			               			mov closed,1
			               		.endif
			               invoke      SendMessage,hWndClient,WM_MDIDESTROY,hChild,0
			               invoke	ToolBarStatus
			               invoke	   SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
			               .if eax
					           invoke	   GetWindow, eax, GW_CHILD
					           mov         hEdit,eax
					           invoke      SetFocus, hEdit					           
							   invoke DefMDIChildProc, hChild, wMsg, wParam, lParam 
						   .endif
			        .endif
                .endif
 	.else 
DefMDI:	
		invoke DefMDIChildProc, hChild, wMsg, wParam, lParam    
		ret
	.endif
	xor eax,eax
	ret
ChildProc EndP
	
OpenCommandLine proc uses ebx,lpCmnd:DWORD

	mov		ebx,lpCmnd
	.while byte ptr [ebx]
		.while byte ptr [ebx]==' '
			inc		ebx
		.endw
		lea		edx,offset PathName
		.if byte ptr [ebx]=='"'
			inc		ebx
			.while byte ptr [ebx]!='"' && byte ptr [ebx]
				mov		al,[ebx]
				mov		[edx],al
				inc		ebx
				inc		edx
			.endw
			inc		ebx
		.else
			.while byte ptr [ebx]!=' ' && byte ptr [ebx]
				mov		al,[ebx]
				mov		[edx],al
				inc		ebx
				inc		edx
			.endw
		.endif
		mov		byte ptr [edx],0
		.if PathName
			invoke LoadFile,offset PathName
		.endif
	.endw
	ret
OpenCommandLine endp
WordWrap PROC
local hEdit:DWORD
local hWndChild:DWORD
local rect:RECT
local buffer[256]	:BYTE
local chrg			:CHARRANGE

	    invoke	    SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
		   mov		hWndChild, eax
		invoke	    GetWindow, eax, GW_CHILD
		   mov	   	hEdit,eax
	    invoke      SendMessage, hEdit, EM_GETMODIFY, 0, 0
		.if eax
			call SaveEdit
		.endif
		invoke 		GetWindowTextLength,hWndChild
		   inc 		eax
		invoke  	GetWindowText, hWndChild,addr buffer,eax
	  	invoke		SendMessage,hWndChild,WM_CLOSE,0,0
	    invoke     CheckMenuItem, hChildMenu, IDM_FORMAT_WWRAP, MF_BYCOMMAND
	  	.if eax == MF_CHECKED
	  		   and     WWrap, 0
	    .else
	        	or     WWrap, 1
	    .endif      		
	    invoke  	LoadFile,addr buffer 
	  	invoke 		SendMessage,hEdit,EM_EXSETSEL,0,addr chrg
	  	invoke		SetFocus, hEdit
	   	   add		chcount,2 
	  	invoke 		DwToAscii, chcount, offset ascii
	  	   dec		chcount
	    invoke 		lstrcpy,offset tmpbuff,addr szChildTitle
	    invoke 		lstrcat,offset tmpbuff,addr ascii
	  	   mov 		mdiCreate.szTitle, offset tmpbuff
	  		    invoke     CheckMenuItem, hChildMenu, IDM_FORMAT_WWRAP, MF_BYCOMMAND
	  	.if eax == MF_CHECKED
	  		invoke     CheckMenuItem, hChildMenu, IDM_FORMAT_WWRAP, MF_UNCHECKED
	    .else
			invoke     CheckMenuItem, hChildMenu, IDM_FORMAT_WWRAP, MF_CHECKED
	    .endif      		
	   	   ret
WordWrap endp
NonWrapedWindow proc hWndc:DWORD
      		
	invoke SendMessage,hWndClient,WM_MDIMAXIMIZE,hWndc,0
	invoke     CreateWindowEx, WS_EX_CLIENTEDGE, addr RichEdit, 0,\
               WS_CHILD  or WS_VISIBLE or WS_BORDER or WS_HSCROLL or WS_VSCROLL or\
               ES_MULTILINE or ES_NOHIDESEL, CW_USEDEFAULT, CW_USEDEFAULT,\
               200, 100, hWndc, EditID, hInstance, NULL
	ret
NonWrapedWindow endp
WrapedWindow proc hWndc:DWORD
            
	invoke SendMessage,hWndClient,WM_MDIMAXIMIZE,hWndc,0
	invoke     CreateWindowEx, WS_EX_CLIENTEDGE, addr RichEdit, 0,\
               WS_CHILD  or WS_VISIBLE or WS_BORDER or WS_VSCROLL or\
               ES_MULTILINE or ES_NOHIDESEL, CW_USEDEFAULT, CW_USEDEFAULT,\
               200, 100, hWndc, EditID, hInstance, NULL
	ret
WrapedWindow endp


End Start