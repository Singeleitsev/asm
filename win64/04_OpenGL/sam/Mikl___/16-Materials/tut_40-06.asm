; GUI #
;����������� �����������
;����� �� 4kogltutor\bin\sharpe.exe
include win64a.inc
; --------------- 
WINDOWWIDTH  = 600
WINDOWHEIGHT = 510

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
wmCREATE:invoke	GetDC ;������� �������� ����
	mov	hDC,rax
;�������������� ���������� ������� �������� OpenGL (��������� OpenGL � ������� 
;�����������) ������� ���
        mov	edx,offset PixFrm
	invoke	ChoosePixelFormat,eax
;� ��������� ���
	mov	r8d,offset PixFrm
	invoke	SetPixelFormat,hDC,eax
;����������� �������� ���� � �������� OpenGL
	invoke	wglCreateContext,hDC
	mov	hrc,rax
;� ������� ��� �������
	invoke	wglMakeCurrent,hDC,eax
;������� ����� ���������� ������������� �������������� (���������)
	invoke glHint,GL_PERSPECTIVE_CORRECTION_HINT,GL_NICEST;
;������� ��� �������������� ������� ������������� ��������
	invoke glMatrixMode,GL_PROJECTION;�������� �������� ������� �� ������ 
;(�����) ������� �� �� ������� �����������, �� ���� �������� ������� �� 
;��������� ���������� � ���� 8 ������
	movq	xmm0,constd35;���� ������, ���������� � �������� ����� ��� Y
	movq	xmm1,ratio;aspect ������ ����
	movq	xmm2,constd0_1;�������� ��� �������� ���������. ������ �������� 
;Z, ������� ����� ���������, ����� ����������. ��� �������� ����� ���� ������ 
;�������������. ������ ������������� �������� ��� ��������� ��� �������� 
;��������� �����������
	movq	xmm3,constd100;�������� ��� �������� ���������. ������ 
;��������, ������� ������������� ���������, ������������ �� �����. ������ ���� 
;�������, ��� ��������� ��� ��������� ������������ �� � �������� ��� Z, � � 
;��������, ����������� � ����������� (���)
	invoke	gluPerspective
;---------------------------------------------------------
	mov	eax,const0_1
	movd	xmm3,ebx
	movd	xmm2,eax
	movd	xmm1,eax
	movd	xmm0,ebx
        invoke  glClearColor;, 0.0, 0.1, 0.1, 0.0
	invoke  glEnable, GL_DEPTH_TEST
;������� ��� �������������� ������� �����������
	invoke	glMatrixMode,GL_MODELVIEW;�������� �������� ������� �� ������ (�����)
	mov	r8d,offset ambient
        invoke  glLightfv,GL_LIGHT0,GL_AMBIENT
	mov	r8d,offset diffuse
	invoke  glLightfv,GL_LIGHT0,GL_DIFFUSE
	mov	r8d,offset position
	invoke  glLightfv,GL_LIGHT0,GL_POSITION
	mov	edx,offset lmodel_ambient
	invoke  glLightModelfv,GL_LIGHT_MODEL_AMBIENT
	mov	edx,offset local_view
	invoke  glLightModelfv,GL_LIGHT_MODEL_LOCAL_VIEWER

	invoke  glEnable, GL_LIGHTING
	invoke  glEnable, GL_LIGHT0
;	invoke	GLReshape, WINDOWWIDTH, WINDOWHEIGHT
        jmp	wmBYE
wmSIZE:; --------------- Resize the scene
	movzx	r8,r9w
	shr	r9,16
	invoke	glViewport,0,0;��������� ������� ������ ����������� � ����
;        invoke	glMatrixMode,GL_PROJECTION; ������������� ������� �������� ������� �������
;	invoke	glLoadIdentity;		�������� ��� ����� �������
        jmp	wmBYE
wmPAINT:; No pending messages: draw the scene
	lea	edx,ps
	invoke	BeginPaint
; --------------- Display the scene
;������� ����� ������
	invoke glClear,GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT
;������� ������� ������� (������� �����������)
	invoke glLoadIdentity
;��������� ������� � ����� ������ (z=-5 � ����� �=-1,5)
	movd	xmm0,ebx;const_1_5;ebx
	movd	xmm1,ebx
	movd	xmm2,const_15
	invoke	glTranslatef
        ;draw sphere in first row, first column diffuse reflection only;
