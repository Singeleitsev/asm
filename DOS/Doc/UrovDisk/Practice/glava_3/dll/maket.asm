;----------------------------------------------------------
; ��������� ���������� ������� WriteCon �� dll
;----------------------------------------------------------
.486
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
%NOINCL	;��������� ����� ������ ���������� ������
include	WindowConA.inc
includelib	maket_dll.lib	;�� �����������
;���������� �������� ������������ � ������ ��������� ������� Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	ExitProcess:PROC
extrn	WriteCon:PROC
;���������������� �����
SSHORT	equ	<dw	0>
;��������� ��� ��������� ��������� ������� � �������:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
.data
con	Coord	<>
dIn	dd	0	;���������� ����� �������
dOut	dd	0	;���������� ������ �������
NumWri	dd	0	;���������� ������������� ���������-���������� ��������
TitleText	db	"������ ��������� ���������� �� DLL"
Len_TitleText=$-TitleText
;Len_Text	dd	Len_TitleText
.code
start	proc	near	;����� ����� � ���������:
;������ �������
	call	AllocConsole
;��������� ����� ������� �������
	test	eax,eax
	jz	exit	;�������
;-------------------------------------------------------
;�������� � � �
	push	Len_TitleText
	push	offset TitleText
	call	WriteCon
;-------------------------------------------------------
exit:	;����� �� ����������
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
