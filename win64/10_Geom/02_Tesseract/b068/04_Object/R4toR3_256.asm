;================
R4toR3_256 proc
;================

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;LOCAL xxx:QWORD

;Since this Proc doesn't call further Proc's
;There is no need for the Stack Alignment
;and rsp,-16 ;Align the Stack
;sub rsp,100h ;Create the Buffer

lea rcx,x4D
lea rdx,x3D

vbroadcastss ymm0, dword ptr [vec_x_R4_to_R3] ;vec.x
vbroadcastss ymm1, dword ptr [vec_y_R4_to_R3] ;vec.y
vbroadcastss ymm2, dword ptr [vec_z_R4_to_R3] ;vec.z

xor rax,rax
lbl_Project4D:

;Load from 4D Array
vmovups ymm3, ymmword ptr [rcx] ;x0...x7
vmovups ymm4, ymmword ptr [rcx+40h] ;y0...y7
vmovups ymm5, ymmword ptr [rcx+80h] ;z0...z7
vmovups ymm6, ymmword ptr [rcx+0C0h] ;w0...w7

vmulps ymm7,ymm0,ymm6 ;wi*vec.x
vmulps ymm8,ymm1,ymm6 ;wi*vec.y
vmulps ymm9,ymm2,ymm6 ;wi*vec.z

vaddps ymm10,ymm7,ymm3 ;xi+wi*vec.x
vaddps ymm11,ymm8,ymm4 ;yi+wi*vec.y
vaddps ymm12,ymm9,ymm5 ;zi+wi*vec.z

;Store to 3D Array
vmovups ymmword ptr [rdx],ymm10 ;x0...x7
vmovups ymmword ptr [rdx+40h],ymm11 ;y0...y7
vmovups ymmword ptr [rdx+80h], ymm12 ;z0...z7

add rcx,20h ;Next 4D
add rdx,20h ;Next 3D

add rax,1
cmp rax,1
je lbl_Project4D

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave

ret

R4toR3_256 endp