;no ambient or specular
	invoke  glPushMatrix
	movd	xmm2,ebx
	movd	xmm1,const3
	movd	xmm0,const_3_75
	invoke  glTranslatef
	mov	r8d,offset no_mat
	invoke  glMaterialfv,GL_FRONT,GL_AMBIENT
	mov	r8d,offset mat_diffuse
	invoke  glMaterialfv,GL_FRONT,GL_DIFFUSE
	mov	r8d,offset no_mat
	invoke  glMaterialfv,GL_FRONT,GL_SPECULAR
	mov	r8d,offset no_shininess
	invoke  glMaterialfv,GL_FRONT,GL_SHININESS
	mov	r8d,offset no_mat
	invoke  glMaterialfv,GL_FRONT,GL_EMISSION
	movq	xmm0,constd1
	invoke  glutSolidSphere,,16,16
	invoke  glPopMatrix

;draw sphere in first row, second column diffuse and specular reflection;
;low shininess; no ambient
	invoke  glPushMatrix
	movd	xmm2,ebx
	movd	xmm1,const3
	movd	xmm0,const_1_25

	invoke  glTranslatef
	mov	r8d,offset no_mat
	invoke  glMaterialfv, GL_FRONT, GL_AMBIENT
	mov	r8d,offset mat_diffuse
	invoke  glMaterialfv, GL_FRONT, GL_DIFFUSE
	mov	r8d,offset mat_specular
	invoke  glMaterialfv, GL_FRONT, GL_SPECULAR
	mov	r8d,offset low_shininess
	invoke  glMaterialfv, GL_FRONT, GL_SHININESS
	mov	r8d,offset no_mat
	invoke  glMaterialfv, GL_FRONT, GL_EMISSION
	movq	xmm0,constd1
     invoke  glutSolidSphere,, 16, 16
     invoke  glPopMatrix

;draw sphere in first row, third column diffuse and specular reflection;
;high shininess; no ambient
     invoke  glPushMatrix
	movd	xmm2,ebx
	movd	xmm1,const3
	movd	xmm0,const1_25

     invoke  glTranslatef
	mov	r8d,offset no_mat
     invoke  glMaterialfv, GL_FRONT, GL_AMBIENT
	mov	r8d,offset mat_diffuse
     invoke  glMaterialfv, GL_FRONT, GL_DIFFUSE
	mov	r8d,offset mat_specular
     invoke  glMaterialfv, GL_FRONT, GL_SPECULAR
	mov	r8d,offset high_shininess
     invoke  glMaterialfv, GL_FRONT, GL_SHININESS
	mov	r8d,offset no_mat
     invoke  glMaterialfv, GL_FRONT, GL_EMISSION
	movq	xmm0,constd1
     invoke  glutSolidSphere,, 16, 16
     invoke  glPopMatrix

     ;draw sphere in first row, fourth column  diffuse reflection; emission;
     ;no ambient or specular reflection
     invoke  glPushMatrix
	movd	xmm2,ebx
	movd	xmm1,const3
	movd	xmm0,const3_75

     invoke  glTranslatef
	mov	r8d,offset no_mat
     invoke  glMaterialfv, GL_FRONT, GL_AMBIENT
	mov	r8d,offset mat_diffuse
     invoke  glMaterialfv, GL_FRONT, GL_DIFFUSE
	mov	r8d,offset no_mat
     invoke  glMaterialfv, GL_FRONT, GL_SPECULAR
	mov	r8d,offset no_shininess
     invoke  glMaterialfv, GL_FRONT, GL_SHININESS
	mov	r8d,offset mat_emission
     invoke  glMaterialfv, GL_FRONT, GL_EMISSION
	movq	xmm0,constd1
     invoke  glutSolidSphere,,16,16
     invoke  glPopMatrix
;draw sphere in second row, first column ambient and diffuse reflection
; no specular
     invoke  glPushMatrix
	movd	xmm2,ebx
	movd	xmm1,ebx
	movd	xmm0,const_3_75
    invoke  glTranslatef
	mov	r8d,offset mat_ambient
     invoke  glMaterialfv, GL_FRONT, GL_AMBIENT
	mov	r8d,offset mat_diffuse
     invoke  glMaterialfv, GL_FRONT, GL_DIFFUSE
	mov	r8d,offset no_mat
     invoke  glMaterialfv, GL_FRONT, GL_SPECULAR
	mov	r8d,offset no_shininess
     invoke  glMaterialfv, GL_FRONT, GL_SHININESS
	mov	r8d,offset no_mat
     invoke  glMaterialfv, GL_FRONT, GL_EMISSION
	movq	xmm0,constd1
     invoke  glutSolidSphere,,16,16
     invoke  glPopMatrix

