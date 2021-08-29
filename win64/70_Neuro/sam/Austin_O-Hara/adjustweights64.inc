;Adjust all weights
;delta = learningConstant * n2->error * (n1->output + samadCoefficient * n1->error) + delta * momentum;
;delta = 0.3 * n2->error * (n1->output + 0.5 * n1->error) + delta * 0.8
;weight += delta;

adjust1:
;set constants for this sub
	mov eax, point8x4
	movaps xmm7, [eax]     ;load 4x 0.8 floats
	mov eax, point3x4
	movaps xmm3, [eax]     ;load 4x 0.3
	mov eax, point5x4
	movaps xmm5, [eax]     ;load 4x 0.5

       mov ebx, [caddress0]	 ;cnxn 0 add
       mov edx, [ncount0]    ;for all neurons inlayer0
       shr edx, 2	     ; in groups of 4
       mov eax, 4	      ; for all lower neurons in group
       mov ecx, [ncount1]    ;for all neurons inlayer1
       shr ecx, 2	     ; in groups of 4
nextcnxn1:
       mov esi, [ebx] ;     load lower neu address in edx
       movaps xmm4, [esi+16] ; xmm4 contains all lower outputs
       movaps xmm6, [esi+32] ; xmm6 contains all lower errors
       movaps xmm0, xmm6      ; xmm0 = low error
       mulps xmm0, xmm5       ; times by 0.5
       addps xmm0, xmm4      ; xmm0 = (out+0.5error)
       mulps xmm0, xmm3      ; 0.3x(n1out+0.5xn1error) in xmm0
       movaps xmm2, xmm0      ;xmm2 contains 4xlower(out+0.5error)*0.3
nextcnxn2:
       movaps xmm0, xmm2
       shufps xmm0, xmm0, 00000000b ; shuff low float to all floats in xmm0
       mov esi, [ebx+8]      ;load higher neu address in esi
       mulps xmm0, [esi+32]  ;mul by n2 error
       movaps xmm1, [ebx+32]  ;load deltas to xmm1
       mulps xmm1, xmm7       ;0.8xdelta
       addps xmm0, xmm1       ; xmm0 contains new delta
       movaps [ebx+32], xmm0   ;store new delta
       addps xmm0, [ebx+16]	;add weight
       movaps [ebx+16], xmm0	;store new weight
       add ebx, 48    ;next cnxn
       dec ecx
       jnz nextcnxn2
       shufps xmm2, xmm2, 00111001b ; shuff floats right and wrap
       mov ecx, [ncount1]    ;for all neurons inlayer1
       shr ecx, 2	     ; in groups of 4
       dec eax
       jnz nextcnxn2
       mov eax, 4
       dec edx
       jnz nextcnxn1


       mov ebx, [caddress1]	 ;cnxn 0 add
       mov edx, [ncount1]    ;for all neurons inlayer0
       shr edx, 2	     ; in groups of 4
       mov eax, 4	      ; for all lower neurons in group
       mov ecx, [ncount2]    ;for all neurons inlayer1
       shr ecx, 2	     ; in groups of 4
nextcnxn12:
       mov esi, [ebx] ;     load lower neu address in edx
       movaps xmm4, [esi+16] ; xmm4 contains all lower outputs
       movaps xmm6, [esi+32] ; xmm6 contains all lower errors
       movaps xmm0, xmm6      ; xmm0 = low error
       mulps xmm0, xmm5       ; times by 0.5
       addps xmm0, xmm4      ; xmm0 = (out+0.5error)
       mulps xmm0, xmm3      ; 0.3x(n1out+0.5xn1error) in xmm0
       movaps xmm2, xmm0      ;xmm2 contains 4xlower(out+0.5error)*0.3
nextcnxn22:
       movaps xmm0, xmm2
       shufps xmm0, xmm0, 00000000b ; shuff low float to all floats in xmm0
       mov esi, [ebx+8]      ;load higher neu address in edx
       mulps xmm0, [esi+32]  ;mul by n2 error
       movaps xmm1, [ebx+32]  ;load deltas to xmm1
       mulps xmm1, xmm7       ;0.8xdelta
       addps xmm0, xmm1       ; xmm0 contains new delta
       movaps [ebx+32], xmm0   ;store new delta
       addps xmm0, [ebx+16]	;add weight
       movaps [ebx+16], xmm0	;store new weight
       add ebx, 48    ;next cnxn
       dec ecx
       jnz nextcnxn22
       shufps xmm2, xmm2, 00111001b ; shuff floats right and wrap
       mov ecx, [ncount2]    ;for all neurons inlayer1
       shr ecx, 2	     ; in groups of 4
       dec eax
       jnz nextcnxn22
       mov eax, 4
       dec edx
       jnz nextcnxn12

ret