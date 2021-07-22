.GasketSSE:

;P.x = (P.x + 2*N.x)/3,
;P.y = (P.y + 2*N.y)/3,
;where
;P.x,P.y,P.z - coordinates of Point
;N.x,N.y,N.z - coordinates of randomly selected Vertex  

;Load First Four 32-bit Variables
 ;movups xmm3, yword [P]

;Compute xmm3 = (P+2*N)/3
;xmm3 = P+N
 addps xmm3,xword [rdx]
;xmm3 = P+N+N
 addps xmm3,xword [rdx]
;xmm3 = xmm3/3
 divps xmm3,xword [three]

;Store Data
 vmovups xword [P],xmm3

;Shift to Next Four 32-bit Variables
 add rdx,10h
 ;movups xmm4, yword [P+10h]

;Compute xmm4 = (P+2*N)/3
;xmm4 = P+N
 addps xmm4,xword [rdx]
;xmm4 = P+N+N
 addps xmm4,xword [rdx]
;xmm4 = xmm4/3
 divps xmm4,xword [three]

;Store Data
 vmovups xword [P+10h],xmm4

jmp .GasketDraw