.PyramidModeSSE:
;Optimizing Algorithm for SSE computing
;P = (P+N)/2 = (P+N) * 0.5,
;where
;P - 4 variables of Point in 128 bits of xmm0
;N - 4 constants of Vertices from memory

;Load First Four 32-bit Variables
 ;movups xmm3, yword [P]

;Compute
;xmm3 = P+N
 addps xmm3,xword [rdx]
;xmm3 = (P+N)*0.5
 mulps xmm3,xword [half]

;Store Data
 movups xword [P],xmm3

;Shift to Next Four 32-bit Variables
 add rdx,10h
 ;movups xmm4, yword [P+10h]

;Compute
;xmm3 = P+N
 addps xmm4,xword [rdx]
;xmm3 = (P+N)*0.5
 mulps xmm4,xword [half]

;Store Data
 movups xword [P+10h],xmm4


jmp .PyramidDraw
