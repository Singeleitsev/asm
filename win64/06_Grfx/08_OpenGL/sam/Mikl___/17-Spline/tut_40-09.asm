; GUI #
include win64a.inc
; --------------- 
WINDOWWIDTH equ 400
WINDOWHEIGHT equ 440

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
	push	sizeof WNDCLASSEX       ;cbSize & style
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
local	ps:PAINTSTRUCT
local	dresult:DWORD
local	i:DWORD

        mov	hWin,rcx
        xor	ebx,ebx
        cmp	edx,WM_CREATE
	je      wmCREATE
        cmp	edx,WM_SIZE
	je      wmSIZE
        cmp	edx,WM_PAINT
	je      wmPAINT
        cmp	edx,WM_DESTROY
	je      wmDESTROY     
default:leave
	jmp     NtdllDefWindowProc_
wmDESTROY::invoke wglMakeCurrent,0,0
	invoke	wglDeleteContext,hrc
	invoke	ReleaseDC,hWin,hDC
	invoke	RtlExitUserProcess,NULL
wmCREATE:invoke	GetDC  ;получим контекст окна
	mov	hDC,rax
;инициализируем дескриптор формата пикселей OpenGL (поддержку OpenGL и двойной буферизации)
        mov	edx,offset PixFrm
	invoke	ChoosePixelFormat,eax;выберем его
	mov	r8d,offset PixFrm
	invoke	SetPixelFormat,hDC,eax;и установим его
	invoke	wglCreateContext,hDC;преобразуем контекст окна в контекст OpenGL
	mov	hrc,rax
	invoke	wglMakeCurrent,hDC,eax;и сделаем его текущим
	movd	xmm0,ebx
	movd	xmm1,ebx
	movd	xmm2,ebx
	movd	xmm3,ebx
	invoke  glClearColor
	invoke  glShadeModel, GL_FLAT
	movr	qword ptr [rsp+28h], ctrlpoints
	movd	xmm2,const1
	movd	xmm1,ebx
	invoke  glMap1f,GL_MAP1_VERTEX_3,,,3,4
	invoke  glEnable, GL_MAP1_VERTEX_3

	invoke	GLReshape, WINDOWWIDTH, WINDOWHEIGHT
	jmp	wmBYE
wmSIZE:; --------------- Resize the scene
        movzx	ecx,r9w
	mov	edx,r9d
	shr	edx,16
	invoke	GLReshape
        jmp	wmBYE
wmPAINT:; No pending messages: draw the scene
; --------------- Display the scene
	lea	edx,ps
        invoke  BeginPaint
        fninit
	invoke  glClear, GL_COLOR_BUFFER_BIT
	mov	eax,const1
	movd	xmm2,eax
	movd	xmm1,eax
	movd	xmm0,eax
	invoke  glColor3f

	invoke  glBegin, GL_LINE_STRIP
	and     i,0 ;i <= 30; i++
@@:	fild    i
	fld    const0_03333333
	fmulp
	fstp    dresult
	movd	xmm0,dresult
	invoke  glEvalCoord1f
	inc     i
	cmp	i,30
	jbe	@b
	invoke  glEnd
;The following code displays the control points as dots.
	movd	xmm0,const5
	invoke  glPointSize
	movd	xmm2,ebx
	mov	eax,const1
	movd	xmm1,eax
	movd	xmm0,eax	
	invoke  glColor3f

	invoke  glBegin, GL_POINTS
	mov     i,0
@@:	mov     eax,12;sizeof FLOAT*3
	mul     i
	add     eax,offset ctrlpoints
	invoke  glVertex3fv, eax
	inc     i
	cmp	i,4
	jc	@b
	invoke  glEnd
	invoke  glFlush
        invoke	SwapBuffers,hDC
	lea	edx,ps
        invoke  EndPaint,hWin
wmBYE:	leave
	xor	eax,eax
	retn	
WndProc	endp

GLReshape proc 	w:dword, h:dword
local resultqa:QWORD
local resultqb:QWORD

	mov	w,ecx
	mov	h,edx

	mov	r8d,ecx
	mov	r9d,edx
	invoke  glViewport,0,0
	invoke  glLoadIdentity
	fninit
	mov     eax,h
	cmp	w,eax
	ja	@f
	fld	const_5
	fimul	h
	fidiv	w
	fstp	resultqa
	fld	const5
	fimul	h
	fidiv	w
	fstp	resultqb
	movq	xmm3,resultqb
	movq	xmm2,resultqa
	movq	xmm1,constd5
	movq	xmm0,constd_5
	jmp	@0
@@:	fld	const_5
	fimul	w
	fidiv	h
	fstp	resultqa
	fld	const5
	fimul	w
	fidiv	h
	fstp	resultqb
	movq	xmm3,constd5
	movq	xmm2,constd_5
	movq	xmm1,resultqb
	movq	xmm0,resultqa
@0:	movq	xmm5,constd5
	movq	xmm4,constd_5
	invoke  glOrtho
	invoke  glMatrixMode, GL_MODELVIEW
     	invoke  glLoadIdentity
	leave
     retn
GLReshape endp
hDC	dq	?
hrc	dq	?
PixFrm	label	PIXELFORMATDESCRIPTOR 
;размер структуры данных
	nSize             dw	sizeof PIXELFORMATDESCRIPTOR
  	nVersion          dw	1;версия структуры данных
;Набор битовых флагов, которые определяют свойства буфера точек
  	dwFlags           dd	PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER or \
	PFD_DRAW_TO_WINDOW 
  	iPixelType        db	PFD_TYPE_RGBA;Требуется RGBA формат
  	cColorBits        db	32;Выбирается бит глубины цвета
  	cRedBits          db	0
  	cRedShift         db	0
  	cGreenBits        db	0
  	cGreenShift       db	0
  	cBlueBits         db	0
  	cBlueShift        db	0;Игнорирование цветовых битов
  	cAlphaBits        db	0;Нет буфера прозрачности
  	cAlphaShift       db	0;Сдвиговый бит игнорируется
  	cAccumBits        db	0;Нет буфера накопления
  	cAccumRedBits     db	0
  	cAccumGreenBits   db	0
  	cAccumBlueBits    db	0
  	cAccumAlphaBits   db	0;Биты накопления игнорируются
  	cDepthBits        db	32;32 битный Z-буфер (буфер глубины)
  	cStencilBits      db	0;Нет буфера трафарета
  	cAuxBuffers       db	0;Нет вспомогательных буферов
  	iLayerType        db	PFD_MAIN_PLANE;Главный слой рисования
  	bReserved         db	0;Зарезервировано
  	dwLayerMask       dd	0
  	dwVisibleMask     dd	0
  	dwDamageMask      dd	0;Маски слоя игнорируются

ctrlpoints dd -0.8, -0.8, 0.0, -0.4, 0.8, 0.0, 0.4, -0.8, 0.0, 0.8, 0.8, 0.0
szClassName	db "OpenGL - Bezier Curve",0
FileName	db "br_Rabbit3.cur",0
const0_03333333	dd 0.03333333
const1		dd 1.0
const5		dd 5.0
const_5		dd -5.0
constd5		dq 5.0
constd_5	dq -5.0
end