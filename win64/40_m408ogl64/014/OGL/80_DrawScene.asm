DrawScene proc
PROLOG 100h

;1.1. Select the Background Color
;mov rcx,3f000000h ;0.5
;movd xmm0,ecx ;r
;movd xmm1,ecx ;g
;movd xmm2,ecx ;b
;xorps xmm3,xmm3 ;a
;call glClearColor

;1.2. Clear the Frame
mov rcx,4100h;GL_COLOR_BUFFER_BIT Or GL_DEPTH_BUFFER_BIT
call glClear

;2. Activate the shader program
mov rcx,gpShaderProgram
call qword ptr[gpGlUseProgram]

;3. Update Uniforms
lea rcx,mtxCameraVolatile
lea rdx,vecCamPos
call GetGlobalOrigin

;uProjection
mov rcx,uLocationProjection
mov rdx,1
mov r8,0 ;GL_FALSE (transpose)
lea r9,mtxProjectionVolatile
call qword ptr[gpGlUniformMatrix4fv]
;uView
mov rcx,uLocationView
mov rdx,1
mov r8,0
lea r9,mtxCameraVolatile
call qword ptr[gpGlUniformMatrix4fv]
;uModel
mov rcx,uLocationModel
mov rdx,1
mov r8,0
lea r9,mtxObjectVolatile
call qword ptr[gpGlUniformMatrix4fv]
;uCameraPos
mov rcx,uLocationCamera
mov rdx,1
lea r8,vecCamPos
call qword ptr[gpGlUniform3fv]
;uLightDir
include ogl\81_LightDirection.asm

;4. Draw the Object
include ogl\82_DrawVBO.asm

;5. Deactivate — revert to fixed function
xor rcx,rcx
call qword ptr[gpGlUseProgram]

;6. Swap the buffers
mov rcx,ghDC
call SwapBuffers

;7. Update the Indicators
;7.1. Screen Frames per Second
call ComputeFPS
;7.2. Application Title
call RefreshTitle
;7.3. Get the Camera's World Position
lea rcx,mtxCameraVolatile
lea rdx,vecCamPos
call GetGlobalOrigin
;7.4. Get the Object's World Position
lea rcx,mtxObjectVolatile
lea rdx,vecObjPos
call GetGlobalOrigin 
;7.5. Status Bar
call RefreshStatus

;8. Mark the frame as drawn
mov isRefreshed,1

DrawScene_End:
EPILOG
DrawScene endp


