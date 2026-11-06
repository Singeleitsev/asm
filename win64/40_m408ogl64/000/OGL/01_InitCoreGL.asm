InitCoreGL proc
PROLOG 100h

;1. Get the Handle to the Device Context
;for the Client Area of the Main Window
lea rcx,szGetDC
call WriteLog

mov rcx,ghWnd
call GetDC
test eax,eax
jz InitCoreGL_Error
mov ghDC,rax

lea rcx,szOK
call WriteLog

;2. Choose the Extended Pixel Format

lea rcx,szChoosePixelFormat
call WriteLog

mov numFormats,0
mov giPixelFormat,0

mov rcx,ghDC ;hdc
lea rdx,pixAttribs ;*piAttribIList
xor r8,r8 ;*pfAttribFList
mov r9d,1 ;nMaxFormats
lea rax,giPixelFormat ; *piFormats
mov qword ptr[rsp+20h],rax
lea rax,numFormats ;*nNumFormats
mov qword ptr[rsp+28h],rax
call qword ptr [gpWglChoosePixelFormatARB]
cmp numFormats,0
je InitCoreGL_Error
cmp giPixelFormat,0
je InitCoreGL_Error

lea rcx,szOK
call WriteLog

;4. Set the pixel format of the specified device context
;to the specified format
lea rcx,szSetPixelFormat
call WriteLog

mov rcx,ghDC
xor rdx,rdx
mov edx,giPixelFormat
lea r8,pfd
call SetPixelFormat
test eax,eax
jz InitCoreGL_Error

lea rcx,szOK
call WriteLog

;5. Create the ARB Rendering Context (OpenGL 3.2+)
lea rcx,szWglCreateContextAttribsARB
call WriteLog

mov rcx,ghDC
xor rdx,rdx
lea r8,contextAttribs
call qword ptr[gpWglCreateContextAttribsARB]
test rax,rax
jz InitCoreGL_Error
mov ghRC,rax

lea rcx,szOK
call WriteLog

;6. Make a specified OpenGL rendering context
;the calling thread's current rendering context
lea rcx,szWglMakeCurrent
call WriteLog

mov rcx,ghDC
mov rdx,ghRC
call wglMakeCurrent
test eax,eax
jz InitCoreGL_Error

lea rcx,szOK
call WriteLog

;7. Log the OpenGL Data

;7.1. Get GL_VENDOR (0x1F00)
lea rcx,szGlVendor
call WriteLog
mov rcx,1F00h
call glGetString
mov rcx,rax
call WriteLog
lea rcx,szCRLF
call WriteLog

;7.2. Get GL_RENDERER (0x1F01)
lea rcx,szGlRenderer
call WriteLog
mov rcx,1F01h
call glGetString
mov rcx,rax
call WriteLog
lea rcx,szCRLF
call WriteLog

;7.3. Get GL_VERSION (0x1F02)
lea rcx,szGlVersion
call WriteLog
mov rcx,1F02h
call glGetString
mov rcx,rax
call WriteLog
lea rcx,szCRLF
call WriteLog

;7.4. Get GL_CONTEXT_PROFILE_MASK (0x9126)
lea rcx,szGlContextProfileMask
call WriteLog
mov rcx,9126h ;GL_CONTEXT_PROFILE_MASK
lea rdx,profileMask
call glGetIntegerv
xor rcx,rcx
mov ecx,profileMask ;load the actual value
call WriteDecimalToLog
lea rcx,szCRLF
call WriteLog

;8. Ensure Counter-Clockwise Winding is on
mov rcx,901h ;GL_CCW
call glFrontFace

;9.1. Don't draw the unseen sides of polygons
mov rcx,0B44h ;GL_CULL_FACE
call glEnable
;9.2. Ensure back-facing polygons are culled
mov rcx,405h ;GL_BACK
call glCullFace

;10.1. Don't draw the overlayed polygons
mov rcx,0B71h ;GL_DEPTH_TEST
call glEnable
;10.2. Set the Depth Test Mode
mov rcx,0201h ;GL_LESS
call glDepthFunc
mov rcx,1 ;GL_TRUE
call glDepthMask

;11. MSAA Multisampling
mov rcx,809Dh ;GL_MULTISAMPLE
call glEnable

;12. Compile and Link Vertex and Fragment Shaders
mov rcx,SHADER_INDEX_VERTEX
call CompileShader
mov rcx,SHADER_INDEX_FRAGMENT
call CompileShader
call LinkShaders

;13.1. Set VBO
call SetVBO

;13.2. Set VAO
call SetVAO

;14. Compute Projection, Camera and Object Matrices
call GetDefaults

;15. Apply Defaults
call ResetScene

;Success
xor rax,rax ;Return Success
jmp InitCoreGL_End

;Error
InitCoreGL_Error:
;call SpellError - used in CreateMainWnd proc
mov rax,-1 ;Return Error

InitCoreGL_End:
EPILOG
InitCoreGL endp


