Draw2DScene proc

LOCAL lp0:QWORD,lp1:QWORD,lp2:QWORD,lp3:QWORD,lp4:QWORD,lp5:QWORD
LOCAL lp6:QWORD,lp7:QWORD,lp8:QWORD,lp9:QWORD,lpA:QWORD,lpB:QWORD

;Prologue
push rbp
mov rbp,rsp

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

lea rsi,pg ;AddressOf Zeroth POLYGON
lea rdi,lp0 ;AddressOf Address
xor rcx,rcx
lbl_Draw2D_StoreAddr:
mov qword ptr[rdi],rsi
add rsi,40h
sub rdi,8 ;move to next local (lower address)
inc cl
cmp cl,12
jl lbl_Draw2D_StoreAddr

xorps xmm0,xmm0
movss xmm1,f32_1
xorps xmm2,xmm2
movss xmm3,xmm1
Call glColor4f ;(0.0, 1.0, 0.0, 1.0);

Call glPushMatrix
mov rcx,1 ;GL_LINES
Call glBegin

;Front Face
mov rcx,lp0
Call glVertex3fv ;(&polygon[0].Vertex[0].x)

mov rcx,lp0
add rcx,10h
Call glVertex3fv ;(&polygon[0].Vertex[1].x)
mov rcx,lp0
add rcx,10h
Call glVertex3fv ;(&polygon[0].Vertex[1].x)
mov rcx,lp0
add rcx,20h
Call glVertex3fv ;(&polygon[0].Vertex[2].x)
mov rcx,lp0
add rcx,20h
Call glVertex3fv ;(&polygon[0].Vertex[2].x)
mov rcx,lp0
Call glVertex3fv ;(&polygon[0].Vertex[0].x)

mov rcx,lp1
Call glVertex3fv ;(&polygon[1].Vertex[0].x)
mov rcx,lp1
add rcx,10h
Call glVertex3fv ;(&polygon[1].Vertex[1].x)
mov rcx,lp1
add rcx,10h
Call glVertex3fv ;(&polygon[1].Vertex[1].x)
mov rcx,lp1
add rcx,20h
Call glVertex3fv ;(&polygon[1].Vertex[2].x)
mov rcx,lp1
add rcx,20h
Call glVertex3fv ;(&polygon[1].Vertex[2].x)
mov rcx,lp1
Call glVertex3fv ;(&polygon[1].Vertex[0].x)

;Back Face
mov rcx,lp2
add rcx,30h
Call glNormal3fv ;(&polygon[2].Vertex[0].nx)

mov rcx,lp2
Call glVertex3fv ;(&polygon[2].Vertex[0].x)
mov rcx,lp2
add rcx,10h
Call glVertex3fv ;(&polygon[2].Vertex[1].x)
mov rcx,lp2
add rcx,10h
Call glVertex3fv ;(&polygon[2].Vertex[1].x)
mov rcx,lp2
add rcx,20h
Call glVertex3fv ;(&polygon[2].Vertex[2].x)
mov rcx,lp2
add rcx,20h
Call glVertex3fv ;(&polygon[2].Vertex[2].x)
mov rcx,lp2
Call glVertex3fv ;(&polygon[2].Vertex[0].x)

mov rcx,lp3
Call glVertex3fv ;(&polygon[3].Vertex[0].x)
mov rcx,lp3
add rcx,10h
Call glVertex3fv ;(&polygon[3].Vertex[1].x)
mov rcx,lp3
add rcx,10h
Call glVertex3fv ;(&polygon[3].Vertex[1].x)
mov rcx,lp3
add rcx,20h
Call glVertex3fv ;(&polygon[3].Vertex[2].x)
mov rcx,lp3
add rcx,20h
Call glVertex3fv ;(&polygon[3].Vertex[2].x)
mov rcx,lp3
Call glVertex3fv ;(&polygon[3].Vertex[0].x)

;Top Face
mov rcx,lp4
add rcx,30h
Call glNormal3fv ;(&polygon[4].Vertex[0].nx)

mov rcx,lp4
Call glVertex3fv ;(&polygon[4].Vertex[0].x)
mov rcx,lp4
add rcx,10h
Call glVertex3fv ;(&polygon[4].Vertex[1].x)
mov rcx,lp4
add rcx,10h
Call glVertex3fv ;(&polygon[4].Vertex[1].x)
mov rcx,lp4
add rcx,20h
Call glVertex3fv ;(&polygon[4].Vertex[2].x)
mov rcx,lp4
add rcx,20h
Call glVertex3fv ;(&polygon[4].Vertex[2].x)
mov rcx,lp4
Call glVertex3fv ;(&polygon[4].Vertex[0].x)

mov rcx,lp5
Call glVertex3fv ;(&polygon[5].Vertex[0].x)
mov rcx,lp5
add rcx,10h
Call glVertex3fv ;(&polygon[5].Vertex[1].x)
mov rcx,lp5
add rcx,10h
Call glVertex3fv ;(&polygon[5].Vertex[1].x)
mov rcx,lp5
add rcx,20h
Call glVertex3fv ;(&polygon[5].Vertex[2].x)
mov rcx,lp5
add rcx,20h
Call glVertex3fv ;(&polygon[5].Vertex[2].x)
mov rcx,lp5
Call glVertex3fv ;(&polygon[5].Vertex[0].x)

