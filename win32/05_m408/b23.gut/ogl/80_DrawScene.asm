DrawScene proc

;1.1. Activate the Projection Matrix
push 1701h ;GL_PROJECTION
call glMatrixMode

;1.2. Load the current Projection matrix
push offset mtxProjectionVolatile
call glLoadMatrixf

;2.1. Activate the ModelView Matrix
push 1700h ;GL_MODELVIEW
call glMatrixMode

;2.2. Load the current Camera matrix
push offset mtxCameraVolatile
call glLoadMatrixf

;2.3. Multiply by the current Object matrix
push offset mtxObjectVolatile
call glMultMatrixf

;3.1. Select the background color
;push 0 ;a
;push 0 ;b
;push 0 ;g
;push 3f800000h ;r
;call glClearColor

;3.2. Clear the Frame
push 4100h;GL_COLOR_BUFFER_BIT Or GL_DEPTH_BUFFER_BIT
call glClear

;4.1. Select the object color
push 3f800000h ;b
push 3f800000h ;g
push 3f800000h ;r
call glColor3f

;4.2. Draw the Object
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

;5. Swap the buffers
push ghDC
call SwapBuffers

;6. Mark the frame as drawn
mov isRefreshed,1

DrawScene_End:
ret
DrawScene endp

