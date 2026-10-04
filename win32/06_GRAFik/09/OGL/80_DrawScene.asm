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

;4. Use the pre-compiled Display List:
;4.1. Setup Lighting
;4.2. Set Materials to Lighting
push DISPLAY_LIST_LIGHTING
call glCallList

;5. Update the Lighting Position
push offset lightPosition
push 1203h ;GL_POSITION
push 4000h ;GL_LIGHT0
call glLightfv

;6.1. Draw the Axes
include obj\00_Axes.asm

;6.2. Draw the Floor 
include obj\01_Floor.asm

;6.3. Draw Custom Blocks
include obj\10_DrawObject.asm

;7. Swap the buffers
push ghDC
call SwapBuffers

;8. Update the Indicators
;8.1. Screen Frames per Second
call ComputeFPS
;8.2. Application Title
call RefreshTitle
;8.3. Get the Camera's World Position
lea ecx,mtxCameraVolatile ;fastcall
lea edx,vecCamPos
call GetGlobalOrigin
;8.4. Get the Object's World Position
lea ecx,mtxObjectVolatile ;fastcall
lea edx,vecObjPos
call GetGlobalOrigin
;8.5. Status Bar
call RefreshStatus

;9. Mark the frame as drawn
mov isRefreshed,1

DrawScene_End:
ret
DrawScene endp


