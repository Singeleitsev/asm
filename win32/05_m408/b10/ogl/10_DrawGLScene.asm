DrawGLScene proc

;push 0 ;a
;push 0 ;b
;push 0 ;g
;push 3f800000h ;r
;call glClearColor

;Clear the Frame
push 4100h;GL_COLOR_BUFFER_BIT Or GL_DEPTH_BUFFER_BIT
call glClear

push 3f800000h ;b
push 3f800000h ;g
push 3f800000h ;r
call glColor3f

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

call glEnd

;Swap the buffers
push ghDC
call SwapBuffers

;Mark the frame as drawn
mov isRefreshed,1

DrawGLScene_End:
ret
DrawGLScene endp

