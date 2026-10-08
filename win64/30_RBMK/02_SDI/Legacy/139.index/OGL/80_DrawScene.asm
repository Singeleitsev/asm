DrawScene proc
PROLOG 100h

;1.1. Activate the Projection Matrix
mov rcx,1701h ;GL_PROJECTION
call glMatrixMode

;1.2. Load the current Projection matrix
lea rcx,mtxProjectionVolatile
call glLoadMatrixf

;2.1. Activate the ModelView Matrix
mov rcx,1700h ;GL_MODELVIEW
call glMatrixMode

;2.2. Load the current Camera matrix
lea rcx,mtxCameraVolatile
call glLoadMatrixf

;2.3. Multiply by the current Object matrix
lea rcx,mtxObjectVolatile
call glMultMatrixf

;3.1. Select the Background Color
;push 0 ;a
;push 0 ;b
;push 0 ;g
;push 3f800000h ;r
;call glClearColor

;3.2. Clear the Frame
mov rcx,4100h;GL_COLOR_BUFFER_BIT Or GL_DEPTH_BUFFER_BIT
call glClear

;4. Use the pre-compiled Display List:
;4.1. Setup Lighting
;4.2. Set Materials to Lighting
mov rcx,DISPLAY_LIST_LIGHTING
call glCallList

;5. Update the Lighting Position
mov rcx,4000h ;GL_LIGHT0
mov rdx,1203h ;GL_POSITION
lea r8,lightPosition
call glLightfv

;6. Draw the Object
include obj\80_DrawArray.asm

;7. Swap the buffers
mov rcx,ghDC
call SwapBuffers

;8. Update the Indicators
;8.1. Screen Frames per Second
call ComputeFPS
;8.2. Application Title
call RefreshTitle
;8.3. Get the Camera's World Position
lea rcx,mtxCameraVolatile
lea rdx,vecCamPos
call GetGlobalOrigin
;8.4. Get the Object's World Position
lea rcx,mtxObjectVolatile
lea rdx,vecObjPos
call GetGlobalOrigin 
;8.5. Status Bar
call RefreshStatus

;9. Mark the frame as drawn
mov isRefreshed,1

DrawScene_End:
EPILOG
DrawScene endp


