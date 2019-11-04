 
.code





;-------------------------------------------------------------------


PrintPreviewProc  	PROTO :DWORD,:DWORD,:DWORD,:DWORD
PaintView     		PROTO :DWORD
ViewProc            PROTO :DWORD,:DWORD,:DWORD,:DWORD
GetMsgProc          PROTO :DWORD, :WPARAM, :LPARAM
DrawPaper           PROTO :HDC,:DWORD,:DWORD,:DWORD
px                  PROTO :DWORD,:DWORD
py                  PROTO :DWORD,:DWORD
screen_to_dpi       PROTO :DWORD
SetPaper            PROTO
SetDefaultPSD       PROTO
SetZoom             PROTO :DWORD
DoPreviewToolBar    PROTO :DWORD
DlgProc_ToPage      PROTO :HWND, :UINT, :WPARAM, :LPARAM
GetPageInfo   		PROTO :HWND
DrawPaperFrame      PROTO :HDC,:DWORD,:DWORD,:DWORD
DrawPaperShade      PROTO :HDC,:DWORD
DrawBorderProc   	PROTO :HMENU,:HDC,:DWORD
ZoomProc			PROTO :DWORD

                 
nCurrentPageMin     SDWORD       ?                    
nCurrentPageMax     SDWORD       ? 


      return MACRO arg
        mov eax, arg
        ret
      ENDM

$invoke MACRO Fun:REQ, A:VARARG
  IFB <A>
    invoke Fun
  else
    invoke Fun, A
  endif
  exitm <eax>
        ENDM

LOWORD MACRO bigword     
   mov  eax,bigword
   and  eax,0FFFFh     ;; Set to low word 
ENDM


HIWORD macro bigword    
   mov  eax,bigword
   shr  eax,16         ;; Get high word
endm

IF_MSG macro WMsg:REQ, DoJmp:REQ
   cmp uMsg, WMsg
   jz  DoJmp
endm

WM_CASE macro reg,msgs
   irp msg,<msgs>
      cmp reg,WM_&msg
      je @@&msg
   endm
endm

.data
szPreViewClass      db          "PreViewClass32",0
szClassView         db          "View32",0
szToolBarClass      db          "ToolbarWindow32",0
szPreViewName       db          "Print Preview",0
szCZoom				db          '10%,25%,50%,65%,75%,100%,150%,200%,400%,500%,',0
szPPercent			db           '65%',0
szZoom              db          "Zoom",0
DocName             db          "Print document",0 
szPrepare           db          "Document prepare", 0
szNoPrinter         db          "No printer",0
szNoPreView         db          "Print Preview failed",0
szError             db          "Error!",0
szErrPageNumber     db          "You entered invalid number of the page",0
szErrTickNumber     db          "This is a current page",0

m_Paper             SIZEL      <?>                
m_MinMargin         RECT       <?>                
m_Margin            RECT       <?>                
pDevNames           dd          ?
pDevMode            dd          ?
hRichEdit           HWND        ?
PageRect            RECT       <?>
PageWidth           dd          ?
PageHeight          dd          ?
nCountPage          DWORD       ?                   
nCurrentPage        DWORD       ?                    
fSelOnly            db          ?
pChar               DWORD       ?                    
fPrnPageNumbers     db          TRUE 







NameFile            db          "save.emf",0
szNameFontNP        db          "Courier New",0
nzoom               dd          ?
m_nZoom             dd          100                  ; 100 for 1:1
m_nScale            dd          96                   ; GetDeviceCaps(hDC, LOGPIXELSX) * zoom / 100
m_nSurfaceWidth     dd          320                  ; total surface width  in pixel
m_nSurfaceHeight    dd          240                  ; total surface height in pixel
lf_mnu_brd          LOGFONTA    <22, 0, 900, 900, 600, 0, 0, 0, ANSI_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, FF_MODERN, "Courier New">
cRed                dd          128 
cGreen              dd          128 
cBlue               dd          128 

.data?
hWinMain             HWND        ?
hInst           HINSTANCE   	 ?
hPWnd                HWND        ?
hHook               HHOOK        ?
h_Accel            HACCEL        ?
hPStatus             HWND        ?
hPToolBar            HWND        ?
hPWndView            HWND        ?
hMenu               HMENU        ?
hSysMenu            HMENU        ?
hCZoom			dd  ?

; SCROLL

nHorizDiff          dd          ?
nVertDiff           dd          ?


chrng                CHARRANGE  <?>

.const
IDC_CBO        		equ			1204
IDD_PREVIEW         equ         302
IDD_FORMVIEW        equ         102
IDD_TOPAGE          equ         103
IDC_SBR1            equ         1100
IDC_TBR1            equ         1180
IDC_ED_TOPAGE       equ         1185

IDM_PAGE_SETUP      equ         1002
IDM_PRINT           equ         1004
IDM_EXIT            equ         1006

IDM_FIRSTPAGE       equ         1012
IDM_PREVIOUSPAGE    equ         1014
IDM_TOPAGE          equ         1015
IDM_NEXTPAGE        equ         1016
IDM_LASTPAGE        equ         1018
IDM_ZOOM            equ         1020
IDM_VIEW_ZOOM10     equ         1100    ; zoom
IDM_VIEW_ZOOM25     equ         1102
IDM_VIEW_ZOOM50     equ         1106
IDM_VIEW_ZOOM65     equ         1107
IDM_VIEW_ZOOM75     equ         1108
IDM_VIEW_ZOOM100    equ         1110
IDM_VIEW_ZOOM150    equ         1112
IDM_VIEW_ZOOM200    equ         1114
IDM_VIEW_ZOOM400    equ         1116
IDM_VIEW_ZOOM500    equ         1118
IDM_SELECTONLY      equ         1022

IDM_PAGE_NUMBER     equ         1032


ACC                 equ         110

BASE_DPI            equ         1440
MARGIN_X            equ         16
MARGIN_Y            equ         16


; ######################## TOOLBAR ########################
;IDB_BITMAP1         equ         101
PreViewToolBar      equ         1700
IDC_TBB             equ         350
IDT_ZOOM_IN         equ         1200
IDT_ZOOM_OUT        equ         1201
tbrbtns             TBBUTTON <0,IDM_PRINT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
                    TBBUTTON <1,IDM_PAGE_SETUP,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
                    TBBUTTON <0,0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>
                    TBBUTTON <10,IDM_SELECTONLY,TBSTATE_INDETERMINATE,TBSTYLE_BUTTON,0,0>
                    TBBUTTON <0,0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>
                    TBBUTTON <3,IDM_FIRSTPAGE,TBSTATE_INDETERMINATE,TBSTYLE_BUTTON,0,0>
                    TBBUTTON <4,IDM_PREVIOUSPAGE,TBSTATE_INDETERMINATE,TBSTYLE_BUTTON,0,0>
                    TBBUTTON <6,IDM_TOPAGE,TBSTATE_INDETERMINATE,TBSTYLE_BUTTON,0,0>
                    TBBUTTON <5,IDM_NEXTPAGE,TBSTATE_INDETERMINATE,TBSTYLE_BUTTON,0,0>
                    TBBUTTON <7,IDM_LASTPAGE,TBSTATE_INDETERMINATE,TBSTYLE_BUTTON,0,0>
                    TBBUTTON <0,0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>
                    TBBUTTON <8,IDT_ZOOM_IN,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
                    TBBUTTON <9,IDT_ZOOM_OUT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
                    TBBUTTON <0,0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>
                    TBBUTTON <2,IDM_EXIT,TBSTATE_ENABLED,TBSTYLE_BUTTON,0,0>
                    TBBUTTON <0,0,TBSTATE_ENABLED,TBSTYLE_SEP,0,0>

.code



                

        


 ; --------------------------------------
 ; Create main window for preview
 ; --------------------------------------


PrintPreview proc hWin :HWND, hEdit :DWORD

    call CreatePrinterDC
    .if eax == 0
    
        invoke MessageBox, hWin, addr szNoPrinter, addr szNoPreView, MB_OK or MB_ICONSTOP
           
    .else
    
        mov h_Accel, $invoke (LoadAccelerators, hInst, ACC)
    
        m2m hRichEdit, hEdit
        m2m hWinMain, hWin
        invoke DialogBoxParamA,hInst,IDD_PREVIEW,hWin,addr PrintPreviewProc, NULL
    
        invoke DestroyAcceleratorTable, h_Accel 
        
    .endif

    ret 
PrintPreview endp


PrintPreviewProc proc hWin :DWORD, uMsg :DWORD, wParam :DWORD, lParam :DWORD

    local hDC :HDC
    local Rct :RECT
    local Ps  :PAINTSTRUCT
    local sbh :DWORD
    local buff[32]:BYTE
    local buffer1[128]:BYTE
    local var :DWORD
    local charrange :CHARRANGE
    local mii :MENUITEMINFO
;    local nzoom:DWORD

    WM_CASE uMsg, <INITDIALOG, COMMAND, SIZE, CLOSE, SYSCOMMAND,NOTIFY>
     
@@end:    
    xor eax, eax 
    ret     
 
@@NOTIFY:
		
		mov		edx,lParam
		mov		eax,[edx].NMHDR.code		
		.if eax==TTN_NEEDTEXT
			;Toolbar tooltip
			mov		edx,(NMHDR ptr [edx]).idFrom
			invoke LoadString,hInstance,edx,addr buffer1,sizeof buffer1
			lea		eax,buffer1
			mov		edx,lParam
			mov		(TOOLTIPTEXT ptr [edx]).lpszText,eax
		.endif
jmp @@end
     
