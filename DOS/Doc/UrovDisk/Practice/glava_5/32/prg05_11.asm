;----------------------------------------------------------
;prg05_11.asm - ��������� �����-������ � ������� c ��������� ��������� ���������� ������
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
extrn	GetStdHandle:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	SetConsoleTextAttribute:PROC
extrn	ReadConsoleA:PROC
extrn	WriteConsoleA:PROC
extrn	ExitProcess:PROC
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
TitleText	db	80 dup (0),0
.code
start	proc	near	;����� ����� � ���������:
;������ �������
	call	AllocConsole
;��������� ����� ������� �������
	test	eax,eax
	jz	exit	;�������
;-------------------------------------------------------
;�������� � � �
;������� ����������� ����������� �����-������
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-���������� ������ �������
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-���������� ����� �������
;������ ������
;��������� ������ � ������� (2,6)
	mov	con.xx,2
	mov	con.yy,6
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax, 0
	jz	exit	;���� �������
	push	0
	push	offset NumWri	;���������� ������������� ��������� ��������
	push	80	;������ ������ TitleText ��� �����
	push	offset TitleText
	push	dIn
	call	ReadConsoleA	;������ ��� �������� �����
	cmp	eax, 0
	jz	exit	;���� �������
;������� ��������� ������ � ��������� ���� �������:
	push	offset TitleText
	call	SetConsoleTitleA
;��������� ����� ������ ���������
	test	eax,eax
	jz	exit	;�������
;������� ������ � ���� ������� � ��������� ������� � � ������� �������
;��������� ������ � ������� (2,5)
	mov	ecx,10	;������ ������� 10 ���
	mov	bl,10000001b	;��������� ��������
m1:
push	ecx
	inc	con.xx
	inc	con.yy
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
;��������� �������� ��������� �������� - ����� �������� �� ���������� ������� - ������� bl
	xor	eax,eax
	rol	bl,1
	mov	al,bl
	push	eax
	push	dOut
	call	SetConsoleTextAttribute
	cmp	eax,0
	jz	exit	;���� �������
;������� ������
	push	0
	push	offset NumWri	;�������������� ���������� ���������� �� �����
	push	NumWri	;����� ������ ��� ������ �� �����
	push	offset TitleText	;����� ������ ��� ������ �� �����
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;���� �������
pop	ecx
	loop	m1
;-------------------------------------------------------
exit:	;����� �� ����������
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
