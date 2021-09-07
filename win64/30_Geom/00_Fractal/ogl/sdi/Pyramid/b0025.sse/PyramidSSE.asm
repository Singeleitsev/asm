.PyramidModeSSE:

;Load First Four 32-bit Variables
 ;movups xmm3, yword [P]

;Compute
;xmm3 = P+N
 addps xmm3,xword [rdx]
;xmm3 = (P+N)/2
 divps xmm3,xword [two]

;Store Data
 movups xword [P],xmm3

;Shift to Next Four 32-bit Variables
 add rdx,10h
 ;movups xmm4, yword [P+10h]

;Compute
;xmm4 = P+N
 addps xmm4,xword [rdx]
;xmm4 = (P+N)/2
 divps xmm4,xword [two]

;Store Data
 movups xword [P+10h],xmm4


jmp .PyramidDraw
