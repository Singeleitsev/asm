;----------------------------------------------------------
;prg10_04.asm - ��������� ��������� ������� �� ������ (XMM-�������).
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
;ALIGN 16
xyzw	dd	3 dup (2.0), 1.0	;�������� ���������� ����� (���������� ����������������) � w=1.0
M	dd	16 dup (0.0)	;������� �������������� ����������� �� ������� (���������� ����������������)
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
	lea	edi,xyzw	;����� �������
	lea	ebx,M	;����� ������� M
	mov	ecx,4	;���������� �����
	movups	rxmm0,xyzw	;��������� ������
row:
	movups	rxmm1,rxmm0	;�������� ������
	movups	rxmm2,[ebx]	;��������� ��������� ������ M
	mulps		rxmm2,rxmm1	;�������� ������ �� ��������� ������ M
;���������� ��������� ���������:
	shufps	rxmm1, rxmm2,0ah
	addps	rxmm2, rxmm1
	shufps	rxmm3, rxmm2,1
	addss	rxmm3, rxmm2	;��������� ��������
	movss	[edi],rxmm3	;��������� ���������
;��������� � ���������� ��������� ����������
	add	edi,4
	loop	row
;������ ���������� ��������� ���������� x', y', z', w' �� w':
	lea	edi,xyzw	;����� �������
	movups	rxmm0,xyzw	;��������� ������ (x',y',z',w')
	movss	rxmm1,rxmm0	;��������� w'
	shufps	rxmm1, rxmm1,0	;���������� w'
	divps	rxmm0,rxmm1
	movups	xyzw, rxmm0	;��������� ����� �������� �������
;�������� (x, y, z, 1)=> ������� w=1 � �������� ��������� �������������� (x,y,z)
exit:	;����� �� ���������
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