;Bottom Face
mov rcx,lp6
add rcx,30h
Call glNormal3fv ;(&polygon[6].Vertex[0].nx)

mov rcx,lp6
Call glVertex3fv ;(&polygon[6].Vertex[0].x)
mov rcx,lp6
add rcx,10h
Call glVertex3fv ;(&polygon[6].Vertex[1].x)
mov rcx,lp6
add rcx,10h
Call glVertex3fv ;(&polygon[6].Vertex[1].x)
mov rcx,lp6
add rcx,20h
Call glVertex3fv ;(&polygon[6].Vertex[2].x)
mov rcx,lp6
add rcx,20h
Call glVertex3fv ;(&polygon[6].Vertex[2].x)
mov rcx,lp6
Call glVertex3fv ;(&polygon[6].Vertex[0].x)

mov rcx,lp7
Call glVertex3fv ;(&polygon[7].Vertex[0].x)
mov rcx,lp7
add rcx,10h
Call glVertex3fv ;(&polygon[7].Vertex[1].x)
mov rcx,lp7
add rcx,10h
Call glVertex3fv ;(&polygon[7].Vertex[1].x)
mov rcx,lp7
add rcx,20h
Call glVertex3fv ;(&polygon[7].Vertex[2].x)
mov rcx,lp7
add rcx,20h
Call glVertex3fv ;(&polygon[7].Vertex[2].x)
mov rcx,lp7
Call glVertex3fv ;(&polygon[7].Vertex[0].x)

;Right face
mov rcx,lp8
add rcx,30h
Call glNormal3fv ;(&polygon[8].Vertex[0].nx)

mov rcx,lp8
Call glVertex3fv ;(&polygon[8].Vertex[0].x)
mov rcx,lp8
add rcx,10h
Call glVertex3fv ;(&polygon[8].Vertex[1].x)
mov rcx,lp8
add rcx,10h
Call glVertex3fv ;(&polygon[8].Vertex[1].x)
mov rcx,lp8
add rcx,20h
Call glVertex3fv ;(&polygon[8].Vertex[2].x)
mov rcx,lp8
add rcx,20h
Call glVertex3fv ;(&polygon[8].Vertex[2].x)
mov rcx,lp8
Call glVertex3fv ;(&polygon[8].Vertex[0].x)

mov rcx,lp9
Call glVertex3fv ;(&polygon[9].Vertex[0].x)
mov rcx,lp9
add rcx,10h
Call glVertex3fv ;(&polygon[9].Vertex[1].x)
mov rcx,lp9
add rcx,10h
Call glVertex3fv ;(&polygon[9].Vertex[1].x)
mov rcx,lp9
add rcx,20h
Call glVertex3fv ;(&polygon[9].Vertex[2].x)
mov rcx,lp9
add rcx,20h
Call glVertex3fv ;(&polygon[9].Vertex[2].x)
mov rcx,lp9
Call glVertex3fv ;(&polygon[9].Vertex[0].x)

;Left Face
mov rcx,lpA
add rcx,30h
Call glNormal3fv ;(&polygon[10].Vertex[0].nx)

mov rcx,lpA
Call glVertex3fv ;(&polygon[10].Vertex[0].x)
mov rcx,lpA
add rcx,10h
Call glVertex3fv ;(&polygon[10].Vertex[1].x)
mov rcx,lpA
add rcx,10h
Call glVertex3fv ;(&polygon[10].Vertex[1].x)
mov rcx,lpA
add rcx,20h
Call glVertex3fv ;(&polygon[10].Vertex[2].x)
mov rcx,lpA
add rcx,20h
Call glVertex3fv ;(&polygon[10].Vertex[2].x)
mov rcx,lpA
Call glVertex3fv ;(&polygon[10].Vertex[0].x)

mov rcx,lpB
Call glVertex3fv ;(&polygon[11].Vertex[0].x)
mov rcx,lpB
add rcx,10h
Call glVertex3fv ;(&polygon[11].Vertex[1].x)
mov rcx,lpB
add rcx,10h
Call glVertex3fv ;(&polygon[11].Vertex[1].x)
mov rcx,lpB
add rcx,20h
Call glVertex3fv ;(&polygon[11].Vertex[2].x)
mov rcx,lpB
add rcx,20h
Call glVertex3fv ;(&polygon[11].Vertex[2].x)
mov rcx,lpB
Call glVertex3fv ;(&polygon[11].Vertex[0].x)

Call glEnd
Call glPopMatrix

;Draw Yellow Sphere

mov rcx,0b50H ;GL_LIGHTING
Call glEnable

mov rcx,404H ;GL_FRONT
mov rdx,1200H ;GL_AMBIENT
lea r8,fMatAmbient
Call glMaterialfv

mov rcx,404H ;GL_FRONT
mov rdx,1201H ;GL_DIFFUSE
lea r8,fMatDiffuse
Call glMaterialfv

Call glPushMatrix

;glTranslatef(vertex[VertexNumber].x, vertex[VertexNumber].y, vertex[VertexNumber].z)
movzx rax,VertexNumber
shl ax,4 ;mul ax,10h ;sizeof POINT4D
lea rsi,vtx
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

