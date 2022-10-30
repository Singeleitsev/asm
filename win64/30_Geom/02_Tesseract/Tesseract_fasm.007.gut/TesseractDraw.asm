
;Set Vertex Counter
lea rsi,[f0] ;Face 0 Vertex 0
;Set Iteration Counter
mov [i0],0

.DrawFace:
invoke glBegin,GL_QUADS
;invoke glColor3f, float dword 1.0,float dword 1.0,float dword 1.0

;Get Face Colors
lea rdi,[fc0] ;Reset to Vertex 0
xor rbx,rbx
mov bl,byte [i0]
shl rbx,4 ;Multiply by 16 bytes because Color has 4 RGBA Components
add rdi,rbx
;invoke glColor3f, float dword 1.0,float dword 1.0,float dword 1.0
invoke glColor3f, float dword [rdi+00], float dword [rdi+04], float dword [rdi+08]

mov [i1],0
.SetVertex:

;Get Vertex Coordinates
lea rdi,[v2] ;Reset to Vertex 0
xor rbx,rbx
mov bl,byte [rsi]
shl rbx,4 ;Multiply by 16 bytes because Face has 4 Vertices
add rdi,rbx

invoke glVertex3f, float dword [rdi+00], float dword [rdi+04], float dword [rdi+08]

inc rsi ;Vertex Counter
inc [i1]
cmp [i1],4
jl .SetVertex

invoke glEnd

inc [i0]
cmp [i0],6 ;Number of Faces
jl .DrawFace

