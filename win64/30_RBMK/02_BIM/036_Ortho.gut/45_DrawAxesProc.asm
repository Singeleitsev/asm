DrawAxesProc proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;X - Red
movss xmm0,f32_1
xorps xmm1,xmm1
xorps xmm2,xmm2
Call glColor3f ;(1, 0, 0)
mov rcx,1 ;GL_LINES
Call glBegin
;Red Axis
movss xmm0,f32_neg7000
xorps xmm1,xmm1
xorps xmm2,xmm2
Call glVertex3f ;(-7000, 0, 0)
movss xmm0,f32_7000
xorps xmm1,xmm1
xorps xmm2,xmm2
Call glVertex3f ;(7000, 0, 0)
;Arrow
movss xmm0,f32_6900
movss xmm1,f32_neg50
xorps xmm2,xmm2
Call glVertex3f ;(6900, -50, 0)
movss xmm0,f32_7000
xorps xmm1,xmm1
xorps xmm2,xmm2
Call glVertex3f ;(7000, 0, 0)
movss xmm0,f32_7000
xorps xmm1,xmm1
xorps xmm2,xmm2
Call glVertex3f ;(7000, 0, 0)
movss xmm0,f32_6900
movss xmm1,f32_50
xorps xmm2,xmm2
Call glVertex3f ;(6900, 50, 0)
Call glEnd

;Y - Green
xorps xmm0,xmm0
movss xmm1,f32_1
xorps xmm2,xmm2
Call glColor3f ;(0, 1, 0)
mov rcx,1 ;GL_LINES
Call glBegin
;Green Axis
xorps xmm0,xmm0
movss xmm1,f32_neg7000
xorps xmm2,xmm2
Call glVertex3f ;(0, -7000, 0)
xorps xmm0,xmm0
movss xmm1,f32_7000
xorps xmm2,xmm2
Call glVertex3f ;(0, 7000, 0)
;Green Arrow
movss xmm0,f32_neg50
movss xmm1,f32_6900
xorps xmm2,xmm2
Call glVertex3f ;(-50, 6900, 0)
xorps xmm0,xmm0
movss xmm1,f32_7000
xorps xmm2,xmm2
Call glVertex3f ;(0, 7000, 0)
xorps xmm0,xmm0
movss xmm1,f32_7000
xorps xmm2,xmm2
Call glVertex3f ;(0, 7000, 0)
movss xmm0,f32_50
movss xmm1,f32_6900
xorps xmm2,xmm2
Call glVertex3f ;(50, 6900, 0)
Call glEnd

;Z - Blue
xorps xmm0,xmm0
xorps xmm1,xmm1
movss xmm2,f32_1
Call glColor3f ;(0, 0, 1)
mov rcx,1 ;GL_LINES
Call glBegin
xorps xmm0,xmm0
xorps xmm1,xmm1
xorps xmm2,xmm2
Call glVertex3f ;(0, 0, 0)
xorps xmm0,xmm0
xorps xmm1,xmm1
movss xmm2,f32_1000
Call glVertex3f ;(0, 0, 1000)
;Blue Arrow
movss xmm0,f32_neg50
xorps xmm1,xmm1
movss xmm2,f32_900
Call glVertex3f ;(-50, 0, 900)
xorps xmm0,xmm0
xorps xmm1,xmm1
movss xmm2,f32_1000
Call glVertex3f ;(0, 0, 1000)
xorps xmm0,xmm0
xorps xmm1,xmm1
movss xmm2,f32_1000
Call glVertex3f ;(0, 0, 1000)
movss xmm0,f32_50
xorps xmm1,xmm1
movss xmm2,f32_900
Call glVertex3f ;(50, 0, 900)
Call glEnd

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
DrawAxesProc endp