;;show.inc
;в сегменте данных определить три переменые:
;eedx	dd	0
;eecx	dd	0,0
;template	db	'0123456789ABCDEF'
;MesMsgBox	db	'Отладка (содержимое eax):',0
show_eax	MACRO	
	push	eax
	push	ebx
	push	ecx
	push	edx

	lea	ebx,template

	push	eax
	and	eax,0f0000000h
	shr	eax,28	
	xlat		
	mov	dl,al	;1
	shl	edx,8
	pop	eax


	push	eax
	and	eax,0f000000h
	shr	eax,24	
	xlat		
	mov	dl,al	;2
	shl	edx,8
	pop	eax

	push	eax
	and	eax,0f00000h
	shr	eax,20
	xlat
	mov	dl,al	;3
	shl	edx,8
	pop	eax

	push	eax
	and	eax,0f0000h
	shr	eax,16
	xlat
	mov	dl,al	;4
	pop	eax


	push	eax
	and	eax,0f000h
	shr	eax,12
	xlat
	mov	cl,al	;1
	shl	ecx,8
	pop	eax

	push	eax
	and	eax,0f00h
	shr	eax,8
	xlat
	mov	cl,al	;2
	shl	ecx,8
	pop	eax

	push	eax
	and	eax,0f0h
	shr	eax,4
	xlat
	mov	cl,al	;3
	shl	ecx,8
	pop	eax


	and	eax,0fh
	xlat
	mov	cl,al	;4

	mov	eedx,edx
	mov	eecx,ecx
	push	MB_ICONINFORMATION+MB_OK
	push	offset MesMsgBox
	push	offset  eedx
	push	0
	call	MessageBoxA

	pop	edx
	pop	ecx
	pop	ebx
	pop	eax
ENDM