;----------------------------------------------------------
;prg07_34.asm - Win32-���������� ���������� ��� ������������ ������ ������� GetLogicalDrives API Win32.
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
extrn	GetLogicalDrives:PROC
extrn	GetLastError:PROC
.data
TitleText	db	'��������� ���������� � ������ � Win32',0
info_buf	db	10 dup (0)
.code
start	proc	near
;����� ����� � ���������:
;������ �������
	call	AllocConsole
;��������� ����� ������� �������
	test	ax,ax
	jz	exit	;�������
;-----------GetLogicalDrives------------------------------------
	call	GetLogicalDrives
	cmp	eax,0
	jz	exit	;����� � ������ �������
;-------------------------------------------------------
;��������� ������� � ��������� TD32.exe
;� � �
exit:
;����� �� ����������
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
