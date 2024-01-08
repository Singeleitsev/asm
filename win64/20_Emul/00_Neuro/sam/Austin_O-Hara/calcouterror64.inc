;calculate output error
calcouterror:
;load required constant
	mov eax, plus1x4
	movaps xmm7, [eax]     ;load 4x 1.0 floats
; setup loops
       mov ebx, pattout  ;using this pattern address
       add ebx, [addoffset]
       mov edx, [naddress2]
       mov ecx, 21 ; for each line  ; [ncount2]
;       shr ecx, 2
       mov eax, 12
nexterror1:
; (patt-Out)(1-Out)(Out)=error
       movaps xmm1, [ebx]    ;load patt in xmm1
       movaps xmm0, [edx+16]	; load output in xmm0
       subps xmm1, xmm0      ;
       mulps xmm1, xmm0      ; xmm1 = (Patt-Out)x(Out)
       movaps xmm2, xmm7     ; xmm2 = 4x1.0
       subps xmm2, xmm0      ; xmm2 = (1-Out)
       mulps xmm1, xmm2      ; xmm1 = (patt-Out)(1-Out)(Out)
       movaps [edx+32], xmm1  ; load into error
       add edx, 48	  ; go to next neu group
       add ebx, 16
       dec eax
       jnz nexterror1
	mov eax, 12
	add ebx, 1728
	dec ecx
	jnz nexterror1
ret