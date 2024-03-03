
;==================
Rot4D_Proc_512 proc
;==================

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
vbroadcastss zmm0, dword ptr [cosA]
vbroadcastss zmm1, dword ptr [sinA]

vmovups zmm2, zmmword ptr [rcx] ;x0...x15
vmovups zmm3, zmmword ptr [rdx] ;y0...y15

vmulps zmm4,zmm0,zmm2 ;xi*cosA
vmulps zmm5,zmm1,zmm3 ;yi*sinA
vsubps zmm6,zmm4,zmm5 ;xi*cosA-yi*sinA

vmulps zmm7,zmm1,zmm2 ;xi*sinA
vmulps zmm8,zmm0,zmm3 ;yi*cosA
vaddps zmm9,zmm7,zmm8 ;xi*sinA+yi*cosA

vmovups zmmword ptr [rcx],zmm6 ;x0...x15
vmovups zmmword ptr [rdx],zmm9 ;y0...y15

;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave

ret

Rot4D_Proc_512 endp


