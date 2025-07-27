DrawCap proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Call glPushMatrix
;Call glRotatef(CSng(5 * Rnd - 2.5), 0, 0, 1)
;Call glTranslatef(0, 0, CSng(10 * Rnd))

;Top Surface
mov rcx,7 ;GL_QUADS
Call glBegin
movss xmm0,f32_neg110
movss xmm1,f32_neg110
xorps xmm2,xmm2
Call glVertex3f ;(-110, -110, 0)
movss xmm0,f32_110
movss xmm1,f32_neg110
xorps xmm2,xmm2
Call glVertex3f ;(110, -110, 0)
movss xmm0,f32_110
movss xmm1,f32_110
xorps xmm2,xmm2
Call glVertex3f ;(110, 110, 0)
movss xmm0,f32_neg110
movss xmm1,f32_110
xorps xmm2,xmm2
Call glVertex3f ;(-110, 110, 0)
Call glEnd
;Chamfer
mov rcx,8 ;GL_QUAD_STRIP
Call glBegin
movss xmm0,f32_neg120
movss xmm1,f32_neg120
movss xmm2,f32_neg10
Call glVertex3f ;(-120, -120, -10)
movss xmm0,f32_neg110
movss xmm1,f32_neg110
xorps xmm2,xmm2
Call glVertex3f ;(-110, -110, 0)
movss xmm0,f32_120
movss xmm1,f32_neg120
movss xmm2,f32_neg10
Call glVertex3f ;(120, -120, -10)
movss xmm0,f32_110
movss xmm1,f32_neg110
xorps xmm2,xmm2
Call glVertex3f ;(110, -110, 0)
movss xmm0,f32_120
movss xmm1,f32_120
movss xmm2,f32_neg10
Call glVertex3f ;(120, 120, -10)
movss xmm0,f32_110
movss xmm1,f32_110
xorps xmm2,xmm2
Call glVertex3f ;(110, 110, 0)
movss xmm0,f32_neg120
movss xmm1,f32_120
movss xmm2,f32_neg10
Call glVertex3f ;(-120, 120, -10)
movss xmm0,f32_neg110
movss xmm1,f32_110
xorps xmm2,xmm2
Call glVertex3f ;(-110, 110, 0)
movss xmm0,f32_neg120
movss xmm1,f32_neg120
movss xmm2,f32_neg10
Call glVertex3f ;(-120, -120, -10)
movss xmm0,f32_neg110
movss xmm1,f32_neg110
xorps xmm2,xmm2
Call glVertex3f ;(-110, -110, 0)
Call glEnd

;Call glPopMatrix

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
DrawCap endp
