;----------------------------------------------------------
;prg07_33.asm - Win32-���������� ���������� ��� Win32 ��� ������������ ������ ������� GetLogicalDriveStrings API Win32.
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
extrn	GetLogicalDriveStringsA:PROC
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
;-----------GetLogicalDriveStrings------------------------------------
	push	offset info_buf
	push	0
	call	GetLogicalDriveStringsA
	cmp	eax,0
	jz	exit	;����� � ������ �������
;�������� ������� ������ ���, ����� �������� ���������� ����, ��������� ��� ������ ������ �������� ���������
	push	offset info_buf
	push	eax
	call	GetLogicalDriveStringsA
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
