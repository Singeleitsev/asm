SetVertices proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Set the Cube's Vertices
xor rcx,rcx
lea rsi,i0
lea rdi,vbo

lbl_NextVertex:
movzx rax,byte ptr[rsi] ;Load Current index
shl rax,4 ;mul rax,10h - Size of Vertex Array
lea rbx,v0 ;Load Vertex Base
add rax,rbx ;Current Vertex Address
vmovups xmm0,xmmword ptr[rax]
vmovups xmmword ptr[rdi],xmm0
inc rsi
add rdi,20h
inc cl
cmp cl,24
jl lbl_NextVertex

Call GetNormals
Call GetMapping

;lbl_SetVertices_End:
;Epilogue
leave
ret
SetVertices endp

