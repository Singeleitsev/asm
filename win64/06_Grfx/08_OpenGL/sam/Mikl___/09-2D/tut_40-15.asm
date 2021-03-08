; GUI #
include win64a.inc
;вз€то OpenGl Examples->01 OpenGL Primitives 
; --------------- 
WINDOWWIDTH  = 440
WINDOWHEIGHT = 400

.code
WinMain	proc
local	msg:MSG

	xor	ebx,ebx
        mov	edi,offset szClassName
        mov	esi,IMAGE_BASE
        mov	ecx,offset FileName
	invoke	LoadCursorFromFile
        push	rax	;hIconSm
	push	rdi	;lpszClassName
	push	rbx	;lpszMenuName
	push	COLOR_WINDOWTEXT+1;hbrBackground
	push	rax	;hCursor
	push	rax        ;hIcon
	push	rsi	;hInstance
	push	rbx        ;cbClsExtra & cbWndExtra
	pushaddr WndProc;lpfnWndProc
	mov	rax,(CS_HREDRAW or CS_VREDRAW or CS_OWNDC) shl 32 + (sizeof WNDCLASSEX)
	push	rax                     ;cbSize & style
    	invoke	RegisterClassEx,esp	;addr WNDCLASSEX
	
	push	rbx
	push	rsi	;rsi = 400000h
	shl	esi,9	;rsi = CW_USEDEFAULT
	push	rbx
	push	rbx
	push	WINDOWHEIGHT
	push	WINDOWWIDTH
	push	rsi
	push	rsi
	sub	esp,20h
    	invoke	CreateWindowEx,0,edi,edi,WS_OVERLAPPEDWINDOW or WS_CLIPCHILDREN or WS_CLIPSIBLINGS or WS_VISIBLE
;цикл сообщений
    	lea	edi,msg
@@:	invoke	GetMessage,edi,0,0,0
	cmp	msg.wParam,VK_ESCAPE;user press 'Esc'?
	je	wmDESTROY
	invoke	DispatchMessage,edi
	jmp	@b
WinMain endp
WndProc	proc	hWin:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
        mov	hWin,rcx

        cmp	edx,WM_CREATE
	je      wmCREATE
        cmp	edx,WM_SIZE
	je      wmSIZE
        cmp	edx,WM_PAINT
	je      wmPAINT
        cmp	edx,WM_DESTROY
	je      wmDESTROY     
default:leave
	jmp	NtdllDefWindowProc_
wmDESTROY::invoke wglMakeCurrent,0,0
	invoke	wglDeleteContext,hrc
	invoke	ReleaseDC,hWin,hDC
	invoke	RtlExitUserProcess,NULL
wmCREATE:invoke	GetDC    ;получим контекст окна
	mov	hDC,rax
;инициализируем дескриптор формата пикселей OpenGL (поддержку OpenGL и двойной 
;буферизации) выберем его
        mov	edx,offset PixFrm
	invoke	ChoosePixelFormat,eax;eax=hDC
;и установим его
	mov	r8d,offset PixFrm
	invoke	SetPixelFormat,hDC,eax
;преобразуем контекст окна в контекст OpenGL
	invoke	wglCreateContext,hDC
	mov	hrc,rax
;и сделаем его текущим
	invoke	wglMakeCurrent,hDC,eax
;GLInit----------------------------------
	invoke  glEnable,GL_CULL_FACE
	invoke  glCullFace,GL_BACK
	invoke  glFrontFace,GL_CCW
        jmp	wmBYE
wmSIZE:;;»зменение области вывода изображени€ в окно
	movzx	r8,r9w
	shr	r9,16
	invoke	glViewport,0,0
        jmp	wmBYE
wmPAINT:; No pending messages: draw the scene
;;очистим буфер экрана
        invoke	glClear,GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT
