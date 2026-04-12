SetPolygons proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

lea rsi,vtx ;Zeroth VERTEX Structure
;SizeOf VERTEX = 10h
lea rdi,pg ;Zeroth POLYGON Structure
;SizeOf POLYGON = 40h

;Front
;polygon[0].Vertex[0] = vertex[0];
vmovups xmm0,xmmword ptr [rsi+00h]
vmovups xmmword ptr [rdi+00h],xmm0
;polygon[0].Vertex[1] = vertex[1];
vmovups xmm1,xmmword ptr [rsi+10h]
vmovups xmmword ptr [rdi+10h],xmm1
;polygon[0].Vertex[2] = vertex[2];
vmovups xmm2,xmmword ptr [rsi+20h]
vmovups xmmword ptr [rdi+20h],xmm2

;polygon[1].Vertex[0] = vertex[0];
vmovups xmm3,xmmword ptr [rsi+00h]
vmovups xmmword ptr [rdi+40h],xmm3
;polygon[1].Vertex[1] = vertex[2];
vmovups xmm4,xmmword ptr [rsi+20h]
vmovups xmmword ptr [rdi+50h],xmm4
;polygon[1].Vertex[2] = vertex[3];
vmovups xmm5,xmmword ptr [rsi+30h]
vmovups xmmword ptr [rdi+60h],xmm5

;Back
;polygon[2].Vertex[0] = vertex[5];
vmovups xmm0,xmmword ptr [rsi+50h]
vmovups xmmword ptr [rdi+080h],xmm0
;polygon[2].Vertex[1] = vertex[4];
vmovups xmm1,xmmword ptr [rsi+40h]
vmovups xmmword ptr [rdi+090h],xmm1
;polygon[2].Vertex[2] = vertex[7];
vmovups xmm2,xmmword ptr [rsi+70h]
vmovups xmmword ptr [rdi+0A0h],xmm2

;polygon[3].Vertex[0] = vertex[5];
vmovups xmm3,xmmword ptr [rsi+50h]
vmovups xmmword ptr [rdi+0C0h],xmm3
;polygon[3].Vertex[1] = vertex[7];
vmovups xmm4,xmmword ptr [rsi+70h]
vmovups xmmword ptr [rdi+0D0h],xmm4
;polygon[3].Vertex[2] = vertex[6];
vmovups xmm5,xmmword ptr [rsi+60h]
vmovups xmmword ptr [rdi+0E0h],xmm5

;Left
;polygon[4].Vertex[0] = vertex[4];
vmovups xmm0,xmmword ptr [rsi+40h]
vmovups xmmword ptr [rdi+100h],xmm0
;polygon[4].Vertex[1] = vertex[0];
vmovups xmm1,xmmword ptr [rsi+00h]
vmovups xmmword ptr [rdi+110h],xmm1
;polygon[4].Vertex[2] = vertex[3];
vmovups xmm2,xmmword ptr [rsi+30h]
vmovups xmmword ptr [rdi+120h],xmm2

;polygon[5].Vertex[0] = vertex[4];
vmovups xmm3,xmmword ptr [rsi+40h]
vmovups xmmword ptr [rdi+140h],xmm3
;polygon[5].Vertex[1] = vertex[3];
vmovups xmm4,xmmword ptr [rsi+30h]
vmovups xmmword ptr [rdi+150h],xmm4
;polygon[5].Vertex[2] = vertex[7];
vmovups xmm5,xmmword ptr [rsi+70h]
vmovups xmmword ptr [rdi+160h],xmm5

;Right
;polygon[6].Vertex[0] = vertex[1];
vmovups xmm0,xmmword ptr [rsi+10h]
vmovups xmmword ptr [rdi+180h],xmm0
;polygon[6].Vertex[1] = vertex[5];
vmovups xmm1,xmmword ptr [rsi+50h]
vmovups xmmword ptr [rdi+190h],xmm1
;polygon[6].Vertex[2] = vertex[6];
vmovups xmm2,xmmword ptr [rsi+60h]
vmovups xmmword ptr [rdi+1A0h],xmm2

