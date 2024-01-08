win1:
	invoke	GetModuleHandle,NULL
	mov	[hinstance],eax

	invoke	LoadIcon,NULL,IDI_APPLICATION
	mov	[wc.hIcon],eax

	invoke	LoadCursor,NULL,IDC_ARROW
	mov	[wc.hCursor],eax

	mov	[wc.style],0
	mov	[wc.lpfnWndProc],WindowProc
	mov	[wc.cbClsExtra],0
	mov	[wc.cbWndExtra],0
	mov	eax,[hinstance]
	mov	[wc.hInstance],eax
	mov	[wc.hbrBackground],COLOR_BTNSHADOW
	mov	dword [wc.lpszMenuName],NULL
	mov	dword [wc.lpszClassName],_class
	invoke	RegisterClass,wc

	invoke	CreateWindowEx,\
		0,_class,_title,WS_POPUP+WS_VISIBLE,0,0,0,0,NULL,NULL,[hinstance],NULL
;                0,_class,_title,WS_OVERLAPPEDWINDOW,0,0,0,0,NULL,NULL,[hinstance],NULL
	mov	[hwnd],eax

;first initialise a directDraw object DDraw
	invoke	DirectDrawCreate,NULL,DDraw,NULL
	or	eax,eax
	jnz	ddraw_error

	cominvk DDraw,SetCooperativeLevel,\
	    [hwnd],DDSCL_EXCLUSIVE+DDSCL_FULLSCREEN
;              [hwnd],DDSCL_NORMAL


	or	eax,eax
	jnz	ddraw_error

	cominvk DDraw,SetDisplayMode,\
		     800,600,32 ;    640,480,32
	    ;  800,600,32      ;   640,480,8
	or	eax,eax
	jnz	ddraw_error

	mov	[ddsd.dwSize],sizeof.DDSURFACEDESC
	mov	[ddsd.dwFlags],DDSD_CAPS+DDSD_BACKBUFFERCOUNT
	mov	[ddsd.ddsCaps.dwCaps],DDSCAPS_PRIMARYSURFACE+DDSCAPS_FLIP+DDSCAPS_COMPLEX
	mov	[ddsd.dwBackBufferCount],1

; use DDraw to make DDSPrimary (a directdrawsurface)which includes
; all information in the variable ddsd (a ddsurfacedesc)
	cominvk DDraw,CreateSurface,\
		ddsd,DDSPrimary, NULL
   mov edi, [ddsd.lpSurface]
mov [surfaceptr1], edi
	or	eax,eax
	jnz	ddraw_error

	mov	[ddscaps.dwCaps],DDSCAPS_BACKBUFFER

; use DDSPrimary calls to set another directdrawsurface DDSBack
	cominvk DDSPrimary,GetAttachedSurface,\
		ddscaps,DDSBack

	or	eax,eax
	jnz	ddraw_error

	mov	esi,picture
; uses Windows commands to open gif file
; load_picture calls DDraw Createsurface to make a second surface
; DDSPicture using information it has stored in the variable ddsd
; from the gif file. It then locks the surface of DDSPicture. Then
; it gets the pointer of the surface and decodes the gif reading the
; bytes to the screen. Then it unlocks the surface of DDSPicture
	call	load_picture
	call storebmp
;      mov eax,ebx ;  012345678h
;       mov eax, [gdisurface1]
;      mov eax, [ebx.lpSurface]
;      mov eax, [GIFHEADER.ID] ; [ddsd.lpSurface]
;      mov eax, 012345678h
;      mov eax, [ddsd.ddpfPixelFormat]
;      mov eax,  [gdisurface1]
;      mov ebx,  [eax]
;      mov eax, [ebx]
;      mov [inbin1], ax
;      shr eax, 16
;      mov [secondhex], ax
;      mov ax, [inbin1]
;      call HexOut
;      mov [outhex3], bx
;      mov [outhex4], ax
;      mov ax, [secondhex]
;      call HexOut
;      mov [outhex1], bx
;      mov [outhex2], ax
;      jmp ddraw_error
	jc	open_error

;        mov     esi,picture
; again opens the file then loads a palette from gif to surface
;        call    load_palette
;        jc      open_error

;        cominvk DDSPrimary,SetPalette,eax

; sets up a timing loop
	invoke	GetTickCount
	mov	[last_tick],eax
ret


