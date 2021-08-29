;----------------------------------------------------------
;prg07_31.asm - Win32-��������� ����������� ���������� ��� ������������ ������ � ������� �� ���������� - ���������� ������ � ����� �� ����� ����������� �����.
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
extrn	GetModuleHandleA:PROC
extrn	GetModuleFileNameA:PROC
extrn	SearchPathA:PROC
extrn	GetFileSize:PROC
extrn	ReadFile:PROC
extrn	GetProcessHeap:PROC
extrn	HeapAlloc:PROC
;���������������� �����
SSHORT	equ	<dw	0>
;��������� ��� ��������� ��������� ������� � �������:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
.data
lpBuf	db	260 dup (20h)
lpBufSize=$-lpBuf
lpNameFileInBuf	dd	0
sAsm	db	"asm"
hFile	dd	0
FileSize	dd	0
con	Coord	<>
TitleText	db	'������ � ������� � Win32',0
dOut	dd	0	;���������� ������ �������
dIn	dd	0	;���������� ����� �������
HandHead	dd	0	;����� ����
p_start	dd	0	;����� ����� ��� ������ ��������� �� ����� ���� ��������
NumWri	dd	0	;���������� �������� ��������� ������, ���������� �� �����
.code
start	proc	near
;����� ����� � ���������:
;������ �������
	call	AllocConsole
;��������� ����� ������� �������
	test	ax,ax
	jz	exit	;�������
;����� ���� ���������
	push	offset TitleText
	call	SetConsoleTitleA
;����� ������ ������
;������� ������� ����������� ����� � ������ �������
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-���������� ������ �������
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-���������� ����� �������
;��������� ������ � ������� (2,5)
	mov	con.xx,2
	mov	con.yy,5
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
;��� ��������� ����� ��������� ��������, ������ �� ���� �������������:
;1. ��� ��������� ����� ��������� � ������ ��� ������������ ������
;2. ��� ����� ����������� ���� � ����� ��������
;HMODULE GetModuleHandle(LPCTSTR lpModuleName);
	push	0
	call	GetModuleHandleA
;DWORD GetModuleFileName(HMODULE hModule,LPTSTR lpFilename,DWORD nSize);
	push	lpBufSize
	push	offset lpBuf
	push	eax	;��������� �� ���� .exe-����, ���������� GetModuleHandle
	call	GetModuleFileNameA
;� eax ����� ������� ���� � ������������ ����� (� ����������� .exe)
	mov	lpNameFileInBuf,eax
;��� ��������� ����� ��������� ����� ������� ���������� .exe �� .asm
	std
	mov	esi,offset sAsm
	add	esi,2
	mov	edi,offset lpBuf
	dec	eax
	add	edi,eax
	push	ds
	pop	es
	mov	ecx,3
rep	movsb
;��������� ����
;HANDLE CreateFile(LPCTSTR lpFileName,DWORD dwDesiredAccess,DWORD ;dwShareMode,LPSECURITY_ATTRIBUTES lpSecurityAttributes,DWORD dwCreationDisposition,DWORD ;dwFlagsAndAttributes,HANDLE hTemplateFile);
	push	0
	push	0	;�������� (��� ������������)
	push	OPEN_EXISTING	;������� ������������ ����, ���� ��� ��� - ������
	push	0	;������ ����� �� ���������
	push	FILE_SHARE_READ	;��������� ���������� ������������� ����� (�� ������)
	push	GENERIC_READ	;��������� ������ �� �����
	push	offset lpBuf
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
;�������� ���� � ������, � ������� ����� ������ ����
;HandHead - ����� � ���������� ����
;���������� ����, ���������� �������� �� ���������
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	HandHead,eax
;����������� ���� ������ �� ����:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	FileSize
	push	0	;����� �� ������
	push	HandHead	;��������� ����
	call	HeapAlloc
	mov	p_start,eax	;����� ����� � ������� ��������� �� ����� ���� ��������
;������ ����
;BOOL ReadFile(HANDLE hFile,LPVOID lpBuffer,DWORD nNumberOfBytesToRead,LPDWORD lpNumberOfBytesRead,LPOVERLAPPED lpOverlapped);
	push	0
	push	offset FileSize	;������� ���� ��������� �������
	push	FileSize
	push	p_start	;�����, � ������� ������ ����
	push	hFile
	call	ReadFile
	cmp	eax,0
	jz	exit	;���� �������
;������ ����� ��������� � �� �����
;������������� ������
;��������� ������ � ������� (2,5)
	mov	con.xx,1
	mov	con.yy,5
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
	cld
	mov	edi,p_start
	mov	esi,p_start
	mov	ecx,FileSize
cycl:
	mov	al,0dh
repne	scasb
	cmp	byte ptr [edi],0ah
	jne	$-5
	inc	edi
	dec	ecx
	jecxz	exit	;���� ���� ��������
	mov	eax,edi
	sub	eax,esi	;� eax - ����� ������ ��� ������ �� �����, � � esi - �� �����
;������� ��������� ������
;�������� ��, ��� ����� ���������
	push	eax
	push	ecx
	push	0
	push	offset NumWri
	push	eax
	push	esi
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;���� �������
;�������� �����������
	pop	ecx
	pop	eax
	add	esi,eax
	jmp	cycl
;��������� �����
exit:
;����� �� ����������
return:
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
