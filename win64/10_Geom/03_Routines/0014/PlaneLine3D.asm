;Input:
;xmm0: 0,z0P,y0P,x0P
;xmm1: 0,z1P,y1P,x1P
;xmm2: 0,z2P,y2P,x2P
;xmm3: 0,z0L,y0L,x0L
;xmm4: 0,z1L,y1L,x1L

;================
PlaneLine3D Proc
;================

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Plane normal N = (P1-P0) vp (P2-P0)
vsubps xmm5,xmm1,xmm0 ;P1-P0 -> [0,dz10P,dy10P,dx10P]
vsubps xmm6,xmm2,xmm0 ;P2-P0 -> [0,dz20P,dy20P,dx20P]

;xN = dy10P*dz20P - dz10P*dy20P
;yN = dz10P*dx20P - dx10P*dz20P
;zN = dx10P*dy20P - dy10P*dx20P
vpermilps xmm7,xmm5,11001001b ;[0,dx10P,dz10P,dy10P]
vpermilps xmm8,xmm6,11010010b ;[0,dy20P,dx20P,dz20P]
vmulps xmm7,xmm7,xmm8 ;[0,dx10P*dy20P,dz10P*dx20P,dy10P*dz20P]

vpermilps xmm8,xmm5,11010010b ;[0,dy10P,dx10P,dz10P]
vpermilps xmm9,xmm6,11001001b ;[0,dx20P,dz20P,dy20P]
vmulps xmm8,xmm8,xmm9 ;[0,dy10P*dx20P,dx10P*dz20P,dz10P*dy20P]

vsubps xmm7,xmm7,xmm8 ;N[0,zN,yN,xN]

;Load epsilon
movss xmm8,dword ptr [eps]

;Direction vector L1-L0
vsubps xmm9,xmm4,xmm3 ;[0,zV,yV,xV]
;Denominator den = (L1-L0) dp N
vdpps xmm10,xmm9,xmm7,01110001b ;den in low dword

;If |den| < eps then Line is parallel to Plane
;vabsps xmm11,xmm10
vmovd eax,xmm10 
and eax,7FFFFFFFh
vmovd xmm11,eax
vcomiss xmm11,xmm8
jae lbl_PlaneLine3D_Intersection

;Vector P0-L0
vsubps xmm12,xmm0,xmm3 ;[0,zW,yW,xW]
;Numerator num = (P0-L0) dp N
vdpps xmm13,xmm12,xmm7,01110001b ; num in low dword

;If |num| < eps then Line lies in Plane
;vabsps xmm14,xmm13
vmovd eax,xmm13
and eax,7FFFFFFFh
vmovd xmm14,eax
vcomiss xmm14,xmm8
jae lbl_PlaneLine3D_Parallel
jmp lbl_PlaneLine3D_LineInPlane

;Intersection point
lbl_PlaneLine3D_Intersection:
vmovaps xmm15,xmm3 ;L0
vdivss xmm14,xmm13,xmm10 ;t = num / den
vbroadcastss xmm14,xmm14
vfmadd231ps xmm15,xmm14,xmm9 ; P = L0 + t*V
;result in xmm15
Call4 MessageBoxA,0,offset szPlaneLine3D_Intersection,offset szAppTitle,0
jmp lbl_PlaneLine3D_End

lbl_PlaneLine3D_Parallel:
Call4 MessageBoxA,0,offset szPlaneLine3D_Parallel,offset szAppTitle,0
jmp lbl_PlaneLine3D_End

lbl_PlaneLine3D_LineInPlane:
Call4 MessageBoxA,0,offset szPlaneLine3D_LineInPlane,offset szAppTitle,0
jmp lbl_PlaneLine3D_End

lbl_PlaneLine3D_End:
add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
PlaneLine3D endp

;OUTPUT:
;xmm15: 0,zPL,yPL,xPL


