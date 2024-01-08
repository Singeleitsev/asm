;Adjust all weights
;delta = learningConstant * n2->error * (n1->output + samadCoefficient * n1->error) + delta * momentum;
;delta = 0.1 * n2->error * (n1->output + 0.5 * n1->error) + delta * 0.1
;weight += delta;

adjust1:
       mov r10,  [naddress0abs]
       mov r8d, [ncount1]
       mov r9d, [ncount2]
;set constants for this sub
	mov rax, point8x4	;momentum
	movaps xmm7, [rax]     ;load 4x 0.8 floats (0.1 better)
	mov rax, point3x4	 ;samadcoefficient
	movaps xmm3, [rax]     ;load 4x 0.3  (0.1 better)
	mov rax, point5x4	 ;learning constant
	movaps xmm5, [rax]     ;load 4x 0.5

       mov rbx, [caddress0abs]	    ;cnxn 0 add
       mov edx, [ncount0]    ;for all neurons inlayer0
       shr edx, 2	     ; in groups of 4
       mov eax, 4	      ; for all lower neurons in group
       mov ecx, [ncount1]    ;for all neurons inlayer1
       shr ecx, 2	     ; in groups of 4
nextcnxn1:
       mov esi, [rbx] ;
       add rsi, r10   ;      load lower neu address in rsi
       movaps xmm4, [rsi+16] ; xmm4 contains all lower outputs
       movaps xmm6, [rsi+32] ; xmm6 contains all lower errors
       movaps xmm0, xmm6      ; xmm0 = low error
       mulps xmm0, xmm5       ; times by 0.5
       addps xmm0, xmm4      ; xmm0 = (out+0.5error)
       mulps xmm0, xmm3      ; 0.3x(n1out+0.5xn1error) in xmm0
       movaps xmm2, xmm0      ;xmm2 contains 4xlower(out+0.5error)*0.3
nextcnxn2:
       movaps xmm0, xmm2
       shufps xmm0, xmm0, 00000000b ; shuff low float to all floats in xmm0
       mov esi, [rbx+8]
       add rsi, r10	     ;load higher neu address in esi
       mulps xmm0, [rsi+32]  ;mul by n2 error
       movaps xmm1, [rbx+32]  ;load deltas to xmm1
       mulps xmm1, xmm7       ;0.8xdelta
       addps xmm0, xmm1       ; xmm0 contains new delta
       movaps [rbx+32], xmm0   ;store new delta
       addps xmm0, [rbx+16]	;add weight
       movaps [rbx+16], xmm0	;store new weight
       add rbx, 48    ;next cnxn
       dec ecx
       jnz nextcnxn2
       shufps xmm2, xmm2, 00111001b ; shuff floats right and wrap
       mov ecx, r8d ;[ncount1]    ;for all neurons inlayer1
       shr ecx, 2	     ; in groups of 4
       dec eax
       jnz nextcnxn2
       mov eax, 4
       dec edx
       jnz nextcnxn1


       mov rbx, [caddress1abs]	    ;cnxn 0 add
       mov edx, [ncount1]    ;for all neurons inlayer0
       shr edx, 2	     ; in groups of 4
       mov eax, 4	      ; for all lower neurons in group
       mov ecx, [ncount2]    ;for all neurons inlayer1
       shr ecx, 2	     ; in groups of 4
nextcnxn12:
       mov esi, [rbx] ;     load lower neu address in edx
       add rsi, r10	     ;load higher neu address in esi
       movaps xmm4, [rsi+16] ; xmm4 contains all lower outputs
       movaps xmm6, [rsi+32] ; xmm6 contains all lower errors
       movaps xmm0, xmm6      ; xmm0 = low error
       mulps xmm0, xmm5       ; times by 0.5
       addps xmm0, xmm4      ; xmm0 = (out+0.5error)
       mulps xmm0, xmm3      ; 0.3x(n1out+0.5xn1error) in xmm0
       movaps xmm2, xmm0      ;xmm2 contains 4xlower(out+0.5error)*0.3
nextcnxn22:
       movaps xmm0, xmm2
       shufps xmm0, xmm0, 00000000b ; shuff low float to all floats in xmm0
       mov esi, [rbx+8]      ;load higher neu address in edx
       add rsi, r10	     ;load higher neu address in esi
       mulps xmm0, [rsi+32]  ;mul by n2 error
       movaps xmm1, [rbx+32]  ;load deltas to xmm1
       mulps xmm1, xmm7       ;0.8xdelta
       addps xmm0, xmm1       ; xmm0 contains new delta
       movaps [rbx+32], xmm0   ;store new delta
       addps xmm0, [rbx+16]	;add weight
       movaps [rbx+16], xmm0	;store new weight
       add rbx, 48    ;next cnxn
       dec ecx
       jnz nextcnxn22
       shufps xmm2, xmm2, 00111001b ; shuff floats right and wrap
       mov ecx, r9d ; [ncount2]    ;for all neurons inlayer2
       shr ecx, 2	     ; in groups of 4
       dec eax
       jnz nextcnxn22
       mov eax, 4
       dec edx
       jnz nextcnxn12

ret