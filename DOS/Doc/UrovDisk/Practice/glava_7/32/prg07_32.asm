;----------------------------------------------------------
;prg07_32.asm - Win32-��������� ����������� ���������� ��� Win32 ��� ������������ ������ ������� GetFileInformationByHandle API Win32.
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
extrn	MoveFileA:PROC
extrn	CreateFileA:PROC
extrn	GetFileInformationByHandle:PROC
extrn	GetLastError:PROC
;�������� ��������
FILETIME	struc
DwLowDateTime	dd	?	;������� 32 ���� �������� �������
DwHighDateTime	dd	?	;������� 32 ���� �������� �������
FILETIME ends
BY_HANDLE_FILE_INFORMATION	struc
DwFileAttributes	dd	0	;�������� �����
	struc
FtCreationTime_DwLowDateTime	dd	?	;������� 32 ���� �������� ������� �������� �����
FtCreationTime_DwHighDateTime	dd	?	;������� 32 ���� �������� ������� �������� �����
	ends
	struc
FtLastAccessTime_DwLowDateTime	dd	?	;������� 32 ���� �������� ������� ����. �������
FtLastAccessTime_DwHighDateTime	dd	?	;������� 32 ���� �������� ������� ����. �������
	ends
	struc
FtLastWriteTime_DwLowDateTime	dd	?	;������� 32 ���� �������� ������� ����. ������
FtLastWriteTime_DwHighDateTime	dd	?	;������� 32 ���� �������� ������� ����. ������
	ends
dwVolumeSerialNumber	dd	0	;�������� ����� ����, �� ������� ��������� ����
nFileSizeHigh	dd	0	;������� 32 ���� ������� �����
nFileSizeLow	dd	0	;������� 32 ���� ������� �����
nNumberOfLinks	dd	0	;����� ������ �� ����
nFileIndexHigh	dd	0	;������� 32 ���� �������������� �����
nFileIndexLow	dd	0	;������� 32 ���� �������������� �����
	ends
.data
info	BY_HANDLE_FILE_INFORMATION	<>
TitleText	db	'��������� ���������� � ����� � Win32',0
lpBuf	db	"p",0
hFile	dd	0
.code
start	proc	near
;����� ����� � ���������:
;������ �������
	call	AllocConsole
;��������� ����� ������� �������
	test	ax,ax
	jz	exit	;�������
;----------------------CreateFile--------------------------------------
;��������� ����
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
;-----------GetFileInformationByHandle------------------------------------
	push	offset info
	push	hFile
	call	GetFileInformationByHandle
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
