.MagenAVX:

;Compute the Next Point of the Menger Sponge

;P.x = (P.x + 2*N.x)/3,
;P.y = (P.y + 2*N.y)/3,
;P.z = (P.z + 2*N.z)/3,
;where
;P.x,P.y,P.z - coordinates of Point
;N.x,N.y,N.z - coordinates of randomly selected Vertex  

;Method 1 - Redistribution from RAM
;vmovups ymm3,yword [P2]

;Compute ymm3 = (P+2*N)/3
;ymm3 = P+N
vaddps ymm3,ymm3,yword [rdx]
;ymm3 = P+N+N
vaddps ymm3,ymm3,yword [rdx]
;ymm3 = ymm3/3
vdivps ymm3,ymm3,yword [three]

;Store the Current Point of the Menger Sponge
;All Coordinates and Colors at once
vmovups yword [P2],ymm3

;Store the Previous Point of the Menger Sponge
vmovups ymm4, yword [P2]
vaddps ymm4,ymm4,yword [nX];+rax]
vmovups yword [P1],ymm4

include 'IntersectPlaneLine.asm'

;jmp .MagenDraw