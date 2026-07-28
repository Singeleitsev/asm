Draw2DScene proc

;Prologue
push rbp
mov rbp,rsp

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

mov rcx,4100h ;GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT
call glClear

mov rcx,0de1H ;GL_TEXTURE_2D
call glDisable

;Disable lighting for the 2D Cube
mov rcx,0B50H ;GL_LIGHTING
call glDisable

mov rcx,1700h ;GL_MODELVIEW
call glMatrixMode

call glLoadIdentity

Call glPushMatrix

mov rcx,1 ;GL_LINES
Call glBegin

lea rsi,pg
mov rdi,rsi
add rdi,300h ;6 Faces * 2 Polygons * 4 Points * 4 Coordinates * 4 bytes
lbl_Draw2D_Face:
mov rcx,rsi
add rcx,30h
Call glNormal3fv ;(&polygon[i].Vertex[0].nx)
mov rcx,rsi
Call glVertex3fv ;(&polygon[i].Vertex[0].x)
mov rcx,rsi
add rcx,10h
Call glVertex3fv ;(&polygon[i].Vertex[1].x)
mov rcx,rsi
add rcx,10h
Call glVertex3fv ;(&polygon[i].Vertex[1].x)
mov rcx,rsi
add rcx,20h
Call glVertex3fv ;(&polygon[i].Vertex[2].x)
mov rcx,rsi
add rcx,20h
Call glVertex3fv ;(&polygon[i].Vertex[2].x)
mov rcx,rsi
Call glVertex3fv ;(&polygon[i].Vertex[0].x)
add rsi,40h ;Next Polygon
cmp rsi,rdi
jl lbl_Draw2D_Face

Call glEnd

Call glPopMatrix

mov rcx,0b50H ;GL_LIGHTING
Call glEnable

;Draw Yellow Sphere
mov rcx,404H ;GL_FRONT
mov rdx,1200H ;GL_AMBIENT
lea r8,fMatSphereAmbient
Call glMaterialfv

mov rcx,404H ;GL_FRONT
mov rdx,1201H ;GL_DIFFUSE
lea r8,fMatSphereDiffuse
Call glMaterialfv

Call glPushMatrix

;glTranslatef(vertex[VertexNumber].x, vertex[VertexNumber].y, vertex[VertexNumber].z)
lea rsi,vtx
movzx rax,VertexNumber
shl ax,4 ;mul ax,10h ;sizeof POINT4D
add rsi,rax
movss xmm0,dword ptr[rsi]
movss xmm1,dword ptr[rsi+4]
movss xmm2,dword ptr[rsi+8]
Call glTranslatef

mov rcx,sphere
mov edx,186b4H ;GLU_OUTSIDE
Call gluQuadricOrientation

mov rcx,sphere
movsd xmm1,f64_10
mov r8d,14h ;20
mov r9d,14h ;20
Call gluSphere

Call glPopMatrix

;Epilogue
leave
ret
Draw2DScene endp

