;----------------------------------------------------------
;prg07_35.asm - Win32-���������� ���������� ��� ������������ ������ ������� ������ � ���������� API Win32.
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
extrn	GetCurrentDirectoryA:PROC
extrn	SetCurrentDirectoryA:PROC
extrn	GetSystemDirectoryA:PROC
extrn	GetWindowsDirectoryA:PROC
extrn	CreateDirectoryA:PROC
extrn	RemoveDirectoryA:PROC
extrn	GetLastError:PROC
.data
TitleText	db	'������ � ���������� � Win32',0
NewDir	db	"����� �������",0
dir_buf	db	50 dup ("?")
size_dir_buf=$-dir_buf
Parent	db	"..",0
.code
start	proc	near
;����� ����� � ���������:
;������ �������
	call	AllocConsole
;��������� ����� ������� �������
	test	ax,ax
	jz	exit	;�������
;-----------GetCurrentDirectory------------------------------------
;��������� ������� �������
	push	offset dir_buf
	push	size_dir_buf
	call	GetCurrentDirectoryA
	cmp	eax,0
	jz	exit	;����� � ������ �������
;----------- CreateDirectory ------------------------------------
;�������� �������
	push	0
	push	offset NewDir
	call	CreateDirectoryA
	cmp	eax,0
	jz	exit	;����� � ������ �������
;-----------SetCurrentDirectory------------------------------------
;������� ����� ������� �������
	push	offset NewDir
	call	SetCurrentDirectoryA
	cmp	eax,0
	jz	exit	;����� � ������ �������
;-----------GetCurrentDirectory------------------------------------
;�������� ����� ������� �������
	push	offset dir_buf
	push	size_dir_buf
	call	GetCurrentDirectoryA
	cmp	eax,0
	jz	exit	;����� � ������ �������
;-----------SetCurrentDirectory------------------------------------
;�������� � ������������ �������
	push	offset Parent
	call	SetCurrentDirectoryA
	cmp	eax,0
	jz	exit	;����� � ������ �������
;-----------GetCurrentDirectory------------------------------------
;�������� ����� ������� �������
	push	offset dir_buf
	push	size_dir_buf
	call	GetCurrentDirectoryA
	cmp	eax,0
	jz	exit	;����� � ������ �������
;-----------RemoveDirectory------------------------------------
;������ ����� ������� �������
	push	offset NewDir
	call	RemoveDirectoryA
	cmp	eax,0
	jz	exit	;����� � ������ �������
;-----------GetSystemDirectory------------------------------------
;��������� ��������� �������
	mov	eax,size_dir_buf
	push	eax
	push	offset dir_buf
	call	GetSystemDirectoryA
	cmp	eax,0
	jz	exit	;����� � ������ �������
;-----------GetWindowsDirectory------------------------------------
;��������� �������� ������� Windows
	mov	eax,size_dir_buf
	push	eax
	push	offset dir_buf
	call	GetWindowsDirectoryA
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