@@INITDIALOG:  
        
      
        call GetCurrentThreadId
        invoke SetWindowsHookEx, WH_GETMESSAGE, addr GetMsgProc, NULL, eax 
        mov hHook, eax
        
        m2m hPWnd, hWin        
       
        invoke  GetClassLong, hWinMain, GCL_HICON 
        invoke SendMessage,hWin,WM_SETICON,1,eax 
        
        invoke GetDlgItem, hWin, IDC_SBR1 
        mov hPStatus,eax 

        mov [sbParts +  0], 160
        mov [sbParts +  4], 320
        mov [sbParts +  8], -1

        invoke SendMessage,hPStatus,SB_SETPARTS, 3,addr sbParts
        ;Create ToolBar
        invoke DoPreviewToolBar,hWin
        
        
		invoke CreateDialogParam,hInst,IDD_FORMVIEW,hWin,addr ViewProc, NULL
        mov hPWndView,eax 

        invoke ShowWindow, hWin, SW_MAXIMIZE        

        call SetPaper
        
        mov  nzoom,3
        invoke SetZoom, 65
        
        
        
        
        invoke SendMessage, hRichEdit, EM_EXGETSEL, NULL, addr charrange 
        mov eax, charrange.cpMin

        
        .if ( !charrange.cpMax )  || ( charrange.cpMax == eax )                      
         mov fSelOnly, FALSE
         invoke SendMessage, hPToolBar, TB_CHECKBUTTON, IDM_SELECTONLY, FALSE
        .else                          
         mov fSelOnly, TRUE
         invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_SELECTONLY, TBSTATE_ENABLED
         invoke SendMessage, hPToolBar, TB_CHECKBUTTON, IDM_SELECTONLY, TRUE                 
        .endif
        


        invoke GetDC, hWin
        mov hDC, eax
        invoke SetBkMode, hDC, TRANSPARENT
        invoke GetClientRect, hWin, addr Rct
 
        invoke szLen, addr szPrepare
        mov var, eax
        invoke GetStockObject, SYSTEM_FONT
        invoke SelectObject, hDC, eax
        push eax
        invoke DrawText, hDC, addr szPrepare, var, addr Rct, DT_CENTER or DT_VCENTER or DT_SINGLELINE
        push hDC
        call SelectObject
        invoke ReleaseDC, hWin, hDC

        
        invoke GetPageInfo, hRichEdit
        
        .if nCountPage > 1
        
              mov nCurrentPage, 1              
              
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_NEXTPAGE, TBSTATE_ENABLED
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_LASTPAGE, TBSTATE_ENABLED
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_TOPAGE, TBSTATE_ENABLED
                                      
        .else 
              mov nCurrentPage, 1              
        .endif 
        invoke wsprintf,addr buff,SADD(" Page %i/%i"), nCurrentPage, nCountPage
        invoke SendMessage, hPStatus, SB_SETTEXT, 0, addr buff
        invoke wsprintf,addr buff,SADD(" Zoom: %i%%"), m_nZoom
        invoke SendMessage, hPStatus, SB_SETTEXT, 1, addr buff
        
        jmp @@end
          
@@COMMAND:
        mov eax,wParam
        
        .if ax == IDM_PAGE_SETUP

             invoke PageSetUp, hWin        
             call SetPaper
             
            
             invoke GetPageInfo, hRichEdit

           
            mov edx, nCountPage     
            
            .if nCurrentPage > edx
               m2m nCurrentPage, nCountPage
               
            .elseif nCurrentPage < edx 
               invoke SendMessage, hPToolBar, TB_ISBUTTONENABLED, IDM_LASTPAGE, 0
               .if !eax
                invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_NEXTPAGE, TBSTATE_ENABLED   ; ToolBar
                invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_LASTPAGE, TBSTATE_ENABLED
               .endif
                
            .endif          
        
            invoke wsprintf,addr buff,SADD(" Page %i/%i"), nCurrentPage, nCountPage
            invoke SendMessage, hPStatus, SB_SETTEXT, 0, addr buff
             
             
            call CalculateSize
            call SetSize
            
            invoke GetClientRect, hWin, addr Rct 
            invoke InvalidateRect, hPWndView, addr Rct, FALSE
        
        .elseif ax == IDM_PRINT

            invoke PrintEdit, hWin, hRichEdit        
        
        .elseif ax == IDM_PAGE_NUMBER       
        
                
                invoke GetPageInfo, hRichEdit
                
                mov edx, nCountPage     
                
                .if nCurrentPage > edx
                   m2m nCurrentPage, nCountPage
                   
                .elseif nCurrentPage < edx 
                   invoke SendMessage, hPToolBar, TB_ISBUTTONENABLED, IDM_LASTPAGE, 0
                   .if !eax
                    invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_NEXTPAGE, TBSTATE_ENABLED   ; ToolBar
                    invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_LASTPAGE, TBSTATE_ENABLED
                   .endif
                    
                .endif              
                
                invoke wsprintf,addr buff,SADD(" Page %i/%i"), nCurrentPage, nCountPage
                invoke SendMessage, hPStatus, SB_SETTEXT, 0, addr buff
                invoke InvalidateRect, hPWndView, NULL, FALSE
        
                .elseif ax == 83          ; Zoom in
				     invoke     SendMessage, hCZoom, CB_GETDROPPEDSTATE, 0, 0
			         .if eax
				            invoke     SendMessage, hCZoom, CB_GETCURSEL, 0, 0
				            mov edx,eax
				            invoke     SendMessage, hCZoom, CB_GETLBTEXT, edx, addr buff
				               mov     buff[eax-1],0
				               mov     m_nZoom, 0
				               mov     nzoom, 0
				            invoke     AsciiBase, addr buff, addr nzoom, 10 
				            mov       eax,nzoom 
				            .if eax == 500
						             invoke SendMessage, hPToolBar, TB_SETSTATE, IDT_ZOOM_OUT, TBSTATE_ENABLED       
						             invoke SendMessage, hPToolBar, TB_SETSTATE, IDT_ZOOM_IN, TBSTATE_INDETERMINATE  
							.elseif eax == 10
						             invoke SendMessage, hPToolBar, TB_SETSTATE, IDT_ZOOM_IN, TBSTATE_ENABLED        
						             invoke SendMessage, hPToolBar, TB_SETSTATE, IDT_ZOOM_OUT, TBSTATE_INDETERMINATE
						    .else    
						             invoke SendMessage, hPToolBar, TB_SETSTATE, IDT_ZOOM_OUT, TBSTATE_ENABLED
						             invoke SendMessage, hPToolBar, TB_SETSTATE, IDT_ZOOM_IN, TBSTATE_ENABLED                          
							.endif
             				invoke SetZoom,nzoom
				            invoke ZoomProc,hWin 
			        .endif

       
        .elseif ax == IDM_SELECTONLY
        

             invoke GetPageInfo, hRichEdit
             mov nCurrentPage, 1     
             
             .if nCountPage > 1
              
      
              ; ToolBar button State

              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_FIRSTPAGE, TBSTATE_INDETERMINATE   
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_PREVIOUSPAGE, TBSTATE_INDETERMINATE
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_NEXTPAGE, TBSTATE_ENABLED
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_LASTPAGE, TBSTATE_ENABLED
              
             .else     

      
              ; ToolBar button State

              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_FIRSTPAGE, TBSTATE_INDETERMINATE   
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_PREVIOUSPAGE, TBSTATE_INDETERMINATE
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_NEXTPAGE, TBSTATE_INDETERMINATE
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_LASTPAGE, TBSTATE_INDETERMINATE

                            
             .endif             
             
             invoke wsprintf,addr buff,SADD(" Page %i/%i"), nCurrentPage, nCountPage
             invoke SendMessage, hPStatus, SB_SETTEXT, 0, addr buff
             
             invoke InvalidateRect, hPWndView, NULL, FALSE
       
        .elseif ax == IDM_EXIT       

             invoke SendMessage,hWin,WM_SYSCOMMAND,SC_CLOSE,NULL            
            
              
        ;.endif
        
        .elseif ax == IDM_FIRSTPAGE
        
        
              mov nCurrentPage, 1
      
              ; ToolBar button State

              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_FIRSTPAGE, TBSTATE_INDETERMINATE   
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_PREVIOUSPAGE, TBSTATE_INDETERMINATE
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_NEXTPAGE, TBSTATE_ENABLED
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_LASTPAGE, TBSTATE_ENABLED            
              
              
              mov buff, 0
              invoke SendMessage, hPStatus, SB_SETTEXT, 0, addr buff           
              invoke wsprintf,addr buff,SADD(" Page %i/%i"), nCurrentPage, nCountPage
              invoke SendMessage, hPStatus, SB_SETTEXT, 0, addr buff
              
              invoke InvalidateRect, hWin, NULL, FALSE  
   
        .elseif ax == IDM_PREVIOUSPAGE
        
              dec nCurrentPage
              .if nCurrentPage == 1
                 invoke SendMessage, hWin, WM_COMMAND, IDM_FIRSTPAGE, NULL               
              .else
                 invoke InvalidateRect, hWin, NULL, FALSE              
              .endif
              
               ; ToolBar button State
              
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_NEXTPAGE, TBSTATE_ENABLED
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_LASTPAGE, TBSTATE_ENABLED                        

              
              mov buff, 0
              invoke SendMessage, hPStatus, SB_SETTEXT, 0, addr buff           
              invoke wsprintf,addr buff,SADD(" Page %i/%i"), nCurrentPage, nCountPage
              invoke SendMessage, hPStatus, SB_SETTEXT, 0, addr buff
        
        .elseif ax == IDM_NEXTPAGE
              inc nCurrentPage
              mov edx, nCountPage 
              .if nCurrentPage == edx
                 invoke SendMessage, hWin, WM_COMMAND, IDM_LASTPAGE, NULL
              .else
                 invoke InvalidateRect, hWin, NULL, FALSE   
              .endif
              
              
              ; ToolBar button State
              
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_FIRSTPAGE, TBSTATE_ENABLED 
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_PREVIOUSPAGE, TBSTATE_ENABLED
              
              
              mov buff, 0
              invoke SendMessage, hPStatus, SB_SETTEXT, 0, addr buff           
              invoke wsprintf,addr buff,SADD(" Page %i/%i"), nCurrentPage, nCountPage
              invoke SendMessage, hPStatus, SB_SETTEXT, 0, addr buff
        
        .elseif ax == IDM_LASTPAGE

              m2m nCurrentPage, nCountPage
              
              
              ; ToolBar button State
              
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_FIRSTPAGE, TBSTATE_ENABLED 
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_PREVIOUSPAGE, TBSTATE_ENABLED
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_NEXTPAGE, TBSTATE_INDETERMINATE
              invoke SendMessage, hPToolBar, TB_SETSTATE, IDM_LASTPAGE, TBSTATE_INDETERMINATE
                                                
              
              mov buff, 0
              invoke SendMessage, hPStatus, SB_SETTEXT, 0, addr buff           
              invoke wsprintf,addr buff,SADD(" Page %i/%i"), nCurrentPage, nCountPage
              invoke SendMessage, hPStatus, SB_SETTEXT, 0, addr buff
              
              invoke InvalidateRect, hWin, NULL, FALSE  
              
        .elseif ax == IDM_TOPAGE        ; to page ¹ ->
        
            xor eax, eax
            mov ax, IDD_TOPAGE
        
            invoke DialogBoxParam, hInst, eax, hWin, addr DlgProc_ToPage, 0
                 
        ;.endif
        
        .elseif ax == IDT_ZOOM_IN
          invoke SendMessage, hPToolBar, TB_SETSTATE, IDT_ZOOM_OUT, TBSTATE_ENABLED
          invoke SendMessage, hPToolBar, TB_SETSTATE, IDT_ZOOM_IN, TBSTATE_ENABLED                          
          .if m_nZoom == 10
				mov	nzoom,1
				invoke SetZoom,25
	            invoke ZoomProc,hWin 
          .elseif m_nZoom == 25
 				mov	nzoom,2
 				invoke SetZoom,50
	            invoke ZoomProc,hWin                   
          .elseif m_nZoom == 50
                 mov	nzoom,3 
                 invoke SetZoom,65  
	            invoke ZoomProc,hWin          
          .elseif m_nZoom == 65
				mov	nzoom,4 
				invoke SetZoom,75
	            invoke ZoomProc,hWin          
	      .elseif m_nZoom == 75
	      		mov	nzoom,5 
				invoke SetZoom,100
	            invoke ZoomProc,hWin	            
	      .elseif m_nZoom == 100
	      		mov	nzoom,6
				invoke SetZoom,150				
	            invoke ZoomProc,hWin 
          .elseif m_nZoom == 150         
				mov	nzoom,7
				invoke SetZoom,200
	            invoke ZoomProc,hWin          
          .elseif m_nZoom == 200
				mov	nzoom,8
				invoke SetZoom,400
	            invoke ZoomProc,hWin          
          .elseif m_nZoom == 400
				mov	nzoom,9
				invoke SetZoom,500
	            invoke ZoomProc,hWin          
	            invoke SendMessage, hPToolBar, TB_SETSTATE, IDT_ZOOM_OUT, TBSTATE_ENABLED       
	            invoke SendMessage, hPToolBar, TB_SETSTATE, IDT_ZOOM_IN, TBSTATE_INDETERMINATE  
          .endif  

        .elseif ax == IDT_ZOOM_OUT   
           invoke SendMessage, hPToolBar, TB_SETSTATE, IDT_ZOOM_OUT, TBSTATE_ENABLED
          invoke SendMessage, hPToolBar, TB_SETSTATE, IDT_ZOOM_IN, TBSTATE_ENABLED                                 
          .if m_nZoom == 25         
				invoke SetZoom,10
				mov	nzoom,0
	            invoke ZoomProc,hWin
           		invoke SendMessage, hPToolBar, TB_SETSTATE, IDT_ZOOM_IN, TBSTATE_ENABLED        
		        invoke SendMessage, hPToolBar, TB_SETSTATE, IDT_ZOOM_OUT, TBSTATE_INDETERMINATE
          .elseif m_nZoom == 50
          		mov	nzoom,1
				invoke SetZoom,25				
	            invoke ZoomProc,hWin 
            .elseif m_nZoom == 65
            	mov	nzoom,2
				invoke SetZoom,50
	            invoke ZoomProc,hWin          
          .elseif m_nZoom == 75
          		mov	nzoom,3
				invoke SetZoom,65
	            invoke ZoomProc,hWin
          .elseif m_nZoom == 100
          		mov	nzoom,4
				invoke SetZoom,75
	            invoke ZoomProc,hWin
          .elseif m_nZoom == 150
          		mov	nzoom,5
				invoke SetZoom,100
	            invoke ZoomProc,hWin
          .elseif m_nZoom == 200
          		mov	nzoom,6
				invoke SetZoom,150
	            invoke ZoomProc,hWin
          .elseif m_nZoom == 400
          		mov	nzoom,7
				invoke SetZoom,200
	            invoke ZoomProc,hWin
          .elseif m_nZoom == 500
          		mov	nzoom,8
				invoke SetZoom,400
	            invoke ZoomProc,hWin
          .endif   

        .endif
        jmp @@end
        
