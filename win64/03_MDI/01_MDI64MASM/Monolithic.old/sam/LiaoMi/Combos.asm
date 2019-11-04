.data

hWTools   db   ?

szFCText db "Choose Font",0
szSCText db "Font Size",0
OldFontComboProc dd ?
lastpos dd ?
hpMem	dd	0
fpMem	dd   0
.code

LoadLista PROC uses esi , hList:DWORD, Input:DWORD,def:DWORD
         mov     esi, Input
         xor     eax, eax
         mov     cnt, 0
Getlen:
      .if byte ptr[esi+eax] == ','
            mov     Len, eax
            add     Len, 1 
            add     cnt, 1
         .if cnt > 0 ;20
            invoke     lstrcpyn, offset Misc, esi, Len
            .if def == 4444
               invoke     SendMessage, hList, CB_ADDSTRING, 0, offset Misc
            .else
               invoke     SendMessage, hList, LB_ADDSTRING, 0, offset  Misc
            .endif
         .endif
            add     esi, Len
            xor     eax, eax
            jmp     Getlen
      .elseif byte ptr[esi+eax] == 0h
      	
         invoke     SendMessage, hList, CB_SETTOPINDEX,def, 0
            jmp     @1
      .endif
         inc     eax
         jmp     Getlen
@1:
         ret                          ; Return to caller
LoadLista ENDP

;========================================================================|
; Converts a Dec, Hex, Oct or Bin ascii string to a 32 bit num value.    |
;========================================================================|
AsciiBase PROC uses esi edi ebx,Input:DWORD, Output:DWORD, Base: DWORD
      	 pushad
		 mov     w6, 0
         mov     esi, Input
         mov     edi, Output
      invoke     lstrlen, Input
         xor     ecx, ecx
      .while (eax)
         .if byte ptr[esi+ecx] > 60h
               sub     byte ptr[esi+ecx], 57h
         .elseif byte ptr[esi+ecx] > 40h
               sub     byte ptr[esi+ecx], 37h
         .else
               xor     byte ptr[esi+ecx], 30h
         .endif
            dec     eax
            inc     ecx
      .endw
         mov     ebx, 1
         mov     esi, Input
         add     esi, ecx
         dec     esi
         xor     edx, edx
      .while (ecx)
            mov     al, byte ptr[esi]            ; Extract byte for conversion
            and     eax, 000000ffh
           imul     eax, ebx
            add     dword ptr[edi], eax          ; Accumulate output
           imul     ebx, Base
            dec     esi
            dec     ecx 
      .endw
       popad
          ret
AsciiBase ENDP


BaseAscii PROC uses esi edi ebx, InPut:DWORD, OutPut:DWORD, LEN:DWORD, Base:DWORD, Comma:DWORD, Fill:DWORD, TermA:DWORD
local    LBuff[32]: BYTE

      pushad
         xor     esi, esi
         mov     eax, InPut                ; Input
         mov     ebx, OutPut
         mov     byte ptr [ebx], '0'
      .while (eax)
            xor     edx, edx
            div     Base                   ; Base 10, 16, 8, 2
         .if dl > 9h
               add     dl, 37h             ; Convert to hex ASCII
         .else
               add     dl, 30h             ; Convert to dec ASCII
         .endif
            mov     LBuff[esi], dl
            inc     esi
         .if Comma == 1 && Base == 10 && eax > 0
            .if esi == 3 || esi == 7 || esi == 11
                  mov     LBuff[esi], 2ch  ; Insert commas
                  inc     esi
            .endif
         .endif
      .endw
         xor     edi, edi
         mov     ecx, esi
      .if LEN > ecx && Fill == 1           ; Zero fill
            xor     eax, eax
         .while (eax < LEN)
               mov     byte ptr [ebx+eax], '0'
               inc     eax
         .endw
            sub     LEN, ecx
            add     edi, LEN
      .endif
      .while (ecx)
            mov     al, byte ptr LBuff[esi-1]
            mov     byte ptr [ebx+edi], al
            inc     edi
            dec     esi
            dec     ecx
      .endw
      .if TermA
         mov     byte ptr [ebx+edi], 0h
      .endif
       popad
          ret
