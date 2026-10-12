DrawScene proc
PROLOG 100h

;1.1. Select the Background Color
;mov rcx, 3f800000h ;r
;movd xmm0,ecx
;xorps xmm1,xmm1 ;g
;xorps xmm2,xmm2 ;b
;xorps xmm3,xmm3 ;a
;call glClearColor

;1.2. Clear the Frame
mov rcx,4100h;GL_COLOR_BUFFER_BIT Or GL_DEPTH_BUFFER_BIT
call glClear

;2. Activate the shader program
mov rcx,gpShaderProgram
call qword ptr[gpGlUseProgram]

;3. Update Matrices

;uProjection
mov rcx,uProjectionLocation
mov rdx,1
mov r8,0 ;GL_FALSE (transpose)
lea r9,mtxProjectionVolatile
call qword ptr[gpGlUniformMatrix4fv]
;uView
mov rcx,uViewLocation
mov rdx,1
mov r8,0
lea r9,mtxCameraVolatile
call qword ptr[gpGlUniformMatrix4fv]
;uModel
mov rcx,uModelLocation
mov rdx,1
mov r8,0
lea r9,mtxObjectVolatile
call qword ptr[gpGlUniformMatrix4fv]

;4. Update the Light Direction
include ogl\81_LightDirection.asm

;5. Bind VAO
mov rcx,VaoID
call qword ptr[gpGlBindVertexArray]

;6. Draw the Object
include ogl\82_DrawVBO.asm

;7. Deactivate — revert to fixed function
xor rcx,rcx
call qword ptr[gpGlUseProgram]

;8. Unbind VAO
xor rcx,rcx
call qword ptr[gpGlBindVertexArray]

;9. Swap the buffers
mov rcx,ghDC
call SwapBuffers

;10. Update the Indicators
;10.1. Screen Frames per Second
call ComputeFPS
;10.2. Application Title
call RefreshTitle
;10.3. Get the Camera's World Position
lea rcx,mtxCameraVolatile
lea rdx,vecCamPos
call GetGlobalOrigin
;10.4. Get the Object's World Position
lea rcx,mtxObjectVolatile
lea rdx,vecObjPos
call GetGlobalOrigin 
;10.5. Status Bar
call RefreshStatus

;11. Mark the frame as drawn
mov isRefreshed,1

DrawScene_End:
EPILOG
DrawScene endp


