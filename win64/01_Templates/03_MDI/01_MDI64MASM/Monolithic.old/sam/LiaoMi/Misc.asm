.CODE
;


DwToAscii proc uses ebx esi edi,dwVal:DWORD,lpAscii:DWORD

	mov		eax,dwVal
	mov		edi,lpAscii
	or		eax,eax
	jns		pos
	mov		byte ptr [edi],'-'
	neg		eax
	inc		edi
  pos:
	mov		ecx,01999999Ah;429496730
	mov		esi,edi
  @@:
	mov		ebx,eax
	mul		ecx
	mov		eax,edx
	lea		edx,[edx*4+edx]
	add		edx,edx
	sub		ebx,edx
	add		bl,'0'
	mov		[edi],bl
	inc		edi
	or		eax,eax
	jne		@b
	mov		byte ptr [edi],al
	.while esi<edi
		dec		edi
		mov		al,[esi]
		mov		ah,[edi]
		mov		[edi],al
		mov		[esi],ah
		inc		esi
	.endw
	ret
DwToAscii endp
GrayedImageList proc uses ebx esi edi
	LOCAL	hDC:HDC
	LOCAL	mDC:HDC
	LOCAL	hBmp:DWORD
	LOCAL	nCount:DWORD
	LOCAL	rect:RECT

	invoke ImageList_GetImageCount,hImlTbr
	mov		nCount,eax
	shl		eax,4
	mov		rect.left,0
	mov		rect.top,0
	mov		rect.right,eax
	mov		rect.bottom,16
	invoke ImageList_Create,16,16,ILC_MASK or ILC_COLOR24,nCount,10
	mov		hImlTbrGray,eax
	invoke GetDC,NULL
	mov		hDC,eax
	invoke CreateCompatibleDC,hDC
	mov		mDC,eax
	invoke CreateCompatibleBitmap,hDC,rect.right,16
	mov		hBmp,eax
	invoke ReleaseDC,NULL,hDC
	invoke SelectObject,mDC,hBmp
	push	eax
	invoke CreateSolidBrush,0FF00FFh
	push	eax
	invoke FillRect,mDC,addr rect,eax
	xor		ecx,ecx
	.while ecx<nCount
		push	ecx
		invoke ImageList_Draw,hImlTbr,ecx,mDC,rect.left,0,ILD_TRANSPARENT
		pop		ecx
		add		rect.left,16
		inc		ecx
	.endw
	invoke GetPixel,mDC,0,0
	mov		ebx,eax
	xor		esi,esi
	.while esi<16
		xor		edi,edi
		.while edi<rect.right
			invoke GetPixel,mDC,edi,esi
			.if eax!=ebx
				bswap	eax
				shr		eax,8
				movzx	ecx,al			; red
				imul	ecx,ecx,66
				movzx	edx,ah			; green
				imul	edx,edx,129
				add		edx,ecx
				shr		eax,16			; blue
				imul	eax,eax,25
				add		eax,edx
				add		eax,128
				shr		eax,8
				add		eax,16
				imul	eax,eax,010101h
;				and		eax,0E0E0E0h
;				shr		eax,1
;				add		eax,0404040h
;				shr		eax,1
;				or		eax,0808080h
				and		eax,0fcfcfch
				shr		eax,2
				add		eax,0505050h
				invoke SetPixel,mDC,edi,esi,eax
			.endif
			inc		edi
		.endw
		inc		esi
	.endw
	pop		eax
	invoke DeleteObject,eax
	pop		eax
	invoke SelectObject,mDC,eax
	invoke DeleteDC,mDC
	invoke ImageList_AddMasked,hImlTbrGray,hBmp,ebx
	invoke DeleteObject,hBmp
	invoke SendMessage,hToolbar,TB_SETDISABLEDIMAGELIST,0,hImlTbrGray
	ret

GrayedImageList endp

