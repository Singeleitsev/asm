;----------------------------------------------------------
;prg07_36.asm - Win32-���������� ���������� ��� ������������ ������� ������������� ������, ������������ � ������.
;----------------------------------------------------------
.486
.model flat, STDCALL	;������ ������ flat
;STDCALL - �������� ���������� � ����� � (������ ������)
;���������� ��������� ������ �� ����� ����
%NOINCL	;��������� ����� ������ ���������� ������
include	WindowConA.inc
;���������� �������� ������������ � ������ ��������� ������� Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	SetConsoleTitleA:PROC
extrn	ExitProcess:PROC
extrn	GetStdHandle:PROC
extrn	CreateFileA:PROC
extrn	CreateFileMappingA:PROC
extrn	MapViewOfFile:PROC
extrn	UnmapViewOfFile:PROC
extrn	CloseHandle:PROC
extrn	FlushFileBuffers:PROC
extrn	FlushViewOfFile:PROC
extrn	WriteFile:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	ReadConsoleA:PROC
extrn	WriteConsoleA:PROC
extrn	GetFileSize:PROC
;���������������� �����
SSHORT	equ	<dw	0>
;��������� ��� ��������� ��������� ������� � �������:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
.data
TitleText	db	'������ ������������� ������������ � ������ ������',0
NumWri	dd	0
inFile	db	80 dup (20)
con	Coord	<>
xxx	dw	0
yyy	dw	0
FileSize	dd	0	;������ �����
hinFile	dd	0
hMapinFile	dd	0
mes1	db	'������� ���� � ��������� �����:'
len_mes1=$-mes1
dOut	dd	0
dIn	dd	0
PointInRegion	dd	0
.code
start	proc	near
;����� ����� � ���������:
;������ �������
	call	AllocConsole
;��������� ����� ������� �������
	test	ax, ax
	jz	exit	;�������
;����� ���� ���������
	push	offset TitleText
	call	SetConsoleTitleA
;����� ������ ������
;������� ������� ����������� ����� � ������ �������
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut, eax	;dOut-���������� ����� ������ �������
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn, eax	;dIn-���������� ����� ������ �������
;��������� ������ � ������� (2, 5)
	mov	con.xx, 2
	mov	con.yy, 5
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax, 0
	jz	exit	;���� �������
;������� ����������� �� ���� ����� ��������� �����
	push	0
	push	offset NumWri
	push	len_mes1
	push	offset mes1
	push	dOut
	call	WriteConsoleA
;��������� ������ � ������� (2, 6)
	mov	con.xx, 2
	mov	con.yy, 6
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax, 0
	jz	exit	;���� �������
	push	0
	push	offset NumWri	
	push	80
	push	offset inFile
	push	dIn
	call	ReadConsoleA	;������ ��� �������� �����
	lea	eax, inFile
	sub	NumWri, 2
	add	eax, NumWri
	mov	[eax], byte ptr 0	;������������ ASCIIZ-������
;------------------ inFile -----------------------------------------------------
;�������� ������� ���� "����" ��� ��������� ����� inFile
	push	NULL
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_ALWAYS
	push	NULL
	push	0
	push	GENERIC_READ+GENERIC_WRITE	;��������� ������ � ������ � ����
	push	offset inFile
	call	CreateFileA
;��������� �����
	cmp	eax, 0ffffffffh
	jz	exit	;�������
	mov	hinFile, eax
;�������� ������� ���� "������������ ����" ��� ��������� ����� inFile
	push	NULL
	push	0	;������ ����� - �������
	push	0
	push	PAGE_READWRITE
	push	NULL
	push	hinFile
	call	CreateFileMappingA
;��������� �����
	cmp	eax, 0
	jz	exit	;�������
	mov	hMapinFile, eax
;������������� �������� ������ ��� ��������� ����� inFile �� �������� ������������ ��������
	push	NULL
	push	0	;�������� ������� ������������ ����� � �����
	push	0
	push	FILE_MAP_WRITE
	push	hMapinFile
	call	MapViewOfFile
;��������� ����� �������� �����
	cmp	eax, 0
	jz	exit	;�������
	mov	PointInRegion, eax
	mov	ebx, eax	;����� ������ ��������� ����� � ������ � ebx
;------------------ inFile -----------------------------------------------------
;��������� ������ �����
;DWORD GetFileSize(HANDLE hFile,LPDWORD lpFileSizeHigh);
	push	0
	push	hinFile
	call	GetFileSize
	cmp	eax,0
	jz	exit	;���� �������
	mov	FileSize,eax	;�������� ������ �����
;------------------------------------------------------------------------------
;����� �� �����
;��������� ������ � ��������� ������� (0,0))
cycl:
	mov	ax,xxx
	mov	con.xx,ax
	mov	ax,yyy
	mov	con.yy,ax
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
;------------------- WriteConsoleA----------------------------------------
	push	0	;��������������
	push	offset NumWri	;�������������� ���������� ���������� ��������
	push	FileSize	;����� ��������� ������ (��� �������� ����� ����� �����)
	push	PointInRegion	;��������� �� ������ ��������� ������ � ����������� �����
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
;	jz	exit	;���� ������� - ����� �� ������, ��� ��� ��� ����� ��������� ������� ����
;------------------------------------------------------------------------
;��������� ����� ����� �� ����� � ��� �����������
	push	NULL
	push	PointInRegion
	call	FlushViewOfFile
;��������� ������� ���� "�������� �����" � "����"
	push	hinFile
	call	CloseHandle
	push	hMapinFile
	call	CloseHandle
;����� �� ����������
exit:
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