@@SYSCOMMAND:

        mov eax, wParam    
        
        jmp @@end        
        
@@SIZE:
        invoke SendMessage,hPToolBar,TB_AUTOSIZE,0,0
        invoke MoveWindow, hPStatus, 0, 0, 0, 0, TRUE        
        invoke GetClientRect,hPStatus,addr Rct
        m2m sbh, Rct.bottom         
        invoke GetClientRect,hPToolBar,addr Rct
        m2m var, Rct.bottom         ; TOOLBARA
      ; --------------------------------------------------------------------
      ; Use a valid handle in the following MoveWindow() call and uncomment
      ; --------------------------------------------------------------------
        invoke GetClientRect, hWin, addr Rct
        mov eax, Rct.bottom 
        sub eax, sbh            
        sub eax, var
        mov edx, Rct.top
        add edx, var
        invoke MoveWindow,hPWndView,Rct.left,edx,Rct.right,eax,TRUE  
        jmp @@end
        
@@CLOSE:

        invoke UnhookWindowsHookEx, hHook 

        invoke ImageList_Destroy, hImageList


        mov fSelOnly, TRUE

        invoke EndDialog, hWin, 0

        jmp @@end
    
PrintPreviewProc endp


GetMsgProc proc uses ebx nCode :DWORD, wParam :WPARAM, lParam :LPARAM

mov ebx, lParam
assume ebx: ptr MSG

    .if [ebx].message >= WM_KEYFIRST && [ebx].message <= WM_KEYLAST
    
        invoke TranslateAccelerator, hPWnd, h_Accel, lParam
        
        .if eax
            mov [ebx].message, WM_NULL
        .endif  
    .endif

assume ebx: nothing

    
    invoke CallNextHookEx, hHook, nCode, wParam, lParam 
    xor eax, eax
    ret
GetMsgProc endp

HeaderTime   PROC
local	temp	:DWORD

	 invoke		 GetLocalTime,offset time
        xor      eax,eax
        mov      ax,time.wDay
        mov      temp,eax
     invoke      BaseAscii, temp, offset dda, 2, 10, 0, 1, 0
        xor      eax,eax
        mov      ax,time.wMonth
        mov      temp,eax
     invoke      BaseAscii, temp, offset dmo, 2, 10, 0, 1, 0
        xor      eax,eax
        mov      ax,time.wYear
        mov      temp,eax
     invoke      BaseAscii, temp, offset dyr, 2, 10, 0, 1, 0
     .if  time.wHour >= 12
     	mov      byte ptr[tmsgampm],'P'   
     .endif
     .if  time.wHour > 12   
        sub      time.wHour, 12                     
	 .else
	 	mov      byte ptr[tmsgampm],'A' 
     .endif
		xor      eax,eax
		mov      ax,time.wHour
        mov      temp,eax
     invoke      BaseAscii, temp, offset tmsghour, 2, 10, 0, 1, 0
       	xor      eax,eax
       	mov      ax,time.wMinute
        mov      temp,eax
     invoke      BaseAscii, temp, offset tmsgmin, 2, 10, 0, 1, 0
        xor      eax,eax
        mov      ax,time.wSecond
        mov      temp,eax
     invoke      BaseAscii, temp, offset tmsgsec, 2, 10, 0, 1, 0
	  	ret
HeaderTime   ENDP

ViewProc proc uses ebx hWin :DWORD, uMsg :DWORD, wParam :DWORD, lParam :DWORD

   local hDC :HDC
   local Rct :RECT
   local NewPos :SDWORD         ; new position
   local ScrollPix :SDWORD
   local v_dy   :SDWORD
   local h_dx   :SDWORD
   
   local hRgn :HRGN

    WM_CASE uMsg, <INITDIALOG, PAINT, SIZE, HSCROLL, VSCROLL>

@@end:
    
    xor eax, eax 
    ret
    
@@INITDIALOG:

        call CalculateSize
        call SetSize
        jmp  @@end

@@PAINT:

        invoke PaintView,hWin
        jmp  @@end
        
@@SIZE:   
        call CalculateSize
        call SetSize
        invoke GetClientRect, hWin, addr Rct
        invoke InvalidateRect, hWin, addr Rct, FALSE
        
        jmp  @@end

        
@@HSCROLL:   

    invoke GetScrollPos, hWin, SB_HORZ
    mov ebx, eax

    LOWORD wParam

    .if eax == SB_LINERIGHT               ; User clicked the right arrow. 
            
            invoke IntDiv, m_nSurfaceWidth, 100    
            .if eax < 1                   
              inc eax
            .endif
          m2m NewPos, ebx
          add NewPos, eax

    .elseif eax == SB_LINELEFT            ; User clicked the left arrow.
    
           invoke IntDiv, m_nSurfaceWidth, 100     
            .if eax < 1                   
              inc eax
            .endif
          m2m NewPos, ebx
          sub NewPos, eax
          
    .elseif eax == SB_PAGELEFT            ; User clicked the shaft left of the scroll box.  

          invoke IntDiv, m_nSurfaceWidth, 10       
            .if eax < 1                   
              inc eax
            .endif
          m2m NewPos, ebx
          sub NewPos, eax

    .elseif eax == SB_PAGERIGHT           ; User clicked the shaft right of the scroll box.  

          invoke IntDiv, m_nSurfaceWidth, 10       
            .if eax < 1                   
              inc eax
            .endif
          m2m NewPos, ebx
          add NewPos, eax

    .elseif ( eax == SB_THUMBTRACK ) || ( eax == SB_THUMBPOSITION ) ; User dragged the scroll box.

        HIWORD wParam
        mov NewPos, eax 

    .else                                 ; default  
    
        m2m NewPos, ebx
     
    .endif

    .if NewPos < 0                        ; New position must be between 0 and the screen width.
        mov NewPos, 0     
    .endif

     mov eax, nHorizDiff
    .if NewPos > eax
        mov NewPos, eax
    .endif

     invoke SetScrollPos,hWin, SB_HORZ, NewPos, TRUE ; Reset the scroll bar.

     m2m eax, NewPos                      ; Determine the amount scrolled (in pixels).
     sub eax, ebx
     neg eax
     mov h_dx, eax
     
     invoke ScrollWindowEx, hWin, h_dx, 0, NULL, NULL, NULL, NULL, SW_INVALIDATE

     return TRUE      
        
