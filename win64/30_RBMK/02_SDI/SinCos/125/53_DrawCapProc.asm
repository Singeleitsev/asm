DrawCap proc

;Prologue:
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

;0 - Top
xorps xmm0,xmm0 ;0
xorps xmm1,xmm1 ;0
movss xmm2,f32_1 ;1
Call glNormal3f
movss xmm0,f32_110
movss xmm1,xmm0
xorps xmm2,xmm2
Call glVertex3f ;(110, 110, 0)
movss xmm0,f32_neg110
movss xmm1,f32_110
xorps xmm2,xmm2
Call glVertex3f ;(-110, 110, 0)
movss xmm0,f32_neg110
movss xmm1,xmm0
xorps xmm2,xmm2
Call glVertex3f ;(-110, -110, 0)
movss xmm0,f32_110
movss xmm1,f32_neg110
xorps xmm2,xmm2
Call glVertex3f ;(110, -110, 0)

;1 - North
xorps xmm0,xmm0 ;0
movss xmm1,f32_1 ;1
movss xmm2,xmm1 ;1
Call glNormal3f
movss xmm0,f32_120
movss xmm1,xmm0
movss xmm2,f32_neg10
Call glVertex3f ;(120, 120, -10)
movss xmm0,f32_neg120
movss xmm1,f32_120
movss xmm2,f32_neg10
Call glVertex3f ;(-120, 120, -10)
movss xmm0,f32_neg110
movss xmm1,f32_110
xorps xmm2,xmm2
Call glVertex3f ;(-110, 110, 0)
movss xmm0,f32_110
movss xmm1,xmm0
xorps xmm2,xmm2
Call glVertex3f ;(110, 110, 0)

;2 - West
movss xmm0,f32_neg1 ;-1
xorps xmm1,xmm1 ;0
movss xmm2,f32_1 ;1
Call glNormal3f
movss xmm0,f32_neg120
movss xmm1,f32_120
movss xmm2,f32_neg10
Call glVertex3f ;(-120, 120, -10)
movss xmm0,f32_neg120
movss xmm1,xmm0
movss xmm2,f32_neg10
Call glVertex3f ;(-120, -120, -10)
movss xmm0,f32_neg110
movss xmm1,xmm0
xorps xmm2,xmm2
Call glVertex3f ;(-110, -110, 0)
movss xmm0,f32_neg110
movss xmm1,f32_110
xorps xmm2,xmm2
Call glVertex3f ;(-110, 110, 0)

;3 - South
xorps xmm0,xmm0 ;0
movss xmm1,f32_neg1 ;-1
movss xmm2,f32_1 ;1
Call glNormal3f
movss xmm0,f32_neg120
movss xmm1,xmm0
movss xmm2,f32_neg10
Call glVertex3f ;(-120, -120, -10)
movss xmm0,f32_120
movss xmm1,f32_neg120
movss xmm2,f32_neg10
Call glVertex3f ;(120, -120, -10)
movss xmm0,f32_110
movss xmm1,f32_neg110
xorps xmm2,xmm2
Call glVertex3f ;(110, -110, 0)
movss xmm0,f32_neg110
movss xmm1,xmm0
xorps xmm2,xmm2
Call glVertex3f ;(-110, -110, 0)

;4 - East
movss xmm0,f32_1 ;1
xorps xmm1,xmm1 ;0
movss xmm2,xmm0 ;1
Call glNormal3f
movss xmm0,f32_120
movss xmm1,f32_neg120
movss xmm2,f32_neg10
Call glVertex3f ;(120, -120, -10)
movss xmm0,f32_120
movss xmm1,xmm0
movss xmm2,f32_neg10
Call glVertex3f ;(120, 120, -10)
movss xmm0,f32_110
movss xmm1,xmm0
xorps xmm2,xmm2
Call glVertex3f ;(110, 110, 0)
movss xmm0,f32_110
movss xmm1,f32_neg110
xorps xmm2,xmm2
Call glVertex3f ;(110, -110, 0)

Call glEnd

;Call glPopMatrix

;Epilogue:
leave
ret
DrawCap endp


