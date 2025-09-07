
;================
R4toR3_512 proc
;================

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

;Load from 4D Array
vmovups zmm3, zmmword ptr [x4D] ;x0...x15
vmovups zmm4, zmmword ptr [y4D] ;y0...y15
vmovups zmm5, zmmword ptr [z4D] ;z0...z15
vmovups zmm6, zmmword ptr [w4D] ;w0...w15

vmulps zmm7,zmm0,zmm6 ;wi*vec.x
vmulps zmm8,zmm1,zmm6 ;wi*vec.y
vmulps zmm9,zmm2,zmm6 ;wi*vec.z

vaddps zmm10,zmm7,zmm3 ;xi+wi*vec.x
vaddps zmm11,zmm8,zmm4 ;yi+wi*vec.y
vaddps zmm12,zmm9,zmm5 ;zi+wi*vec.z

;Store to 3D Array
vmovups zmmword ptr [x3D],zmm10 ;x0...x15
vmovups zmmword ptr [y3D],zmm11 ;y0...y15
vmovups zmmword ptr [z3D],zmm12 ;z0...z15

;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave

ret

R4toR3_512 endp

