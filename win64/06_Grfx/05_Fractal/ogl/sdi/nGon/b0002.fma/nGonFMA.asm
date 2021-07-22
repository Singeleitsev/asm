.nGonFMA:

;P.x = (P.x + 4*N.x)/5,
;P.y = (P.y + 4*N.y)/5,
;where
;P.x,P.y,P.z - coordinates of Point
;N.x,N.y,N.z - coordinates of randomly selected Vertex

;Method 1 - Redistribution from RAM
 ;vmovups ymm3,yword [P]
 vmovups ymm4,yword [four]
 vmovups ymm5,yword [five]

;Compute ymm3 = (P+4*N)/5
;ymm3 = P+4*N
 vfmadd231ps ymm3,ymm4,yword [rdx]
;ymm3 = ymm3/5
 vdivps ymm3,ymm3,ymm5

;Store all the Point's data at once
 vmovups yword [P],ymm3

jmp .nGonDraw