;draw sphere in second row, second column ambient, diffuse and specular 
;reflection, low shininess
     invoke  glPushMatrix
	movd	xmm2,ebx
	movd	xmm1,ebx
	movd	xmm0,const_1_25
     invoke  glTranslatef
	mov	r8d,offset mat_ambient
     invoke  glMaterialfv, GL_FRONT, GL_AMBIENT
	mov	r8d,offset mat_diffuse
     invoke  glMaterialfv, GL_FRONT, GL_DIFFUSE
	mov	r8d,offset mat_specular
     invoke  glMaterialfv, GL_FRONT, GL_SPECULAR
	mov	r8d,offset low_shininess
     invoke  glMaterialfv, GL_FRONT, GL_SHININESS
	mov	r8d,offset no_mat
     invoke  glMaterialfv, GL_FRONT, GL_EMISSION
	movq	xmm0,constd1
     invoke  glutSolidSphere,,16,16
     invoke  glPopMatrix

;draw sphere in second row, third column ambient, diffuse and specular 
;reflection, high shininess
     invoke  glPushMatrix
	movd	xmm2,ebx
	movd	xmm1,ebx
	movd	xmm0,const1_25
     invoke  glTranslatef
	mov	r8d,offset mat_ambient
     invoke  glMaterialfv, GL_FRONT, GL_AMBIENT
	mov	r8d,offset mat_diffuse
     invoke  glMaterialfv, GL_FRONT, GL_DIFFUSE
	mov	r8d,offset mat_specular
     invoke  glMaterialfv, GL_FRONT, GL_SPECULAR
	mov	r8d,offset high_shininess
     invoke  glMaterialfv, GL_FRONT, GL_SHININESS
	mov	r8d,offset no_mat
     invoke  glMaterialfv, GL_FRONT, GL_EMISSION
	movq	xmm0,constd1
     invoke  glutSolidSphere,,16,16
     invoke  glPopMatrix

     ;draw sphere in second row, fourth column ambient and diffuse reflection;
     ;emission; no specular
     invoke  glPushMatrix
	movd	xmm2,ebx
	movd	xmm1,ebx
	movd	xmm0,const3_75
     invoke  glTranslatef
	mov	r8d,offset mat_ambient
     invoke  glMaterialfv, GL_FRONT, GL_AMBIENT
	mov	r8d,offset mat_diffuse
     invoke  glMaterialfv, GL_FRONT, GL_DIFFUSE
	mov	r8d,offset no_mat
     invoke  glMaterialfv, GL_FRONT, GL_SPECULAR
	mov	r8d,offset no_shininess
     invoke  glMaterialfv, GL_FRONT, GL_SHININESS
	mov	r8d,offset mat_emission
     invoke  glMaterialfv, GL_FRONT, GL_EMISSION
	movq	xmm0,constd1
     invoke  glutSolidSphere,,16,16
     invoke  glPopMatrix

