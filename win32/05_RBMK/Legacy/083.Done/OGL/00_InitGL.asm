InitGL proc

;Get the Handle to a Device Context for the Client Area of the Main Window
invoke WriteLog,offset szGetDC
invoke GetDC,ghWnd
test eax,eax
jz InitGL_Error
mov ghDC,eax
invoke WriteLog,offset szOK

;Match an appropriate pixel format supported by a device context
invoke WriteLog,offset szChoosePixelFormat
invoke ChoosePixelFormat,ghDC,OFFSET_PFD
mov giPixelFormat,eax
test eax,eax
jz InitGL_Error
invoke WriteLog,offset szOK

;Set the pixel format of the specified device context to the specified format
invoke WriteLog,offset szSetPixelFormat
invoke SetPixelFormat,ghDC,giPixelFormat,OFFSET_PFD
test eax,eax
jz InitGL_Error
invoke WriteLog,offset szOK

;Create a new OpenGL rendering context
invoke WriteLog,offset szWglCreateContext
invoke wglCreateContext,ghDC
test eax,eax
jz InitGL_Error
mov ghRC,eax
invoke WriteLog,offset szOK

;Make a specified OpenGL rendering context the calling thread's current rendering context
invoke WriteLog,offset szWglMakeCurrent
invoke wglMakeCurrent,ghDC,ghRC
test eax,eax
jz InitGL_Error
invoke WriteLog,offset szOK

;Ensure Counter-Clockwise Winding is on
invoke glFrontFace,901h ;GL_CCW

;Don't draw the unseen sides of polygons
invoke glEnable,0B44h ;GL_CULL_FACE

;Ensure back-facing polygons are culled
invoke glCullFace,405h ;GL_BACK

;Don't draw the overlayed polygons
invoke glEnable,0B71h ;GL_DEPTH_TEST

;Set the Depth Test Mode
invoke glDepthFunc,0201h ;GL_LESS
invoke glDepthMask,1 ;GL_TRUE

;Ensure Smooth (Gouraud) Shading is on
invoke glShadeModel,1D01h ;GL_SMOOTH

;Prefer quality over speed for perspective-correct interpolation
push 1102h ;GL_NICEST
push 0C50h ;GL_PERSPECTIVE_CORRECTION_HINT
call glHint

;Log the OpenGL Data

;Получить строку GL_VENDOR (0x1F00)
invoke glGetString,1F00h
invoke WriteLog,eax
invoke WriteLog,offset szCRLF

;Получить строку GL_RENDERER (0x1F01)
invoke glGetString,1F01h
invoke WriteLog,eax
invoke WriteLog,offset szCRLF

;Получить строку GL_VERSION (0x1F02)
invoke glGetString,1F02h
invoke WriteLog,eax
invoke WriteLog,offset szCRLF

;Compute Projection, Camera and Object Matrices
call GetDefaults

;Apply Defaults
call ResetScene

;Success
xor eax,eax
ret

InitGL_Error:
call SpellError
mov eax,-1
ret

InitGL endp


