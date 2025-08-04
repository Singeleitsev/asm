
;Set Face Colors
movd xmm0,f32_HALF ;r
movd xmm1,f32_HALF ;g
movd xmm2,f32_HALF ;b
call glColor3f

;Set Points
mov rcx,7 ;GL_QUADS
call glBegin

;mov i0,48
;
;lblNextRow:
;mov i1,48
;
;lblNextColumn:

;Set Points
movd xmm0,f32_neg_110 ;x
movd xmm1,f32_neg_110 ;y ;8 coordinates * 4 bytes
xorps xmm2,xmm2 ;z
call glVertex3f

movd xmm0,f32_110 ;x
movd xmm1,f32_neg_110 ;y ;8 coordinates * 4 bytes
xorps xmm2,xmm2 ;z
call glVertex3f

movd xmm0,f32_110 ;x
movd xmm1,f32_110 ;y ;8 coordinates * 4 bytes
xorps xmm2,xmm2 ;z
call glVertex3f

movd xmm0,f32_neg_110 ;x
movd xmm1,f32_110 ;y ;8 coordinates * 4 bytes
xorps xmm2,xmm2 ;z
call glVertex3f

;movps xmm8,xArray
;broadcastss xmm9, f32_250
;addps xmm8,xmm9
;movps xArray,xmm8

;dec i1
;cmp i1,0
;jg NextColumn

;movps xmm10,yArray
;broadcastss xmm11, f32_250
;addps xmm10,xmm11
;movps yArray,xmm10

;dec i0
;cmp i0,0
;jg NextRow


call glEnd


