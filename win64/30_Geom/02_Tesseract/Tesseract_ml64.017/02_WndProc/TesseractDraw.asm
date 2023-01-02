
;Set Vertex Counter
lea rsi,f0 ;Face 0 Vertex 0
;Set Iteration Counter
mov i0,0

lblDrawFace:
mov rcx,7 ;GL_QUADS
call glBegin

;Get Face Colors
lea rdi,fc0 ;Reset to Vertex 0
xor rbx,rbx
mov bl,byte ptr i0
shl rbx,4 ;Multiply by 16 bytes because Color has 4 RGBA Components
add rdi,rbx

movd xmm0,dword ptr [rdi+00]
movd xmm1,dword ptr [rdi+04]
movd xmm2,dword ptr [rdi+08]
call glColor3f

;Set Vertex Counter
mov i1,0
lblSetVertex:

;Get Vertex Coordinates
lea rdi,v2 ;Reset to Vertex 0
xor rbx,rbx
mov bl,byte ptr [rsi]
shl rbx,4 ;Multiply by 16 bytes because Face has 4 Vertices
add rdi,rbx

movd xmm0,dword ptr [rdi+00]
movd xmm1,dword ptr [rdi+04]
movd xmm2,dword ptr [rdi+08]
call glVertex3f

inc rsi ;Next Face
inc i1 ;Vertex Counter
cmp i1,4
jl lblSetVertex

call glEnd

inc i0 ;Next Iteration
cmp i0,6 ;Number of Faces
jl lblDrawFace

