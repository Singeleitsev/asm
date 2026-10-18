.nGonFMA:

;Method 1 - Redistribution from RAM
 ;vmovups ymm3,yword [P]
 vmovups ymm4,yword [q1]
 ;vmovups ymm5,yword [q2]

;Compute ymm3 = (P+q1*N)/q2
;ymm3 = P+q1*N
 vfmadd231ps ymm3,ymm4,yword [rdx]
;ymm3 = (P+q1*N)/q2
 vdivps ymm3,ymm3,yword [q2]

;Store all the Point's data at once
 vmovups yword [P],ymm3

jmp .nGonDraw