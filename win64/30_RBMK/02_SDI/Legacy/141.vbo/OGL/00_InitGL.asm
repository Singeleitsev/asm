InitGL proc
PROLOG 100h

;1. Get the Handle to the Device Context
;for the Client Area of the Main Window
lea rcx,szGetDC
call WriteLog

mov rcx,ghWnd
call GetDC
test eax,eax
jz InitGL_Error
mov ghDC,rax

lea rcx,szOK
call WriteLog

;2. Match an appropriate pixel format
;supported by a device context

lea rcx,szChoosePixelFormat
call WriteLog

mov rcx,ghDC
mov rdx,OFFSET_PFD
call ChoosePixelFormat
mov giPixelFormat,eax
test eax,eax
jz InitGL_Error

lea rcx,szOK
call WriteLog

;3. Set the pixel format of the specified device context
;to the specified format
lea rcx,szSetPixelFormat
call WriteLog

mov rcx,ghDC
xor rdx,rdx
mov edx,giPixelFormat
mov r8,OFFSET_PFD
call SetPixelFormat
test eax,eax
jz InitGL_Error

lea rcx,szOK
call WriteLog

;4. Create a new OpenGL rendering context
lea rcx,szWglCreateContext
call WriteLog

mov rcx,ghDC
call wglCreateContext
test eax,eax
jz InitGL_Error
mov ghRC,rax

lea rcx,szOK
call WriteLog

;5. Make a specified OpenGL rendering context
;the calling thread's current rendering context
lea rcx,szWglMakeCurrent
call WriteLog

mov rcx,ghDC
mov rdx,ghRC
call wglMakeCurrent
test eax,eax
jz InitGL_Error

lea rcx,szOK
call WriteLog

;6. Ensure Counter-Clockwise Winding is on
mov rcx,901h ;GL_CCW
call glFrontFace

;7.1. Don't draw the unseen sides of polygons
mov rcx,0B44h ;GL_CULL_FACE
call glEnable
;7.2. Ensure back-facing polygons are culled
mov rcx,405h ;GL_BACK
call glCullFace

;8.1. Don't draw the overlayed polygons
mov rcx,0B71h ;GL_DEPTH_TEST
call glEnable
;8.2. Set the Depth Test Mode
mov rcx,0201h ;GL_LESS
call glDepthFunc
mov rcx,1 ;GL_TRUE
call glDepthMask

;9.1. Ensure Smooth (Gouraud) Shading is on
mov rcx,1D01h ;GL_SMOOTH
call glShadeModel
;9.2. Prefer quality over speed for perspective-correct interpolation
mov rcx,0C50h ;GL_PERSPECTIVE_CORRECTION_HINT
mov rdx,1102h ;GL_NICEST
call glHint

;10. Log the OpenGL Data
;10.1. Get GL_VENDOR (0x1F00)
mov rcx,1F00h
call glGetString
mov rcx,rax
call WriteLog
lea rcx,szCRLF
call WriteLog
;10.2. Get GL_RENDERER (0x1F01)
mov rcx,1F01h
call glGetString
mov rcx,rax
call WriteLog
lea rcx,szCRLF
call WriteLog
;10.3. Get GL_VERSION (0x1F02)
mov rcx,1F02h
call glGetString
mov rcx,rax
call WriteLog
lea rcx,szCRLF
call WriteLog

;11. Compute Projection, Camera and Object Matrices
call GetDefaults

;12. Pre-compile the Display List:
;12.1. Setup Lighting
;12.2. Set Materials to Lighting
call BuildLightingDisplayList

;13. Set VBO
call SetVBO

;14. Apply Defaults
call ResetScene

;Success
xor rax,rax
EPILOG

InitGL_Error:
call SpellError
mov rax,-1
EPILOG

InitGL endp


