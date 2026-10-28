InitGL proc

;1. Get the Handle to the Device Context
;for the Client Area of the Main Window
invoke WriteLog,offset szGetDC
invoke GetDC,ghWnd
test eax,eax
jz InitGL_Error
mov ghDC,eax
invoke WriteLog,offset szOK

;2. Match an appropriate pixel format
;supported by a device context
invoke WriteLog,offset szChoosePixelFormat
invoke ChoosePixelFormat,ghDC,OFFSET_PFD
mov giPixelFormat,eax
test eax,eax
jz InitGL_Error
invoke WriteLog,offset szOK

;3. Set the pixel format of the specified device context
;to the specified format
invoke WriteLog,offset szSetPixelFormat
invoke SetPixelFormat,ghDC,giPixelFormat,OFFSET_PFD
test eax,eax
jz InitGL_Error
invoke WriteLog,offset szOK

;4. Create a new OpenGL rendering context
invoke WriteLog,offset szWglCreateContext
invoke wglCreateContext,ghDC
test eax,eax
jz InitGL_Error
mov ghRC,eax
invoke WriteLog,offset szOK

;5. Make a specified OpenGL rendering context
;the calling thread's current rendering context
invoke WriteLog,offset szWglMakeCurrent
invoke wglMakeCurrent,ghDC,ghRC
test eax,eax
jz InitGL_Error
invoke WriteLog,offset szOK

;6. Ensure Counter-Clockwise Winding is on
invoke glFrontFace,901h ;GL_CCW

;7.1. Don't draw the unseen sides of polygons
invoke glEnable,0B44h ;GL_CULL_FACE
;7.2. Ensure back-facing polygons are culled
invoke glCullFace,405h ;GL_BACK

;8.1. Don't draw the overlayed polygons
invoke glEnable,0B71h ;GL_DEPTH_TEST
;8.2. Set the Depth Test Mode
invoke glDepthFunc,0201h ;GL_LESS
invoke glDepthMask,1 ;GL_TRUE

;9.1. Ensure Smooth (Gouraud) Shading is on
invoke glShadeModel,1D01h ;GL_SMOOTH
;9.2. Prefer quality over speed for perspective-correct interpolation
push 1102h ;GL_NICEST
push 0C50h ;GL_PERSPECTIVE_CORRECTION_HINT
call glHint

;10. Log the OpenGL Data
;10.1. Get GL_VENDOR (0x1F00)
invoke glGetString,1F00h
invoke WriteLog,eax
invoke WriteLog,offset szCRLF
;10.2. Get GL_RENDERER (0x1F01)
invoke glGetString,1F01h
invoke WriteLog,eax
invoke WriteLog,offset szCRLF
;10.3. Get GL_VERSION (0x1F02)
invoke glGetString,1F02h
invoke WriteLog,eax
invoke WriteLog,offset szCRLF

;11. Compute Projection, Camera and Object Matrices
call GetDefaults

;12. Pre-compile the Display List:
;12.1. Setup Lighting
;12.2. Set Materials to Lighting
call BuildLightingDisplayList

;13. Apply Defaults
call ResetScene

;Success
xor eax,eax
ret

InitGL_Error:
call SpellError
mov eax,-1
ret

InitGL endp


