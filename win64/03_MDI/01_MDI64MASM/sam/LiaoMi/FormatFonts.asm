.code


FormatFont  PROC 
local hWndChild :DWORD
local	cf:CHOOSEFONT
local   hEdit:DWORD
 
	  invoke	 SendMessage, hWndClient, WM_MDIGETACTIVE, 0, 0
		 mov	 hWndChild, eax
		 invoke	   GetWindow, eax, GW_CHILD
		 mov	   hEdit,eax
      invoke     SendMessage, hEdit, EM_GETCHARFORMAT, TRUE, offset charF
      invoke     GetDC, hWndChild
        push     eax
      invoke     GetDeviceCaps, eax, LOGPIXELSY  ; = 96
         mov     tempword, eax
         pop     eax
      invoke     ReleaseDC, hWndChild, eax
         mov     eax, charF.yHeight              ; =  0
         mul     tempword
         mov     ecx, 1440
         div     ecx
         neg     eax                
         mov     lf.lfHeight, eax                ; = -12
         mov     lf.lfWeight, FW_NORMAL
      .if     charF.dwEffects==CFE_BOLD
         	mov     lf.lfWeight, FW_BOLD
      .endif
      .if charF.dwEffects==CFE_ITALIC
         	mov     lf.lfItalic, TRUE
      .else
        	mov     lf.lfItalic, FALSE
      .endif
      .if charF.dwEffects==CFE_UNDERLINE
         	mov     lf.lfUnderline, TRUE
      .else
         	mov     lf.lfUnderline, FALSE
      .endif
	  .if charF.dwEffects==CFE_STRIKEOUT
         mov     lf.lfStrikeOut, TRUE
	  .else
         mov     lf.lfStrikeOut, FALSE
      .endif
         mov     al, charF.bCharSet
         mov     lf.lfCharSet, al
         mov     al, charF.bPitchAndFamily
         mov     lf.lfPitchAndFamily, al
         mov     eax, charF.crTextColor
         mov     cf.rgbColors, eax
      invoke     lstrcpy, addr lf.lfFaceName, addr charF.szFaceName
         mov     cf.lStructSize, sizeof cf
         m2m     cf.hwndOwner, hWndChild
         m2m     cf.hInstance, hInstance
         mov     cf.lpLogFont, offset lf
         mov     cf.Flags, CF_SCREENFONTS or CF_INITTOLOGFONTSTRUCT or CF_FORCEFONTEXIST or CF_EFFECTS
      invoke     ChooseFont, addr cf ; Invoke common ChooseFont dialog
         cmp     eax, FALSE
          je     FontRet
      invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_UNDERLINE, FALSE
      invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_ITALIC, FALSE
      invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_BOLD, FALSE
      invoke     SendMessage, hREdit, EM_GETCHARFORMAT, TRUE, offset charF
         mov     charF.dwEffects, 0    ; Reset the effects, they will all be specified
          or     charF.dwMask, CFM_STRIKEOUT
         mov     al, lf.lfStrikeOut
      .if al
          or     charF.dwEffects, CFE_STRIKEOUT
      .endif
      	  or     charF.dwMask, CFM_ITALIC
      	 mov     al, lf.lfItalic
      .if al
          or     charF.dwEffects, CFE_ITALIC
          invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_ITALIC, TRUE
      .endif
      or     	 charF.dwMask, CFM_UNDERLINE
      mov     	 al, lf.lfUnderline
      .if al
         xor     charF.dwEffects, CFE_UNDERLINE
         invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_UNDERLINE, TRUE       
      .endif
      	  or     charF.dwMask, CFM_BOLD 
         mov     eax, lf.lfWeight
      .if     eax>FW_NORMAL        ; 400 = FW_NORMAL 700 = FW_BOLD
          or     charF.dwEffects, CFE_BOLD
          invoke      SendMessage, hToolbar, TB_CHECKBUTTON, IDM_FORMAT_BOLD, TRUE
	  .endif
         mov     eax, cf.rgbColors
         mov     charF.crTextColor, eax
       	 m2m     charF.crBackColor, TextBGC
         mov     al, lf.lfCharSet
         mov     charF.bCharSet, al
         mov     al, lf.lfPitchAndFamily
         mov     charF.bPitchAndFamily, al
         mov     eax, cf.iPointSize
         shl     eax, 1              ; Convert from 1/10 pt to twips (which is points*20)
         mov     charF.yHeight, eax
         mov     PointSize, eax
          or     charF.dwMask, CFM_FACE or CFM_SIZE or CFM_COLOR or CFM_BACKCOLOR or CFM_CHARSET
      invoke     lstrcpy, offset FontName, offset lf.lfFaceName
         m2m     TextC, cf.rgbColors
      invoke     lstrcpy, offset charF.szFaceName, offset lf.lfFaceName
      invoke     SendMessage, hEdit, EM_SETCHARFORMAT, SCF_SELECTION, addr charF
      invoke     CreateFontIndirect, offset lf
         mov     hFont,eax
