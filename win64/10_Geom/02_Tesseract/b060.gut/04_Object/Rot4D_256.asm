
;==============
Rot4D_Proc proc
;==============

;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;LOCAL xxx:QWORD

;Since this Proc doesn't call further Proc's
;There is no need for the Stack Alignment
;and rsp,-16 ;Align the Stack
;sub rsp,100h ;Create the Buffer

fld dword ptr [r8] ;Angle
fsincos
fstp dword ptr [cosA]
fstp dword ptr [sinA]
vbroadcastss ymm0, dword ptr [cosA]
vbroadcastss ymm1, dword ptr [sinA]

xor rax,rax

lbl_Rot4D:
vmovups ymm2, ymmword ptr [rcx] ;x0...x7
vmovups ymm3, ymmword ptr [rdx] ;y0...y7

vmulps ymm4,ymm0,ymm2 ;xi*cosA
vmulps ymm5,ymm1,ymm3 ;yi*sinA

vsubps ymm6,ymm4,ymm5 ;xi*cosA-yi*sinA

vmovups ymmword ptr [rcx],ymm6 ;x0...x7

vmulps ymm7,ymm1,ymm2 ;xi*sinA
vmulps ymm8,ymm0,ymm3 ;yi*cosA

vaddps ymm9,ymm7,ymm8 ;xi*sinA+yi*cosA

vmovups ymmword ptr [rdx],ymm9 ;y0...y7

add rcx,20h
add rdx,20h

add rax,1
cmp rax,1
je lbl_Rot4D

;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave

ret

Rot4D_Proc endp