@@VSCROLL:

    invoke GetScrollPos, hWin, SB_VERT
    mov ebx, eax

    LOWORD wParam

    .if eax == SB_LINEDOWN                ; User clicked the right arrow.  
            
            invoke IntDiv, m_nSurfaceHeight, 100   
            .if eax < 1                   
              inc eax
            .endif
          m2m NewPos, ebx
          add NewPos, eax

    .elseif eax == SB_LINEUP              ; User clicked the left arrow.  
    
           invoke IntDiv, m_nSurfaceHeight, 100    
            .if eax < 1                   
              inc eax
            .endif
          m2m NewPos, ebx   
          sub NewPos, eax
          
    .elseif eax == SB_PAGEUP              ; User clicked the shaft left of the scroll box.   

          invoke IntDiv, m_nSurfaceHeight, 10      
            .if eax < 1                   
              inc eax 
            .endif
          m2m NewPos, ebx   
          sub NewPos, eax

    .elseif eax == SB_PAGEDOWN            ; User clicked the shaft right of the scroll box.  

          invoke IntDiv, m_nSurfaceHeight, 10      
            .if eax < 1                   
              inc eax
            .endif
          m2m NewPos, ebx   
          add NewPos, eax

    .elseif ( eax == SB_THUMBTRACK ) ;|| ( eax == SB_THUMBPOSITION ) ; User dragged the scroll box.

        HIWORD wParam
        mov NewPos, eax
     
    .else                                 ; default  
    
        m2m NewPos, ebx

    .endif

    .if NewPos < 0                        ; New position must be between 0 and the screen width.  
        mov NewPos, 0    
    .endif

    mov eax, nVertDiff
    .if NewPos > eax
        mov NewPos, eax
    .endif

     invoke SetScrollPos,hWin, SB_VERT, NewPos, TRUE  ; Reset the scroll bar.

     m2m eax, NewPos                      ; Determine the amount scrolled (in pixels). 
     sub eax, ebx 
     neg eax
     mov v_dy, eax
     invoke ScrollWindowEx, hWin, 0, v_dy, NULL, NULL, NULL, NULL, SW_INVALIDATE

     return TRUE
    
ViewProc endp


 ;========================================================================
 ;   WM_PAINT 

 ; =======================================================================


PaintView proc hWin:DWORD
    local hDC   :HDC
    local Ps    :PAINTSTRUCT
    local Rct   :RECT
    local rect  :RECT
    local tect  :RECT
    local frr    :FORMATRANGE
    local hMetaDC:HDC
    local hMetaFile:HENHMETAFILE
    local widthmm   :DWORD
    local heightmm  :DWORD
    local widthpixel:DWORD
    local heightpixel:DWORD
    local m_nZoomOld :DWORD
    local ViewOrgOld :POINT
    LOCAl HorizScrollPos :SDWORD
    LOCAl VertScrollPos :SDWORD
    local buff[256]:BYTE  ; these are two spare buffers
    local hFooterDefFont:HFONT
    local hHeaderDefFont:HFONT
    local hFontOld:HFONT
    local lff    :LOGFONT
    local yNP       :DWORD
    local xCNP       :DWORD  
    local xRNP		:DWORD
    local xLNP      :DWORD
    local xAlign    :DWORD
    local hChild:DWORD
    local buffer[256]:BYTE
    local tl      :DWORD
    local deffont :DWORD
    local OldAlign  	 :DWORD


    invoke BeginPaint,hWin,addr Ps
    mov hDC,eax       
    invoke GetClientRect, hWin, addr Rct
    invoke GetStockObject, GRAY_BRUSH	
    invoke SelectObject, hDC, eax   
    invoke PatBlt, hDC, 0, 0, Rct.right, Rct.bottom, PATCOPY    

    invoke GetClientRect, hWin, addr Rct
    invoke GetStockObject, GRAY_BRUSH 
    invoke FillRect, hDC, addr Ps.rcPaint, eax

    invoke SetWindowOrgEx, hDC, 0, 0, NULL
    invoke GetScrollPos, hWin, SB_HORZ
    mov HorizScrollPos,eax 
    invoke GetScrollPos, hWin, SB_VERT 
    mov VertScrollPos,eax 
    neg HorizScrollPos
    neg VertScrollPos
    invoke SetViewportOrgEx, hDC, HorizScrollPos, VertScrollPos, addr ViewOrgOld
    
    invoke DrawPaper, hDC, addr Ps.rcPaint, 0, 0 
    
    invoke SetViewportOrgEx, hDC, ViewOrgOld.x, ViewOrgOld.y, NULL



    m2m m_nZoomOld, m_nZoom
    invoke SetZoom, 100
    
    invoke px, m_Margin.left, 0
    mov tect.left,eax 
    invoke py, m_Margin.top, 0
    mov tect.top,eax 
    
    mov eax, m_Paper.x
    sub eax, m_Margin.right
    invoke px, eax, 0
    mov tect.right,eax 
        
    mov eax, m_Paper.y
    sub eax, m_Margin.bottom
    invoke py, eax, 0
    mov tect.bottom,eax 
    invoke SetZoom, m_nZoomOld     
    
     
    m2m rect.left, 0
    m2m rect.top, 0
    
    mov eax, tect.right
    sub eax, tect.left
    mov rect.right, eax
    mov xRNP,eax
    invoke IntDiv, eax, 2
    mov xCNP, eax
    
    mov eax, tect.bottom
    sub eax, tect.top
    mov rect.bottom, eax
    
    mov yNP, eax                    
	add yNP,40
	add xCNP,40
	add xRNP,40
	invoke GetDeviceCaps, hDC, HORZSIZE 
    mov widthmm,eax
    invoke GetDeviceCaps, hDC, VERTSIZE   
    mov heightmm,eax 
    invoke GetDeviceCaps, hDC, HORZRES
    mov widthpixel,eax
    invoke GetDeviceCaps, hDC, VERTRES  
    mov heightpixel,eax    
    invoke LPtoDP, hDC, addr rect, 2    
    invoke IntMul, rect.right, widthmm
    invoke IntMul, eax, 120
    mov edx, eax 
    invoke IntDiv, widthpixel, 2        
    add eax, edx
    invoke IntDiv, eax, widthpixel
    mov rect.right, eax
    invoke IntMul, rect.bottom, heightmm
    invoke IntMul, eax, 107
    mov edx, eax 
    invoke IntDiv, heightpixel, 2        
    add eax, edx
    invoke IntDiv, eax, heightpixel
    mov rect.bottom, eax
  
    invoke CreateEnhMetaFile, hDC, NULL, addr rect, NULL
    mov hMetaDC,eax  
    
    ; -----------------------------------------------------------------------   
    
    m2m frr.hdc, hMetaDC           
    m2m frr.hdcTarget, hMetaDC     
    
    .if pChar
    
        mov eax, pChar
        mov edx, nCurrentPage
        dec edx
        m2m frr.chrg.cpMin, [eax][edx*4]
        
        inc edx
        m2m frr.chrg.cpMax, [eax][edx*4]
            
    .else
        mov frr.chrg.cpMin, 0
        mov frr.chrg.cpMax, 0
    .endif
    

             mov eax, m_Margin.left
             mov frr.rc.left,eax
             mov eax, m_Margin.top
             mov frr.rc.top, eax
             mov eax, m_Paper.x
             sub eax, m_Margin.right
             mov frr.rc.right, eax       
             mov eax, m_Paper.y
             sub eax, m_Margin.bottom
             mov frr.rc.bottom, eax
			
			mov deffont,FALSE
		.if PrtHead || PrtFoot
			
			.if !footfont || !headfont
				;default font
				
	 	        invoke GetDeviceCaps, hDC, LOGPIXELSY
		        invoke MulDiv, 10,eax,72 
		        neg eax     
		        mov lff.lfHeight, eax
		        mov lff.lfWidth, 0
		        mov lff.lfEscapement, 0
		        mov lff.lfOrientation,0
		        mov lff.lfWeight, FW_NORMAL
		        mov lff.lfItalic, FALSE
		        mov lff.lfUnderline, FALSE
		        mov lff.lfStrikeOut, FALSE
		        mov lff.lfCharSet, ANSI_CHARSET
		        mov lff.lfOutPrecision, OUT_DEFAULT_PRECIS
		        mov lff.lfClipPrecision, CLIP_DEFAULT_PRECIS
		        mov lff.lfQuality, DEFAULT_QUALITY
		        mov lff.lfPitchAndFamily, FF_MODERN
		        invoke lstrcpy, addr lff.lfFaceName, addr szNameFontNP
		        invoke CreateFontIndirect, addr lff
		        mov hFooterDefFont,eax
		        mov hHeaderDefFont,eax
		        mov deffont,TRUE
		     .endif
	 			mov hFontOld, 0
	 			mov OldAlign,0 
		    .if PrtFoot
		    	mov eax,footfont           
		        .if !eax
		        	mov eax,hFooterDefFont
		        .endif
				invoke SelectObject, hMetaDC, eax
		        mov hFontOld, eax
		        mov eax,FootPage         				
				.if FootPage
					invoke wsprintf,addr buff,SADD("Page %i"), nCurrentPage
				.elseif FootText
					invoke DwToAscii,nCurrentPage,addr ascii
					invoke lstrcpy,addr buff,addr szPrtFootBuff
					invoke lstrlen,	addr buff
					lea eax,buff[eax]
					mov word ptr[eax],20h
					invoke lstrcat,addr buff,addr ascii
				.else
		        	invoke wsprintf,addr buff,SADD("%i"), nCurrentPage
		        .endif
		        .if FootLeft
		        	mov eax,TA_LEFT
		        	mov xAlign,36
		        .elseif FootCenter
		        	m2m xAlign,xCNP
		        	mov eax,TA_CENTER
		        .else 
		        	m2m xAlign,xRNP
		        	mov eax,TA_RIGHT
		        .endif
		        or eax,TA_BOTTOM       				        			        
		        invoke SetTextAlign, hMetaDC, eax
		        mov OldAlign,eax
		        invoke SetTextColor, hMetaDC, footcolor
		        .if FootTime
					call HeaderTime
					invoke lstrcat,addr buff,offset dmsg
		        .endif
		        invoke lstrlen, addr buff
		        mov  tl,eax
		        add  yNP,56
		        invoke TextOut, hMetaDC, xAlign, yNP, addr buff,tl 
		    .endif       
			.if PrtHead				
		    	mov eax,headfont           
		        .if !eax
		        	mov eax,hHeaderDefFont
		        .endif 
		        invoke SelectObject, hMetaDC, eax
		        .if !hFontOld
		        	mov hFontOld, eax  
		        .endif
		        .if PrtLeft
		        	mov eax,TA_LEFT
		        	mov xAlign,36
		        .elseif PrtCenter
		        	m2m xAlign,xCNP
		        	mov eax,TA_CENTER
		        .else 
		        	m2m xAlign,xRNP
		        	mov eax,TA_RIGHT
		        .endif
		        or eax,TA_TOP       				        			        
		        invoke SetTextAlign, hMetaDC,eax 
		        .if !OldAlign
		        	mov OldAlign,eax
		        .endif
		        invoke SetTextColor, hMetaDC, headcolor
				.if PrtName
					invoke     SendMessage, hREdit , WM_GETTEXTLENGTH, 0, 0
					mov      tl, eax
					inc      tl
					invoke     GetWindowText,hREdit,addr szPrtHeadBuff,tl				
				.endif
					.if PrtPath
						invoke     SendMessage, hREdit , WM_GETTEXTLENGTH, 0, 0
						mov      tl, eax
						inc      tl
						invoke     GetWindowText,hREdit,addr szPrtHeadBuff,tl
					.endif
		        .if PrtTime
					call HeaderTime
					invoke lstrcat,offset szPrtHeadBuff,offset dmsg
				.endif	
		        invoke lstrlen,offset szPrtHeadBuff
		        mov tl,eax
		        invoke TextOut, hMetaDC, xAlign, 20, addr szPrtHeadBuff,tl
			.endif
		        invoke SelectObject, hMetaDC, hFontOld
		 		.if deffont
		        	invoke DeleteObject, hFooterDefFont
		        .endif        
		        invoke GetDeviceCaps, hDC, LOGPIXELSY
		        invoke MulDiv, 200,eax, 72
		        add frr.rc.bottom, eax
		        add frr.rc.top,eax
    .endif    
    invoke CopyRect, addr frr.rcPage, addr frr.rc     
    invoke SetTextAlign, hMetaDC,OldAlign
    invoke SendMessage, hRichEdit, EM_FORMATRANGE, TRUE, addr frr
        
    invoke SendMessage, hRichEdit, EM_FORMATRANGE, FALSE, NULL

    ; -----------------------------------------------------------------------
    invoke CloseEnhMetaFile, hMetaDC 
    mov hMetaFile,eax 

    invoke SetViewportOrgEx, hDC, HorizScrollPos, VertScrollPos, addr ViewOrgOld

    m2m Rct.left, PageRect.left
    m2m Rct.top, PageRect.top
    m2m Rct.right, PageRect.right
    m2m Rct.bottom, PageRect.bottom 
    invoke PlayEnhMetaFile, hDC, hMetaFile, addr Rct    
    invoke CopyEnhMetaFile, hMetaFile, addr NameFile
    invoke DeleteEnhMetaFile, hMetaFile

    invoke EndPaint,hWin,addr Ps

    ret
