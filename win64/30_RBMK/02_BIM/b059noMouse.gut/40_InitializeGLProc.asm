InitializeGL proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov rcx, ghWnd
call GetDC
mov ghDC,rax

;Fill the PIXELFORMATDESCRIPTOR Structure
mov pfd.nSize,28h ;sizeof.PIXELFORMATDESCRIPTOR
mov pfd.nVersion,1
mov pfd.dwFlags,25h ;PFD_SUPPORT_OPENGL+PFD_DOUBLEBUFFER+PFD_DRAW_TO_WINDOW
mov pfd.iPixelType,0 ;PFD_TYPE_RGBA
mov pfd.cColorBits,10h ;Color Depth = 16 bits per pixel
mov pfd.cRedBits,0 ;Color Bits Ignored
mov pfd.cRedShift,0 ;Color Bits Ignored
mov pfd.cGreenBits,0 ;Color Bits Ignored
mov pfd.cGreenShift,0 ;Color Bits Ignored
mov pfd.cBlueBits,0 ;Color Bits Ignored
mov pfd.cBlueShift,0 ;Color Bits Ignored
mov pfd.cAlphaBits,0 ;No Alpha Buffer
mov pfd.cAlphaShift,0 ;Shift Bit Ignored
mov pfd.cAccumBits,0 ;No Accumulation Buffer
mov pfd.cAccumRedBits,0 ;Accumulation Bits Ignored
mov pfd.cAccumGreenBits,0 ;Accumulation Bits Ignored
mov pfd.cAccumBlueBits,0 ;Accumulation Bits Ignored
mov pfd.cAccumAlphaBits,0 ;Accumulation Bits Ignored
mov pfd.cDepthBits,10h ;16 Bit z-Buffer (Depth Buffer) 
mov pfd.cStencilBits,0 ;No Stencil Buffer
mov pfd.cAuxBuffers,0 ;No Auxiliary Buffer
mov pfd.iLayerType,0 ;PFD_MAIN_PLANE
mov pfd.bReserved,0 ;Reserved
mov pfd.dwLayerMask,0 ;Layer Masks Ignored
mov pfd.dwVisibleMask,0 ;Layer Masks Ignored
mov pfd.dwDamageMask,0 ;Layer Masks Ignored

;Now call the Function
mov rcx,ghDC
lea rdx,pfd
call ChoosePixelFormat
mov iPixelFormat,rax
cmp rax,0
je lbl_ErrChoosePixelFormat

mov rcx,ghDC
mov rdx,iPixelFormat
lea r8,pfd
call SetPixelFormat

mov rcx,ghDC
call wglCreateContext
mov ghRC,rax
cmp rax,0
je lbl_ErrCreateContext

;Activate The Rendering Context
mov rcx,ghDC
mov rdx,ghRC
call wglMakeCurrent

;Enable Depth Testing
mov rcx,0B71h ;GL_DEPTH_TEST
call glEnable

;The Type Of Depth Testing To Do
mov rcx,0201h ;GL_LESS - From NeHe Lesson 10
call glDepthFunc

;Konstantin Vladimirov
;perform some rendering with near and far planes clipping off
mov rcx,864Fh ;GL_DEPTH_CLAMP = 34383
call glEnable
mov rcx,0B44h ;GL_CULL_FACE
call glEnable

;Really Nice Perspective Calculations
mov rcx,0C50h ;GL_PERSPECTIVE_CORRECTION_HINT
mov rdx,1102h ;GL_NICEST
call glHint

Call ResetScene

jmp lbl_InitializeGL_Return1

lbl_ErrChoosePixelFormat:
lea rcx,szErrChoosePixelFormat
;mov rdx,31 ;String Length
mov rdx,lpszErrChoosePixelFormatCode
Call SpellError
jmp lbl_InitializeGL_Return0

lbl_ErrCreateContext:
lea rcx,szErrCreateContext
;mov rdx,30 ;String Length
mov rdx,lpszErrCreateContextCode
Call SpellError
jmp lbl_InitializeGL_Return0

lbl_InitializeGL_Return0:
xor rax,rax
jmp lbl_InitializeGL_End

lbl_InitializeGL_Return1:
mov rax,1
jmp lbl_InitializeGL_End

lbl_InitializeGL_End:
add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
InitializeGL endp
