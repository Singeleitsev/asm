Draw3DScene proc

;Prologue
push rbp
mov rbp,rsp

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

mov rcx,4100h ;GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT
call glClear

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

lea rsi,pg
mov rdi,rsi
add rdi,300h ;6 Faces * 2 Polygons * 4 Points * 4 Coordinates * 4 bytes
lbl_Draw3D_Face:
mov rcx,rsi
add rcx,30h
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
add rcx,10h
Call glVertex3fv ;(&polygon[0].Vertex[1].x)
movss xmm0,f32_1
movss xmm1,f32_1
Call glTexCoord2f ;(1.0f, 1.0f)
mov rcx,lp0
add rcx,20h
Call glVertex3fv ;(&polygon[0].Vertex[2].x)

Call glEnd

Call glPopMatrix

mov rcx,0b50H ;GL_LIGHTING
Call glDisable

mov rcx,0de1H ;GL_TEXTURE_2D
Call glDisable

;Epilogue
leave
ret
Draw3DScene endp

