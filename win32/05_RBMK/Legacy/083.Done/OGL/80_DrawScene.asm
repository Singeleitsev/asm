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

;4.1. Setup Lighting
invoke glEnable,0B50h ;GL_LIGHTING

invoke glEnable,4000h ;GL_LIGHT0

push offset lightAmbient
push 1200h ;GL_AMBIENT
push 4000h ;GL_LIGHT0
call glLightfv

push offset lightDiffuse
push 1201h ;GL_DIFFUSE
push 4000h ;GL_LIGHT0
call glLightfv

push offset lightSpecular
push 1202h ;GL_SPECULAR
push 4000h ;GL_LIGHT0
call glLightfv

push offset lightPosition
push 1203h ;GL_POSITION
push 4000h ;GL_LIGHT0
call glLightfv

;4.2. Set Materials
push 1602h ;GL_AMBIENT_AND_DIFFUSE
push 408h ;GL_FRONT_AND_BACK
call glColorMaterial

push 0B57h ;GL_COLOR_MATERIAL
call glEnable

push offset lightSpecular
push 1202h ;GL_SPECULAR
push 0408h ;GL_FRONT_AND_BACK
call glMaterialfv

push 3f000000h ;0.5
push 1601h ;GL_SHININESS
push 0408h ;GL_FRONT_AND_BACK
call glMaterialf

;5. Draw the Object
include obj\80_DrawArray.asm
;include obj\90_Floor.asm

;6. Swap the buffers
push ghDC
call SwapBuffers

;7. Update the Indicators
call RefreshTitle

;8.1. Get the Camera's World Position
invoke GetGlobalOrigin,offset mtxCameraVolatile,offset vecCamPos
;8.2. Get the Object's World Position
invoke GetGlobalOrigin,offset mtxObjectVolatile,offset vecObjPos
call RefreshStatus

;9. Mark the frame as drawn
mov isRefreshed,1

DrawScene_End:
ret
DrawScene endp