;polygon[7].Vertex[0] = vertex[1];
vmovups xmm3,xmmword ptr [rsi+10h]
vmovups xmmword ptr [rdi+1C0h],xmm3
;polygon[7].Vertex[1] = vertex[6];
vmovups xmm4,xmmword ptr [rsi+60h]
vmovups xmmword ptr [rdi+1D0h],xmm4
;polygon[7].Vertex[2] = vertex[2];
vmovups xmm5,xmmword ptr [rsi+20h]
vmovups xmmword ptr [rdi+1E0h],xmm5

;Top
;polygon[8].Vertex[0] = vertex[3];
vmovups xmm0,xmmword ptr [rsi+30h]
vmovups xmmword ptr [rdi+200h],xmm0
;polygon[8].Vertex[1] = vertex[2];
vmovups xmm1,xmmword ptr [rsi+20h]
vmovups xmmword ptr [rdi+210h],xmm1
;polygon[8].Vertex[2] = vertex[6];
vmovups xmm2,xmmword ptr [rsi+60h]
vmovups xmmword ptr [rdi+220h],xmm2

;polygon[9].Vertex[0] = vertex[3];
vmovups xmm3,xmmword ptr [rsi+30h]
vmovups xmmword ptr [rdi+240h],xmm3
;polygon[9].Vertex[1] = vertex[6];
vmovups xmm4,xmmword ptr [rsi+60h]
vmovups xmmword ptr [rdi+250h],xmm4
;polygon[9].Vertex[2] = vertex[7];
vmovups xmm5,xmmword ptr [rsi+70h]
vmovups xmmword ptr [rdi+260h],xmm5

;Bottom
;polygon[10].Vertex[0] = vertex[5];
vmovups xmm0,xmmword ptr [rsi+50h]
vmovups xmmword ptr [rdi+280h],xmm0
;polygon[10].Vertex[1] = vertex[1];
vmovups xmm1,xmmword ptr [rsi+10h]
vmovups xmmword ptr [rdi+290h],xmm1
;polygon[10].Vertex[2] = vertex[0];
vmovups xmm2,xmmword ptr [rsi+00h]
vmovups xmmword ptr [rdi+2A0h],xmm2

;polygon[11].Vertex[0] = vertex[5];
vmovups xmm3,xmmword ptr [rsi+50h]
vmovups xmmword ptr [rdi+2C0h],xmm3
;polygon[11].Vertex[1] = vertex[0];
vmovups xmm4,xmmword ptr [rsi+00h]
vmovups xmmword ptr [rdi+2D0h],xmm4
;polygon[11].Vertex[2] = vertex[4];
vmovups xmm5,xmmword ptr [rsi+40h]
vmovups xmmword ptr [rdi+2E0h],xmm5

;Normals
xor rcx,rcx
lbl_NextNormal:

mov rax,rcx
shl ax,6 ;imul ax,40h ;SizeOf POLYGON
lea rsi,pg
add rsi,rax

movups xmm0,xmmword ptr[rsi+00h] ;Vertex[0]
movups xmm1,xmmword ptr[rsi+10h] ;Vertex[1]
movups xmm2,xmmword ptr[rsi+20h] ;Vertex[2]

subps xmm1,xmm0 ;u = Vertex[1] - Vertex[0]
subps xmm2,xmm0 ;v = Vertex[2] - Vertex[0]

;Normal.x = (uy*vz)-(vy*uz);
;Normal.y = (uz*vx)-(vz*ux);
;Normal.z = (ux*vy)-(vx*uy);

pshufd xmm3,xmm1,11001001b ;xmm3 = uw,ux,uz,uy
pshufd xmm4,xmm2,11010010b ;xmm4 = vw,vy,vx,vz

pshufd xmm5,xmm1,11010010b ;xmm5 = uw,uy,ux,uz
pshufd xmm6,xmm2,11001001b ;xmm6 = vw,vx,vz,vy

mulps xmm3,xmm4 ;xmm3 = uw*vw,ux*vy,uz*vx,uy*vz
mulps xmm5,xmm6 ;xmm5 = uw*vw,uy*vx,ux*vz,uz*vy

subps xmm3,xmm5 ;xmm3 = 0,Normal.z,Normal.y,Normal.x

movups xmmword ptr[rsi+30h],xmm3

inc cl
cmp cl,12
jl lbl_NextNormal

;Epilogue
leave
ret
SetPolygons endp


