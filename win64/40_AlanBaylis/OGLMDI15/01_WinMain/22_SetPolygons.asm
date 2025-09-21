;Set the Cube's Polygons
SetPolygons proc

LOCAL bLoop:BYTE
LOCAL lpV0:QWORD,lpV1:QWORD,lpV2:QWORD
LOCAL v0x:DWORD,v0y:DWORD,v0z:DWORD,v1x:DWORD,v1y:DWORD,v1z:DWORD,v2x:DWORD,v2y:DWORD,v2z:DWORD
LOCAL ux:DWORD,uy:DWORD,uz:DWORD,vx:DWORD,vy:DWORD,vz:DWORD

;Since the Proc has locals
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Front
;polygon[0].Vertex[0] = vertex[0];
lea rsi,vertex[0]
lea rdi,polygon[0].Vertex[0]
vmovups xmm0,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm0
;polygon[0].Vertex[1] = vertex[1];
lea rsi,vertex[1]
lea rdi,polygon[0].Vertex[1]
vmovups xmm1,xmmword ptr [rsi+rax]
vmovups xmmword ptr [rdi+rax],xmm1
;polygon[0].Vertex[2] = vertex[2];
lea rsi,vertex[2]
lea rdi,polygon[0].Vertex[2]
vmovups xmm2,xmmword ptr [rsi+rax]
vmovups xmmword ptr [rdi+rax],xmm2
;polygon[1].Vertex[0] = vertex[0];
lea rsi,vertex[0]
lea rdi,polygon[1].Vertex[0]
vmovups xmm3,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm3
;polygon[1].Vertex[1] = vertex[2];
lea rsi,vertex[2]
lea rdi,polygon[1].Vertex[1]
vmovups xmm4,xmmword ptr [rsi+rax]
vmovups xmmword ptr [rdi+rax],xmm4
;polygon[1].Vertex[2] = vertex[3];
lea rsi,vertex[3]
lea rdi,polygon[1].Vertex[2]
vmovups xmm5,xmmword ptr [rsi+rax]
vmovups xmmword ptr [rdi],xmm5

;Back
;polygon[2].Vertex[0] = vertex[5];
lea rsi,vertex[5]
lea rdi,polygon[2].Vertex[0]
vmovups xmm0,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm0
;polygon[2].Vertex[1] = vertex[4];
lea rsi,vertex[4]
lea rdi,polygon[2].Vertex[1]
vmovups xmm1,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm1
;polygon[2].Vertex[2] = vertex[7];
lea rsi,vertex[7]
lea rdi,polygon[2].Vertex[2]
vmovups xmm2,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm2
;polygon[3].Vertex[0] = vertex[5];
lea rsi,vertex[5]
lea rdi,polygon[3].Vertex[0]
vmovups xmm3,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm3
;polygon[3].Vertex[1] = vertex[7];
lea rsi,vertex[7]
lea rdi,polygon[3].Vertex[1]
vmovups xmm4,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm4
;polygon[3].Vertex[2] = vertex[6];
lea rsi,vertex[6]
lea rdi,polygon[3].Vertex[2]
vmovups xmm5,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm5

;Left
;polygon[4].Vertex[0] = vertex[4];
lea rsi,vertex[4]
lea rdi,polygon[4].Vertex[0]
vmovups xmm0,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm0
;polygon[4].Vertex[1] = vertex[0];
lea rsi,vertex[0]
lea rdi,polygon[4].Vertex[1]
vmovups xmm1,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm1
;polygon[4].Vertex[2] = vertex[3];
lea rsi,vertex[3]
lea rdi,polygon[4].Vertex[2]
vmovups xmm2,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm2
;polygon[5].Vertex[0] = vertex[4];
lea rsi,vertex[4]
lea rdi,polygon[5].Vertex[0]
vmovups xmm3,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm3
;polygon[5].Vertex[1] = vertex[3];
lea rsi,vertex[3]
lea rdi,polygon[5].Vertex[1]
vmovups xmm4,xmmword ptr [rsi]
vmovups xmmword ptr [rdi+1],xmm4
;polygon[5].Vertex[2] = vertex[7];
lea rsi,vertex[7]
lea rdi,polygon[5].Vertex[2]
vmovups xmm5,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm5

