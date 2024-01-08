setrand:
     mov ecx, [ccount0]
     add ecx, [ccount1]     ; ecx holds number of cnxns
     shr ecx, 2 	 ; each loop does 4
mov [loopcount], ecx	  ; no registers for this

     mov edi, [caddress0]   ; address of first connection
     add edi, 16	     ; address of first weight
		mov esi, 4
		mov eax, point000004   ; this normalises the weights to
		movaps xmm1, [eax]     ; +/- 0.016324
nextseed3:
		mov bx, 32749
		mov cx, 32649
		mov ax, [seed1]
		mul bx		;ax now [seed1] x bx
		mov bx, 32497
		add ax, cx
		div bx		;ax/bx , remainder is stored in dx
		mov [seed1], dx       ;and becomes the next seed
		mov eax, 0
		mov ax, dx
		cvtsi2ss xmm0, eax   ; convert eax int to float 0-32648
		subss xmm0, [div2]   ; sub 16324.0 - vary about zero
		mulss xmm0, xmm1     ;divide by 1 0 000 get 0-0.016324
;                xmm0 is weight
       shufps xmm0, xmm0, 00111001b ; shuff floats right and wrap
		dec esi
		jnz nextseed3
	    movaps [edi], xmm0	   ; store 4 randoms
	    mov esi, 4
	    add edi, 48
	    mov eax, [loopcount]
	    dec eax
	    mov [loopcount], eax
	    jnz nextseed3


	ret