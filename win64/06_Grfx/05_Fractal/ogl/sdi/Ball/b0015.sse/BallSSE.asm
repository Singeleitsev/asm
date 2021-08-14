.BallSSE:

;Coordinates
 movups xmm3,xword [P]
 movups xmm4,xword [q1]
 movups xmm5,xword [q2]
 movups xmm6,xword [rdx] ;N

;Compute xmm3 = (P+q1*N)/q2
;xmm4 = q1*N
 ;mulps xmm4,xword [rdx] ;Crashes
 mulps xmm4,xmm6
;xmm3 = P+q1*N
 addps xmm3,xmm4
;xmm3 = (P+q1*N)/q2
 divps xmm3,xmm5

;Store Coordinates
 movups xword [P],xmm3

;Colors xmm3 = abs(P)
 ;movups xmm3,xword [P]
 andps xmm3,xword [sign]
 
;Store Colors
 movups xword [P+10h],xmm3

jmp .BallDraw