;draw sphere in third row, first column colored ambient and diffuse reflection;
;no specular
     invoke  glPushMatrix
	movd	xmm2,ebx
	movd	xmm1,const_3
	movd	xmm0,const_3_75
     invoke  glTranslatef
	mov	r8d,offset mat_ambient_color
     invoke  glMaterialfv, GL_FRONT, GL_AMBIENT
	mov	r8d,offset mat_diffuse
     invoke  glMaterialfv, GL_FRONT, GL_DIFFUSE
	mov	r8d,offset no_mat
     invoke  glMaterialfv, GL_FRONT, GL_SPECULAR
	mov	r8d,offset no_shininess
     invoke  glMaterialfv, GL_FRONT, GL_SHININESS
	mov	r8d,offset no_mat
     invoke  glMaterialfv, GL_FRONT, GL_EMISSION
	movq	xmm0,constd1
     invoke  glutSolidSphere,,16,16
     invoke  glPopMatrix

     ;draw sphere in third row, second column  colored ambient,
     ;diffuse and specular reflection; low shininess
     invoke  glPushMatrix
	movd	xmm2,ebx
	movd	xmm1,const_3
	movd	xmm0,const_1_25
     invoke  glTranslatef
	mov	r8d,offset mat_ambient_color
     invoke  glMaterialfv, GL_FRONT, GL_AMBIENT
	mov	r8d,offset mat_diffuse
     invoke  glMaterialfv, GL_FRONT, GL_DIFFUSE
	mov	r8d,offset mat_specular
     invoke  glMaterialfv, GL_FRONT, GL_SPECULAR
	mov	r8d,offset low_shininess
     invoke  glMaterialfv, GL_FRONT, GL_SHININESS
	mov	r8d,offset no_mat
     invoke  glMaterialfv, GL_FRONT, GL_EMISSION
	movq	xmm0,constd1
     invoke  glutSolidSphere,,16,16
     invoke  glPopMatrix

     ;draw sphere in third row, third column colored ambient,
     ;diffuse and specular reflection; high shininess
     invoke  glPushMatrix
	movd	xmm2,ebx
	movd	xmm1,const_3
	movd	xmm0,const1_25
     invoke  glTranslatef
	mov	r8d,offset mat_ambient_color
     invoke  glMaterialfv, GL_FRONT, GL_AMBIENT
	mov	r8d,offset mat_diffuse
     invoke  glMaterialfv, GL_FRONT, GL_DIFFUSE
	mov	r8d,offset mat_specular
     invoke  glMaterialfv, GL_FRONT, GL_SPECULAR
	mov	r8d,offset high_shininess
     invoke  glMaterialfv, GL_FRONT, GL_SHININESS
	mov	r8d,offset no_mat
     invoke  glMaterialfv, GL_FRONT, GL_EMISSION
	movq	xmm0,constd1
     invoke  glutSolidSphere,,16,16
     invoke  glPopMatrix

     ;draw sphere in third row, fourth column colored ambient and diffuse reflection;
     ;emission; no specular
     invoke  glPushMatrix
	movd	xmm2,ebx
	movd	xmm1,const_3
	movd	xmm0,const3_75
     invoke  glTranslatef
	mov	r8d,offset mat_ambient_color
     invoke  glMaterialfv, GL_FRONT, GL_AMBIENT
	mov	r8d,offset mat_diffuse
     invoke  glMaterialfv, GL_FRONT, GL_DIFFUSE
	mov	r8d,offset no_mat
     invoke  glMaterialfv, GL_FRONT, GL_SPECULAR
	mov	r8d,offset no_shininess
     invoke  glMaterialfv, GL_FRONT, GL_SHININESS
	mov	r8d,offset mat_emission
     invoke  glMaterialfv, GL_FRONT, GL_EMISSION
	movq	xmm0,constd1
     invoke  glutSolidSphere,,16,16
     invoke  glPopMatrix
        invoke  glFlush
;��������� ����� �� �����
        invoke	SwapBuffers,hDC
	lea	edx,ps
	invoke	EndPaint,hWin
;--------------------------------------------------------------
wmBYE:	leave
	retn	
WndProc	endp
;----------------------------------------------------------------
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
  	cColorBits        db	32;���������� ��� ������� �����
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
  	cDepthBits        db	32;32 ������ Z-����� (����� �������)
  	cStencilBits      db	0;��� ������ ���������
  	cAuxBuffers       db	0;��� ��������������� �������
  	iLayerType        db	PFD_MAIN_PLANE;������� ���� ���������
  	bReserved         db	0;���������������
  	dwLayerMask       dd	0
  	dwVisibleMask     dd	0
  	dwDamageMask      dd	0;����� ���� ������������

szClassName	db "Uncle Remus tales:#40 OpenGL - Lighting and Materials",0
FileName	db "br_Rabbit3.cur",0
ratio		dq 1.17647058823529411764705882353;=600/510
ambient		dd 0.0, 0.0, 0.0, 1.0
diffuse		dd 1.0, 1.0, 1.0, 1.0
specular	dd 1.0, 1.0, 1.0, 1.0
position	dd 0.0, 3.0, 2.0, 0.0
lmodel_ambient	dd 0.4, 0.4, 0.4, 1.0
local_view	dd 0.0

no_mat		dd 0.0, 0.0, 0.0, 1.0
mat_ambient	dd 0.7, 0.7, 0.7, 1.0
mat_ambient_color dd 0.8,0.8,0.2, 1.0
mat_diffuse	dd 0.1, 0.5, 0.8, 1.0
mat_specular	dd 1.0, 1.0, 1.0, 1.0
no_shininess	dd 0.0
low_shininess	dd 5.0
high_shininess	dd 100.0
mat_emission	dd 0.3, 0.2, 0.2, 0.0
;float-----------------------------
const0_1	dd 0.1
const_1_25	dd -1.25
const1_25	dd 1.25
const2		dd 2.0
const3		dd 3.0
const_3		dd -3.0
const_3_75	dd -3.75
const3_75	dd 3.75
const_15	dd -15.0
const_6		dd -6.0
const6		dd 6.0
;double------------------------------
constd35	dq 35.0
constd0_1	dq 0.1
constd1		dq 1.0
constd3         dq 3.0
constd_3        dq -3.0
constd6         dq 6.0
constd_6        dq -6.0
constd10        dq 10.0
constd_10	dq -10.0
constd100	dq 100.0
end