;Right
;polygon[6].Vertex[0] = vertex[1];
lea rsi,vertex[1]
lea rdi,polygon[6].Vertex[0]
vmovups xmm0,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm0
;polygon[6].Vertex[1] = vertex[5];
lea rsi,vertex[5]
lea rdi,polygon[6].Vertex[1]
vmovups xmm1,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm1
;polygon[6].Vertex[2] = vertex[6];
lea rsi,vertex[6]
lea rdi,polygon[6].Vertex[2]
vmovups xmm2,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm2
;polygon[7].Vertex[0] = vertex[1];
lea rsi,vertex[1]
lea rdi,polygon[7].Vertex[0]
vmovups xmm3,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm3
;polygon[7].Vertex[1] = vertex[6];
lea rsi,vertex[6]
lea rdi,polygon[7].Vertex[1]
vmovups xmm4,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm4
;polygon[7].Vertex[2] = vertex[2];
lea rsi,vertex[2]
lea rdi,polygon[7].Vertex[2]
vmovups xmm5,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm5

;Top
;polygon[8].Vertex[0] = vertex[3];
lea rsi,vertex[3]
lea rdi,polygon[8].Vertex[0]
vmovups xmm0,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm0
;polygon[8].Vertex[1] = vertex[2];
lea rsi,vertex[2]
lea rdi,polygon[8].Vertex[1]
vmovups xmm1,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm1
;polygon[8].Vertex[2] = vertex[6];
lea rsi,vertex[6]
lea rdi,polygon[8].Vertex[2]
vmovups xmm2,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm2
;polygon[9].Vertex[0] = vertex[3];
lea rsi,vertex[3]
lea rdi,polygon[9].Vertex[0]
vmovups xmm3,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm3
;polygon[9].Vertex[1] = vertex[6];
lea rsi,vertex[6]
lea rdi,polygon[9].Vertex[1]
vmovups xmm4,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm4
;polygon[9].Vertex[2] = vertex[7];
lea rsi,vertex[7]
lea rdi,polygon[9].Vertex[2]
vmovups xmm5,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm5

;Bottom
;polygon[10].Vertex[0] = vertex[5];
lea rsi,vertex[5]
lea rdi,polygon[10].Vertex[0]
vmovups xmm0,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm0
;polygon[10].Vertex[1] = vertex[1];
lea rsi,vertex[1]
lea rdi,polygon[10].Vertex[1]
vmovups xmm1,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm1
;polygon[10].Vertex[2] = vertex[0];
lea rsi,vertex[0]
lea rdi,polygon[10].Vertex[2]
vmovups xmm2,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm2
;polygon[11].Vertex[0] = vertex[5];
lea rsi,vertex[5]
lea rdi,polygon[11].Vertex[0]
vmovups xmm3,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm3
;polygon[11].Vertex[1] = vertex[0];
lea rsi,vertex[0]
lea rdi,polygon[11].Vertex[1]
vmovups xmm4,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm4
;polygon[11].Vertex[2] = vertex[4];
lea rsi,vertex[4]
lea rdi,polygon[11].Vertex[2]
vmovups xmm5,xmmword ptr [rsi]
vmovups xmmword ptr [rdi],xmm5

;Normals
mov bLoop,0
lbl_NextNormal:

include 23_SetNormal.asm

inc bLoop
cmp bLoop,12
jl lbl_NextNormal

;lbl_SetPolygons_End:
add rsp,100h
;Since the Proc has locals
;Assembler will add this epilogue automatically:
;leave
ret
SetPolygons endp