PaintView endp

DrawPaper proc uses ebx hDC :HDC, rcPaint :DWORD, column :DWORD, row :DWORD 
    
    local RctPaperFrame :RECT
    local RctMinMargin  :RECT
    local RctMargin     :RECT
    
    local RctBkgndPage  :RECT
    
;   // paper frame
             invoke GetWindowRect,hPWnd ,addr RctBkgndPage
			invoke px, 20, column
             mov 	RctPaperFrame.left, eax 
             mov  	ecx,RctBkgndPage.right
             invoke py,700, row
             mov 	RctPaperFrame.top, eax 
             invoke px, m_Paper.x, column
             mov 	RctPaperFrame.right, eax
             invoke py, m_Paper.y, row 
             mov 	RctPaperFrame.bottom, eax 
             mov  	ecx,RctBkgndPage.right
             mov  	edx,RctPaperFrame.right
             mov 	eax,RctPaperFrame.left
             sub  	edx,eax
             sub  	ecx,edx
             .if ecx > 0FFFFFFFh
	           	mov ecx,30  
             .endif
             shr ecx,1
			 add RctPaperFrame.left,ecx
			 add RctPaperFrame.right,ecx           
;   // margin
			invoke px, m_Margin.left, column
	         mov 	RctMargin.left, eax 
	         invoke py, m_Margin.top, row
	         mov 	RctMargin.top, eax 
	         
	         mov 	eax, m_Paper.x
	         sub 	eax, m_Margin.right
	         invoke px, eax, column
	         mov 	RctMargin.right, eax 
	        
	         mov 	eax, m_Paper.y
	         sub 	eax, m_Margin.bottom
	         invoke py, eax, row
	         mov 	RctMargin.bottom, eax 
	         mov  	ecx,RctPaperFrame.left
	         add  	ecx,3
	         mov  	edx,RctPaperFrame.right
	         sub  	edx,3
	         mov 	RctMargin.left,ecx
             mov 	RctMargin.right,edx
             mov 	RctMinMargin.left,ecx
             mov 	RctMinMargin.right,edx
             mov  	ecx,RctPaperFrame.bottom
             sub  	ecx,3
             mov  	edx,RctPaperFrame.top
             add  	edx,3
             mov 	RctMinMargin.bottom,ecx
             mov 	RctMinMargin.top,edx

          invoke 	DrawPaperFrame, hDC, addr RctPaperFrame, addr RctMinMargin, addr RctMargin
             m2m 	PageRect.left, RctMargin.left
             m2m 	PageRect.top, RctMargin.top
             m2m 	PageRect.right, RctMargin.right
             m2m 	PageRect.bottom, RctMargin.bottom
             ret
DrawPaper endp

;========================================================================

DrawPaperFrame proc hDC :HDC, lpPaperFrame :DWORD, lpMinMargin :DWORD, lpRctMargin :DWORD 

    local hRgnPaperFrame :HRGN
    local hRgnMinMargin  :HRGN
    local hRgnMargin     :HRGN    
    local hRgnTemp       :HRGN    
    local hBrushPaperFrame:HBRUSH
    local hBrushMinMargin:HBRUSH

    mov	eax,0ffa525h
    invoke CreateSolidBrush, eax
    mov hBrushPaperFrame, eax       ; paper frame
    
    
    mov	eax,0FFFFFFh;0fdedddh
    invoke CreateSolidBrush, eax
    mov hBrushMinMargin, eax        ; minimum margin : printable margin 
    
    invoke InflateRect, lpPaperFrame, 1, 1   
    invoke InflateRect, lpMinMargin, 1, 1
    invoke InflateRect, lpRctMargin, 1, 1
    invoke CreateRectRgnIndirect, lpPaperFrame
    mov hRgnPaperFrame, eax 
    invoke CreateRectRgnIndirect, lpMinMargin 
    mov hRgnMinMargin, eax
    invoke CreateRectRgnIndirect, lpRctMargin 
    mov hRgnMargin, eax
    invoke CreateRectRgn, 0, 0, 1, 1 
    mov hRgnTemp, eax 
    invoke GetStockObject,WHITE_BRUSH
    invoke FillRgn, hDC, hRgnMargin, eax 
    invoke CombineRgn, hRgnTemp,hRgnMinMargin , hRgnMargin, RGN_DIFF;hRgnMinMargin
    invoke FillRgn, hDC, hRgnTemp,hBrushMinMargin ;hBrushMinMargin
    invoke CombineRgn, hRgnTemp, hRgnPaperFrame, hRgnMinMargin, RGN_DIFF;hRgnMinMargin
    invoke FillRgn, hDC, hRgnTemp, hBrushPaperFrame
    invoke GetStockObject, BLACK_BRUSH
    invoke FrameRect, hDC, lpPaperFrame, eax 
    
    invoke InflateRect, lpPaperFrame, -1, -1 ; "original" - DrawPaperFrame
    invoke InflateRect, lpMinMargin, -1, -1
    invoke InflateRect, lpRctMargin, -1, -1
    
    invoke DrawPaperShade, hDC, lpPaperFrame    
    
    invoke DeleteObject, hBrushPaperFrame
    invoke DeleteObject, hBrushMinMargin
    
    invoke DeleteObject, hRgnTemp
    invoke DeleteObject, hRgnPaperFrame
    invoke DeleteObject, hRgnMinMargin
    invoke DeleteObject, hRgnMargin
    
    ret
DrawPaperFrame endp

DrawPaperShade proc uses edx ebx  hDC :HDC, lpPaperFrame :DWORD

    local rectr :RECT
    local rectb :RECT
    local hBlackBrush :HBRUSH

            invoke GetStockObject, BLACK_BRUSH
            mov hBlackBrush, eax

assume ebx: ptr RECT
mov ebx, lpPaperFrame 

        ; RECT rectr = { x1+1, y0+1, x1+3, y1+3 } 
            mov edx, [ebx].right
            inc edx
            mov rectr.left, edx
            mov eax, [ebx].top
            inc eax 
            mov rectr.top, eax            
            add edx, 2
            mov rectr.right, edx
            mov eax, [ebx].bottom
            add eax, 3
            mov rectr.bottom, eax
            
            invoke FillRect, hDC, addr rectr, hBlackBrush
 
        ; RECT rectb = { x0+1, y1+1, x1+3, y1+3 } 
            mov eax, [ebx].left
            inc eax
            mov rectb.left, eax
            mov edx, [ebx].bottom
            inc edx
            mov rectb.top, edx
            mov eax, [ebx].right
            add eax, 3
            mov rectb.right, eax
            add edx, 2
            mov rectb.bottom, edx                        
        	
            invoke FillRect, hDC, addr rectb, hBlackBrush

assume ebx: nothing

    ret
DrawPaperShade endp 


;========================================================================
; from base_dpi to screen
; -----------------------------------------------------------------------
; ( x + m_Paper.cx * column ) * m_nScale / BASE_DPI + MARGIN_X * (column+1)
;========================================================================

