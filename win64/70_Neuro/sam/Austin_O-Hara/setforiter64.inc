setforiter1:
;1st set input patterns to input neuron output queues
	mov edx, pattin      ;the address of the relavant pattern
	add edx, [addoffset]
	mov ebx, [naddress0]	 ;expects start of neurons
	add ebx, 16   ; go to outs
	mov ecx, 21 ; [ncount0]    21 rows
;        shr ecx, 2     ; divide by 2 each loop does 4 floats
		       ; and each layer neuron count is multiple of 4
	mov eax, 12 ; inner loop to only get first picture
nextpatt1:
	 movaps xmm0, [edx]
	 movaps [ebx], xmm0
	 add edx, 16
	 add ebx, 48
;        mov edx, [pattptr1]      ;the address of the relavant pattern
;        add ebx, 32            ; go to next outputs
	dec eax 	;counting number of input neurons
	jnz nextpatt1
	mov eax, 12
	add edx, 1728
	dec ecx
	jnz nextpatt1

;2nd set n4-n11 neuron inputs to zero
	mov ecx, [ncount1]
	add ecx, [ncount2]  ;ecx now has no. of neus in (layer1+layer2)
	shr ecx, 2	   ; each loop does 4
	mov edx, [naddress1] ; layer1 address
nextnzero1:
	xorps xmm0, xmm0
	movaps [edx], xmm0
	add edx, 48	   ; go to next input
	dec ecx
	jnz nextnzero1

ret