Draw3DScene proc
;Since the Proc has NOparameters
;Assembler will NOT add this prologue automatically:
;push rbp
;mov rbp,rsp

LOCAL lp0:QWORD,lp1:QWORD,lp2:QWORD,lp3:QWORD,lp4:QWORD,lp5:QWORD
LOCAL lp6:QWORD,lp7:QWORD,lp8:QWORD,lp9:QWORD,lpA:QWORD,lpB:QWORD

;Stack Usage: 8(return address)+0(parameters)+8(push)+60(locals) = 70h

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

lea rsi,pg ;AddressOf Zeroth POLYGON
lea rdi,lp0 ;AddressOf Address
xor cl,cl
lbl_Draw3D_StoreAddr:
mov qword ptr[rdi],rsi
add rsi,40h
add rdi,8
inc cl
cmp cl,12
jl lbl_Draw3D_StoreAddr

mov rcx,0de1H ;GL_TEXTURE_2D
Call glEnable

mov rcx,0de1H ;GL_TEXTURE_2D
xor rdx,rdx
mov edx,txr.txrID ;The name of a texture; the texture name cannot currently be in use
Call glBindTexture ;Enable the creation of a named texture that is bound to a texture target

mov rcx,0b50H ;GL_LIGHTING
Call glEnable

Call glPushMatrix
mov rcx,4 ;GL_TRIANGLES
Call glBegin

;Front Face

mov rcx,lp0
Call glNormal3fv ;(&polygon[0].Vertex[0].nx)

xorps xmm0,xmm0
xorps xmm1,xmm1
Call glTexCoord2f ;(0.0f, 0.0f)
mov rcx,lp0
Call glVertex3fv ;(&polygon[0].Vertex[0].x)
movss xmm0,f32_1
xorps xmm1,xmm1
Call glTexCoord2f ;(1.0f, 0.0f)
mov rcx,lp0
add rcx,4
Call glVertex3fv ;(&polygon[0].Vertex[1].x)
movss xmm0,f32_1
movss xmm1,f32_1
Call glTexCoord2f ;(1.0f, 1.0f)
mov rcx,lp0
add rcx,8
Call glVertex3fv ;(&polygon[0].Vertex[2].x)

mov rcx,lp1
Call glNormal3fv ;(&polygon[1].Vertex[0].nx)

xorps xmm0,xmm0
xorps xmm1,xmm1
Call glTexCoord2f ;(0.0f, 0.0f)
mov rcx,lp1
Call glVertex3fv ;(&polygon[1].Vertex[0].x)
movss xmm0,f32_1
movss xmm1,f32_1
Call glTexCoord2f ;(1.0f, 1.0f)
mov rcx,lp1
add rcx,4
Call glVertex3fv ;(&polygon[1].Vertex[1].x)
xorps xmm0,xmm0
movss xmm1,f32_1
Call glTexCoord2f ;(0.0f, 1.0f)
mov rcx,lp1
add rcx,8
Call glVertex3fv ;(&polygon[1].Vertex[2].x)

;Back Face

mov rcx,lp2
Call glNormal3fv ;(&polygon[2].Vertex[0].nx)

xorps xmm0,xmm0
xorps xmm1,xmm1
Call glTexCoord2f ;(0.0f, 0.0f)
mov rcx,lp2
Call glVertex3fv ;(&polygon[2].Vertex[0].x)
movss xmm0,f32_1
xorps xmm1,xmm1
Call glTexCoord2f ;(1.0f, 0.0f)
mov rcx,lp2
add rcx,4
Call glVertex3fv ;(&polygon[2].Vertex[1].x)
movss xmm0,f32_1
movss xmm1,f32_1
Call glTexCoord2f ;(1.0f, 1.0f)
mov rcx,lp2
add rcx,8
Call glVertex3fv ;(&polygon[2].Vertex[2].x)

mov rcx,lp3
Call glNormal3fv ;(&polygon[3].Vertex[0].nx)

xorps xmm0,xmm0
xorps xmm1,xmm1
Call glTexCoord2f ;(0.0f, 0.0f)
mov rcx,lp3
Call glVertex3fv ;(&polygon[3].Vertex[0].x)
movss xmm0,f32_1
movss xmm1,f32_1
Call glTexCoord2f ;(1.0f, 1.0f)
mov rcx,lp3
add rcx,4
Call glVertex3fv ;(&polygon[3].Vertex[1].x)
xorps xmm0,xmm0
movss xmm1,f32_1
Call glTexCoord2f ;(0.0f, 1.0f)
mov rcx,lp3
add rcx,8
Call glVertex3fv ;(&polygon[3].Vertex[2].x)

;Top Face

mov rcx,lp4
Call glNormal3fv ;(&polygon[4].Vertex[0].nx)

xorps xmm0,xmm0
xorps xmm1,xmm1
Call glTexCoord2f ;(0.0f, 0.0f)
mov rcx,lp4
Call glVertex3fv ;(&polygon[4].Vertex[0].x)
movss xmm0,f32_1
xorps xmm1,xmm1
Call glTexCoord2f ;(1.0f, 0.0f)
mov rcx,lp4
add rcx,4
Call glVertex3fv ;(&polygon[4].Vertex[1].x)
movss xmm0,f32_1
movss xmm1,f32_1
Call glTexCoord2f ;(1.0f, 1.0f)
mov rcx,lp4
add rcx,8
Call glVertex3fv ;(&polygon[4].Vertex[2].x)

mov rcx,lp5
Call glNormal3fv ;(&polygon[5].Vertex[0].nx)