FontRet:
         ret                       
FormatFont    ENDP

HeadFont  PROC Parent:DWORD
local	cf:CHOOSEFONT

		invoke     GetWindowDC, hREdit
        push     eax
        invoke GetDeviceCaps, eax, LOGPIXELSY
        invoke MulDiv, 10,eax,72 
        neg eax     
        mov HFlf.lfHeight, eax
        pop  eax
        invoke     ReleaseDC, Parent, eax
        mov HFlf.lfWidth, 0
        mov HFlf.lfEscapement, 0
        mov HFlf.lfOrientation,0
        mov HFlf.lfWeight, FW_NORMAL
        mov HFlf.lfItalic, FALSE
        mov HFlf.lfUnderline, FALSE
        mov HFlf.lfStrikeOut, FALSE
        mov HFlf.lfCharSet, ANSI_CHARSET
        mov HFlf.lfOutPrecision, OUT_DEFAULT_PRECIS
        mov HFlf.lfClipPrecision, CLIP_DEFAULT_PRECIS
        mov HFlf.lfQuality, DEFAULT_QUALITY
        mov HFlf.lfPitchAndFamily, FF_MODERN
        invoke lstrcpy, addr HFlf.lfFaceName, addr szNameFontNP

 

		invoke RtlZeroMemory,addr cf,sizeof (CHOOSEFONT)
         mov     cf.lStructSize, sizeof (CHOOSEFONT)
         m2m     cf.hwndOwner,Parent
         m2m     cf.hInstance, hInstance
         mov     cf.lpLogFont, offset HFlf
         mov     cf.Flags, CF_SCREENFONTS or CF_INITTOLOGFONTSTRUCT or CF_FORCEFONTEXIST or CF_EFFECTS
      invoke     ChooseFont, addr cf ; Invoke common ChooseFont dialog
         cmp     eax, FALSE
          je     FontRet
      invoke     CreateFontIndirect, offset HFlf
	  	mov     headfont,eax
	  	m2m     headcolor,cf.rgbColors
	  	mov     eax,HFlf.lfHeight
	  	mov    eax,cf.iPointSize
	  	mov    ecx,10
	  	mov    edx,0
	  	div    ecx
	  	mov    nHeadfntsize,eax
FontRet:
         ret                       
HeadFont    ENDP
FootFont  PROC Parent:DWORD
local	cf:CHOOSEFONT

		invoke     GetWindowDC, hREdit
        push     eax
        invoke GetDeviceCaps, eax, LOGPIXELSY
        invoke MulDiv, 10,eax,72 
        neg eax     
        mov FFlf.lfHeight, eax
        pop  eax
        invoke     ReleaseDC, Parent, eax
        mov FFlf.lfWidth, 0
        mov FFlf.lfEscapement, 0
        mov FFlf.lfOrientation,0
        mov FFlf.lfWeight, FW_NORMAL
        mov FFlf.lfItalic, FALSE
        mov FFlf.lfUnderline, FALSE
        mov FFlf.lfStrikeOut, FALSE
        mov FFlf.lfCharSet, ANSI_CHARSET
        mov FFlf.lfOutPrecision, OUT_DEFAULT_PRECIS
        mov FFlf.lfClipPrecision, CLIP_DEFAULT_PRECIS
        mov FFlf.lfQuality, DEFAULT_QUALITY
        mov FFlf.lfPitchAndFamily, FF_MODERN
        invoke lstrcpy, addr FFlf.lfFaceName, addr szNameFontNP

 

		invoke RtlZeroMemory,addr cf,sizeof (CHOOSEFONT)
         mov     cf.lStructSize, sizeof (CHOOSEFONT)
         m2m     cf.hwndOwner,Parent
         m2m     cf.hInstance, hInstance
         mov     cf.lpLogFont, offset FFlf
         mov     cf.Flags, CF_SCREENFONTS or CF_INITTOLOGFONTSTRUCT or CF_FORCEFONTEXIST or CF_EFFECTS
      invoke     ChooseFont, addr cf ; Invoke common ChooseFont dialog
         cmp     eax, FALSE
          je     FontRet
      invoke     CreateFontIndirect, offset FFlf
	  	mov     footfont,eax
	  	m2m     footcolor,cf.rgbColors
	  	mov    eax,cf.iPointSize
	  	mov    ecx,10
	  	mov    edx,0
	  	div    ecx
	  	mov    nFootfntsize,eax
FontRet:
         ret                       
FootFont    ENDP
