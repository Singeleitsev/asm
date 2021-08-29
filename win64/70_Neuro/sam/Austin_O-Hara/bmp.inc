
;virtual at buffer
;  GIFHEADER:
;    .ID         dd ?
;    .ver        dw ?
;    .width      dw ?
;    .height     dw ?
;    .bits       db ?
;    .background db ?
;    .reserved   db ?
;end virtual

virtual at buffer
  BMPHEADER:
    .ID 	 dw ?	  ;BM
    .filesize	 dd ?
    .res1	 dw ?
    .res2	 dw ?
    .ptrbits	 dw ?
    .bisize	 dd ?
    .biwidth	 dd ?
    .biheight	  dd ?
    .biplanes	 dw ?
    .bibitcount  dw ?
    .bicompress  dd ?
    .bisizeimage dd ?
    .bixppmeter  dd ?
    .biyppmeter  dd ?
    .biclrused	 dd ?
    .biclrimp	 dd ?

end virtual

load_picture:
;    jmp picture_error1
	invoke	CreateFile,esi,GENERIC_READ,0,0,OPEN_EXISTING,0,0
	mov	edi,eax
	invoke	ReadFile,edi,BMPHEADER,40000h,bytes_count,0
;        invoke  ReadFile,edi,GIFHEADER,40000h,bytes_count,0
	invoke	CloseHandle,edi
;BOOL ReadFile(
;  HANDLE hFile,
;  LPVOID lpBuffer,
;  DWORD nNumberOfBytesToRead,
;  LPDWORD lpNumberOfBytesRead,
;  LPOVERLAPPED lpOverlapped
;);
	cmp	[BMPHEADER.ID],'BM'
	jne	picture_error1
	jmp allok1
picture_error1:
	 mov eax, 5 ; [BMPHEADER.ID] ; 1
jmp  picture_error
allok1:

	mov	[ddsd.dwSize],sizeof.DDSURFACEDESC
	mov	[ddsd.dwFlags],DDSD_CAPS+DDSD_WIDTH+DDSD_HEIGHT+DDSD_CKSRCBLT
	mov	[ddsd.ddsCaps.dwCaps],DDSCAPS_OFFSCREENPLAIN+DDSCAPS_SYSTEMMEMORY

mov eax, [BMPHEADER.biwidth]
       shr eax, 16
       mov     [ddsd.dwWidth],eax
mov eax, [BMPHEADER.biheight]
       shr eax, 16
       add eax, 21	  ; for double height
	mov	[ddsd.dwHeight],eax

	cominvk DDraw,CreateSurface,\
		ddsd,DDSPicture,0
	or	eax,eax
	jnz	picture_error

	cominvk DDSPicture,Lock,\
		0,ddsd,DDLOCK_WAIT,0

	mov	esi, buffer
	add	esi, 54
	mov	edi,[ddsd.lpSurface] ; screen upside down so
	mov [surfacestore], edi
       add edi, 25600 ; 12800     ;go to start of last line
mov eax, [BMPHEADER.biheight]
	shr eax, 16
;        mov eax, 40
	mov ebx, eax
mov eax, [BMPHEADER.biwidth]
	shr eax, 16
;        mov eax, 1920
	mov ecx, eax
inloop1:

	movsb
	movsb
	movsb
       stosb
	dec ecx
	jnz inloop1
	sub edi, 2560 ; 1280 ; go back to start of last line
mov eax, [BMPHEADER.biwidth]
	shr eax, 16
;        mov eax, 1920
	mov ecx, eax
	dec ebx
	jnz inloop1
;--------------------------------------------------------
	  mov	  esi, buffer
	add	esi, 54
	mov	edi,[ddsd.lpSurface] ; screen upside down so
	mov [surfacestore], edi
       add edi, 25600 ; 12800     ;go to start of last line
       add edi ,26880
mov eax, [BMPHEADER.biheight]
	shr eax, 16
;        mov eax, 40
	mov ebx, eax
mov eax, [BMPHEADER.biwidth]
	shr eax, 16
;        mov eax, 1920
	mov ecx, eax
inloop12:

	movsb
	movsb
	movsb
       stosb
	dec ecx
	jnz inloop12
	sub edi, 2560 ; 1280 ; go back to start of last line
mov eax, [BMPHEADER.biwidth]
	shr eax, 16
;        mov eax, 1920
	mov ecx, eax
	dec ebx
	jnz inloop12
;---------------------------------------------------------

	cominvk DDSPicture,Unlock,0
;set grey screen
       mov eax, 800
       mov     [ddsd.dwWidth],eax
       mov eax, 600
	mov	[ddsd.dwHeight],eax

	cominvk DDraw,CreateSurface,\
		ddsd,DDSPictureback,0
	or	eax,eax
	jnz	picture_error

	cominvk DDSPictureback,Lock,\
		0,ddsd,DDLOCK_WAIT,0

	mov	edi,[ddsd.lpSurface]
	mov ebx, 600
	mov ecx, 800
	mov eax, 22222222h
inloop2:
      rep  stosd
	mov ecx, 800
	dec ebx
	jnz inloop2
       cominvk DDSPictureback,Unlock,0

; set grey done
	mov	eax,[DDSPicture]
	clc
	ret

    picture_error:
	      mov ebx, 012345678h
	stc
	ret

