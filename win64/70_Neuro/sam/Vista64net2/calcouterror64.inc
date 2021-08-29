;calculate output error
calcouterror:
;load required constant
	mov rax, plus1x4
	movaps xmm7, [rax]     ;load 4x 1.0 floats
; setup loops
       mov rbx, pattout  ;using this pattern address
       add rbx, [addoffset]
       mov rdx, [naddress2abs]
       mov ecx, 21 ; for each line  ; [ncount2]
       mov eax, 12
nexterror1:
; (patt-Out)(1-Out)(Out)=error
       movaps xmm1, [rbx]    ;load patt in xmm1
       movaps xmm0, [rdx+16]	; load output in xmm0
       subps xmm1, xmm0      ;
       mulps xmm1, xmm0      ; xmm1 = (Patt-Out)x(Out)
       movaps xmm2, xmm7     ; xmm2 = 4x1.0
       subps xmm2, xmm0      ; xmm2 = (1-Out)
       mulps xmm1, xmm2      ; xmm1 = (patt-Out)(1-Out)(Out)
       movaps [rdx+32], xmm1  ; load into error
       add rdx, 48	  ; go to next neu group
       add rbx, 16
       dec eax
       jnz nexterror1
	mov eax, 12
	add rbx, 1728
	dec ecx
	jnz nexterror1
ret