px proc x :DWORD, column :DWORD            
 
            invoke IntMul, m_Paper.x, column
            add eax, x
            invoke IntMul, eax, m_nScale
            invoke IntDiv, eax, BASE_DPI
            mov edx, eax

            mov eax, column
            inc eax
            invoke IntMul, eax, MARGIN_X
            
            add eax, edx 

    ret
px endp

;========================================================================
; from base_dpi to screen
; -----------------------------------------------------------------------
; ( y + m_Paper.cy * rows ) * m_nScale / BASE_DPI + MARGIN_Y * (rows+1)
;========================================================================

py proc y :DWORD, row :DWORD            
            
            invoke IntMul, m_Paper.y, row
            add eax, y
            invoke IntMul, eax, m_nScale
            invoke IntDiv, eax, BASE_DPI
            mov edx, eax
            
            mov eax, row
            inc eax
            invoke IntMul, eax, MARGIN_Y

            add eax, edx
            
    ret
py endp

;========================================================================
; from screen  to base_dpi
;========================================================================

screen_to_dpi proc xy :DWORD
 
            invoke IntMul, xy, BASE_DPI
            invoke IntDiv, eax, m_nScale

    ret
screen_to_dpi endp

;========================================================================
; convert from 1/1000 inch to BASE_DPI
;========================================================================

SetPaper proc

    local paper :POINT 
    local margin :RECT  
    local minmargin :RECT

    m2m paper.x, m_psd.ptPaperSize.x    
    m2m paper.y, m_psd.ptPaperSize.y       

    invoke CopyRect,addr margin,addr m_psd.rtMargin
    invoke CopyRect,addr minmargin,addr m_psd.rtMinMargin

    mov eax, paper.x
    invoke IntMul, eax, BASE_DPI   
    invoke IntDiv, eax, 1000
    mov m_Paper.x, eax
    
    mov eax, paper.y
    invoke IntMul, eax, BASE_DPI   
    invoke IntDiv, eax, 1000    
    mov m_Paper.y, eax
    
    mov eax, margin.left
    invoke IntMul, eax, BASE_DPI   
    invoke IntDiv, eax, 1000    
    mov m_Margin.left, eax
 
    mov eax, margin.right
    invoke IntMul, eax, BASE_DPI   
    invoke IntDiv, eax, 1000    
    mov m_Margin.right, eax
    
    mov eax, margin.top
    invoke IntMul, eax, BASE_DPI   
    invoke IntDiv, eax, 1000    
    mov m_Margin.top, eax
 
    mov eax, margin.bottom
    invoke IntMul, eax, BASE_DPI   
    invoke IntDiv, eax, 1000    
    mov m_Margin.bottom, eax
    
    mov eax, minmargin.left
    invoke IntMul, eax, BASE_DPI   
    invoke IntDiv, eax, 1000    
    mov m_MinMargin.left, eax
 
    mov eax, minmargin.right
    invoke IntMul, eax, BASE_DPI   
    invoke IntDiv, eax, 1000    
    mov m_MinMargin.right, eax
    
    mov eax, minmargin.top
    invoke IntMul, eax, BASE_DPI   
    invoke IntDiv, eax, 1000    
    mov m_MinMargin.top, eax
 
    mov eax, minmargin.bottom
    invoke IntMul, eax, BASE_DPI   
    invoke IntDiv, eax, 1000    
    mov m_MinMargin.bottom, eax        

    ret
SetPaper endp

SetDefaultPSD proc

    local dpix :DWORD
    local dpiy :DWORD
    local hDC  :HDC
    local var  :DWORD 

        mov m_pd.lStructSize, sizeof m_pd
        m2m m_pd.hInstance, hInst
        mov m_pd.Flags, PD_RETURNDEFAULT
        invoke PrintDlg, offset m_pd

        call CreatePrinterDC
        mov hDC, eax

        mov m_psd.rtMargin.left, 750;1000       
        mov m_psd.rtMargin.right, 750;1000      
        mov m_psd.rtMargin.top, 600         
        mov m_psd.rtMargin.bottom, 450      
    	invoke GetDeviceCaps, hDC, LOGPIXELSX
        mov dpix, eax
        invoke GetDeviceCaps, hDC, LOGPIXELSY 
        mov dpiy, eax 
        
        invoke GetDeviceCaps, hDC, PHYSICALWIDTH
        invoke IntMul, eax, 1000
        invoke IntDiv, eax, dpix   
        mov m_psd.ptPaperSize.x, eax
        
        invoke GetDeviceCaps, hDC, PHYSICALHEIGHT
        invoke IntMul, eax, 1000       
        invoke IntDiv, eax, dpiy   
        mov m_psd.ptPaperSize.y, eax
        
        invoke GetDeviceCaps, hDC, PHYSICALOFFSETX
        invoke IntMul, eax, 1000
        invoke IntDiv, eax, dpix   
        mov m_psd.rtMinMargin.left, eax
    
        invoke GetDeviceCaps, hDC, PHYSICALOFFSETY
        invoke IntMul, eax, 1000
        invoke IntDiv, eax, dpiy   
        mov m_psd.rtMinMargin.top, eax
        
        invoke GetDeviceCaps, hDC, HORZRES
        invoke IntMul, eax, 1000
        invoke IntDiv, eax, dpix    

        m2m var, m_psd.ptPaperSize.x    ; m_psd.rtMinMargin.right = ebx - edx - eax
        mov edx, m_psd.rtMinMargin.left
        
        sub var, edx
        sub var, eax
        m2m m_psd.rtMinMargin.right, var
        
        
        invoke GetDeviceCaps, hDC, VERTRES
        invoke IntMul, eax, 1000
        invoke IntDiv, eax, dpiy    

        m2m var, m_psd.ptPaperSize.y    ; m_psd.rtMinMargin.bottom = ebx - edx - eax
        mov edx, m_psd.rtMinMargin.top
        
        sub var, edx
        sub var, eax   
        
        m2m m_psd.rtMinMargin.bottom, var
        
        invoke DeleteDC, hDC                 

    ret
SetDefaultPSD endp

CreatePrinterDC proc
		invoke GlobalLock, m_pd.hDevMode
        mov pDevMode, eax
        invoke GlobalLock, m_pd.hDevNames 
        mov pDevNames, eax 

        mov edx, pDevMode
        invoke CreateDC, NULL,addr [edx].DEVMODE.dmDeviceName, NULL, pDevMode        

    ret
CreatePrinterDC endp

SetZoom proc zoom :DWORD

local hDC :HDC

    mov eax, zoom

        .if eax == m_nZoom 
          return FALSE
        .else
        
          m2m m_nZoom, zoom
          invoke GetDC, NULL
          mov hDC, eax 
          
          invoke GetDeviceCaps, eax, LOGPIXELSX      
          invoke IntMul, eax, zoom 
          invoke IntDiv, eax, 100
          mov m_nScale, eax
          invoke ReleaseDC, NULL, hDC
          invoke     SendMessage, hCZoom,CB_SETCURSEL, nzoom, 0
        .endif

    ret
SetZoom endp

SetSize proc

    local rect  :RECT
    local lpSi  :SCROLLINFO
    local tmp   :BYTE

@@:
    
        invoke GetClientRect,hPWndView,addr rect


;--------------------------------
        mov eax, m_nSurfaceWidth
        sub eax, rect.right
        mov nHorizDiff, eax
;--------------------------------
        mov eax, m_nSurfaceWidth
    .if rect.right < eax    

        mov lpSi.cbSize, sizeof(SCROLLINFO)
        mov lpSi.fMask, SIF_RANGE or SIF_PAGE
        m2m lpSi.nMin, 0    
        dec eax
        mov lpSi.nMax, eax  
        m2m lpSi.nPage, rect.right

        invoke SetScrollInfo, hPWndView, SB_HORZ, addr lpSi, TRUE

    .else           
        invoke SetScrollRange, hPWndView, SB_HORZ, 0, 0, TRUE
    .endif



        invoke GetClientRect,hPWndView,addr rect  
    
;--------------------------------
        mov eax, m_nSurfaceHeight
        sub eax, rect.bottom
        mov nVertDiff, eax
;--------------------------------
            mov eax, m_nSurfaceHeight
        .if rect.bottom < eax
        
            mov lpSi.cbSize, sizeof(SCROLLINFO)
            mov lpSi.fMask, SIF_RANGE or SIF_PAGE
            m2m lpSi.nMin, 0            
            dec eax                               
            mov lpSi.nMax, eax          
            m2m lpSi.nPage, rect.bottom 
        
            invoke SetScrollInfo, hPWndView, SB_VERT, addr lpSi, TRUE
        
        .else
        
            invoke SetScrollRange, hPWndView, SB_VERT, 0, 0, TRUE        
            
        .endif
        
        cmp tmp, 1
        je e_t        
        mov tmp, 1
        jmp @b
        
e_t:

    ret
SetSize endp

CalculateSize  proc

           invoke px, m_Paper.x, 0
           add eax, MARGIN_X
           mov m_nSurfaceWidth, eax
           
           invoke px, m_Paper.y, 0
           add eax, MARGIN_Y
           mov m_nSurfaceHeight, eax

    ret
CalculateSize endp
ZoomProc proc hWin:DWORD
local buff 	[256]:BYTE
local rect		 :RECT
             call CalculateSize
             call SetSize         
             invoke GetClientRect, hWin, addr rect
             invoke InvalidateRect, hWin, addr rect, FALSE
              
             mov buff, 0
             invoke SendMessage, hPStatus, SB_SETTEXT, 1, addr buff
             invoke wsprintf,addr buff,SADD(" Zoom: %i%%"), m_nZoom
             invoke SendMessage, hPStatus, SB_SETTEXT, 1, addr buff
	ret
ZoomProc endp

