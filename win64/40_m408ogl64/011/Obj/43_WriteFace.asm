;---------------------------------------------------------------
;WriteFace - a routine splitted for Opaque and Transparent Faces
;Input
;rcx = Current face address (to read from)
;rdx = Current material address (to read from)
;rsi = indices-out (rsiOpaque or rsiTransparent)
;rdi = gpInterleavedVNC
;Output:
;rcx = Current face address (to read from) untouched
;rsi = indices-out (rsiOpaque or rsiTransparent) advanced
;rdi = gpInterleavedVNC advanced
;--------------------------------

WriteFace proc
PROLOG 100h

xor rbx,rbx ;group offset 0,12,24,...

lbl_GroupLoop:
;v -> position
movsxd rax,dword ptr[rbx+rcx+0] ;Read the current index
imul rax,rax,12 ;sizeof(vec3)
add rax,gpBuffer_v
mov r9d,dword ptr [rax+0]
mov dword ptr [rdi+00h],r9d
mov r9d,dword ptr [rax+4]
mov dword ptr [rdi+04h],r9d
mov r9d,dword ptr [rax+8]
mov dword ptr [rdi+08h],r9d
mov dword ptr [rdi+0Ch],3F800000h ; w = 1.0

;vn -> normal
movsxd rax,dword ptr[rbx+rcx+8] ;Read the current index
imul rax,rax,12 ;sizeof(vec3)
add rax,gpBuffer_vn
mov r9d,dword ptr [rax+0]
mov dword ptr [rdi+10h],r9d
mov r9d,dword ptr [rax+4]
mov dword ptr [rdi+14h],r9d
mov r9d,dword ptr [rax+8]
mov dword ptr [rdi+18h],r9d
mov dword ptr [rdi+1Ch],0 

;Kd (vec4) - diffuse Color with Aplha
movups xmm2,xmmword ptr [rdx + OFFSET_KD]
movups xmmword ptr[rdi+20h],xmm2

;Ks (vec4) — direct copy from CPU struct
movups xmm3,xmmword ptr [rdx + OFFSET_KS]
movups xmmword ptr [rdi+30h],xmm3

;Ka (vec4)
movups xmm4,xmmword ptr [rdx + OFFSET_KA]
movups xmmword ptr [rdi+40h],xmm4

;Ke (vec4)
movups xmm5,xmmword ptr [rdx + OFFSET_KE]
movups xmmword ptr [rdi+50h],xmm5

;Ns,Ni,Tr,Pr — 4 contiguous floats
movups xmm6,xmmword ptr [rdx + OFFSET_NS]
movups xmmword ptr [rdi+60h],xmm6

;Pm,Pc,Pcr,illum — 4 contiguous 4-byte slots (illum as raw DWORD bits)
movups xmm7,xmmword ptr [rdx + OFFSET_PM]
movups xmmword ptr [rdi+70h],xmm7

;Advance the Current Vertex
mov eax,gnCurrentVertex
mov dword ptr[rsi],eax
add rsi,4 ;sizeof(face_index)
inc gnCurrentVertex

;Advance the cursor
add rdi,STRIDE
add rbx,12 ;sizeof(vec3)
cmp rbx,SIZE_FACE
jl lbl_GroupLoop

EPILOG
WriteFace endp


