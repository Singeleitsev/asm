;---------------------------------------------------------------
;WriteFace - a routine splitted for Opaque and Transparent Faces
;Input:
;rdx = Current face address (to read from)
;rsi = either rsiOpaque or rsiTransparent
;rdi = gpInterleavedVNC
;Output:
;rdx = Current face address (to read from) advanced
;rsi = either rsiOpaque or rsiTransparent advanced
;rdi = gpInterleavedVNC advanced
;--------------------------------

WriteFace proc
PROLOG 100h

xor rcx,rcx ;group offset 0,12,24

lbl_GroupLoop:
;v -> position
movsxd rax,dword ptr[rdx+rcx+0] ;Read the current index
imul rax,rax,12 ;sizeof(vec3)
add rax,gpBuffer_v
mov r9d,dword ptr[rax+0] ;Write the current vertex
mov dword ptr[rdi+0],r9d
mov r9d,dword ptr[rax+4]
mov dword ptr[rdi+4],r9d
mov r9d,dword ptr[rax+8]
mov dword ptr[rdi+8],r9d

;vn -> normal
movsxd rax,dword ptr[rdx+rcx+8] ;Read the current index
imul rax,rax,12 ;sizeof(vec3)
add rax,gpBuffer_vn
mov r9d,dword ptr[rax+0] ;Write the current normal
mov dword ptr[rdi+12],r9d
mov r9d,dword ptr[rax+4]
mov dword ptr[rdi+16],r9d
mov r9d,dword ptr[rax+8]
mov dword ptr[rdi+20],r9d

;Color
movups xmm0,xmmCurrentColor ;a,b,g,r in little-endian
movups xmmword ptr[rdi+24],xmm0

;Advance the Current Vertex
mov eax,gnCurrentVertex
mov dword ptr[rsi],eax
add rsi,4 ;sizeof(face_index)
inc gnCurrentVertex

;Advance the cursor
add rdi,STRIDE
add rcx,12 ;sizeof(vec3)
cmp rcx,36 ;sizeof(face)
jl lbl_GroupLoop

EPILOG
WriteFace endp


