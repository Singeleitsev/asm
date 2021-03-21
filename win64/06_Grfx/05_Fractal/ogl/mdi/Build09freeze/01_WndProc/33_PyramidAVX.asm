modeAVX:
;Sierpinski Pyramid Algorithm
;P.x = (P.x + N.x)/2,
;P.y = (P.y + N.y)/2,
;P.z = (P.z + N.z)/2,
;where
;P.x, P.y, P.z - coordinates of Current Point
;N.x, N.y, N.z - coordinates of randomly selected Vertex


;Optimizing Algorithm for AVX computing
;P = (P + N)/2,
;where
;P - all 8 variables of Point in 256 bits of ymm3
;N - all 8 constants of Vertices in ymm8...ymm11


;Broadcast 8 dword values of 2.0 to ymm4
vbroadcastss ymm4, dword ptr [two]


;Load Vertices Data to AVX registers
;ymm8 = A.x,A.y,A.z,A.t, A.r,A.g,A.b,A.a
vmovups ymm8, ymmword ptr [A]
;ymm9 = B.x,B.y,B.z,B.t, B.r,B.g,B.b,B.a
vmovups ymm9, ymmword ptr [B]
;ymm10 = C.x,C.y,C.z,C.t, C.r,C.g,C.b,C.a
vmovups ymm10, ymmword ptr [C]
;ymm11 = D.x,D.y,D.z,D.t, D.r,D.g,D.b,D.a
vmovups ymm11, ymmword ptr [D]


;Clean the Counter
xor rax,rax
mov i,rax


NewPointAVX:
;Generate Random Number in rax
rdrand rax
;Select one of four Vertices
;Divide random by 4
xor rdx,rdx ;Dividend High QWORD
;rax = Dividend Low QWORD
mov rcx,4 ;Divisor
div rcx
;rdx = Remainder = random[0 to 3]


;Select Case
cmp rdx,2
jg caseD_AVX ;3
je caseC_AVX ;2
cmp rdx,1
je caseB_AVX ;1


;Compute
;ymm3 = (P + N) / 2
;ymm3 = ymm3 + ymmi
;ymm3 = ymm3 / ymm4


caseA_AVX:
	vaddps ymm3,ymm3,ymm8
	jmp div2_AVX
caseB_AVX:
	vaddps ymm3,ymm3,ymm9
	jmp div2_AVX
caseC_AVX:
	vaddps ymm3,ymm3,ymm10
	jmp div2_AVX
caseD_AVX:
	vaddps ymm3,ymm3,ymm11


div2_AVX:
	vdivps ymm3,ymm3,ymm4
jmp DrawAVX


DrawAVX:
sub rsp,20h
	;Method 1 - Redistribution from RAM
	vmovups ymmword ptr [P],ymm3
	;invoke glColor3f,  float dword [P.r], float dword [P.g], float dword [P.b]
	movd xmm0,P.r
	movd xmm1,P.g
	movd xmm2,P.b
	call glColor3f
	;invoke glVertex3f, float dword [P.x], float dword [P.y], float dword [P.z]
	movd xmm0,P.x
	movd xmm1,P.y
	movd xmm2,P.z
	call glVertex3f
add rsp,20h

;Check for Loop
inc i
cmp i,1000h
jl NewPointAVX ;Loop

jmp lblSkip


