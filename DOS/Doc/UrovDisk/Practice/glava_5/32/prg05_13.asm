;----------------------------------------------------------
;prg05_13.asm - ��������� �� ���������� ��� ��������� ������� ����.
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
extrn	SetConsoleCursorPosition:PROC
extrn	GetStdHandle:PROC
extrn	ReadConsoleInputA:PROC
extrn	WriteConsoleA:PROC
extrn	ExitProcess:PROC
;���������������� �����
SSHORT	equ	<dw	0>
;��������� ��� ��������� ��������� ������� � �������:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
;��������� INPUT_RECORD ��� ��������� ������� ����:
INPUT_RECORD struc
EventType	dw	0
	dw	0
	struc	; dwMousePosition
x_M	dw	0
y_M	dw	0
	ends
dwButtonState	dd	0
dwControlKeyState	dd	0
dwEventFlags	dd	0
ends
.data
INPUT_RECORD_buf	INPUT_RECORD	<>
n_record	dd	0	;���������� ������������ ������� � �������� ����
con	Coord	<>
dIn	dd	0	;���������� ����� �������
dOut	dd	0	;���������� ������ �������
NumWri	dd	0	;���������� ������������� ���������-���������� ��������
TitleText	db	"������ � ����� � �������",0
Text_Out	db	"������� ����: ������ ����� ������!"
Len_Text=$-Text_Out
.code
start	proc	near	;����� ����� � ���������:
;������ �������
	call	AllocConsole
;��������� ����� ������� �������
	test	eax,eax
	jz	exit	;�������
;-------------------------------------------------------
;������� ����������� ����������� �����-������
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-���������� ������ �������
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-���������� ����� �������
;������� ������ � ��������� ���� �������:
	push	offset TitleText
	call	SetConsoleTitleA
	test	eax,eax	;��������� ����� ������ ���������
	jz	exit	;�������
cycl:	;����� ����������� ���� �� ������� ������ ������ ����
	mov	INPUT_RECORD_buf.EventType,0
	push	offset	n_record
	push	1
	push	offset INPUT_RECORD_buf
	push	dIn
	call	ReadConsoleInputA
	cmp	eax,0
	jz	exit	;���� �������
	cmp	INPUT_RECORD_buf.EventType,MOUSE_EVENT
	jne	cycl
;����� ������� ���� ���������?
	bt	INPUT_RECORD_buf.dwButtonState ,0	;������ ����� ������?
	jc	left_but
	bt	INPUT_RECORD_buf.dwButtonState ,1	;������ ������ ������?
	jc	exit
	jmp	cycl
left_but:
;��� ������� ����� ������ ���� ������� ������ � ���� �������:
;��������� ������ � ������� ������� ����
	mov	ax,INPUT_RECORD_buf.x_M
	mov	con.xx,ax
	mov	ax,INPUT_RECORD_buf.y_M
	mov	con.yy,ax
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
	push	0
	push	offset NumWri	;�������������� ���������� ���������� �� ����� ��������
	push	Len_Text	;����� ������ ��� ������ �� �����
	push	offset Text_Out	;����� ������ ��� ������ �� �����
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;���� �������
	jmp	cycl
exit:	;����� �� ����������
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
