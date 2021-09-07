setrand:
     mov ecx, [ccount0]
     add ecx, [ccount1]     ; ecx holds number of cnxns
     shr ecx, 2 	 ; each loop does 4
mov [loopcount], ecx	  ; no registers for this

     mov rdi, [caddress0abs]   ; address of first connection
     add rdi, 16	     ; address of first weight
		mov esi, 4
		mov eax, point000004   ; this normalises the weights to
		movaps xmm1, [eax]     ; +/- 0.016324
nextseed3:
		mov ebx, 32749
		mov ecx, 32649
		mov eax, [seed1]
		mul ebx 	 ;ax now [seed1] x bx
		mov ebx, 32497
		add eax, ecx
		div ebx 	 ;ax/bx , remainder is stored in dx
		mov [seed1], edx       ;and becomes the next seed
		mov eax, 0
		mov eax, edx
		cvtsi2ss xmm0, eax   ; convert eax int to float 0-32648
		subss xmm0, [div2]   ; sub 16324.0 - vary about zero
		mulss xmm0, xmm1     ;divide by 1 0 000 get 0-0.016324
;                xmm0 is weight
       shufps xmm0, xmm0, 00111001b ; shuff floats right and wrap
		dec esi
		jnz nextseed3
	    movaps [rdi], xmm0	   ; store 4 randoms
	    mov esi, 4
	    add rdi, 48
	    mov eax, [loopcount]
	    dec eax
	    mov [loopcount], eax
	    jnz nextseed3


	ret