;-----Points-------------------------------
        invoke	glBegin,GL_POINTS
        movd	xmm0,const1_0;красный
        movd	xmm1,ebx;зеленый
        movd    xmm2,ebx;синий
	invoke	glColor3f
	mov	eax,const_0_1
        movd	xmm0,eax
        movd    xmm1,eax	
        invoke	glVertex2f;red point
        movd    xmm0,ebx;красный
        movd	xmm1,const1_0;зеленый
        movd    xmm2,ebx;синий
        invoke	glColor3f
        movd	xmm0,const0_1
        movd	xmm1,const_0_1
	invoke	glVertex2f;green point
        movd    xmm0,ebx;красный
        movd    xmm1,ebx;зеленый
        movd	xmm2,const1_0;синий
	invoke	glColor3f
	mov	eax,const0_1
        movd	xmm0,eax
        movd    xmm1,eax
	invoke	glVertex2f;blue point
	mov	eax,const1_0
        movd	xmm0,eax;красный
        movd    xmm1,eax;зеленый
        movd    xmm2,eax;синий
	invoke	glColor3f
        movd	xmm0,const_0_1
        movd	xmm1,const0_1
	invoke	glVertex2f;white point
	invoke	glEnd
;--------------Lines-----------------------
	mov	eax,const0_1
        movd	xmm0,eax;красный
        movd    xmm2,eax;зеленый
        movd	xmm1,const0_5;синий
	invoke  glColor3f
	invoke  glBegin,GL_LINES
;Horziontal
        movd	xmm0,const_1_0
        movd    xmm1,ebx
	invoke  glVertex2f
        movd	xmm0,const1_0
        movd    xmm1,ebx
	invoke  glVertex2f
;Vertical
        movd    xmm0,ebx
	movd	xmm1,const_1_0
	invoke  glVertex2f
        movd    xmm0,ebx
	movd	xmm1,const1_0
	invoke  glVertex2f
	invoke  glEnd
;Red Triangle
        movd	xmm0,const1_0;красный
        movd    xmm1,ebx;зеленый
        movd    xmm2,ebx;синий
     	invoke  glColor3f
	invoke  glBegin, GL_TRIANGLES
        movd	xmm0,const_0_5
        movd	xmm1,const_0_2
	invoke  glVertex2f;ќпредел€ет координаты вершины
	mov	eax,const_0_8
        movd	xmm0,eax
        movd    xmm1,eax
	invoke  glVertex2f;ќпредел€ет координаты вершины
        movd	xmm0,const_0_2
        movd	xmm1,const_0_8
	invoke  glVertex2f;ќпредел€ет координаты вершины
	invoke  glEnd
;Blue Quad
        movd    xmm0,ebx;красный
        movd    xmm1,ebx;зеленый
        movd	xmm2,const1_0;синий
	invoke  glColor3f
	invoke  glBegin,GL_TRIANGLE_STRIP
	mov	eax,const0_2
	movd	xmm0,eax
        movd    xmm1,eax
	invoke  glVertex2f;ќпредел€ет координаты вершины
        movd	xmm0,const0_8
        movd	xmm1,const0_2
	invoke  glVertex2f;ќпредел€ет координаты вершины
        movd	xmm0,const0_2
        movd	xmm1,const0_8
	invoke  glVertex2f;ќпредел€ет координаты вершины
	mov	eax,const0_8
        movd	xmm0,eax
        movd    xmm1,eax
	invoke  glVertex2f;ќпредел€ет координаты вершины
	invoke  glEnd
;Colorful Quad
     	invoke  glBegin,GL_QUADS
;цвет 1-ой вершины
        movd	xmm0,const1_0;красный
        movd    xmm1,ebx;зеленый
        movd    xmm2,ebx;синий
	invoke  glColor3f
        movd	xmm0,const_0_8
        movd	xmm1,const0_2
	invoke  glVertex2f;ќпредел€ет координаты вершины
;цвет 2-ой вершины
        movd    xmm0,ebx;красный
        movd    xmm2,ebx;зеленый
        movd	xmm1,const1_0;синий
	invoke  glColor3f
        movd	xmm0,const_0_2
        movd	xmm1,const0_2
	invoke  glVertex2f;ќпредел€ет координаты вершины