DoPreviewToolBar proc hWin:DWORD
    local   tbab:TBADDBITMAP
    
	invoke CreateToolbarEx, hWin, WS_CHILD OR WS_CLIPCHILDREN OR WS_CLIPSIBLINGS OR\
		 TBSTYLE_TOOLTIPS OR CCS_TOP, IDC_TBR1, 1, hInstance, IDB_BITMAP1, \
		 addr tbrbtns, 16, 16, 16, 16, 16, SizeOf TBBUTTON
	mov [hPToolBar],eax
	invoke SendMessage, [hPToolBar],TB_SETSTYLE, 0,TBSTYLE_FLAT OR TBSTYLE_TOOLTIPS OR CCS_TOP 
	invoke ImageList_LoadImage,hInstance,IDB_BITMAP1,16,10,00FF00FFh,IMAGE_BITMAP, LR_CREATEDIBSECTION
	mov		hImageList,eax
	invoke SendMessage,[hPToolBar],TB_SETIMAGELIST,0,hImageList	
	invoke ShowWindow,[hPToolBar],SW_SHOW 
	;create combo zoom    
      invoke     CreateWindowEx, 0, offset combobox, 0,
                 WS_VSCROLL or WS_VISIBLE or WS_CHILD or CBS_HASSTRINGS or\
                 CBS_DROPDOWNLIST, 300,0,60,210, [hPToolBar], 83, hInstance, 0
         mov     hCZoom, eax
      invoke     LoadLista, hCZoom, offset szCZoom, 4444
      invoke     SendMessage, hCZoom,CB_SETCURSEL, 3, 0

     ;create tooltip for combo zoom    
    invoke SetWndToolTip,hCZoom,0,offset szZoom       
    
    ret

DoPreviewToolBar endp

DlgProc_ToPage proc hDlg :DWORD, uMsg :DWORD, wParam :DWORD, lParam :DWORD

    local bTranslated   :BYTE
    local buff[32]:BYTE

    WM_CASE uMsg, <INITDIALOG,CLOSE,COMMAND>
     
@@end:    
    xor eax, eax 
    ret     
     
@@INITDIALOG:

        invoke GetDlgItem,hDlg, IDC_ED_TOPAGE
        invoke SetFocus, eax

        return TRUE

@@COMMAND:

        .if wParam == IDOK

               invoke GetDlgItemInt, hDlg, IDC_ED_TOPAGE,addr bTranslated, FALSE
               .if bTranslated
                    .if (eax <= nCountPage) && (eax != nCurrentPage) && eax
                        
                        .if eax != 1 && eax != nCountPage   
                        
                            mov nCurrentPage, eax
                        
                            
                            ; ToolBar button State
                            
                            invoke SendMessage, [hPToolBar], TB_SETSTATE, IDM_FIRSTPAGE, TBSTATE_ENABLED   
                            invoke SendMessage, [hPToolBar], TB_SETSTATE, IDM_PREVIOUSPAGE, TBSTATE_ENABLED
                            invoke SendMessage, [hPToolBar], TB_SETSTATE, IDM_NEXTPAGE, TBSTATE_ENABLED
                            invoke SendMessage, [hPToolBar], TB_SETSTATE, IDM_LASTPAGE, TBSTATE_ENABLED
                        
                            mov buff, 0
                            invoke SendMessage, hPStatus, SB_SETTEXT, 0, addr buff           
                            invoke wsprintf,addr buff,SADD(" Page %i/%i"), nCurrentPage, nCountPage
                            invoke SendMessage, hPStatus, SB_SETTEXT, 0, addr buff
                            
                            invoke InvalidateRect, hPWndView, NULL, FALSE  
                        
                        .elseif eax == 1        
                        
                            xor eax, eax
                            mov ax, IDM_FIRSTPAGE
                            invoke SendMessage, hPWnd, WM_COMMAND, eax, 0                            
                            
                        .elseif eax == nCountPage   
                        
                            xor eax, eax
                            mov ax, IDM_LASTPAGE
                            invoke SendMessage, hPWnd, WM_COMMAND, eax, 0
                        
                        .endif
                                           
                    .elseif eax == nCurrentPage     
                    
                        invoke MessageBox, hDlg, addr szErrTickNumber, addr szError, MB_OK
                        jmp @@end 
                    
                    .else                           
                    
                        invoke MessageBox, hDlg, addr szErrPageNumber, addr szError, MB_OK
                        jmp @@end                    
                    .endif
               
               .endif

               jmp  @@CLOSE
        .elseif  wParam == IDCANCEL
               jmp  @@CLOSE
        .endif


        jmp @@end        

@@CLOSE:

        invoke EndDialog, hDlg, 0
        jmp @@end
    
DlgProc_ToPage endp



PageSetUp  proc hWin :HWND

             m2m m_psd.lStructSize, sizeof (PAGESETUPDLG)
             m2m m_psd.hwndOwner, hWin
             m2m m_psd.hDevMode, m_pd.hDevMode          
             mov m_psd.hDevNames, 0
             mov m_psd.Flags, PSD_MARGINS or PSD_MINMARGINS or PSD_INTHOUSANDTHSOFINCHES            
             invoke PageSetupDlg, addr m_psd

    ret
PageSetUp endp



PrintEdit proc uses edi esi hWin  :HWND, hEdit :HWND

local frr        	 :FORMATRANGE
local docinfo   	 :DOCINFO
local hPrintDC  	 :HDC
local charrange 	 :CHARRANGE
local flag_print	 :DWORD
local fSelOnlyOld	 :BYTE
local szErr[128]	 :BYTE
local buff[32]		 :BYTE
local hFooterDefFont:HFONT
local hHeaderDefFont:HFONT
local hFontOld  	 :HFONT
local ffnt      	 :LOGFONT
local hfnt      	 :LOGFONT
local OldClr    	 :COLORREF
local OldAlign  	 :DWORD
local nPageMax  	 :DWORD
local nPageMin  	 :DWORD
local scale     	 :DWORD
local xNP       	 :DWORD  
local yNP       	 :DWORD
local xCNP       :DWORD  
local xRNP		:DWORD
local xLNP      :DWORD
local xAlign    :DWORD
local hChild    	 :DWORD
local buffer[256]	 :BYTE
local tl        	 :DWORD
local deffont :DWORD

        mov pd.lStructSize, sizeof (PRINTDLG)
        m2m pd.hwndOwner, hWin
        mov pd.hDevMode, 0 
        mov pd.hDevNames, 0
        invoke SendMessage, hEdit, EM_EXGETSEL, NULL, addr charrange 
        mov eax, charrange.cpMin
        .if ( !charrange.cpMax )  || ( charrange.cpMax == eax )       
                mov flag_print, PD_ALLPAGES or PD_NOSELECTION
        .else                                     
            .if fSelOnly == TRUE            
                mov flag_print, PD_SELECTION
            .else                     
                mov flag_print, PD_ALLPAGES
            .endif
        .endif
        mov eax, flag_print
        or  eax, PD_RETURNDC or PD_HIDEPRINTTOFILE or 20000h
        mov pd.Flags,eax
        m2m pd.hInstance, hInst
        mov al, fSelOnly
        mov fSelOnlyOld, al
        mov fSelOnly, FALSE
        invoke GetPageInfo, hEdit
        mov al, fSelOnlyOld
        mov fSelOnly, al
        mov pd.nFromPage, 1 
        m2m pd.nToPage, nCountPage  
        mov pd.nMinPage, 1  
        m2m pd.nMaxPage, nCountPage 
        mov pd.nCopies, 1
        invoke GetPageInfo, hEdit 
        invoke PrintDlg, addr pd
        .if eax                    
            m2m hPrintDC, pd.hDC
            m2m frr.hdc, hPrintDC
            m2m frr.hdcTarget, 0
            mov eax, pd.Flags
            and eax, PD_ALLPAGES or PD_SELECTION or PD_PAGENUMS            
            .if eax == PD_ALLPAGES           
                mov nPageMin, 0
                m2m nPageMax, nCountPage
            .elseif eax == PD_SELECTION
                mov nPageMin, 0
                m2m nPageMax, nCountPage
            .elseif eax == PD_PAGENUMS          
                m2m nPageMin, pd.nFromPage
                dec nPageMin              
                m2m nPageMax, pd.nToPage
            .endif
	        invoke GetDeviceCaps, hPrintDC, LOGPIXELSY
	         mov scale, eax                 
             mov eax, m_Margin.left
             mov frr.rc.left,eax
             mov eax, m_Margin.top
             mov frr.rc.top, eax
             mov eax, m_Paper.x
             sub eax, m_Margin.right
             mov frr.rc.right, eax       
             mov eax, m_Paper.y
             sub eax, m_Margin.bottom
             mov frr.rc.bottom, eax
             mov deffont,FALSE
            .if PrtHead || PrtFoot       
                invoke GetDeviceCaps, hPrintDC, LOGPIXELSY
	            mov scale, eax 
	            .if  PrtHead               
	                invoke MulDiv, nHeadfntsize, scale, 72
	                neg eax     
	                mov hfnt.lfHeight, eax
	                mov hfnt.lfWidth, 0
	                mov hfnt.lfEscapement, 0
	                mov hfnt.lfOrientation,0
	                mov hfnt.lfWeight, FW_NORMAL
	                mov hfnt.lfItalic, FALSE
	                mov hfnt.lfUnderline, FALSE
	                mov hfnt.lfStrikeOut, FALSE
	                mov hfnt.lfCharSet, ANSI_CHARSET
	                mov hfnt.lfOutPrecision, OUT_DEFAULT_PRECIS
	                mov hfnt.lfClipPrecision, CLIP_DEFAULT_PRECIS
	                mov hfnt.lfQuality, DEFAULT_QUALITY
	                mov hfnt.lfPitchAndFamily, FF_MODERN
	                .if headfont
						lea edi,hfnt+4
						lea esi,offset HFlf+4
						mov ecx,6
						cld
						rep     movsd
	                	invoke lstrcpy, addr hfnt.lfFaceName, addr HFlf.lfFaceName
	                .else
	                	invoke lstrcpy, addr hfnt.lfFaceName, addr szNameFontNP
	                .endif
	                invoke CreateFontIndirect, addr hfnt
	                mov hHeaderDefFont,eax
			    .endif
	            .if  PrtFoot               
	                invoke MulDiv, nFootfntsize, scale, 72
	                neg eax     
	                mov ffnt.lfHeight, eax
	                mov ffnt.lfWidth, 0
	                mov ffnt.lfEscapement, 0
	                mov ffnt.lfOrientation,0
	                mov ffnt.lfWeight, FW_NORMAL
	                mov ffnt.lfItalic, FALSE
	                mov ffnt.lfUnderline, FALSE
	                mov ffnt.lfStrikeOut, FALSE
	                mov ffnt.lfCharSet, ANSI_CHARSET
	                mov ffnt.lfOutPrecision, OUT_DEFAULT_PRECIS
	                mov ffnt.lfClipPrecision, CLIP_DEFAULT_PRECIS
	                mov ffnt.lfQuality, DEFAULT_QUALITY
	                mov ffnt.lfPitchAndFamily, FF_MODERN
	                .if footfont
						lea edi, ffnt+4
						lea esi,offset FFlf+4
						mov ecx,6
						cld
						rep     movsd
	                	invoke lstrcpy, addr ffnt.lfFaceName, addr FFlf.lfFaceName
	                .else
	                	invoke lstrcpy, addr ffnt.lfFaceName, addr szNameFontNP
	                .endif
	                invoke CreateFontIndirect, addr ffnt
	                mov hFooterDefFont, eax 
			    .endif
                invoke GetDeviceCaps, hPrintDC, VERTRES
                mov yNP, eax
				add xCNP,40
				add xRNP,40
                invoke GetDeviceCaps, hPrintDC, HORZRES
                mov xRNP,eax
                invoke IntDiv, eax, 2
                mov xCNP, eax
            .endif
            mov frr.rcPage.left,0
            .if PrtHead
        		add frr.rcPage.top, 36
        	.else 
        		mov frr.rcPage.top, 0
        	.endif
            m2m frr.rcPage.right, m_Paper.x
            m2m frr.rcPage.bottom, m_Paper.y  
			add frr.rcPage.bottom,80
            mov docinfo.cbSize, sizeof(DOCINFO)
            mov docinfo.lpszDocName, offset DocName
            mov docinfo.lpszOutput, NULL
            mov docinfo.lpszDatatype, NULL
            mov docinfo.fwType, NULL             
            invoke StartDoc, hPrintDC, addr docinfo
            .if !eax
                call GetLastError
                invoke wsprintf, szErr, SADD("Print Error %ld"), eax
                invoke MessageBox, hWin, szErr, offset DocName, MB_OK or MB_ICONEXCLAMATION
                ret
            .endif                
            .if nPageMax   
