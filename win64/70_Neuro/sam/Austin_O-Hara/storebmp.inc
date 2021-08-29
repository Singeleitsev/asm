; stores the bitmap as array of floats for later access
; by net

storebmp:

	mov eax, 0
	mov	esi, buffer
	add	esi, 54
	mov	edi, pattin
	mov	edx, pattout
	mov ebx, 21 ; number of lines * pattpairs
	mov ecx, 480  ; small pic width


pattin16:
	mov al, [esi]
	mov [patttemp], eax
	fild [patttemp]
	fld [plus256]
	fdivp
	fstp dword [edi]    ;store in pattin
	inc esi      ;next byte
	add edi, 4   ;next float
	dec ecx
	jnz pattin16
	mov ecx, 480
pattout16:
	mov al, [esi]
	mov [patttemp], eax
	fild [patttemp]
	fld [plus256]
	fdivp
	fstp dword [edx]    ;store in pattout
	inc esi      ;next byte
	add edx, 4   ;next float
	dec ecx
	jnz pattout16
	mov ecx, 480
	dec ebx
	jnz pattin16
ret

