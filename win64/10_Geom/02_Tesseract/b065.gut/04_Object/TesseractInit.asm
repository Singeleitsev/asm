
;There are two Buffers for the Vertices:
;(0) the Back Buffer (v4D) which is used
;to compute 4D-Vertices affected by 4D-Rotation
;(1) the Front Buffer (v3D) which is used
;to compute 3D-Vertices projected from 4D-Space

;Get the Initial Coordinates (x[i],y[i],z[i],w[i])
;from the Read-Only Memory
;to the Changeable Back Buffer (x3D[i],y3D[i],z3D[i],w3D[i])

;=======================
LoadCoordinates_256 proc
;=======================

;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;LOCAL xxx:QWORD

;Since this Proc doesn't call further Proc's
;There is no need for the Stack Alignment
;and rsp,-16 ;Align the Stack
;sub rsp,100h ;Create the Buffer

;256-bit instructions
;Load 256 bits = 32 bytes = 8 coordinates At Once

lea rsi,x ;Source
lea rdi,x4D ;Destination

xor rcx,rcx
lbl_Load_Back_Buffer:
vmovups ymm4, ymmword ptr [rsi]
vmovups ymmword ptr [rdi],ymm4
add rsi,20h ;32 bytes = 8 coordinates At Once
add rdi,20h ;32 bytes = 8 coordinates At Once
inc cl
cmp cl,8
jl lbl_Load_Back_Buffer

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
;leave

ret
LoadCoordinates_256 endp

;;=======================
;LoadCoordinates_512 proc
;;=======================

;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;LOCAL xxx:QWORD

;Since this Proc doesn't call further Proc's
;There is no need for the Stack Alignment
;and rsp,-16 ;Align the Stack
;sub rsp,100h ;Create the Buffer

;;512-bit instructions
;;Load 512 bits = 64 bytes = 16 coordinates At Once

;vmovups zmm4, zmmword ptr [x] ;x - Source
;vmovups zmmword ptr [x4D],zmm4 ;x - Destination

;vmovups zmm5, zmmword ptr [y] ;y - Source
;vmovups zmmword ptr [y4D],zmm5 ;y0 - Destination

;vmovups zmm6, zmmword ptr [z] ;z - Source
;vmovups zmmword ptr [z4D],zmm6 ;z0 - Destination

;vmovups zmm7, zmmword ptr [w] ;w - Source
;vmovups zmmword ptr [w4D],zmm7 ;w0 - Destination

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
;leave

;ret
;LoadCoordinates_512 endp
