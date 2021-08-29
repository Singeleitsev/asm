setforiter1:
;1st set input patterns to input neuron output queues
	mov rdx, pattin      ;the address of the relavant pattern
	add rdx, [addoffset]
	mov rbx, [naddress0abs]     ;expects start of neurons
	add rbx, 16   ; go to outs
	mov ecx, 21 ; [ncount0]    21 rows
;        shr ecx, 2     ; divide by 2 each loop does 4 floats
		       ; and each layer neuron count is multiple of 4
	mov eax, 12 ; inner loop to only get first picture
nextpatt1:
	 movaps xmm0, [rdx]
	 movaps [rbx], xmm0
	 add rdx, 16
	 add rbx, 48
	dec eax 	;counting number of input neurons
	jnz nextpatt1
	mov eax, 12
	add rdx, 1728
	dec ecx
	jnz nextpatt1

;2nd set n4-n11 neuron inputs to zero
	mov ecx, [ncount1]
	add ecx, [ncount2]  ;ecx now has no. of neus in (layer1+layer2)
	shr ecx, 2	   ; each loop does 4
	mov rdx, [naddress0abs]
	mov eax, [naddress1]
	add rdx, rax ; layer1 address
nextnzero1:
	xorps xmm0, xmm0
	movaps [rdx], xmm0
	add rdx, 48	   ; go to next input
	dec ecx
	jnz nextnzero1

ret