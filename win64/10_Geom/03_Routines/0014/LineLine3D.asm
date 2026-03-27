;Input:
;xmm0: 0,z0,y0,x0
;xmm1: 0,z1,y1,x1
;xmm2: 0,z2,y2,x2
;xmm3: 0,z3,3,x3

;================
LineLine3D Proc
;================

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Difference Vectors
;dx10 = x1 - x0
;dy10 = y1 - y0
;dz10 = z1 - z0
vsubps xmm4,xmm1,xmm0 ;xmm4: 0,dz10,dy10,dx10
;dx32 = x3 - x2
;dy32 = y3 - y2
;dz32 = z3 - z2
vsubps xmm5,xmm3,xmm2 ;xmm5: 0,dz32,dy32,dx32
;dx20 = x2 - x0
;dy20 = y2 - y0
;dz20 = z2 - z0
vsubps xmm6,xmm2,xmm0 ;xmm6: 0,dz20,dy20,dx20

;Dot Products
vdpps xmm7,xmm4,xmm4,01110001b ;a = dx10*dx10 + dy10*dy10 + dz10*dz10
vdpps xmm8,xmm4,xmm5,01110001b ;b = dx10*dx32 + dy10*dy32 + dz10*dz32
vdpps xmm9,xmm5,xmm5,01110001b ;c = dx32*dx32 + dy32*dy32 + dz32*dz32
vdpps xmm10,xmm6,xmm4,01110001b ;e = dx20*dx10 + dy20*dy10 + dz20*dz10
vdpps xmm11,xmm6,xmm5,01110001b ;f = dx20*dx32 + dy20*dy32 + dz20*dz32

;Determinant
;det = a*c - b*b
vmulss xmm12,xmm7,xmm9 ;xmm12[0] = a*c
vmulss xmm13,xmm8,xmm8 ;xmm13[0] = b*b
vsubss xmm12,xmm12,xmm13 ;xmm12[0] = det

;Check for Parallelism
;If Abs(det) > eps*(a+c) Then
 ;Branch A - Non-parallel (or not too close)
;Else
 ;Branch B - Nearly Parallel
;End If

;vabsps xmm13,xmm12 ;xmm13[0] = abs(det)
vmovd eax,xmm12 
and eax,7FFFFFFFh
vmovd xmm13,eax

vaddss xmm14,xmm7,xmm9 ;xmm14[0] = a+c
vmulss xmm14,xmm14,dword ptr[eps] ;xmm14[0] = eps*(a+c)
vmovss dword ptr[treshold],xmm14

vcomiss xmm13,xmm14
jbe lbl_NearParallel ;Abs(det) <= eps*(a+c)

;Branch A
;lbl_NotParallel:

;t = (e*c - b*f) / det
vmulss xmm13,xmm10,xmm9 ;xmm13[0] = e*c
vmulss xmm14,xmm8,xmm11 ;xmm14[0] = b*f
vsubss xmm13,xmm13,xmm14 ;xmm13[0] = e*c - b*f
vdivss xmm13,xmm13,xmm12 ;xmm13[0] = t

;s = (b*e - a*f) / det
vmulss xmm14,xmm8,xmm10 ;xmm14[0] = b*e
vmulss xmm15,xmm7,xmm11 ;xmm15[0] = a*f
vsubss xmm14,xmm14,xmm15 ;xmm14[0] = b*e - a*f
vdivss xmm14,xmm14,xmm12 ;xmm14[0] = s

;Nearest Point on Line0
;x4t = x0 + t*dx10
;y4t = y0 + t*dy10
;z4t = z0 + t*dz10
vbroadcastss xmm13,xmm13 ;xmm13: t,t,t,t
vfmadd231ps xmm0,xmm13,xmm4 ;xmm0: 0,z4t,y4t,x4t

;Nearest Point on Line1
;x4s = x2 + s*dx32
;y4s = y2 + s*dy32
;z4s = z2 + s*dz32
vbroadcastss xmm14,xmm14 ;xmm14: s,s,s,s
vmulps xmm1,xmm14,xmm5 ;xmm1: 0,s*dz32,s*dy32,s*dx32
vaddps xmm1,xmm1,xmm2 ;xmm1: 0,z4s,y4s,x4s


;Check for Intersection
;If dist2 < eps Then
 ;Branch A0 - The specified Lines have an Intersection Point
;Else
 ;Branch A1 - Exact Skew
;End If

;dist2 = (x4t-x4s)*(x4t-x4s) + (y4t-y4s)*(y4t-y4s) + (z4t-z4s)*(z4t-z4s)
vsubps xmm2,xmm0,xmm1 ;xmm2: 0,(z4t-z4s),(y4t-y4s),(x4t-x4s)
vdpps xmm2,xmm2,xmm2,01110001b ;xmm2[0] = dist2

vcomiss xmm2,dword ptr [eps]
ja lbl_ExactSkew ;dist2 > eps

