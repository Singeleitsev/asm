;----------------------------------------------------------
;prg05_10.asm - ��������� ������������ ����������� ���������� Windows
;----------------------------------------------------------
.486
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
%NOINCL	;��������� ����� ������ ���������� ������
include	WindowConA.inc
;���������� �������� ������������ � ������ ��������� ������� Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	SetConsoleTitleA:PROC
extrn	ExitProcess:PROC
.data
TitleText	db	'����������� ���������� ���������� Win32',0
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
;�������� � � �
;-------------------------------------------------------
exit:	;����� �� ����������
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
