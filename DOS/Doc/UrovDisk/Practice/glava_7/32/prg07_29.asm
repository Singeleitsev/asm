;----------------------------------------------------------
;prg07_29.asm - Win32-��������� ����������� ���������� ��� ������������ ������ ������� CopyFile API Win32.
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
extrn	CopyFileA:PROC
.data
TitleText	db	'����������� ������ � Win32',0
s_file	db	"p",0	;��� �������� �����
d_file	db	"p1",0	;��� ��������� �����
.code
start	proc	near
;����� ����� � ���������:
;������ �������
	call	AllocConsole
;��������� ����� ������� �������
	test	ax,ax
	jz	exit	;�������
;-----------CopyFileA------------------------------------
	mov	eax,1
	push	eax
	push	offset d_file
	push	offset s_file
	call	CopyFileA
	cmp	eax,0
	jz	exit	;����� � ������ �������
;-------------------------------------------------------
;� � �
exit:
;����� �� ����������
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