;Branch A0
;The specified Lines have an Intersection Point
Call4 MessageBoxA,0,offset szIntersection,offset szAppTitle,0
jmp lbl_LineLine3D_End

;Branch A1
;The specified Lines are Skew at Far Distance
lbl_ExactSkew:
Call4 MessageBoxA,0,offset szExactSkew,offset szAppTitle,0
jmp lbl_LineLine3D_End

;Branch B
;The specified Lines do not intersect
;They are either Collinear, or Parallel, or Skew at Near Distance
lbl_NearParallel:

;If Magnitude_d10d32 < eps*(a+c) Then
 ;Branch B0 - Directions are parallel (or one is zero)
;Else
 ;Branch B1 - Determinant is small but directions not parallel
 ;Nearly parallel but numerically unstable - treat as Skew
;End If

;Compute cross product magnitudes
;xCross_d10d32 = dy10*dz32 - dz10*dy32
;yCross_d10d32 = dz10*dx32 - dx10*dz32
;zCross_d10d32 = dx10*dy32 - dy10*dx32
vpermilps xmm12,xmm4,11001001b ;xmm12: 0,dx10,dz10,dy10
vpermilps xmm13,xmm5,11010010b ;xmm13: 0,dy32,dx32,dz32
vpermilps xmm14,xmm4,11010010b ;xmm14: 0,dy10,dx10,dz10
vpermilps xmm15,xmm5,11001001b ;xmm15: 0,dx32,dz32,dy32
vmulps xmm12,xmm12,xmm13 ;xmm12: 0,dx10*dy32,dz10*dx32,dy10*dz32
vmulps xmm14,xmm14,xmm15 ;xmm14: 0,dy10*dx32,dx10*dz32,dz10*dy32
vsubps xmm12,xmm12,xmm14 ;xmm12: 0,zCross_d10d32,yCross_d10d32,xCross_d10d32
        
;Magnitude_d10d32 = xCross_d10d32*xCross_d10d32 + yCross_d10d32*yCross_d10d32 + zCross_d10d32*zCross_d10d32
vdpps xmm12,xmm12,xmm12,01110001b ;xmm12 = Magnitude_d10d32

;If Magnitude_d10d32 < eps*(a+c) Then
vcomiss xmm12,dword ptr [treshold]
jae lbl_NearSkew ;Magnitude_d10d32 >= eps*(a+c)

;Branch B0
;If Magnitude_d20d10 <  eps*a Then
 ;Branch B0A - Collinear: infinite intersections
;Then
 ;Branch B0B - Parallel but distinct
;Else

;xCross_d20d10 = dy20 * dz10 - dz20 * dy10
;yCross_d20d10 = dz20 * dx10 - dx20 * dz10
;zCross_d20d10 = dx20 * dy10 - dy20 * dx10
vpermilps xmm12,xmm6,11001001b ;xmm12: 0,dx20,dz20,dy20
vpermilps xmm13,xmm4,11010010b ;xmm13: 0,dy10,dx10,dz10
vpermilps xmm14,xmm6,11010010b ;xmm14: 0,dy20,dx20,dz20
vpermilps xmm15,xmm4,11001001b ;xmm15: 0,dx10,dz10,dy10
vmulps xmm12,xmm12,xmm13 ;xmm12: 0,dx20*dy10,dz20*dx10,dy20*dz10
vmulps xmm14,xmm14,xmm15 ;xmm14: 0,dy20*dx10,dx20*dz10,dz20*dy10
vsubps xmm12,xmm12,xmm14 ;xmm12: 0,zCross_d20d10,yCross_d20d10,xCross_d20d10

;Magnitude_d20d10 = xCross_d20d10 * xCross_d20d10 + yCross_d20d10 * yCross_d20d10 + zCross_d20d10 * zCross_d20d10
vdpps xmm12,xmm12,xmm12,01110001b ;xmm12 = Magnitude_d20d10

;If Magnitude_d20d10 < eps*a Then
vmulss xmm13,xmm7,dword ptr[eps] ;xmm13 = eps*a
vcomiss xmm12,xmm13
jae lbl_ExactParallel ;Magnitude_d20d10 >= eps*a

;Branch B0A - Collinear: infinite intersections
;lbl_Collinear:
Call4 MessageBoxA,0,offset szCollinear,offset szAppTitle,0
jmp lbl_LineLine3D_End

;Branch B0B - Parallel but distinct
lbl_ExactParallel:
Call4 MessageBoxA,0,offset szParallel,offset szAppTitle,0
jmp lbl_LineLine3D_End

;Branch B1 - The determinant is small but directions not parallel
;Nearly parallel but numerically unstable - treat as skew
lbl_NearSkew:
Call4 MessageBoxA,0,offset szNearSkew,offset szAppTitle,0
;jmp lbl_LineLine3D_End

lbl_LineLine3D_End:
add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
LineLine3D endp

;OUTPUT:
;xmm0: 0,z4t,y4t,x4t
;xmm1: 0,z4s,y4s,x4s

