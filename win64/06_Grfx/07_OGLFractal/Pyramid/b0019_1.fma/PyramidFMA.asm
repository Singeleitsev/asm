.modeFMA:
;Sierpinski Pyramid Algorithm
;P.x = (P.x + N.x) / 2,
;P.y = (P.y + N.y) / 2,
;P.z = (P.z + N.z) / 2,
;where
;P.x, P.y, P.z - coordinates of Current Point
;N.x, N.y, N.z - coordinates of randomly selected Vertex


;Optimizing Algorithm for FMA computing
;P = (P + N) / 2 = (P*0.5)+(N*0.5)
;where
;P - all 8 variables of Point in 256 bits of ymm3
;N - all 8 constants of Vertices in ymm8...ymm11


;Broadcast 8 dword values of 0.5 to ymm4
vbroadcastss ymm4,[half]


;Load Vertices Data to AVX registers
;And simultaneously divide them by 2
;ymm8 = 0.5*A
vmulps ymm8,ymm4,yword [A]
;ymm9 = 0.5*B
vmulps ymm9,ymm4,yword [B]
;ymm10 = 0.5*C
vmulps ymm10,ymm4,yword [C]
;ymm11 = 0.5*D
vmulps ymm11,ymm4,yword [D]


;Clean the Counter
xor rax,rax
mov [i],rax


.NewPointFMA:
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
jg .caseD_FMA ;3
je .caseC_FMA ;2
cmp rdx,1
je .caseB_FMA ;1


;Compute
;ymm0 = (P*0.5)+(N*0.5) = (ymm3*ymm4)+(ymmi)
.caseA_FMA:
 vfmadd213ps ymm3,ymm4,ymm8
 jmp .DrawFMA
.caseB_FMA:
 vfmadd213ps ymm3,ymm4,ymm9
 jmp .DrawFMA
.caseC_FMA:
 vfmadd213ps ymm3,ymm4,ymm10
 jmp .DrawFMA
.caseD_FMA:
 vfmadd213ps ymm3,ymm4,ymm11
 ;jmp .DrawFMA


.DrawFMA:
;Method 1 - Redistribution from RAM
 vmovups yword [P],ymm3 
 invoke glColor3f,  float dword [P.r], float dword [P.g], float dword [P.b]
 invoke glVertex3f, float dword [P.x], float dword [P.y], float dword [P.z]


;Check for Loop
inc [i]
cmp [i],1000h
jl .NewPointFMA ;Loop


jmp .skip
