; accesses the floats in store and displays in screen
showfloats:
	mov	rdi,[ddsd.lpSurface]	 ;set destination
	mov rax, [ddsd.lPitch]
	mov rbx, 43
	mul rbx
	add rdi, rax
;        add rdi, 154112     ;go down 43 lines (3584 per line)
	add rdi, 640	 ;move horizontal to start under matching

;------------------------------------------------------------------
	mov [patttemp], 0ffh
	mov rsi, [naddress2abs]  ; address source pattern
	add rsi, 16	    ; go to outs
	mov ebx, 21	;      number of lines to draw
       add rdi, [addoffset2]; to display consecutive numbers
       mov ecx, 4 ;
nextpixel5:
	fld dword [rsi] 	; get pattout float         RED
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [rdi], al		;move to screen
	inc rdi 		; next pixel colour
	add rsi, 4		; next float

	fld dword [rsi] 	; get pattout float        BLUE
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [rdi], al		;move to screen
	inc rdi 		; next pixel colour
	add rsi, 4		; next float

	fld dword [rsi] 	; get pattout float       GREEN
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
       mov eax, [patttemp]     ;al contains byte
	mov [rdi], al		;move to screen
	inc rdi 		; next pixel colour
	add rsi, 4		; next float
inc rdi 		     ;for extra screen thing
	fld dword [rsi] 	; get pattout float         RED
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [rdi], al		;move to screen
	inc rdi 		; next pixel colour
	add rsi, 4		; next float
add rsi, 32		       ; for next neuron group
	fld dword [rsi] 	; get pattout float        BLUE
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [rdi], al		;move to screen
	inc rdi 		; next pixel colour
	add rsi, 4		; next float

	fld dword [rsi] 	; get pattout float       GREEN
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
       mov eax, [patttemp]     ;al contains byte
	mov [rdi], al		;move to screen
	inc rdi 		; next pixel colour
	add rsi, 4		; next float

inc rdi 		     ;for extra screen thing
	fld dword [rsi] 	; get pattout float         RED
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [rdi], al		;move to screen
	inc rdi 		; next pixel colour
	add rsi, 4		; next float

	fld dword [rsi] 	; get pattout float        BLUE
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [rdi], al		;move to screen
	inc rdi 		; next pixel colour
	add rsi, 4		; next float
add rsi, 32	     ; for next neuron group
	fld dword [rsi] 	; get pattout float       GREEN
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
       mov eax, [patttemp]     ;al contains byte
	mov [rdi], al		;move to screen
	inc rdi 		; next pixel colour
	add rsi, 4		; next float
inc rdi 		     ;for extra screen thing
	fld dword [rsi] 	; get pattout float         RED
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [rdi], al		;move to screen
	inc rdi 		; next pixel colour
	add rsi, 4		; next float

	fld dword [rsi] 	; get pattout float        BLUE
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [rdi], al		;move to screen
	inc rdi 		; next pixel colour
	add rsi, 4		; next float

	fld dword [rsi] 	; get pattout float       GREEN
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
       mov eax, [patttemp]     ;al contains byte
	mov [rdi], al		;move to screen
	inc rdi 		; next pixel colour
	add rsi, 4		; next float

	inc rdi 		     ;for extra screen thing
add rsi, 32
	dec ecx 	       ; next pixel
	jnz nextpixel5
	mov ecx, 4 ; 16
;        add esi, 32 ; 1920           ; add one line (20 * 16 pixels)
;        sub esi, 192            ; go back one line. esi at start of next L
	sub rdi, 3584 ; 1280         ; go back 1 line
	sub edi, 64	      ;  go to start char
	dec ebx
	jnz nextpixel5


	ret

