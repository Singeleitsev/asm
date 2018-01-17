;;show_rax_xx.inc
;в секции .data? определить переменые:
;eedx dq ?
;eecx dq ?
;template db '0123456789ABCDEF'
;MesMsgBox db 'Отладка (содержимое rax):',0

show_rax	MACRO	
	push	rax
	push	rbx
	push	rcx
	push	rdx

	lea	rbx,template

	push	rax
	and	rax,0f0000000h
	shr	rax,28	
	xlat		
	mov	dl,al	;1
	shl	rdx,8
	pop	rax

	push	rax
	and	rax,0f000000h
	shr	rax,24	
	xlat		
	mov	dl,al	;2
	shl	rdx,8
	pop	rax

	push	rax
	and	rax,0f00000h
	shr	rax,20
	xlat
	mov	dl,al	;3
	shl	rdx,8
	pop	rax

	push	rax
	and	rax,0f0000h
	shr	rax,16
	xlat
	mov	dl,al	;4
	pop	rax

	push	rax
	and	rax,0f000h
	shr	rax,12
	xlat
	mov	cl,al	;1
	shl	rcx,8
	pop	rax

	push	rax
	and	rax,0f00h
	shr	rax,8
	xlat
	mov	cl,al	;2
	shl	rcx,8
	pop	rax

	push	rax
	and	rax,0f0h
	shr	rax,4
	xlat
	mov	cl,al	;3
	shl	rcx,8
	pop	rax

	and	rax,0fh
	xlat
	mov	cl,al	;4

	mov	eedx,rdx
	mov	eecx,rcx

	xor	rcx,rcx
	lea	rdx,eedx
	lea	r8,MesMsgBox
	mov	r9,40h ;MB_ICONINFORMATION+MB_OK
	call	MessageBoxA

	pop	rdx
	pop	rcx
	pop	rbx
	pop	rax
ENDM ;show_rax