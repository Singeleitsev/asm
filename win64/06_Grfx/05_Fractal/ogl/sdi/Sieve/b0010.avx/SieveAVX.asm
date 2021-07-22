.SieveModeAVX:

;Method 1 - Redistribution from RAM
 ;vmovups ymm3, yword [P]

;Compute
;ymm3 = (P+N)
 vaddps ymm3,ymm3,yword [rdx]
;ymm3 = (P+N)/2
 vdivps ymm3,ymm3,yword [two]

;Store all the Point's data at once
 vmovups yword [P],ymm3

jmp .SieveDraw