BaseAscii ENDP
EnumFontFamExProc proc   lpelfe:ENUMLOGFONTEX  , lpntme:NEWTEXTMETRICEX , FontType:DWORD, lParam:LPARAM
			
			mov eax, dword ptr lpelfe;.elfFullName
			add eax,extent;3ch;9ch
			push eax
			 invoke lstrcmp, Head,eax  ; check if it is the same name
			 .if eax       ; not the same name 
			 	inc index
				 pop eax
				 invoke lstrcpy, Tail,eax
				 m2m Head,Tail
				 invoke lstrlen, Tail
				 inc eax
				 add Tail,eax
			.else
				pop eax
			.endif
	mov eax,rval
	ret 16
EnumFontFamExProc endp
FillComboBox proc hFontCombo:HWND
local hDC:HDC
local lpLogfont:LOGFONT
	   ;allocate memory for font names
       invoke 		HeapCreate, HEAP_GENERATE_EXCEPTIONS, 6000, 0
          mov     	hpMem, eax
       invoke 		HeapAlloc, hpMem,HEAP_ZERO_MEMORY, 6000
          mov     	fpMem, eax
	;init variables
		mov		index,0 					;clear index
		mov		rval,1						;return value to enumerate all fonts
		mov		extent,03ch					;lpelfe.elfFullName (we want face names)
		mov		eax,fpMem					;get the addres of the buffer 
		mov		Head,eax					;put addres of our buffer into a variable
		mov		Tail,eax					;same addres into another
	  invoke		GetDC,NULL				;The GetDC retrieves a handle of a  (DC)				
		mov		hDC,eax						;put it into handle
		mov		lpLogfont.lfFaceName,0		;0 = all names
		mov		lpLogfont.lfCharSet, DEFAULT_CHARSET ;DEFAULT_CHARSET = all charsets
	  invoke		EnumFontFamiliesEx, hDC,addr lpLogfont,\ ;fill our buffer 
	  								addr EnumFontFamExProc,0,0 ;with all names
	  invoke 	 ReleaseDC, NULL, hDC				;We don't need it anymore
;now we fill combo box with strings
		mov     eax,fpMem
		mov      Head,eax
	.while index
;      invoke     lstrcpy, addr lf.lfFaceName,  Head
;      invoke     CreateFontIndirect, ADDR lf
;         mov     cFont, eax
;      invoke     SendMessage, hCFont, WM_SETFONT, cFont, 1
	  invoke     SendMessage, hFontCombo, CB_ADDSTRING, 0, Head 
	  invoke     lstrlen, Head
	  	inc eax			;skip the zero
	     add     Head,eax
	     dec     index		;next string
	.endw
	invoke     HeapDestroy, hpMem
	ret
FillComboBox endp

;=========================================================================
; Get Information for ComboBoxes procedures                             *
;=========================================================================

Combos proc
local hDC:HDC
local lpLogfont:LOGFONT
      invoke     CreateWindowEx, 0, offset combobox, 0,
                 WS_VSCROLL or WS_VISIBLE or WS_CHILD or WS_CLIPSIBLINGS or\
                 CBS_DROPDOWNLIST or CBS_SORT or TBSTYLE_TOOLTIPS,\
                 706,0,150,210, hToolbar, ID_FONTCOMBO, hInstance, 0
         mov     hCFont, eax
      invoke     CreateWindowEx, 0, offset combobox, 0,
                 WS_VSCROLL or WS_VISIBLE or WS_CHILD or WS_CLIPSIBLINGS or\
                 CBS_DROPDOWNLIST ,\
                 856,0,50,210, hToolbar, ID_FONTSIZECOMBO, hInstance, 0
         mov     hCSize, eax
      invoke     lstrcpy, addr lf.lfFaceName, addr FontMS
         mov     lf.lfHeight, 15
         mov     lf.lfWeight, 500
      invoke     CreateFontIndirect, ADDR lf
         
         mov     cFont, eax

;------------ [Set the fonts and size the ComboBoxes] ------------ 
      invoke     SendMessage, hCFont, WM_SETFONT, cFont, 1
      invoke     SendMessage, hCSize, WM_SETFONT, cFont, 1
 	  invoke 		FillComboBox,hCFont
      invoke     LoadLista, hCSize, offset szSize, 4444
      invoke     SendMessage, hCFont,CB_SETCURSEL, -1, 0
      invoke     SendMessage, hCSize,CB_SETCURSEL, -1, 0
 
	;set tooltip for Fonts Combo
     invoke 	SetWndToolTip,hCFont,0,offset szFCText       

	;set tooltip for Font Size Combo
     invoke 	SetWndToolTip,hCSize,0,offset szSCText
	ret
Combos endp



