;--------------------------------------------------------------------------------;
;prg4_67_d.asm - ����� ������ P � ������� ����� (�����). ����� ����� ������������ �����������.
;����: ��������� ���� shaltai.txt � ������ P ("������").
;�����: ��������� � ���������� ��������� ������ P � ������ ����� shaltai.txt.
;--------------------------------------------------------------------------------;
masm
.486
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
%NOINCL	;��������� ����� ������ ���������� ������
include	WindowConA.inc
;���������� �������� ������������ � ������ ��������� ������� Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	ExitProcess:PROC
extrn	GetStdHandle:PROC
extrn	CreateFileA:PROC
extrn	GetFileSize:PROC
extrn	ReadFile:PROC
extrn	GetProcessHeap:PROC
extrn	HeapAlloc:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	WriteConsoleA:PROC
extrn	ReadConsoleA:PROC
;���������������� �����
SSHORT	equ	<dw	0>
;���������� ��������:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
.data
mes	db	"��������� ������ - "
;������ ������ P - �������� ������
p	db	"�����"	;���� ������ - ����� "�����" � ����� shaltai.txt
len_p=$-p
	db	" - "
	db	"� ������ ����� "
	db	0	;������� ����� ���������������� ������ ������
n_str_f	db	0	;������� ����� ���������������� ������ ������
	db	" - "
count	db	0	;������� ��������� P � S (�����������)
Len_disp=$-mes
Hand_Head	dd	0	;��������� ����
lpBuf	db	'shaltai.txt'	;��� �����
lpBufSize=$-lpBuf
hFile	dd	0	;���������� �����
FileSize	dd	0	;������ �����
buf_start	dd	0	;����� ����� ��� ������ ��������� �� ����� ���� ��������
dOut	dd	0	;���������� ������ �������
dIn	dd	0	;���������� ����� �������
con	Coord	<>
;��������� �������� ��������� ��� ������ �� �����
xxx	dw	1	;
yyy	dw	1	;
NewNode	dd	0
NumWri	dd	0
.stack	256
.code
start	proc	near	;����� ����� � ���������:
;������ �������
	call	AllocConsole
;��������� ����� ������� �������
	test	ax,ax
	jz	exit	;�������
; ������� ����������� ����� � ������ �������
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-���������� ������ �������
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-���������� ����� �������
;��� ���������� ����� ���������� ����, ���������� �������� �� ��������� (1 �����)
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	Hand_Head,eax	;��������� ����������
;������ ���� � ����������� ���������� ������� ������
;��������� ����
;HANDLE CreateFile(LPCTSTR lpFileName,DWORD dwDesiredAccess,DWORD ;dwShareMode,LPSECURITY_ATTRIBUTES lpSecurityAttributes,DWORD dwCreationDisposition,DWORD ;dwFlagsAndAttributes,HANDLE hTemplateFile);
	push	0
	push	0	;�������� (��� ������������)
	push	OPEN_EXISTING	;������� ������������ ����, ���� ��� ��� ? ������
	push	0	;������ ����� �� ���������
	push	FILE_SHARE_READ	;��������� ���������� ������������� ����� (�� ������)
	push	GENERIC_READ	;��������� ������ �� �����
	push	offset lpBuf	;��� �����
	call	CreateFileA
	cmp	eax,0ffffffffh
	je	exit	;���� �������
	mov	hFile,eax	;���������� �����
;��������� ������ �����
;DWORD GetFileSize(HANDLE hFile,LPDWORD lpFileSizeHigh);
	push	0
	push	hFile
	call	GetFileSize
	cmp	eax,0
	jz	exit	;���� �������
	mov	FileSize,eax	;�������� ������ �����
;����������� ���� ������ �� ����:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	FileSize
	push	0	;����� �� ������
	push	Hand_Head	;��������� ����
	call	HeapAlloc
	mov	buf_start,eax	;����� ����� � ������� ��������� �� ����� ���� ��������
;������ ����
;BOOL ReadFile(HANDLE hFile,LPVOID lpBuffer,DWORD nNumberOfBytesToRead,LPDWORD lpNumberOfBytesRead,LPOVERLAPPED lpOverlapped);
	push	0
	push	offset FileSize	;������� ���� ��������� �������
	push	FileSize
	push	buf_start	;�����, � ������� ������ ����
	push	hFile
	call	ReadFile
	cmp	eax,0
	jz	exit	;���� �������
push	ds
pop	es
	cld
	mov	ecx,FileSize
	mov	edi,buf_start	;����� ������ � ������� ����� � edi
cycl1:
push	ecx
push	edi
	mov	ebx,ecx
	mov	al,0dh	;0dh ->al
repne	scasb
	jcxz	e_exit
	jmp	$+7
e_exit:	jmp	exit
pop	edi
	sub	ebx,ecx
	xchg	ebx,ecx
	mov	al,p	;P[0]->al
next_search:
repne	scasb
	jcxz	end_str	;��������� ����� ������
;��������� ��������� ����������
push	ecx
	lea	esi,p
	inc	esi
	mov	ecx,len_p-1
repe	cmpsb
	jz	eq_substr
;������ p <> ��������� � s
	mov	edx,len_p-1
	sub	edx,ecx
pop	ecx
	sub	ecx,edx	;���� ���������� ��� ��������� cmpsb
	jmp	next_search
end_str:
	inc	edi
	inc	ebx
	xchg	ebx,ecx
;����������� � ���������� ������������� ������� ��������� count
	mov	al,count
	aam
	add	ax,3030h
	lea	esi,count
	mov	[esi-1],ah
	mov	[esi],al
;����� �� �����
push	ecx	;1 - ���������, ��� ��� �������� ���� ��������� API Win32
;��������� ������ � ��������� ������� (1,1)
	mov	ax,xxx
	mov	con.xx,ax
	mov	ax,yyy
	mov	con.yy,ax
	inc	xxx
	inc	yyy
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
	mov	eax,Len_disp
	lea	ebx,mes
	push	0	;��������������
	push	offset NumWri	;�������������� ���������� ���������� ��������
	push	eax	;����� ������
	push	ebx	;��������� �� ������
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;���� �������
	mov	count,0	;�������� ������� ��������� � ������
pop	ecx	;1 - ���������������
	jmp	cycl1
eq_substr:
pop	ecx
	sub	ecx,len_p-1	;���� ���������� ��� ��������� cmpsb
	inc	count
	jmp	next_search
exit:
pop	ecx	;1
;����� �� ��������� - �������� ���� �� ������� ����� �������
	push	0
	push	offset NumWri
	push	4
	push	offset NewNode	;���� ����� �����
	push	dIn
	call	ReadConsoleA
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
