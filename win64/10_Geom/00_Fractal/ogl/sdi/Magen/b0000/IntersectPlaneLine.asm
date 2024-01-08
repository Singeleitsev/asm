;Compute the Intersection Point between
;the CutPlane which crosses the Menger Sponge is Defined by 3 Attractor points: A00, A09, A18
;and the Line defined by Previously Calculated and Current Point of Menger Sponge: P1, P2

;Plane's coordinates are constant
;Line's coordinates are variable

;Quotients for the Plane Equation
;are stored as coordinates of the Normal Vector in '.const' section as N
;A = y1*(z2 - z3) + y2*(z3 - z1) + y3*(z1 - z2) = 0.75
;B = z1*(x2 - x3) + z2*(x3 - x1) + z3*(x1 - x2) = 0.75
;C = x1*(y2 - y3) + x2*(y3 - y1) + x3*(y1 - y2) = 0.75
;D = x1*(y3*z2 - y2*z3) + x2*(y1*z3 - y3*z1) + x3*(y2*z1 - y1*z2) = 0

;Normal Vector is Defined in '.const' section as N = (A,B,C) = (0.75,0.75,0.75)
;xN = A
;yN = B
;zN = C

;Auxiliary Vector
;xV = x1-x4
;yV = y1-y4
;zV = z1-z4
movups xmm4,xword [A00] ;x1,y1,z1,t1
;subps xmm4,xword [P1] ;x1-x4,y1-y4,z1-z4,t1-t4
movups xmm7,xword [P1] ;x4,y4,z4,t4
subps xmm4,xmm7 ;x1-x4,y1-y4,z1-z4,t1-t4
;movups xword [V],xmm4 ;xV,yV,zV,tV

;Auxiliary Distance - Dot Product
;dist1 = xN*xV + yN*yV + zN*zV
;movups xmm4,xword [V] ;xV,yV,zV,tV
dpps xmm4,xword [N],255 ;xmm4 = dist1,dist1,dist1,dist1
movups xword [dist1],xmm4

;Check for Parallel
;IF dist1 <> 0 THEN ;Line does NOT belong to Plane
cmp dword [dist1],0 ;+0.0f
je .MagenNewPoint
cmp dword [dist1],80000000h ;-0.0f
je .MagenNewPoint

;Auxiliary Vector
;xW1 = x5-x4
;yW1 = y5-y4
;zW1 = z5-z4
movups xmm5,xword [P2] ;x5,y5,z5,t5
;subps xmm5,xword [P2] ;x5-x4,y5-y4,z5-z4,t5-t4
;movups xmm7,xword [P2] ;x4,y4,z4,t4
subps xmm5,xmm7 ;x5-x4,y5-y4,z5-z4,t5-t4
;movups xword [W],xmm5 ;xW1,yW1,zW1,tW1

;Auxiliary Distance - Dot Product
;dist2 = xN*xW + yN*yW + zN*zW
movups xmm6,xmm5 ;xW1,yW1,zW1,tW1
dpps xmm6,xword [N],255 ;xmm6 = dist2,dist2,dist2,dist2
movups xword [dist2],xmm6

;IF dist2 <> 0 THEN ;Line is NOT parallel to Plane
cmp dword [dist2],0 ;+0.0f
je .MagenNewPoint
cmp dword [dist2],80000000h ;-0.0f
je .MagenNewPoint

;Auxiliary Ratio
;ratio = dist1/dist2
;movups xmm4,xword [dist1]
;movups xmm6,xword [dist2]
divps xmm4,xmm6 ;dist1/dist2
;movups xword [ratio], xmm4

;'Вспомогательный вектор
;xW2 = xW1*ratio
;yW2 = yW1*ratio
;zW2 = zW1*ratio
;movups xmm5,xword [W] ;xW1,yW1,zW1,tW1
;mulps xmm5,xword [ratio] ;xW*ratio,yW*ratio,zW*ratio,tW*ratio
mulps xmm4,xmm5 ;xW2,yW2,zW2,tW2

;'Искомые координаты
;x0 = x4 + xW2
;y0 = y4 + yW2
;z0 = z4 + zW2
;movups xmm4,xword [W] ;xW2,yW2,zW2,tW2
;addps xmm4,xword [P1] ;x4,y4,z4,t4
movups xmm7,xword [P1] ;x4,y4,z4,t4
addps xmm4,xmm7 ;x0,y0,z0,t0
movups xword [P0],xmm4 ;x0,y0,z0,t0

;END IF dist1 <> 0
;END IF dist2 <> 0