SetupMenu proc uses ebx esi edi,hSubMnu:HMENU
	LOCAL	nPos:DWORD
	LOCAL	mii:MENUITEMINFO
	LOCAL	buffer[MAX_PATH]:BYTE

	mov		nPos,0
	mov		mii.cbSize,sizeof MENUITEMINFO
	mov		mii.fMask,MIIM_DATA or MIIM_ID or MIIM_SUBMENU or MIIM_TYPE
  @@:
	lea		eax,buffer
	mov		word ptr [eax],0
	mov		mii.dwTypeData,eax
	mov		mii.cch,sizeof buffer
	invoke GetMenuItemInfo,hSubMnu,nPos,TRUE,addr mii
	.if eax
		mov		edi,offset mnubuff
		add		edi,mnupos
		mov		mii.dwItemData,edi
		mov		[edi].MENUDATA.img,0
		test	mii.fType,MFT_SEPARATOR
		.if ZERO?
			invoke SendMessage,hToolbar,TB_COMMANDTOINDEX,mii.wID,0
			.if sdword ptr eax>=0
				invoke SendMessage,hToolbar,TB_GETBITMAP,mii.wID,0
				inc		eax
				mov		[edi].MENUDATA.img,eax
			.endif
			mov		[edi].MENUDATA.tpe,0
			mov		eax,mii.fType
			and		eax,7Fh
			.if eax==MFT_STRING
				lea		esi,buffer
				mov		ecx,sizeof MENUDATA
				xor		edx,edx
				.while byte ptr [esi]
					mov		al,[esi]
					.if al==VK_TAB
						mov		al,0
						inc		edx
					.endif
					mov		[edi+ecx],al
					inc		ecx
					inc		esi
				.endw
				mov		al,0
				mov		[edi+ecx],al
				inc		ecx
				mov		[edi+ecx],al
				inc		ecx
				add		mnupos,ecx
			.else
				mov		[edi].MENUDATA.tpe,0
				mov		word ptr [edi+sizeof MENUDATA],0
				add		mnupos,sizeof MENUDATA+2
			.endif
		.else
			; Separator
			mov		[edi].MENUDATA.tpe,1
			add		mnupos,sizeof MENUDATA
		.endif
		or		mii.fType,MFT_OWNERDRAW
		invoke SetMenuItemInfo,hSubMnu,nPos,TRUE,addr mii
		.if mii.hSubMenu
			invoke SetupMenu,mii.hSubMenu
		.endif
		inc		nPos
		jmp		@b
	.endif
	ret
SetupMenu endp
MakeMenuBitmap proc uses ebx esi edi,wt:DWORD,nColor:DWORD
	LOCAL	hBmp:HBITMAP
	LOCAL	hOldBmp:HBITMAP
	LOCAL	hDC:HDC
	LOCAL	mDC:HDC
	LOCAL	hDeskTop:HWND

	invoke GetDesktopWindow
	mov		hDeskTop,eax
	invoke GetDC,hDeskTop
	mov		hDC,eax
	invoke CreateCompatibleDC,hDC
	mov		mDC,eax
	invoke CreateCompatibleBitmap,hDC,600,6
	mov		hBmp,eax
	invoke ReleaseDC,hDeskTop,hDC
	invoke SelectObject,mDC,hBmp
	mov		hOldBmp,eax
	xor		ebx,ebx
	.while ebx<6
		xor		edi,edi
		mov		esi,nColor
		.while edi<wt
			invoke SetPixel,mDC,edi,ebx,esi
			sub		esi,030303h
			inc		edi
		.endw
		.while edi<600
			invoke SetPixel,mDC,edi,ebx,0F0F0F0h
			inc		edi
		.endw
		inc		ebx
	.endw
	invoke SelectObject,mDC,hOldBmp
	invoke DeleteDC,mDC
	mov		eax,hBmp
	ret

MakeMenuBitmap endp

CoolMenu proc
	LOCAL	MInfo:MENUINFO
	LOCAL	nInx:DWORD
	LOCAL	hBmp:HBITMAP
