;lbl_SetNormal:

mov rax,bLoop
mul ax,SIZEOF polygon ;ax = index * size
lea rsi,polygon
add rax,rsi
mov v0x,dword ptr [rax]
add rax,4
mov v0y,dword ptr [rax]
add rax,4
mov v0z,dword ptr [rax]
add rax,8 ;skip v0w
mov v1x,dword ptr [rax]
add rax,4
mov v1y,dword ptr [rax]
add rax,4
mov v1z,dword ptr [rax]
add rax,8 ;skip v1w
mov v2x,dword ptr [rax]
add rax,4
mov v2y,dword ptr [rax]
add rax,4 ;We'll use this Address in RAX to store the Normal Vector Coordinates
mov v2z,dword ptr [rax]

;ux = Vertex[1].x - Vertex[0].x;
movss xmm0,v1x
subss xmm0,v0x
movss ux,xmm0
;uy = Vertex[1].y - Vertex[0].y;
movss xmm1,v1y
subss xmm1,v0y
movss uy,xmm1
;uz = Vertex[1].z - Vertex[0].z;
movss xmm2,v1z
subss xmm2,v0z
movss uz,xmm2
;vx = Vertex[2].x - Vertex[0].x;
movss xmm3,v2x
subss xmm3,v0x
movss vx,xmm3
;vy = Vertex[2].y - Vertex[0].y;
movss xmm4,v2y
subss xmm4,v0y
movss vy,xmm4
;vz = Vertex[2].z - Vertex[0].z;
movss xmm5,v2z
subss xmm5,v0z
movss vz,xmm5

;Normal.x = (uy*vz)-(vy*uz);
vmulss xmm6,xmm1,xmm5
vmulss xmm7,xmm4,xmm2
vsubss xmm8,xmm6,xmm7
add rax,8 ;skip v2w
mov dword prt [rax],xmm8
;Normal.y = (uz*vx)-(vz*ux);
vmulss xmm9,xmm2,xmm3
vmulss xmm10,xmm5,xmm0
vsubss xmm11,xmm9,xmm10
add rax,4
mov dword prt [rax],xmm11
;Normal.z = (ux*vy)-(vx*uy);
vmulss xmm12,xmm0,xmm4
vmulss xmm13,xmm3,xmm1
vmulss xmm14,xmm12,xmm13
add rax,4
mov dword prt [rax],xmm14

;lbl_SetNormal_End:

