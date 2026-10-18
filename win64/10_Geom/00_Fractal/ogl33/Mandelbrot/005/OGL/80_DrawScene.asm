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

;3. Compute the World Positions (needed for the fractal zoom)
lea rcx,mtxCameraVolatile
lea rdx,vecCamPos
call GetGlobalOrigin

lea rcx,mtxObjectVolatile
lea rdx,vecObjPos
call GetGlobalOrigin

;4. Update Matrices

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

;5. Upload the Fractal Uniforms

;uCenter
mov rcx,uCenterLocation
movss xmm1,xFractalCenter
movss xmm2,yFractalCenter
call qword ptr[gpGlUniform2f]

;;uZoom = distCurrent / (f32FractalBaseScale * f32DistDefault)
;;distCurrent = |vecCamPos - vecObjPos|
;movss xmm0,dword ptr[vecCamPos+0]
;subss xmm0,dword ptr[vecObjPos+0]
;movss xmm1,dword ptr[vecCamPos+4]
;subss xmm1,dword ptr[vecObjPos+4]
;movss xmm2,dword ptr[vecCamPos+8]
;subss xmm2,dword ptr[vecObjPos+8]
;mulss xmm0,xmm0
;mulss xmm1,xmm1
;mulss xmm2,xmm2
;addss xmm0,xmm1
;addss xmm0,xmm2
;sqrtss xmm0,xmm0
;;xmm0 = distCurrent
;movss xmm1,f32FractalBaseScale
;mulss xmm1,f32DistDefault
;divss xmm0,xmm1 ;xmm0 = distCurrent / (base * distDefault)
;mov rcx,uZoomLocation
;;xmm1 already holds uZoom
;movaps xmm1,xmm0
;call qword ptr[gpGlUniform1f]

mov rcx,uZoomLocation
mov eax,40555555h ;3.3333333f
movd xmm1,eax
call qword ptr[gpGlUniform1f]


;uAspect = float(gRectClientAspect)
cvtsd2ss xmm1,qword ptr[gRectClientAspect]
mov rcx,uAspectLocation
call qword ptr[gpGlUniform1f]

;6. Bind VAO
mov rcx,VaoID
call qword ptr[gpGlBindVertexArray]

;7. Draw the Object
include ogl\82_DrawVBO.asm

;8. Deactivate — revert to fixed function
xor rcx,rcx
call qword ptr[gpGlUseProgram]

;9. Unbind VAO
xor rcx,rcx
call qword ptr[gpGlBindVertexArray]

;10. Swap the buffers
mov rcx,ghDC
call SwapBuffers

;11. Update the Indicators
;11.1. Screen Frames per Second
call ComputeFPS
;11.2. Application Title
call RefreshTitle
;11.3. Get the Camera's World Position
lea rcx,mtxCameraVolatile
lea rdx,vecCamPos
call GetGlobalOrigin
;11.4. Get the Object's World Position
lea rcx,mtxObjectVolatile
lea rdx,vecObjPos
call GetGlobalOrigin 
;11.5. Status Bar
call RefreshStatus

;12. Mark the frame as drawn
mov isRefreshed,1

DrawScene_End:
EPILOG
DrawScene endp


