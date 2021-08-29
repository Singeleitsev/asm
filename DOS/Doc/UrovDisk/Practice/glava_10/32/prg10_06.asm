;----------------------------------------------------------
;prg10_06.asm - ��������� �������� ����������� �� ����� � �������������� ������� XMM-����������.
;----------------------------------------------------------
.486
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
%NOINCL	;��������� ����� ������ ���������� ������
include	WindowConA.inc
include xmm_32.inc
;���������� �������� ������������ � ������ ��������� ������� Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	SetConsoleTitleA:PROC
extrn	ExitProcess:PROC
.stack	256
.586
.data
;���������� �������� (���������� ����������������) x0,y0,x1,y1,x2,y2,x3,y3
mas_xy	dd	8 dup (0.0)
a	dd	0.0	;���� (���������� ����������������)
sin_a	dd	0.0
cos_a	dd	0.0
null	dd	0.0
TitleText	db	'��������� ������������ ���� ��������',0
.code
start	proc	near	;����� ����� � ���������:
;������ �������
	call	AllocConsole
;��������� ����� ������� �������
	test	eax,eax
	jz	exit	;�������
;������� ��������� ���� ������� SetConsoleTitle:
	push	offset TitleText
	call	SetConsoleTitleA
;��������� ����� ������ ���������
	test	eax,eax
	jz	exit	;�������
;-------------------------------------------------------
	lea	esi,mas_xy
	mov	ecx,4	;���� 4 ���� - �� ���������� ������
	finit
;��������� sin a � cos a;
	fld	a	;�������� � ���� ����
	fsin	;��������� sin a
	fxch	;������ st(0)<?>st(1)
	fcos	;��������� cos a
	fxch	;������ st(0)<?>st(1)
	fstp	a	;����������� �
	fstp	cos_a	;����������� cos_a
	fstp	sin_a	;����������� sin_a
;������� �����������
;������� xmm-������� rxmm2 �� ���������� �����
	movlps	rxmm2,sin_a
	movhps	rxmm2,sin_a	;rxmm2= cos_a sin_a cos_a sin_a
	movss	rxmm2,null
	subss	rxmm2,sin_a	;rxmm2= cos_a sin_a cos_a -sin_a
cycl:
	movlps	rxmm0,[esi]	;rxmm0= ? ? yi xi
	movhps	rxmm0,[esi]	;rxmm0= yi xi yi xi
	shufps	rxmm0,rxmm0,0b0h	; rxmm0= xi yi yi xi
	mulps		rxmm0,rxmm2	; rxmm0=rxmm0*rxmm2= xi*cos_a yi*sin_a yi* cos_a xi*(-sin_a)
	shufps	rxmm1,rxmm0,31h	;rxmm1=? xi*cos_a ? yi* cos_a
	addps	rxmm0,rxmm1	;rxmm0= ? (xi*cos_a+yi*sin_a) ? (yi* cos_a+xi*(-sin_a))
	shufps	rxmm0,rxmm0,2	;rxmm0= ? ? (yi* cos_a+xi*(-sin_a)) (xi*cos_a+yi*sin_a)
;��������� ���������:
	movlps	[esi],rxmm0
;��������� � ���������� ������ ��������� ��� ��������� ����������
	add	esi,8
	loop	cycl
exit:	;����� �� ���������
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
