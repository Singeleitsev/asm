
;Clear Face Counter
mov i0,0

lblDrawFace:

;Reset Face Color Address
lea rsi,fc0
;Shift to Current Face Color
xor rax,rax
mov ax,i0
;Address = Counter*Size = i0*16 bytes
;Shift by 4 digits = Multiply by 16
shl rax,4
add rsi,rax

;Set Face Colors
movd xmm0,dword ptr [rsi+0] ;r
movd xmm1,dword ptr [rsi+4] ;g
movd xmm2,dword ptr [rsi+8] ;b
call glColor3f

;Set Points
mov rcx,7 ;GL_QUADS
call glBegin

;Clear Vertex Counter
mov i1,0

lblSetVertex:
;Reset Face Address
lea rsi,f0
;Shift to Current Face
xor rax,rax
mov ax,i0
;Address = Counter*Size = i0*4 bytes
;Shift by 2 digits = Multiply by 4
shl rax,2
;Shift to Current Vertex
add ax,i1
add rsi,rax

;Reset Vertex Address
lea rdi,v3D
xor rbx,rbx
mov bl, byte ptr[rsi]
;Address = Counter*Size = i0*4 bytes
;Shift by 2 digits = Multiply by 4
shl rbx,2
;Shift to Current Vertex
add rdi,rbx

;Set Points
movd xmm0,dword ptr [rdi+0] ;x
movd xmm1,dword ptr [rdi+20h] ;y ;8 coordinates * 4 bytes
movd xmm2,dword ptr [rdi+40h] ;z
call glVertex3f

inc i1 ;Next Vertex
cmp i1,4 ;Number of Vertices
jl lblSetVertex

call glEnd

inc i0 ;Next Face
cmp i0,6 ;Number of Faces
jl lblDrawFace

