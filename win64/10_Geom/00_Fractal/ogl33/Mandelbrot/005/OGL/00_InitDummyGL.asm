InitDummyGL proc
PROLOG 100h

;1. Get the Dummy Device Context
lea rcx,szGetDC
call WriteLog

mov rcx,ghWnd
call GetDC
test rax,rax
jz InitDummyGL_Error
mov ghDC,rax

lea rcx,szOK
call WriteLog

;2. Choose the Dummy Pixel Format
lea rcx,szChoosePixelFormat
call WriteLog

;PIXELFORMATDESCRIPTOR64 is set in struct.asm

mov rcx,ghDC
lea rdx,pfd
call ChoosePixelFormat
test rax,rax
jz InitDummyGL_Error
mov giPixelFormat,eax

lea rcx,szOK
call WriteLog

;3. Set the Dummy Pixel Format
lea rcx,szSetPixelFormat
call WriteLog

mov rcx,ghDC
mov edx,giPixelFormat
lea r8,pfd
call SetPixelFormat

lea rcx,szOK
call WriteLog

;4. Create the Dummy Rendering Context (OpenGL 1.1)
lea rcx,szWglCreateContext
call WriteLog

mov rcx,ghDC
call wglCreateContext
test rax,rax
jz InitDummyGL_Error
mov ghRC,rax

lea rcx,szOK
call WriteLog

;5. Make the Dummy RC Current
lea rcx,szWglMakeCurrent
call WriteLog

mov rcx,ghDC
mov rdx,ghRC
call wglMakeCurrent

lea rcx,szOK
call WriteLog

;6. Get OpenGL Extension Entry Points
call GetNames

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

;Success - Clean Up
xor rcx,rcx
xor rdx,rdx
call wglMakeCurrent
mov giPixelFormat,0

mov rcx,ghRC
call wglDeleteContext
mov ghRC,0

mov rcx,ghWnd
mov rdx,ghDC
call ReleaseDC
mov ghDC,0

xor rax,rax ;Return Success
jmp InitDummyGL_End

;Error - Clean Up
InitDummyGL_Error:

xor rcx,rcx
xor rdx,rdx
call wglMakeCurrent
mov giPixelFormat,0

cmp ghRC,0
je @f
mov rcx,ghRC
call wglDeleteContext
mov ghRC,0
@@:
cmp ghDC,0
je @f
mov rcx,ghWnd
mov rdx,ghDC
call ReleaseDC
mov ghDC,0
@@:
;call SpellError - used in CreateDummyWnd proc
mov rax,-1 ;Return Error

InitDummyGL_End:
EPILOG
InitDummyGL endp


