;1. Select the Floor Color
push 0 ;b
push 0 ;g
push 3ecccccdh ;r = 0.4
call glColor3f

;2. Draw the floor without culling
invoke glDisable,0B44h ;GL_CULL_FACE

invoke glBegin,7 ;GL_QUADS

;v0
push 0
push 0c5bb8000h ;y = -6000
push 0c5bb8000h ;x = -6000
call glVertex3f
;v1
push 0
push 0c5bb8000h ;y = -6000
push 45bb8000h  ;x = 6000
call glVertex3f
;v2
push 0
push 45bb8000h  ;y = 6000
push 45bb8000h  ;x = 6000
call glVertex3f
;v3
push 0
push 45bb8000h  ;y = 6000
push 0c5bb8000h ;x = -6000
call glVertex3f

call glEnd

invoke glEnable,0B44h ;GL_CULL_FACE


