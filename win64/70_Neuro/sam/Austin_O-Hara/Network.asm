; This is the wrapper for the neural net prog
;the neural net forward pass and backprop will be in the paint loop.

format PE GUI 4.0
entry start
include 'win32a.inc'
include 'data.inc'
include 'setcnxnadd64.inc'
include 'cnxnforward64.inc'
include 'calcouterror64.inc'
include 'calcmiderror64.inc'
include 'adjustweights64.inc'
include 'setforiter64.inc'
include 'setrandom64.inc'

include 'ddraw.inc'
include 'bmp.inc'
include 'storebmp.inc'
include 'showfloats.inc'
include 'win1.inc'
include 'win2.inc'

section '.bss' readable writeable
gdisurface1 dd ?
gdipoin dd ? ; DirectDrawSurface
;gdisurface1 ;  DirectDrawSurface
  hinstance dd ?
  hwnd dd ?
  wc WNDCLASS
  msg MSG

   testing1 DDSURFACEDESC
  ddsd DDSURFACEDESC
  ddscaps DDSCAPS

  DDraw DirectDraw
  DDSPrimary DirectDrawSurface
  DDSBack DirectDrawSurface

  DDSPicture DirectDrawSurface
  DDSPictureback DirectDrawSurface
  DDPalette DirectDrawPalette

  bytes_count dd ?
  last_tick dd ?
  frame db ?
  active db ?
  LZW_bits db ?
  LZW_table rd (0F00h-2)*2
  buffer rb 40000h
  rect RECT
surfaceptr1 dd ?

section '.code' code readable executable

  start:

call win1   ; this removes stuff from this file for clarity
;-------------------------------------------------------------
; This sets up the connections according to network parameters in
; data.inc, moves neuron addresses to cnxns and initializes random weights
	       mov [caddress0], cnxns	 ; cnxn0 address
	       mov [naddress0], neurons ; nin0    ; neuron0 address
	       call setcnxnadd
	       call setrand
;--------------------------------------------------------------------

	jmp	paint

main_loop:

	invoke	PeekMessage,msg,NULL,0,0,PM_NOREMOVE
	or	eax,eax
	jz	no_message
	invoke	GetMessage,msg,NULL,0,0
	or	eax,eax
	jz	end_loop
	invoke	TranslateMessage,msg
	invoke	DispatchMessage,msg

	jmp	main_loop

    no_message:

	cmp	[active],0
	je	sleep

	cominvk DDSPrimary,IsLost
	or	eax,eax
	jz	paint
	cmp	eax,DDERR_SURFACELOST
	jne	end_loop

	cominvk DDSPrimary,Restore

paint:
;These offsets step through corresponding pairs of input and output BMPs
	mov eax, [addoffset]
	add eax, 192
	cmp eax, 1920
	jnz saveadd
	 mov eax, 0
saveadd: mov [addoffset], eax
	mov eax, [addoffset2]
	add eax, 64
	cmp eax, 640
	jnz saveadd2
	 mov eax, 0
saveadd2: mov [addoffset2], eax
; this does a single forward pass and backward prop through the net
	       call setforiter1
	       call cnxnforward
	       call calcouterror
	       call calcmiderror
	       call adjust1
;--------------------------------------------------------------------
; the rest of this file draws the pictures
	mov	[rect.top],0
	mov	[rect.bottom],600
	mov	[rect.left],0
	mov	[rect.right],800
; this uses DDSBack command to copy pixels from DDSPicture to DDSBack
; ie the background surface then contains the main gif.

	cominvk DDSBack,BltFast,\
		0,0,[DDSPictureback],rect,DDBLTFAST_SRCCOLORKEY

	movzx	  ebx, [frame]
	mov eax, 0
	mov	[rect.top],eax
	mov eax, 21
	mov	[rect.bottom],eax
	mov eax, 16
	mul ebx
	mov	[rect.left],eax
	add eax, 16 ; 0
	mov	[rect.right],eax

;This copies the relavant gif small pic to DDSBack, merging by
; colorkey

	cominvk DDSBack,BltFast,\
		344,170,[DDSPicture],rect,DDBLTFAST_SRCCOLORKEY

	movzx	  ebx, [frame]
	mov eax, 0
	mov	[rect.top],eax
	mov eax, 21
	mov	[rect.bottom],eax
	mov eax, 16
	mul ebx
	add eax, 160
	mov	[rect.left],eax
	add eax, 16 ; 0
	mov	[rect.right],eax

;This copies the relavant gif small pic to DDSBack, merging by
; colorkey

	cominvk DDSBack,BltFast,\
		360,170,[DDSPicture],rect,DDBLTFAST_SRCCOLORKEY

;mov eax, 0
;        mov     [rect.top],eax
;mov eax, 21
;        mov     [rect.bottom],eax
;mov eax, 0
;        mov     [rect.left],eax
;add eax, 319
;        mov     [rect.right],eax
;call showfloats    ;this moves float array to screen
;        cominvk DDSBack,BltFast,\
;                200,175,[DDSPicture],rect,DDBLTFAST_SRCCOLORKEY



mov eax, 0
	mov	[rect.top],eax
mov eax, 42 ; 21
	mov	[rect.bottom],eax
mov eax, 0
	mov	[rect.left],eax
add eax, 319
	mov	[rect.right],eax
call showfloats    ;this moves float array to screen
	cominvk DDSBack,BltFast,\
		200,200,[DDSPicture],rect,DDBLTFAST_SRCCOLORKEY


; this flips to DDSPrimary
	cominvk DDSPrimary,Flip,0,0


	invoke	GetTickCount
	mov	ebx,eax
	sub	ebx,[last_tick]
	cmp	ebx, 500 ; 20
	;jmp main_loop
	jb	main_loop
	add	[last_tick], 500 ; 20

	inc	[frame]
	cmp	[frame],10
	jb	main_loop
	mov	[frame],0
	jmp	main_loop