;	LOCAL	hBr:HBRUSH
	LOCAL	ncm:NONCLIENTMETRICS

	; Get menu font
	mov		ncm.cbSize,sizeof NONCLIENTMETRICS
	invoke SystemParametersInfo,SPI_GETNONCLIENTMETRICS,sizeof NONCLIENTMETRICS,addr ncm,0
	invoke CreateFontIndirect,addr ncm.lfMenuFont
	mov		hMnuFont,eax
	invoke MakeMenuBitmap,20,0FFEFDDh
	mov		hBmp,eax
	invoke CreatePatternBrush,hBmp
	mov		hMenuBrushA,eax
	mov		MInfo.hbrBack,eax
	invoke DeleteObject,hBmp
	mov		MInfo.cbSize,SizeOf MENUINFO
	mov		MInfo.fmask,MIM_BACKGROUND or MIM_APPLYTOSUBMENUS
	invoke MakeMenuBitmap,20,0FFEFDDh-030303h
	mov		hBmp,eax
	invoke CreatePatternBrush,hBmp
	mov		hMenuBrushB,eax
	invoke DeleteObject,hBmp
	mov		nInx,0
	mov		mnupos,0
	
  @@:
	invoke GetSubMenu,hMainMenu,nInx
	.if eax
		push	eax
		invoke SetupMenu,eax
		pop		edx
		invoke SetMenuInfo,edx,addr MInfo
		inc		nInx
		jmp		@b
	.endif
	 m2m  nInx,closed
  @@:
	invoke GetSubMenu,hChildMenu,nInx
	.if eax
		push	eax
		invoke SetupMenu,eax
		pop		edx
		invoke SetMenuInfo,edx,addr MInfo
		inc		nInx
		jmp		@b
	.endif
	
		mov		nInx,0
	  @@:
	invoke GetSubMenu,hPopUpMenu,nInx
	.if eax
		push	eax
		invoke SetupMenu,eax
		pop		edx
		invoke SetMenuInfo,edx,addr MInfo
		inc		nInx
		jmp		@b
	.endif

		ret
CoolMenu endp

SetWndToolTip	Proc	hCtrl:HWND,uId:DWORD,lpTipText:LPSTR

	push	edi
	lea	edi, ti
	assume	edi: ptr TOOLINFO
	mov	edx, hCtrl
	mov	[edi].hWnd, edx
	invoke	GetClientRect,edx,addr [edi].rect
	mov	edx, uId
	mov	eax, lpTipText
	mov	[edi].uId, edx
	mov	[edi].lpszText, eax
	invoke	SendMessage, hCtrl, TTM_ADDTOOL, 0, edi
	assume	edi: nothing
	pop	edi
	invoke SendMessage, m_hToolTip, TTM_ADDTOOL, 0, addr ti
	ret
SetWndToolTip ENDP
IndentComment proc uses esi edi, nChr:DWORD,fN:DWORD
	LOCAL	chr:CHARRANGE
	LOCAL	LnSt:DWORD
	LOCAL	LnEn:DWORD
	local   SelSt:DWORD
	
	
	invoke SendMessage,hREdit,EM_HIDESELECTION,TRUE,0
	invoke SendMessage,hREdit,EM_EXGETSEL,0,addr chr
	m2m  SelSt,chr.cpMin
	invoke SendMessage,hREdit,EM_EXLINEFROMCHAR,0,chr.cpMin
	mov		LnSt,eax
	mov		chr.cpMin,eax
	invoke SendMessage,hREdit,EM_EXLINEFROMCHAR,0,chr.cpMax
	mov		LnEn,eax
  nxt:
	mov		eax,LnSt
	.if eax<LnEn
		invoke SendMessage,hREdit,EM_LINEINDEX,LnSt,0
		mov		chr.cpMin,eax
		inc		LnSt
		invoke SendMessage,hREdit,EM_LINEINDEX,LnSt,0
		mov		chr.cpMax,eax
		invoke SendMessage,hREdit,EM_EXSETSEL,0,addr chr
		invoke SendMessage,hREdit,EM_GETSELTEXT,0,addr LineTxt
		mov		esi,offset LineTxt
		.if fN
			invoke lstrlen,addr LineTxt
			add		esi,eax
			mov		edi,esi
			inc		edi
		  @@:
			mov		al,[esi]
			mov		[edi],al
			dec		esi
			dec		edi
			cmp		edi,offset LineTxt
			jne		@b
			mov		eax,nChr
			mov		[edi],al
			invoke SendMessage,hREdit,EM_REPLACESEL,TRUE,addr LineTxt
			jmp		nxt
		.else
			xor		eax,eax
			mov		al,[esi]
			.if eax==nChr
				inc		esi
				invoke SendMessage,hREdit,EM_REPLACESEL,TRUE,esi
			.endif
			jmp		nxt
		.endif
	.endif
	invoke SendMessage,hREdit,EM_EXGETSEL,0,addr chr
	mov		eax,chr.cpMax
	m2m		chr.cpMin,SelSt
	invoke SendMessage,hREdit,EM_EXSETSEL,0,addr chr
	invoke SendMessage,hREdit,EM_HIDESELECTION,FALSE,0
	ret
IndentComment endp