@@:       
                inc nPageMin         
                invoke StartPage, hPrintDC                
                mov hFontOld,0 
                mov OldAlign,0
                mov OldClr, 0
                .if PrtHead || PrtFoot
                	.if PrtFoot  
	                	invoke SelectObject, hPrintDC, hFooterDefFont
	                    mov hFontOld, eax 
						.if FootPage
							invoke wsprintf,addr buff,SADD("Page %i"), nCurrentPage
						.elseif FootText
							invoke DwToAscii,nCurrentPage,addr ascii
							invoke lstrcpy,addr buff,addr szPrtFootBuff
							invoke lstrlen,	addr buff
							lea eax,buff[eax]
							mov word ptr[eax],20h
							invoke lstrcat,addr buff,addr ascii
						.else
				        	invoke wsprintf,addr buff,SADD("%i"), nCurrentPage
				        .endif
				        .if FootLeft
				        	mov eax,TA_LEFT
				        	mov xAlign,36
				        .elseif FootCenter
				        	m2m xAlign,xCNP
				        	mov eax,TA_CENTER
				        .else 
				        	m2m xAlign,xRNP
				        	mov eax,TA_RIGHT
				        .endif
				        or eax,TA_BOTTOM       				        			        
				        invoke SetTextAlign, hPrintDC, eax
	                    mov OldAlign, eax 
	                    invoke SetTextColor, hPrintDC, footcolor 
	                    mov OldClr, eax 
				        .if FootTime
							call HeaderTime
							invoke lstrcat,addr buff,offset dmsg
				        .endif
	                    invoke lstrlen, addr buff
	                    mov tl,eax                    
	                    invoke TextOut, hPrintDC, xAlign, yNP, addr buff, tl
					.endif
					.if PrtHead
				        invoke SelectObject, hPrintDC, hHeaderDefFont
				        .if !hFontOld
				        	mov hFontOld, eax  
				        .endif       				        			        
				        .if PrtLeft
				        	mov eax,TA_LEFT
				        	mov xAlign,36
				        .elseif PrtCenter
				        	m2m xAlign,xCNP
				        	mov eax,TA_CENTER
				        .else 
				        	m2m xAlign,xRNP
				        	mov eax,TA_RIGHT
				        .endif
				        or eax,TA_TOP       				        			        
				        invoke SetTextAlign, hPrintDC, eax
				        .if !OldAlign
				        	mov OldAlign,eax
				        .endif
				        invoke SetTextColor, hPrintDC, headcolor
				        .if !OldClr
				        	mov OldClr,eax
				        .endif
						.if PrtName
							invoke     SendMessage, hREdit , WM_GETTEXTLENGTH, 0, 0
							mov      tl, eax
							inc      tl
							invoke     GetWindowText,hREdit,addr szPrtHeadBuff,tl				
				        .endif
						.if PrtPath
							invoke     SendMessage, hREdit , WM_GETTEXTLENGTH, 0, 0
							mov      tl, eax
							inc      tl
							invoke     GetWindowText,hREdit,addr szPrtHeadBuff,tl
						.endif
				        .if PrtTime
							call HeaderTime
							invoke lstrcat,offset szPrtHeadBuff,offset dmsg
						.endif	
				        invoke lstrlen,offset szPrtHeadBuff
				        mov tl,eax
				        invoke TextOut, hPrintDC, xAlign, 36, addr szPrtHeadBuff,tl
					.endif
	                    invoke SetTextColor, hPrintDC, OldClr
	                    invoke SelectObject, hPrintDC, hFontOld
	                    invoke SetTextAlign, hPrintDC, OldAlign                 
                .endif                    
                .if pChar
                    mov eax, pChar
                    mov edx,nPageMin
                    dec edx
                    m2m frr.chrg.cpMin, [eax][edx*4]
                    inc edx
                    m2m frr.chrg.cpMax, [eax][edx*4]
                .else
                    mov frr.chrg.cpMin, 0
                    mov frr.chrg.cpMax, 0
                .endif
                invoke SendMessage, hEdit, EM_FORMATRANGE, TRUE, addr frr               
                invoke EndPage,hPrintDC                  
                mov eax, nPageMax
                cmp nPageMin, eax
                jb  @b                             
            .endif            
            invoke SendMessage, hEdit, EM_FORMATRANGE, FALSE, NULL
            invoke EndDoc, hPrintDC         
            invoke DeleteDC, hPrintDC
         .else               
         .endif
    ret
PrintEdit endp

GetPageInfo proc uses esi edi hEdit :HWND

    local nLastChar :DWORD
    local nLastOldChar :DWORD
    local frr        :FORMATRANGE
    local nMaxLen   :SDWORD
    local hDC       :DWORD
    local charrange :CHARRANGE
    local pCharOld  :DWORD

            invoke GetDC, NULL
            mov hDC, eax  
            mov nCountPage, 0
            
            invoke SendMessage, hEdit, EM_EXGETSEL, NULL, addr charrange          
            mov eax, charrange.cpMin
    
        
                .if ( !charrange.cpMax )  || ( charrange.cpMax == eax )      
                    mov nLastChar, 0
                    mov nMaxLen, -1
                .else                                    
                    .if fSelOnly == TRUE      
                        m2m nLastChar, charrange.cpMin      
                        m2m nMaxLen, charrange.cpMax
                    .else                     
                        m2m nLastChar, 0
                        mov nMaxLen, -1
                    .endif
                .endif


            m2m frr.hdc, hDC                
            m2m frr.hdcTarget, hDC         ; 0

            
            mov frr.rc.left, 0
            mov frr.rc.top, 0
            
            mov eax, m_Paper.x
            sub eax, m_Margin.right
            sub eax, m_Margin.left          
            mov frr.rc.right, eax
            
            mov eax, m_Paper.y
            sub eax, m_Margin.top
            sub eax, m_Margin.bottom
            mov frr.rc.bottom, eax   
            
            .if fPrnPageNumbers
            	invoke GetDeviceCaps, hDC, LOGPIXELSY
                invoke MulDiv, 200, eax , 72
                sub frr.rc.bottom, eax               
           .else
               mov frr.rc.bottom, 0            
           .endif
            

            
    
            jmp start_c
           
new_page:   
            inc nCountPage                
 
            m2m pCharOld, pChar
            
            invoke IntMul, nCountPage, 4
            invoke GlobalAlloc,GPTR, eax         
            mov pChar, eax      
            
            .if pCharOld                   
                
                dec nCountPage
                mov ecx, nCountPage
                mov esi, pCharOld                       
                mov edi, pChar                          
                rep movsd 
                inc nCountPage
                
                invoke GlobalFree, pCharOld     
            
            .endif
            
                      
            
            lea esi, nLastOldChar            
            mov edx, nCountPage
            dec edx
            invoke IntMul, edx, 4
            mov edi, pChar
            add edi, eax                     
            movsd
                
start_c:       
            m2m frr.chrg.cpMin, nLastChar
            m2m frr.chrg.cpMax, nMaxLen
       
                       
            m2m nLastOldChar, nLastChar
            invoke SendMessage, hEdit, EM_FORMATRANGE, FALSE, addr frr
            mov nLastChar, eax  


            mov eax, nLastOldChar
            cmp nLastChar, eax
            ja  new_page


            inc nCountPage                
 
            m2m pCharOld, pChar
            
            
            invoke IntMul, nCountPage, 4
            invoke GlobalAlloc,GPTR, eax         
            mov pChar, eax      
            
            .if pCharOld                   
                
                dec nCountPage
                mov ecx, nCountPage
                mov esi, pCharOld                       
                mov edi, pChar                          
                rep movsd 
                inc nCountPage
                
                invoke GlobalFree, pCharOld     
            
            .endif
            
                        
            
            lea esi, nLastOldChar            
            mov edx, nCountPage
            dec edx
            invoke IntMul, edx, 4
            mov edi, pChar
            add edi, eax                     
            movsd 

            dec nCountPage

            invoke ReleaseDC, NULL, hDC
                        
            invoke SendMessage, hEdit, EM_FORMATRANGE, NULL, NULL

            .if !nCountPage
                mov nCountPage, 1                
            .endif
            

    ret
GetPageInfo endp