;цвет 3-ей вершины
        movd    xmm0,ebx;красный
        movd    xmm1,ebx;зеленый
        movd	xmm2,const1_0;синий
	invoke  glColor3f
        movd	xmm0,const_0_2
        movd	xmm1,const0_8
	invoke  glVertex2f;ќпредел€ет координаты вершины
;цвет 4-ой вершины
	mov	eax,const1_0
        movd	xmm0,eax;красный
        movd    xmm1,ebx;зеленый
        movd    xmm2,eax;синий
	invoke  glColor3f
        movd	xmm0,const_0_8
        movd	xmm1,const0_8
	invoke  glVertex2f;ќпредел€ет координаты вершины
	invoke  glEnd
;зеленый 5-угольник
        movd    xmm0,ebx;красный
        movd	xmm1,const1_0;зеленый
        movd    xmm2,ebx;синий
	invoke  glColor3f
	invoke  glBegin,GL_POLYGON
;координаты 1-ой вершины
        movd	xmm0,const0_2
        movd	xmm1,const_0_4
	invoke  glVertex2f
;координаты 2-ой вершины
        movd	xmm0,const0_3
        movd	xmm1,const_0_8
	invoke  glVertex2f
;координаты 3-ей вершины
        movd	xmm0,const0_7
        movd	xmm1,const_0_8
	invoke  glVertex2f
;координаты 4-ой вершины
        movd	xmm0,const0_8
        movd	xmm1,const_0_4
	invoke  glVertex2f
;координаты 5-ой вершины
        movd	xmm0,const0_5
        movd	xmm1,const_0_2
	invoke  glVertex2f
	invoke  glEnd
;отобразим буфер на экран
        invoke	SwapBuffers,hDC
wmBYE:	leave
	xor	eax,eax
	retn	
WndProc	endp
hDC	dq	?
hrc	dq	?
PixFrm	label	PIXELFORMATDESCRIPTOR 
	nSize             dw	sizeof PIXELFORMATDESCRIPTOR
  	nVersion          dw	1
  	dwFlags           dd	PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER or PFD_DRAW_TO_WINDOW
  	iPixelType        db	PFD_TYPE_RGBA
  	cColorBits        db	32;Select Our Color Depth
  	cRedBits          db	0
  	cRedShift         db	0
  	cGreenBits        db	0
  	cGreenShift       db	0
  	cBlueBits         db	0
  	cBlueShift        db	0;Color Bits Ignored
  	cAlphaBits        db	0;No Alpha Buffer
  	cAlphaShift       db	0;Shift Bit Ignored
  	cAccumBits        db	0;No Accumulation Buffer
  	cAccumRedBits     db	0
  	cAccumGreenBits   db	0
  	cAccumBlueBits    db	0
  	cAccumAlphaBits   db	0;Accumulation Bits Ignored
  	cDepthBits        db	16;16Bit Z-Buffer (Depth Buffer)
  	cStencilBits      db	0;No Stencil Buffer
  	cAuxBuffers       db	0;No Auxiliary Buffer
  	iLayerType        db	PFD_MAIN_PLANE;Main Drawing Layer
  	bReserved         db	0;Reserved
  	dwLayerMask       dd	0
  	dwVisibleMask     dd	0
  	dwDamageMask      dd	0;Layer Masks Ignored

szClassName	db "Uncle Remus tales:#40 OpenGL",0
FileName	db "..\Images\br_Rabbit3.cur",0
const_0_1	dd -0.1
const0_1	dd 0.1

const_0_2	dd -0.2
const0_2	dd 0.2
const0_3	dd 0.3
const_0_4	dd -0.4
const0_5	dd 0.5
const_0_5	dd -0.5
const0_7	dd 0.7
const_0_8	dd -0.8
const0_8	dd 0.8
const_1_0	dd -1.0
const1_0	dd 1.0
end