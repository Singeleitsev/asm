DrawScene proc
PROLOG 100h

;1.1. Activate the Projection Matrix - Temporarily not used
;mov rcx,1701h ;GL_PROJECTION
;call glMatrixMode

;1.2. Load the current Projection matrix - Temporarily not used
;lea rcx,mtxProjectionVolatile
;call glLoadMatrixf

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
;mov rcx, 3f800000h ;r
;movd xmm0,ecx
;xorps xmm1,xmm1 ;g
;xorps xmm2,xmm2 ;b
;xorps xmm3,xmm3 ;a
;call glClearColor

;3.2. Clear the Frame
mov rcx,4100h;GL_COLOR_BUFFER_BIT Or GL_DEPTH_BUFFER_BIT
call glClear

;4. Activate the shader program
mov rcx,ShaderProgram
call qword ptr[gpGlUseProgram]

;5.1. Update the Light Direction
include ogl\81_LightDirection.asm

;5.2. Draw the Object
include ogl\82_DrawVBO.asm

;6. Deactivate — revert to fixed function
xor rcx,rcx
call qword ptr[gpGlUseProgram]

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


