;lbl_InitGL:

;Set child window device context
mov rdi,lpChildStruct
mov rcx,qword ptr[rdi] ;hChild
Call GetDC
cmp rax,0
je lbl_CreateChild_DC_Err
mov rdi,lpChildStruct
mov qword ptr[rdi+8],rax ;hDC

;PIXELFORMATDESCRIPTOR64
mov pfd.nSize,28h ;sizeof.PIXELFORMATDESCRIPTOR
mov pfd.nVersion,1
mov pfd.dwFlags,25h ;PFD_SUPPORT_OPENGL+PFD_DOUBLEBUFFER+PFD_DRAW_TO_WINDOW
mov pfd.iPixelType,0 ;PFD_TYPE_RGBA
mov pfd.cColorBits,18h ;Color Depth = 24 bits per pixel
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

mov rdi,lpChildStruct
mov rcx,qword ptr[rdi+8] ;hDC
lea rdx,pfd
Call ChoosePixelFormat

mov rdi,lpChildStruct
mov rcx,qword ptr[rdi+8] ;hDC
mov rdx,rax ;iFormat retrieved from ChoosePixelFormat
lea r8,pfd
Call SetPixelFormat

mov rdi,lpChildStruct
mov rcx,qword ptr[rdi+8] ;hDC
Call wglCreateContext
cmp rax,0
je lbl_CreateChild_RC_Err
mov rdi,lpChildStruct
mov qword ptr[rdi+10h],rax ;hRC

mov rdi,lpChildStruct
mov rcx,qword ptr[rdi+8] ;hDC
mov rdx,qword ptr[rdi+10h] ;hRC
Call wglMakeCurrent
cmp rax,0
je lbl_CreateChild_MakeCurrent_Err

mov rcx,405H ;GL_BACK
Call glCullFace

mov rcx, 0b44H ;GL_CULL_FACE
Call glEnable

xorps xmm0,xmm0
xorps xmm1,xmm1
xorps xmm2,xmm2
xorps xmm3,xmm3
Call glClearColor

movsd xmm0,f64_1
Call glClearDepth

mov rcx,201H ;GL_LESS
Call glDepthFunc

mov rcx,0b71H ;GL_DEPTH_TEST
Call glEnable

mov rcx,1d01H ;GL_SMOOTH
Call glShadeModel

mov rcx,0ba1H ;GL_NORMALIZE
Call glEnable

mov rcx,404H ;GL_FRONT
mov rdx,1200H ;GL_AMBIENT
lea r8,fMatAmbient
Call glMaterialfv

mov rcx,404H ;GL_FRONT
mov rdx,1201H ;GL_DIFFUSE
lea r8,fMatDiffuse
Call glMaterialfv

mov rcx,404H ;GL_FRONT
mov rdx,1202H ;GL_SPECULAR
lea r8,fMatSpecular
Call glMaterialfv

mov rcx,404H ;GL_FRONT
mov rdx,1600H ;GL_EMISSION
lea r8,fMatEmission
Call glMaterialfv

mov rcx,404H ;GL_FRONT
mov rdx,1601H ;GL_SHININESS
lea r8,fMatShininess
Call glMaterialfv

mov rcx,4000H ;GL_LIGHT0
mov rdx,1200H ;GL_AMBIENT
lea r8,fLightAmbient
Call glLightfv

mov rcx,4000H ;GL_LIGHT0
mov rdx,1203H ;GL_POSITION
lea r8,fLightPosition
Call glLightfv

mov rcx,0b50H ;GL_LIGHTING
Call glEnable

mov rcx,4000H ;GL_LIGHT0
Call glEnable

mov rcx,0de1H ;GL_TEXTURE_2D
Call glEnable

;lbl_InitGL_End:

