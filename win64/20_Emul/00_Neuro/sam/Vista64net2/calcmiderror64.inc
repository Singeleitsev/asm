;calculate middle error
calcmiderror:
       mov r10,  [naddress0abs]
; load constant
	mov rax, plus1x4
	movaps xmm6, [rax]     ;load 4x 1.0 floats

       mov rbx, [caddress1abs]	    ;cnxn layer1/2 address
       mov eax, [ncount1] ; for each middle neuron.........
newneu2:
       xorps xmm7, xmm7     ;zero intermediate error
       mov ecx, [ncount2]  ; .......going through each upper neuron
       shr ecx, 2	   ; in groups of 4
nexterror32:

       mov edx, [rbx+8] ;     load upper neu address in edx
       add rdx, r10
       movaps xmm1, [rdx+32]  ;xmm1 = upper neuron errors
       mulps xmm1, [rbx+16]  ;xmm1 = errors x weights
       addps xmm7, xmm1      ; xmm7 = sum of errors

       add rbx, 48    ;next cnxn
       dec ecx
       jnz nexterror32

       movaps xmm1, xmm7
       movaps xmm2, xmm7
       movaps xmm3, xmm7	    ;  floats moved to low order
       shufps xmm1, xmm1, 00000001b ;  float in 3 registers
       shufps xmm2, xmm2, 00000010b ;  xmm7 already there
       shufps xmm3, xmm3, 00000011b ;
       addss xmm7, xmm1
       addss xmm7, xmm2
       addss xmm7, xmm3 ;xmm7(low order)= all float errors attained above

       sub rbx, 48   ; must stay in lower 4 cnxns
       mov edx, [rbx]
       add edx, [rbx+4]  ; edx points to correct neuron input
       add rdx, r10	    ; now low neu add in rdx
       add rbx, 48   ; ready for next set of 4 cnxns

       movaps xmm1, xmm6    ;load 1.0s to xmm1
       subss xmm1, [rdx+16] ; xmm1 = (1-LowOut)
       mulss xmm1, [rdx+16] ; xmm1 = (1-LowOut)(LowOut)
       mulss xmm1, xmm7     ; xmm1 = (1-LowOut)(LowOut)(error)
       movss [rdx+32], xmm1 ;mov single prec 32-bit to
			     ;lower neuron error
       dec eax
       jnz newneu2
testend1:
ret