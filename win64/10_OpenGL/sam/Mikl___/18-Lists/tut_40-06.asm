; GUI #
include win64a.inc
; --------------- 
WINDOWWIDTH  = 760
WINDOWHEIGHT = 75

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
	mov	rax,(CS_HREDRAW or CS_VREDRAW or CS_OWNDC) shl 32 or \
	(sizeof WNDCLASSEX)       ;cbSize & style
	push	rax
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
local	i:DWORD

        xor	ebx,ebx
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
wmCREATE:invoke	GetDC ;получим контекст окна
	mov	hDC,rax
;инициализируем дескриптор формата пикселей OpenGL (поддержку OpenGL и двойной 
;буферизации) выберем его
        mov	edx,offset PixFrm
	invoke	ChoosePixelFormat,eax
;и установим его
	mov	r8d,offset PixFrm
	invoke	SetPixelFormat,hDC,eax
;преобразуем контекст окна в контекст OpenGL
	invoke	wglCreateContext,hDC
	mov	hrc,rax
;и сделаем его текущим
	invoke	wglMakeCurrent,hDC,eax
        invoke  glGenLists,1
	mov     listName,rax
	invoke  glNewList,eax,GL_COMPILE
;current color red
	movd	xmm2,ebx
	movd	xmm1,ebx
	movd	xmm0,const1
	invoke  glColor3f
	invoke  glBegin, GL_TRIANGLES
	movd	xmm0,ebx
	movd	xmm1,ebx
	invoke  glVertex2f
	movd	xmm1,ebx
	movd	xmm0,const1
	invoke  glVertex2f
	movd	xmm1,const1
	movd	xmm0,ebx
	invoke  glVertex2f
	invoke  glEnd
	movd	xmm2,ebx
	movd	xmm1,ebx
	movd	xmm0,const1_5
	invoke  glTranslatef;move position
	invoke  glEndList
	invoke  glShadeModel,GL_FLAT

	invoke	GLReshape, WINDOWWIDTH, WINDOWHEIGHT-30
        jmp	wmBYE
wmSIZE:; --------------- Resize the scene
	movzx	ecx,r9w
	mov	edx,r9d
	shr	edx,16
	invoke	GLReshape
        jmp	wmBYE
wmPAINT:; No pending messages: draw the scene
	lea	edx,ps
	invoke	BeginPaint
; --------------- Display the scene
;очистим буфер экрана
	invoke	glClear,GL_COLOR_BUFFER_BIT
	movd	xmm3,ebx 
	movd	xmm2,ebx 
	movd	xmm1,ebx 
	movd	xmm0,ebx 
        invoke  glClearColor

	movd	xmm2,ebx 
	movd	xmm1,const1
	movd	xmm0,ebx 
	invoke  glColor3f ;current color green

	and     i,0 ;i < 10; i++) ;draw 10 triangles
@@:	invoke  glCallList,listName
	inc	i
	cmp	i,10
	jc	@b

        invoke  glBegin, GL_LINES
	movd	xmm1,const0_5
	movd	xmm0,ebx 
	invoke  glVertex2f
	movd	xmm1,const0_5
	movd	xmm0,const15
	invoke  glVertex2f
	invoke  glEnd
        invoke  glFlush
;отобразим буфер на экран
        invoke	SwapBuffers,hDC
	lea	edx,ps
	invoke	EndPaint,hWin
;--------------------------------------------------------------
wmBYE:	leave
	retn	
WndProc	endp
GLReshape proc w:dword, h:dword
local	resultqa:QWORD
local	resultqb:QWORD

	mov	w,ecx
	mov	h,edx

	mov	r8d,ecx
	mov	r9d,edx
	invoke  glViewport,0,0
	invoke  glMatrixMode,GL_PROJECTION
	invoke  glLoadIdentity

	mov     eax,w
	cmp	eax,h
	ja	@f
	fld    const_0_5
	fimul   h
	fidiv   w
	fstp    resultqa
	fld    const1_5
	fimul   h
	fidiv   w
	fstp    resultqb
	movq	xmm3,resultqb
	movq	xmm2,resultqa
	movq	xmm1,constd2
	jmp	@0
@@:	fld    const2
	fimul   w
	fidiv   h
	fstp    resultqa	     
	movq	xmm3,constd1_5
	movq	xmm2,constd_0_5
	movq	xmm1,resultqa
@0:	movq	xmm0,rbx
	invoke  gluOrtho2D

	invoke  glMatrixMode,GL_MODELVIEW
	invoke  glLoadIdentity
	leave
	retn
GLReshape endp
;----------------------------------------------------------------
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
  	cColorBits        db	16;Выбирается бит глубины цвета
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
  	cDepthBits        db	0;32 битный Z-буфер (буфер глубины)
  	cStencilBits      db	0;Нет буфера трафарета
  	cAuxBuffers       db	0;Нет вспомогательных буферов
  	iLayerType        db	PFD_MAIN_PLANE;Главный слой рисования
  	bReserved         db	0;Зарезервировано
  	dwLayerMask       dd	0
  	dwVisibleMask     dd	0
  	dwDamageMask      dd	0;Маски слоя игнорируются

szClassName	db "Uncle Remus tales:#40 OpenGL - Display Lists",0
FileName	db "br_Rabbit3.cur",0
listName	dq 0
;float-----------------------------
const0_5	dd 0.5
const_0_5	dd -0.5
const1		dd 1.0
const1_5	dd 1.5
const2		dd 2.0
const15		dd 15.0
;double------------------------------
constd_0_5	dq -0.5
constd1_5	dq 1.5
constd2         dq 2.0
end