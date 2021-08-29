; stores the bitmap as array of floats for later access
; by net

storebmp:

	mov eax, 0
	mov	rsi, buffer
	add	rsi, 54
	mov	rdi, pattin
	mov	rdx, pattout
	mov ebx, 21 ; number of lines * pattpairs
	mov ecx, 480  ; small pic width


pattin16:
	mov al, [rsi]
	mov [patttemp], eax
	fild [patttemp]
	fld [plus256]
	fdivp
	fstp dword [rdi]    ;store in pattin
	inc rsi      ;next byte
	add rdi, 4   ;next float
	dec ecx
	jnz pattin16
	mov ecx, 480
pattout16:
	mov al, [rsi]
	mov [patttemp], eax
	fild [patttemp]
	fld [plus256]
	fdivp
	fstp dword [rdx]    ;store in pattout
	inc rsi      ;next byte
	add rdx, 4   ;next float
	dec ecx
	jnz pattout16
	mov ecx, 480
	dec ebx
	jnz pattin16
ret

