;----------------------------------------------------------
;prg10_02.asm - ��������� ���������� ���������� ������������ ���� ��������.
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
xmm_pack_1	dd	1.0, 2.0, 3.0, 4.0
xmm_pack_2	dd	5.0, 6.0, 7.0, 8.0
rez_sum	dd	0.0	;��������� ��������
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
	movaps	rxmm0,xmm_pack_1	;rxmm0= 4.0, 3.0, 2.0, 1.0
	mulps	rxmm0,xmm_pack_2	;rxmm0= 4.0�8.0, 3.0�7.0, 2.0�6.0, 1.0�5.0
	movaps	rxmm1, rxmm0	;rxmm1= 4.0�8.0, 3.0�7.0, 2.0�6.0, 1.0�5.0
	shufps	rxmm1,rxmm1,4eh	;rxmm1= 2.0�6.0, 1.0�5.0, 4.0�8.0, 3.0�7.0
	addps	rxmm0, rxmm1	;����������:
;rxmm0= 4.0�8.0, 3.0�7.0, 2.0�6.0, 1.0�5.0
;+
;rxmm1= 2.0�6.0, 1.0�5.0, 4.0�8.0, 3.0�7.0
;=
;rxmm0= 4.0�8.0+2.0�6.0, 3.0�7.0+1.0�5.0, 2.0�6.0+4.0�8.0, 1.0�5.0+3.0�7.0
;���
;rxmm0= 44.0, 26.0, 44.0, 26.0
	movaps	rxmm1, rxmm0	;rxmm1= 44.0, 26.0, 44.0, 26.0
	shufps	rxmm1,rxmm1,11h	;rxmm1= 26.0, 44.0, 26.0, 44.0
	addps	rxmm0, rxmm1	;����������:
;rxmm0= 44.0, 26.0, 44.0, 26.0
;+
;rxmm1= 26.0, 44.0, 26.0, 44.0
;=
;rxmm0= 70.0, 70.0, 70.0, 70.0
;��������� ���������
	movss	rez_sum,rxmm0
exit:	;����� �� ���������
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
