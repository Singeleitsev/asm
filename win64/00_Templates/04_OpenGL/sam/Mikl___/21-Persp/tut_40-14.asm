; GUI #
include win64a.inc
; --------------- 
WINDOWWIDTH  = 400
WINDOWHEIGHT = 440

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
local	ps:PAINTSTRUCT

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
;выберем режим вычисления перспективных преобразований (наилучший)
	invoke glHint,GL_PERSPECTIVE_CORRECTION_HINT,GL_NICEST;
;выберем для преобразований матрицу перспективной проекции
	invoke glMatrixMode,GL_PROJECTION;выбирает активную матрицу из списка (стека)
;умножим ее на матрицу перспективы, т.е. попросту включим ее (используем макрос glcall т.к. параметры передаются в виде 8 байтов)
	movq	xmm0,constd90
	movq	xmm1,ratio
	movq	xmm2,constd0_1
	movq	xmm3,constd100
	invoke	gluPerspective
;выберем для преобразований матрицу изображения
	invoke	glMatrixMode,GL_MODELVIEW;выбирает активную матрицу из списка (стека)
;-----------------------------------------
	invoke	glEnable,GL_ALPHA_TEST
	invoke	glEnable,GL_DEPTH_TEST
	invoke	glEnable,GL_COLOR_MATERIAL
	invoke	glEnable,GL_LIGHTING
	invoke	glEnable,GL_LIGHT0
	invoke	glEnable,GL_BLEND
	invoke	glBlendFunc,GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA
	mov	r8d,offset pos
	invoke	glLightfv,GL_LIGHT0, GL_POSITION
	mov	r8d,offset dir
	invoke	glLightfv,GL_LIGHT0,GL_SPOT_DIRECTION
        jmp	wmBYE
wmSIZE:;;Изменение области вывода изображения в окно
	movzx	r8,r9w
	shr	r9,16
	invoke	glViewport,0,0
	invoke	glMatrixMode,GL_PROJECTION
	invoke	glLoadIdentity
  	invoke	glMatrixMode,GL_MODELVIEW
        jmp	wmBYE
wmPAINT:; No pending messages: draw the scene
	lea	edx,ps
	invoke	BeginPaint
;;очистим буфер экрана
        invoke	glClear,GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT
	invoke	glPushMatrix;сохраняем текущие координаты
	movq	xmm2,rbx
	movq	xmm1,rbx
	movq	xmm0,constd0_3
	invoke	glTranslated;сдвигаемся по оси Х на 0.3
	movq	xmm2,rbx
	movq	xmm1,constd1;зеленый
	movq	xmm0,rbx
	invoke	glColor3d;
	movq	xmm0,constd0_1
	invoke	glutSolidSphere,,16,16;рисуем сферу R=0,1 с центром в (0.3,0,0) 
;                      // в абсолютных координатах

	movq	xmm2,rbx
	movq	xmm1,rbx
	movq	xmm0,constd0_25
	invoke	glTranslated;(0.3+0.25,0,0) еще раз сдвигаемся
	movq	xmm2,constd1;синий
	movq	xmm1,rbx
	movq	xmm0,rbx
	invoke	glColor3d;
	movq	xmm0,constd0_06
	invoke	glutSolidSphere,,16,16;;рисуем сферу R=0,06 с центром в (0.55,0,0)

	invoke	glPopMatrix;возвращаемся к старой системе координат

	movq	xmm2,rbx
	movq	xmm1,rbx
	movq	xmm0,constd1;красный
	invoke	glColor3d;(1,0,0);
	movq	xmm0,constd0_15
	invoke	glutSolidSphere,,16,16;рисуем сферу R=0,15 с центром в (0,0,0) 
;в абсолютных координатах        
;отобразим буфер на экран
        invoke	SwapBuffers,hDC
	lea	edx,ps
	invoke	EndPaint,hWin
wmBYE:	leave
	xor	eax,eax
	retn	
WndProc	endp
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

szClassName	db "Uncle Remus tales:#40 OpenGL - Sphere2",0
FileName	db "br_Rabbit3.cur",0
;double----------------------------
constd0_06	dq 0.06
constd0_1	dq 0.1
constd0_15	dq 0.15
constd0_25	dq 0.25
constd0_3	dq 0.3
constd1		dq 1.0
constd90	dq 90.0
constd100	dq 100.0
ratio	        dq 0.9090909090909090909090909091

pos		dd 1.3,1.3,1.3,-1.0;.5
dir		dd 0.5,0.5,0.5
end