xorps xmm0,xmm0
xorps xmm1,xmm1
Call glTexCoord2f ;(0.0f, 0.0f)
mov rcx,lp5
Call glVertex3fv ;(&polygon[5].Vertex[0].x)
movss xmm0,f32_1
movss xmm1,f32_1
Call glTexCoord2f ;(1.0f, 1.0f)
mov rcx,lp5
add rcx,4
Call glVertex3fv ;(&polygon[5].Vertex[1].x)
xorps xmm0,xmm0
movss xmm1,f32_1
Call glTexCoord2f ;(0.0f, 1.0f)
mov rcx,lp5
add rcx,8
Call glVertex3fv ;(&polygon[5].Vertex[2].x)

;Bottom Face
mov rcx,lp6
Call glNormal3fv ;(&polygon[6].Vertex[0].nx)

xorps xmm0,xmm0
xorps xmm1,xmm1
Call glTexCoord2f ;(0.0f, 0.0f)
mov rcx,lp6
Call glVertex3fv ;(&polygon[6].Vertex[0].x)
movss xmm0,f32_1
xorps xmm1,xmm1
Call glTexCoord2f ;(1.0f, 0.0f)
mov rcx,lp6
add rcx,4
Call glVertex3fv ;(&polygon[6].Vertex[1].x)
movss xmm0,f32_1
movss xmm1,f32_1
Call glTexCoord2f ;(1.0f, 1.0f)
mov rcx,lp6
add rcx,8
Call glVertex3fv ;(&polygon[6].Vertex[2].x)

mov rcx,lp7
Call glNormal3fv ;(&polygon[7].Vertex[0].nx)

xorps xmm0,xmm0
xorps xmm1,xmm1
Call glTexCoord2f ;(0.0f, 0.0f)
mov rcx,lp7
Call glVertex3fv ;(&polygon[7].Vertex[0].x)
movss xmm0,f32_1
movss xmm1,f32_1
Call glTexCoord2f ;(1.0f, 1.0f)
mov rcx,lp7
add rcx,4
Call glVertex3fv ;(&polygon[7].Vertex[1].x)
xorps xmm0,xmm0
movss xmm1,f32_1
Call glTexCoord2f ;(0.0f, 1.0f)
mov rcx,lp7
add rcx,8
Call glVertex3fv ;(&polygon[7].Vertex[2].x)

;Right face

mov rcx,lp8
Call glNormal3fv ;(&polygon[8].Vertex[0].nx)

xorps xmm0,xmm0
xorps xmm1,xmm1
Call glTexCoord2f ;(0.0f, 0.0f)
mov rcx,lp8
Call glVertex3fv ;(&polygon[8].Vertex[0].x)
movss xmm0,f32_1
xorps xmm1,xmm1
Call glTexCoord2f ;(1.0f, 0.0f)
mov rcx,lp8
add rcx,4
Call glVertex3fv ;(&polygon[8].Vertex[1].x)
movss xmm0,f32_1
movss xmm1,f32_1
Call glTexCoord2f ;(1.0f, 1.0f)
mov rcx,lp8
add rcx,8
Call glVertex3fv ;(&polygon[8].Vertex[2].x)

mov rcx,lp9
Call glNormal3fv ;(&polygon[9].Vertex[0].nx)

xorps xmm0,xmm0
xorps xmm1,xmm1
Call glTexCoord2f ;(0.0f, 0.0f)
mov rcx,lp9
Call glVertex3fv ;(&polygon[9].Vertex[0].x)
movss xmm0,f32_1
movss xmm1,f32_1
Call glTexCoord2f ;(1.0f, 1.0f)
mov rcx,lp9
add rcx,4
Call glVertex3fv ;(&polygon[9].Vertex[1].x)
xorps xmm0,xmm0
movss xmm1,f32_1
Call glTexCoord2f ;(0.0f, 1.0f)
mov rcx,lp9
add rcx,8
Call glVertex3fv ;(&polygon[9].Vertex[2].x)

;Left Face

mov rcx,lpA
Call glNormal3fv ;(&polygon[10].Vertex[0].nx)

xorps xmm0,xmm0
xorps xmm1,xmm1
Call glTexCoord2f ;(0.0f, 0.0f)
mov rcx,lpA
Call glVertex3fv ;(&polygon[10].Vertex[0].x)
movss xmm0,f32_1
xorps xmm1,xmm1
Call glTexCoord2f ;(1.0f, 0.0f)
mov rcx,lpA
add rcx,4
Call glVertex3fv ;(&polygon[10].Vertex[1].x)
movss xmm0,f32_1
movss xmm1,f32_1
Call glTexCoord2f ;(1.0f, 1.0f)
mov rcx,lpA
add rcx,8
Call glVertex3fv ;(&polygon[10].Vertex[2].x)

mov rcx,lpB
Call glNormal3fv ;(&polygon[11].Vertex[0].nx)

xorps xmm0,xmm0
xorps xmm1,xmm1
Call glTexCoord2f ;(0.0f, 0.0f)
mov rcx,lpB
Call glVertex3fv ;(&polygon[11].Vertex[0].x)
movss xmm0,f32_1
movss xmm1,f32_1
Call glTexCoord2f ;(1.0f, 1.0f)
mov rcx,lpB
add rcx,4
Call glVertex3fv ;(&polygon[11].Vertex[1].x)
xorps xmm0,xmm0
movss xmm1,f32_1
Call glTexCoord2f ;(0.0f, 1.0f)
mov rcx,lpB
add rcx,8
Call glVertex3fv ;(&polygon[11].Vertex[2].x)

Call glEnd
Call glPopMatrix

mov rcx,0b50H ;GL_LIGHTING
Call glDisable

mov rcx,0de1H ;GL_TEXTURE_2D
Call glDisable

;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
Draw3DScene endp

