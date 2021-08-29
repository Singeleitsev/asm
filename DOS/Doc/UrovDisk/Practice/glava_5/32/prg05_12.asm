;----------------------------------------------------------
;prg05_12.asm - ��������� ��������������� ������������� ����������������� ����������� �������.
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
extrn	MessageBeep:PROC
extrn	SetConsoleCtrlHandler:PROC
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
Text_CTRL_C	db	"������ CTRL+C"
Len_Text_CTRL=$-Text_CTRL_C
Text_BREAK	db	"������ CTRL+BREAK"
Len_BREAK=$-Text_BREAK
.code
CtrlHandler	proc
arg @@dwCtrlType:DWORD
uses ebx,edi, esi	;��� �������� ����������� ������ �����������
;����������� ��� ������� ����������
	cmp	@@dwCtrlType,CTRL_C_EVENT
	je	h_CTRL_C_EVENT
	cmp	@@dwCtrlType,CTRL_BREAK_EVENT
	je	h_CTRL_BREAK_EVENT
	jmp	h_default
h_CTRL_C_EVENT:
;��� ������� CTRL+C ������� ��������� � ����:
;��������� ������
	inc	con.xx
	inc	con.yy
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
;������� ������
	push	0
	push	offset NumWri	;�������������� ���������� ���������� �� �����
	push	Len_Text_CTRL	;����� ������ ��� ������ �� �����
	push	offset Text_CTRL_C	;����� ������ ��� ������ �� �����
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;���� �������
;� ����:
;BOOL MessageBeep(UINT uType);
	push	0FFFFFFFFh
	call	MessageBeep
	cmp	eax,0
	jz	exit	;���� �������
;���������� ������� ���������
	mov	eax,1
	jmp	exit_CtrlHandler
h_CTRL_BREAK_EVENT:
;��� ������� CTRL+BREAK ������� ��������� � ����:
;��������� ������
	inc	con.xx
	inc	con.yy
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
;������� ������
	push	0
	push	offset NumWri	;�������������� ���������� ���������� �� ����� ��������
	push	Len_BREAK	;����� ������ ��� ������ �� �����
	push	offset Text_BREAK	;����� ������ ��� ������ �� �����
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;���� �������
;� ����:
;BOOL MessageBeep(UINT uType);
	push	0FFFFFFFFh
	call	MessageBeep
	cmp	eax,0
	jz	exit	;���� �������
;���������� ������� ���������
	mov	eax,1
	jmp	exit_CtrlHandler
h_default:
	mov	eax,0ffffffffh	;���������� -1	;��� ��������� �� ������������
exit_CtrlHandler:
	ret
CtrlHandler	endp
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
;��������� �������-���������� �������� ����������
	push	TRUE
	push	offset cs: CtrlHandler
	call	SetConsoleCtrlHandler
	cmp	eax, 0
	jz	exit	;���� �������
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
;��������� ������ � �������
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
;��������� �������� ��������� �������� - ����� �������� �� ���������� ������� ������� bl
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
	push	offset NumWri	;�������������� ���������� ���������� �� ����� ��������
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
