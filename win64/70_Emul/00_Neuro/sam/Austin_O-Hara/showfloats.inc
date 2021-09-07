; accesses the floats in store and displays in screen
showfloats:
	cominvk DDSPicture,Lock,\
		0,ddsd,DDLOCK_WAIT,0
mov [patttemp], 0ffh
	mov esi, [naddress2]  ; pattout  ; address source pattern
	add esi, 16	    ; go to outs
;jmp endtest2                  ; next add linenumber * linelength (bytes)
	mov eax, 192		; width of 16 pixels in bytes
	mul [frame]		; ax now has correct starting x-axis
;        add esi, eax            ; esi correct starting address
	mov ebx, 21	;      number of lines to draw
	mov	edi,[surfacestore] ; screen upside down so
	     add edi, 640
       add edi, 25600	  ;go to start of last line
       add edi, [addoffset2]; [addoffset] ; 0 ; 200          ;to display elsewhere
       mov ecx, 4 ; 16 ; pixels wide
nextpixel5:
	fld dword [esi] 	; get pattout float         RED
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [edi], al		;move to screen
	inc edi 		; next pixel colour
	add esi, 4		; next float

	fld dword [esi] 	; get pattout float        BLUE
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [edi], al		;move to screen
	inc edi 		; next pixel colour
	add esi, 4		; next float

	fld dword [esi] 	; get pattout float       GREEN
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
       mov eax, [patttemp]     ;al contains byte
	mov [edi], al		;move to screen
	inc edi 		; next pixel colour
	add esi, 4		; next float
inc edi 		     ;for extra screen thing
	fld dword [esi] 	; get pattout float         RED
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [edi], al		;move to screen
	inc edi 		; next pixel colour
	add esi, 4		; next float
add esi, 32		       ; for next neuron group
	fld dword [esi] 	; get pattout float        BLUE
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [edi], al		;move to screen
	inc edi 		; next pixel colour
	add esi, 4		; next float

	fld dword [esi] 	; get pattout float       GREEN
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
       mov eax, [patttemp]     ;al contains byte
	mov [edi], al		;move to screen
	inc edi 		; next pixel colour
	add esi, 4		; next float

inc edi 		     ;for extra screen thing
	fld dword [esi] 	; get pattout float         RED
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [edi], al		;move to screen
	inc edi 		; next pixel colour
	add esi, 4		; next float

	fld dword [esi] 	; get pattout float        BLUE
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [edi], al		;move to screen
	inc edi 		; next pixel colour
	add esi, 4		; next float
add esi, 32	     ; for next neuron group
	fld dword [esi] 	; get pattout float       GREEN
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
       mov eax, [patttemp]     ;al contains byte
	mov [edi], al		;move to screen
	inc edi 		; next pixel colour
	add esi, 4		; next float
inc edi 		     ;for extra screen thing
	fld dword [esi] 	; get pattout float         RED
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [edi], al		;move to screen
	inc edi 		; next pixel colour
	add esi, 4		; next float

	fld dword [esi] 	; get pattout float        BLUE
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
	mov eax, [patttemp]	;al contains byte
	mov [edi], al		;move to screen
	inc edi 		; next pixel colour
	add esi, 4		; next float

	fld dword [esi] 	; get pattout float       GREEN
	fld [plus256]
	fmulp
	fistp dword [patttemp]	; store integer in temp
       mov eax, [patttemp]     ;al contains byte
	mov [edi], al		;move to screen
	inc edi 		; next pixel colour
	add esi, 4		; next float

	inc edi 		     ;for extra screen thing
add esi, 32
	dec ecx 	       ; next pixel
	jnz nextpixel5
	mov ecx, 4 ; 16
;        add esi, 32 ; 1920           ; add one line (20 * 16 pixels)
;        sub esi, 192            ; go back one line. esi at start of next L
	sub edi, 1280	      ; go back 1 line
	sub edi, 64	      ;  go to start char
	dec ebx
	jnz nextpixel5
endtest2:
	cominvk DDSPicture,Unlock,0

	ret

