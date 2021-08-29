;----------------------------------------------------------
;prg05_14.asm - ��������� �� ���������� ��� ��������� ������� ����������.
;�����: ��� ������� ����� ������ ����.
;----------------------------------------------------------
.486
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
%NOINCL	;��������� ����� ������ ���������� ������
include	WindowConA.inc
;���������� �������� ���bKeyDown=1, ����� ������� ��������������� � ������ ��������� ������� Win32 (ASCII):
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
;��������� INPUT_RECORD ��� ��������� ������� ���� � ����������:
INPUT_RECORD	struc
EventType	dw	0
;	dw	0
BkeyDown			db	0
	db	5 dup (0)
WRepeatCount		dw	0
WVirtualKeyCode	dw	0
WVirtualScanCode	dw	0
AsciiChar			db	0
	db	2 dup (0)
dwControlKeyState	dd	0
	ends
.data
INPUT_RECORD_buf	INPUT_RECORD	<>
	db	0ffh
n_record	dd	0	;���������� ������������ ������� � �������� ����
con	Coord	<>
dIn	dd	0	;���������� ����� �������
dOut	dd	0	;���������� ������ �������
NumWri	dd	0	;���������� ������������� ���������-���������� ��������
	db	0ffh
TitleText	db	"������ � ����������� � ����� � �������",0
adr_Text	dd	0	;����� ������ ��� ������ �� �����
len_Text	dd	0	;����� ������ ��� ������ �� �����
Text_Out	db	"������� ����������: ������ � �������� ������� ���������� - ������ Alt!"
Len_Text_Out=$-Text_Out
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
cycl:	; ����������� (��� �������) ���� �� ������� ����� ������ ����
	mov	INPUT_RECORD_buf.EventType,0
	push	offset	n_record
	push	1
	push	offset INPUT_RECORD_buf
	push	dIn
	call	ReadConsoleInputA
	cmp	eax,0
 	jz	exit	;���� �������
	cmp	INPUT_RECORD_buf.EventType,MOUSE_EVENT
	jne	key
	jmp	exit
key:
	cmp	INPUT_RECORD_buf.EventType,KEY_EVENT
	jne	cycl
;����� ������� ���������� ���������?
	cmp	INPUT_RECORD_buf.dwControlKeyState,RIGHT_ALT_PRESSED
	jne	cycl
	mov	len_Text,Len_Text_Out
	mov	adr_Text,offset Text_Out
;������� ������ � ���� �������:
;��������� ������ � ������� ������� ����
	inc	con.xx
	inc	con.yy
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
	push	0
	push	offset NumWri	;�������������� ���������� ���������� �� ����� ��������
	push	dword ptr len_Text	;����� ������ ��� ������ �� �����
	push	dword ptr adr_Text	;����� ������ ��� ������ �� �����
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
