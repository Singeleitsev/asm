sub rsp, 20h

;Get Device Context (DC) for the Client Area
	mov rcx,hWnd
	call GetDC
	mov hdc,rax
	
	mov pfd.nSize,28h ;sizeof.PIXELFORMATDESCRIPTOR
	mov pfd.nVersion,1
	mov pfd.dwFlags,25h ;PFD_SUPPORT_OPENGL+PFD_DOUBLEBUFFER+PFD_DRAW_TO_WINDOW
	mov pfd.iPixelType,0 ;PFD_TYPE_RGBA
	mov pfd.cColorBits,10h
	mov pfd.cRedBits,0
	mov pfd.cRedShift,0
	mov pfd.cGreenBits,0
	mov pfd.cGreenShift,0
	mov pfd.cBlueBits,0
	mov pfd.cBlueShift,0
	mov pfd.cAlphaBits,0
	mov pfd.cAlphaShift,0
	mov pfd.cAccumBits,0
	mov pfd.cAccumRedBits,0
	mov pfd.cAccumGreenBits,0
	mov pfd.cAccumBlueBits,0
	mov pfd.cAccumAlphaBits,0
	mov pfd.cDepthBits,10h
	mov pfd.cStencilBits,0
	mov pfd.cAuxBuffers,0
	mov pfd.iLayerType,0 ;PFD_MAIN_PLANE
	mov pfd.bReserved,0
	mov pfd.dwLayerMask,0
	mov pfd.dwVisibleMask,0
	mov pfd.dwDamageMask,0
	
;invoke ChoosePixelFormat,[hdc],addr pfd
	mov rcx,hdc
	lea rdx,pfd
	call ChoosePixelFormat
	
;invoke SetPixelFormat,[hdc],eax,addr pfd
	mov rcx,hdc
	mov rdx,rax
	lea r8,pfd
	call SetPixelFormat
	
;Get OpenGL Rendering Context
;invoke wglCreateContext,[hdc]
	mov rcx,hdc
	call wglCreateContext
	mov hrc,rax
	
;invoke wglMakeCurrent,[hdc],[hrc]
	mov rcx,hdc
	mov rdx,hrc
	call wglMakeCurrent
	
;invoke GetClientRect,[hwnd],addr rc
	mov rcx,hWnd
	lea rdx,rc
	call GetClientRect
	
;invoke glViewport,0,0,[rc.right],[rc.bottom]
	xor rcx,rcx
	xor rdx,rdx
	xor r8,r8
	mov r8d,rc.right
	xor r9,r9
	mov r9d,rc.bottom
	call glViewport
	
;Get Timer
	call GetTickCount
	mov clock,eax

add rsp,20h


