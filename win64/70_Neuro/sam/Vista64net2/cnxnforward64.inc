;This has four sections...
;1 move through cnxns from input neuron output queues to layer1 neurons
;2 summation through layer1 neurons transfer function
;3 move through cnxns from layer1 neuron output queues to layer2 neurons
;4 summation through layer2 neurons transfer function
cnxnforward:
	mov r8, [caddress0abs]
	mov r9, [caddress1abs]
	mov r10,[naddress0abs]
;cnxn forward before layer1
	mov ecx, [ccount0]	       ;number of cnxns
	mov rbx, [caddress0abs] 	 ; address of first cnxn
	shr ecx, 2	  ; each loop does 4
cnxnfor1:  ; this moves forward in 1st cnxn layer
       mov eax, [rbx]
       add rax, r10	;address of lower neu base in rax
       mov edx, [rbx+4]
       add rdx, rax	 ; address of correct neuron input now in rdx

       movss xmm0, [rdx+16]   ;mov single prec 32-bit to low xmm0
       shufps xmm0, xmm0, 00000000b ; shuff low float to all floats in xmm0
       movaps xmm7, [rbx+16]  ; load in all weights
       mulps xmm0, xmm7       ; multiply
       mov eax, [rbx+8]
       add rax, r10	 ;address of higher neu in rax
       addps xmm0, [rax]   ;sum all 4 neuron inputs
       movaps [rax], xmm0   ; replace back to inputs
       add rbx, 48	  ;address next cnxn
       dec ecx
       jnz cnxnfor1

neuronforward:	 ;this moves forward in neuron layer1
;set constants for this sub
	mov rax, minus2x4
	movaps xmm2, [rax]     ;load 4x -1.0 floats
	mov rax, plus1x4
	movaps xmm1, [rax]     ;load 4x1.0
	mov rax, plus3x4
	movaps xmm3, [rax]     ;load 4x0.5
	mov rax, ffffx4
	movaps xmm5, [rax]     ;load 4x0.5

	mov ecx, [ncount1]	     ;for neurons in layer1
	mov rbx, [naddress1abs]       ;address of first neuron
	shr ecx, 2	  ; each loop does 4 leave for now
; original exponential TX function too difficult to implement in SIMD
;output = 1 / (1 + exp(-1 * 3 * input));
; trying new reciprocal function
;if x>0  y = (-2(x+1))**-1 + 1
; if x<0 y = (-2(x-1))**-1
; code for recip here
nfin:
	movaps xmm6, [rbx]    ;load 4x nueron inputs
	movaps xmm7, xmm6
	xorps xmm0, xmm0      ; zero xmm0
	cmpps xmm7, xmm0, 5 ; xmm7 = mask, FFFF for >0 0000 for <0
	movaps xmm0, xmm6     ;mov inputs to xmm0
	andps xmm0, xmm7      ;only +ve left
	mulps xmm0, xmm3      ; mul by 3
	addps xmm0, xmm1       ; add 1
	mulps xmm0, xmm2	; mul by -2
	rcpps xmm0, xmm0	    ; reciprocal
	addps xmm0, xmm1     ; add 1
	andps xmm0, xmm7     ; zero unwanted
	movaps xmm4, xmm0     ; move result to xmm4

	xorps xmm7, xmm5      ; invert mask, xmm5 is ffff ffff ffff
	movaps xmm0, xmm6     ;mov inputs to xmm0
	andps xmm0, xmm7      ;only -ve left
	mulps xmm0, xmm3      ; mul by 3
	subps xmm0, xmm1       ; sub 1
	mulps xmm0, xmm2	; mul by -2
	rcpps xmm0, xmm0	    ; reciprocal
	andps xmm0, xmm7     ; zero unwanted
	addps xmm0, xmm4     ; result in xmm0
	movaps [rbx+16], xmm0 ; shift to neuron outputs
	add rbx, 48	     ; go to start of next group inputs
	dec ecx 	     ;for each group
	jnz nfin

;cnxn forward for layer1/2
	mov ecx, [ccount1]	       ;number of cnxns
	mov rbx, [caddress1abs] 	 ; address of first cnxn
	shr ecx, 2	  ; each loop does 4
cnxnfor12:  ; this moves forward in 1st cnxn layer
       mov eax, [rbx]	 ;address of lower neu base in eax
       mov edx, [rbx+4]
       add edx, eax
       add rdx, r10	; address of correct neuron input now in rdx

       movss xmm0, [rdx+16]   ;mov single prec 32-bit to low xmm0
       shufps xmm0, xmm0, 00000000b ; shuff low float to all floats in xmm0
       movaps xmm7, [rbx+16]  ; load in all weights
       mulps xmm0, xmm7       ; multiply
       mov eax, [rbx+8]
       add rax, r10	 ;address of higher neu in rax
       addps xmm0, [rax]   ;sum all 4 neuron inputs
       movaps [rax], xmm0   ; replace back to inputs
       add rbx, 48	  ;address next cnxn
       dec ecx
       jnz cnxnfor12

;mov NeuronForward in layer2

	mov ecx, [ncount2]	     ;for neurons in layer1
	mov rbx, [naddress2abs]       ;address of first neuron
	shr ecx, 2	  ; each loop does 4 leave for now
; original exponential TX function too difficult to implement in SIMD
;output = 1 / (1 + exp(-1 * 3 * input));
; trying new reciprocal function
;if x>0  y = (-2(x+1))**-1 + 1
; if x<0 y = (-2(x-1))**-1
; code for recip here
nfin2:
	movaps xmm6, [rbx]    ;load 4x nueron inputs
	movaps xmm7, xmm6
	xorps xmm0, xmm0      ; zero xmm0
	cmpps xmm7, xmm0, 5 ; xmm7 = mask, FFFF for >0 0000 for <0
	movaps xmm0, xmm6     ;mov inputs to xmm0
	andps xmm0, xmm7      ;only +ve left
	mulps xmm0, xmm3      ; mul by 3
	addps xmm0, xmm1       ; add 1
	mulps xmm0, xmm2	; mul by -2
	rcpps xmm0, xmm0	    ; reciprocal
	addps xmm0, xmm1     ; add 1
	andps xmm0, xmm7     ; zero unwanted
	movaps xmm4, xmm0     ; move result to xmm4

	xorps xmm7, xmm5      ; invert mask, xmm5 is ffff ffff ffff
	movaps xmm0, xmm6     ;mov inputs to xmm0
	andps xmm0, xmm7      ;only -ve left
	mulps xmm0, xmm3      ; mul by 3
	subps xmm0, xmm1       ; sub 1
	mulps xmm0, xmm2	; mul by -2
	rcpps xmm0, xmm0	    ; reciprocal
	andps xmm0, xmm7     ; zero unwanted
	addps xmm0, xmm4     ; result in xmm0
	movaps [rbx+16], xmm0 ; shift to neuron outputs
	add rbx, 48	     ; go to start of next group inputs
	dec ecx 	     ;for each group
	jnz nfin2

	ret