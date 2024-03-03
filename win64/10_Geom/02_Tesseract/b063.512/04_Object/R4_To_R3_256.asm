
;================
R4_To_R3_256 proc
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

vbroadcastss ymm0, dword ptr [vec_x_R4_to_R3] ;vec.x
vbroadcastss ymm1, dword ptr [vec_y_R4_to_R3] ;vec.y
vbroadcastss ymm2, dword ptr [vec_z_R4_to_R3] ;vec.z

lea rcx,x4D
lea rdx,y4D
lea r8,z4D

xor rax,rax

lbl_Project4D:
vmovups ymm3, ymmword ptr [rcx] ;x0...x7
vmovups ymm4, ymmword ptr [rdx] ;y0...y7
vmovups ymm5, ymmword ptr [r8] ;z0...z7

vmulps ymm6,ymm0,ymm3 ;xi*vec.x
vmulps ymm7,ymm1,ymm4 ;yi*vec.y
vmulps ymm8,ymm2,ymm5 ;zi*vec.z

vmovups ymmword ptr [rcx],ymm6 ;x0...x7
vmovups ymmword ptr [rdx],ymm7 ;y0...y7
vmovups ymmword ptr [r8],ymm8 ;z0...z7

add rcx,20h ;Next x
add rdx,20h ;Next y
add r8,20h ;Next z

add rax,1
cmp rax,1
je lbl_Project4D

;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave

ret

R4_To_R3_256 endp


