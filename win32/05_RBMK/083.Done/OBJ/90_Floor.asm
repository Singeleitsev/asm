;1. Select the Floor Color
push 3f800000h ;b
push 3f800000h ;g
push 3f800000h ;r
call glColor3f

;2. Draw the floor without culling
invoke glDisable,0B44h ;GL_CULL_FACE

push 7 ;GL_QUADS
call glBegin
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
;The Object ends
call glEnd

invoke glEnable,0B44h ;GL_CULL_FACE


