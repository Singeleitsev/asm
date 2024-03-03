
;=====================
R4_To_R3_512_Proc proc
;=====================

;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;LOCAL xxx:QWORD

;Since this Proc doesn't call further Proc's
;There is no need for the Stack Alignment
;and rsp,-16 ;Align the Stack
;sub rsp,100h ;Create the Buffer

vbroadcastss zmm0, dword ptr [vec_x_R4_to_R3] ;vec.x
vbroadcastss zmm1, dword ptr [vec_y_R4_to_R3] ;vec.y
vbroadcastss zmm2, dword ptr [vec_z_R4_to_R3] ;vec.z

vmovups zmm3, zmmword ptr [x4D] ;x0...x15
vmovups zmm4, zmmword ptr [y4D] ;y0...y15
vmovups zmm5, zmmword ptr [z4D] ;z0...z15

vmulps zmm6,zmm0,zmm3 ;xi*vec.x
vmulps zmm7,zmm1,zmm4 ;yi*vec.y
vmulps zmm8,zmm2,zmm5 ;zi*vec.z

vmovups zmmword ptr [x4D],zmm6 ;x0...x15
vmovups zmmword ptr [y4D],zmm7 ;y0...y15
vmovups zmmword ptr [z4D],zmm8 ;z0...z15

;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave

ret

R4_To_R3_512_Proc endp

