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
;���� ���������
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
wmCREATE:invoke	GetDC    ;������� �������� ����
	mov	hDC,rax
;�������������� ���������� ������� �������� OpenGL (��������� OpenGL � ������� 
;�����������) ������� ���
        mov	edx,offset PixFrm
	invoke	ChoosePixelFormat,eax;eax=hDC
;� ��������� ���
	mov	r8d,offset PixFrm
	invoke	SetPixelFormat,hDC,eax
;����������� �������� ���� � �������� OpenGL
	invoke	wglCreateContext,hDC
	mov	hrc,rax
;� ������� ��� �������
	invoke	wglMakeCurrent,hDC,eax
;GLInit----------------------------------
;������� ����� ���������� ������������� �������������� (���������)
	invoke glHint,GL_PERSPECTIVE_CORRECTION_HINT,GL_NICEST;
;������� ��� �������������� ������� ������������� ��������
	invoke glMatrixMode,GL_PROJECTION;�������� �������� ������� �� ������ (�����)
;������� �� �� ������� �����������, �.�. �������� ������� �� (���������� ������ glcall �.�. ��������� ���������� � ���� 8 ������)
	movq	xmm0,constd90
	movq	xmm1,ratio
	movq	xmm2,constd0_1
	movq	xmm3,constd100
	invoke	gluPerspective
;������� ��� �������������� ������� �����������
	invoke	glMatrixMode,GL_MODELVIEW;�������� �������� ������� �� ������ (�����)
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
wmSIZE:;;��������� ������� ������ ����������� � ����
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
;;������� ����� ������
        invoke	glClear,GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT
	invoke	glPushMatrix;��������� ������� ����������
	movq	xmm2,rbx
	movq	xmm1,rbx
	movq	xmm0,constd0_3
	invoke	glTranslated;���������� �� ��� � �� 0.3
	movq	xmm2,rbx
	movq	xmm1,constd1;�������
	movq	xmm0,rbx
	invoke	glColor3d;
	movq	xmm0,constd0_1
	invoke	glutSolidSphere,,16,16;������ ����� R=0,1 � ������� � (0.3,0,0) 
;                      // � ���������� �����������

	movq	xmm2,rbx
	movq	xmm1,rbx
	movq	xmm0,constd0_25
	invoke	glTranslated;(0.3+0.25,0,0) ��� ��� ����������
	movq	xmm2,constd1;�����
	movq	xmm1,rbx
	movq	xmm0,rbx
	invoke	glColor3d;
	movq	xmm0,constd0_06
	invoke	glutSolidSphere,,16,16;;������ ����� R=0,06 � ������� � (0.55,0,0)

	invoke	glPopMatrix;������������ � ������ ������� ���������

	movq	xmm2,rbx
	movq	xmm1,rbx
	movq	xmm0,constd1;�������
	invoke	glColor3d;(1,0,0);
	movq	xmm0,constd0_15
	invoke	glutSolidSphere,,16,16;������ ����� R=0,15 � ������� � (0,0,0) 
;� ���������� �����������        
;��������� ����� �� �����
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
;������ ��������� ������ 
	nSize             dw	sizeof PIXELFORMATDESCRIPTOR
  	nVersion          dw	1;������ ��������� ������
;����� ������� ������, ������� ���������� �������� ������ �����
  	dwFlags           dd	PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER or \
	PFD_DRAW_TO_WINDOW 
  	iPixelType        db	PFD_TYPE_RGBA;��������� RGBA ������
  	cColorBits        db	16;���������� ��� ������� �����
  	cRedBits          db	0
  	cRedShift         db	0
  	cGreenBits        db	0
  	cGreenShift       db	0
  	cBlueBits         db	0
  	cBlueShift        db	0;������������� �������� �����
  	cAlphaBits        db	0;��� ������ ������������
  	cAlphaShift       db	0;��������� ��� ������������
  	cAccumBits        db	0;��� ������ ����������
  	cAccumRedBits     db	0
  	cAccumGreenBits   db	0
  	cAccumBlueBits    db	0
  	cAccumAlphaBits   db	0;���� ���������� ������������
  	cDepthBits        db	0;32 ������ Z-����� (����� �������)
  	cStencilBits      db	0;��� ������ ���������
  	cAuxBuffers       db	0;��� ��������������� �������
  	iLayerType        db	PFD_MAIN_PLANE;������� ���� ���������
  	bReserved         db	0;���������������
  	dwLayerMask       dd	0
  	dwVisibleMask     dd	0
  	dwDamageMask      dd	0;����� ���� ������������

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