GetNormals proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

lea rdi,vbo ;ex-Cube Vertices
lea rax,xmmMask ;xmmMask dd 0FFFFFFFFh,0FFFFFFFFh,0FFFFFFFFh,0
xor rcx,rcx ;Counter

lbl_NextNormal:

vmovups xmm0,xmmword ptr[rdi+00h] ;v00.xN,v00.z,v00.y,v00.x
vmovups xmm1,xmmword ptr[rdi+20h] ;v01.xN,v01.z,v01.y,v01.x
vmovups xmm2,xmmword ptr[rdi+40h] ;v02.xN,v02.z,v02.y,v02.x
vandps xmm0,xmm0,xmmword ptr[rax] ;0,v00.z,v00.y,v00.x
vandps xmm1,xmm1,xmmword ptr[rax] ;0,v01.z,v01.y,v01.x
vandps xmm2,xmm2,xmmword ptr[rax] ;0,v02.z,v02.y,v02.x

vsubps xmm3,xmm1,xmm0 ;u = v01 - v00
ptest xmm3,xmm3
jz lbl_GetNormals_Zero_Err
vsubps xmm4,xmm2,xmm0 ;v = v02 - v00
ptest xmm4,xmm4
jz lbl_GetNormals_Zero_Err

;Normal.x = (uy*vz)-(vy*uz);
;Normal.y = (uz*vx)-(vz*ux);
;Normal.z = (ux*vy)-(vx*uy);

vpermilps xmm5,xmm3,11001001b ;xmm5 = 0,ux,uz,uy
vpermilps xmm6,xmm4,11010010b ;xmm6 = 0,vy,vx,vz

vpermilps xmm7,xmm3,11010010b ;xmm7 = 0,uy,ux,uz
vpermilps xmm8,xmm4,11001001b ;xmm8 = 0,vx,vz,vy

vmulps xmm9,xmm5,xmm6 ;xmm9 = 0,ux*vy,uz*vx,uy*vz
vmulps xmm10,xmm7,xmm8 ;xmm10 = 0,uy*vx,ux*vz,uz*vy

vsubps xmm11,xmm9,xmm10 ;xmm11 = 0,Normal.z,Normal.y,Normal.x
ptest xmm11,xmm11
jz lbl_GetNormals_Zero_Err
vdpps xmm12,xmm11,xmm11,01110111b ;xmm12 = 0,0,0,len*len
vsqrtss xmm12,xmm12,xmm12 ;xmm12 = 0,0,0,len
vpermilps xmm12,xmm12,11000000b ;xmm12 = 0,len,len,len
vdivps xmm13,xmm11,xmm12

vinsertps xmm14,xmm13,dword ptr[rdi+18h],30h
vmovups xmmword ptr[rdi+0Ch],xmm14
vinsertps xmm14,xmm13,dword ptr[rdi+38h],30h
vmovups xmmword ptr[rdi+2Ch],xmm14
vinsertps xmm14,xmm13,dword ptr[rdi+58h],30h
vmovups xmmword ptr[rdi+4Ch],xmm14
vinsertps xmm14,xmm13,dword ptr[rdi+78h],30h
vmovups xmmword ptr[rdi+6Ch],xmm14

add rdi,80h
inc cl
cmp cl,6
jl lbl_NextNormal

jmp lbl_GetNormals_Return1

lbl_GetNormals_Zero_Err:
lea rdx,szGetNormals_Zero_Err ;Bad Polygon
jmp lbl_GetNormals_ShowErrorMessage

;Show Message and Quit
lbl_GetNormals_ShowErrorMessage:
xor rcx,rcx
lea r8,szGetNormals
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
mov rax,-1
jmp lbl_GetNormals_End

lbl_GetNormals_Return1:
mov rax,1
;jmp lbl_GetNormals_End

lbl_GetNormals_End:
;Epilogue
leave
ret
GetNormals endp

