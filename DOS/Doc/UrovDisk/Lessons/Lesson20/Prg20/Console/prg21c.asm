;prg21c.asm
;������ ����������� ���������� ��� Win32
;(� �������������� ������ MMX-���������� � ������, ������������ � ������)
.486
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
%NOINCL	;��������� ����� ������ ���������� ������
include mmx32.inc
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
;��������� bmp-�����	(�� ����� ���� ����� "������� ������ Windows")
;���������������� �����
SSHORT	equ	<dw	0>
UINT	equ	<dw	0>
DDWORD	equ	<dd	0>
LONG	equ	<dd	0>
WWORD	equ	<dw	0>
BBYTE	equ	<db	0>
;��������� ��� ��������� ��������� ������� � �������:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
;��������� bmp-�����
BitMapFileHeader	struc
bfType	UINT	;������� "B" � "�"
bfSize	DDWORD	;������ ����� � ������
bfReserved1	UINT	;������
bfReserved2	UINT	;������
bfOffBits	DDWORD	;�������� � ������ � ������ ���������� �����������
;�������������� ���������� �����������
biSize	DDWORD	;������ ������ ��������� � ������ (������ ���� ����� 00000028h)
biWidth	LONG	;������ ����������� � ��������
biHeight	LONG	;������ ����������� � ��������
biPlanes	WWORD	;����� �������� ���������� (������ ���� ����� 1)
biBitCount	WWORD	;����� ��� �� ������ (������ ���� ����� 1, 4, 8, 24)
biCompression	DDWORD	;����� ������
biSizeImage	DDWORD	;������ ���������� ���������� ����������� � ������
biXPelsPerMeter	LONG	;���������� �� ����������� � �������� �� ����	
biYPelsPerMeter	LONG	;���������� �� ��������� � �������� �� ����
biClrUsed	DDWORD	;����� ������ � �����������
biClrImportant	DDWORD	;����� ������ ������ �����������
BitMapFileHeader	ends

.data
NumWri	dd	0
inFile	db	80 dup (20)
outFile	db	80 dup (20)
con	Coord	<>
hinFile	dd	0
houtFile	dd	0
hMapinFile	dd	0
hMapoutFile	dd	0
TitleText	db	'MMX �������������� bmp-�����',0
mes1	db	'������� ���� � ��������� ����� TrueColor:'
len_mes1=$-mes1
mes2	db	'������� ���� � ��������� ����� :'
len_mes2=$-mes2
mesErr1	db	'��� �� bmp-����:'
len_mesErr1=$-mesErr1
mesErr2	db	'��� �� TrueColor-����:'
len_mesErr2=$-mesErr2
mesRet	db	'������� ����� ������� ��� ������'
len_mesRet=$-mesRet
dOut	dd	0
dIn	dd	0
porog	label	dword
	dw	0000h	
	dw	004dh
	dw	0097h
	dw	001ch	;00 77 151 28
RabObl	dd	0	
	dd	0	
pixSizeLow	dd	0
pixSizeHi	dd	0
i8	dd	8
outFileSize	dd	0
initRMMX0	label	dword
	db	00,00,00,00,01,01,01,00		
initRMMX1	label	dword
	db	02,02,02,00,02,02,02,00		
PointOutRegion	dd 0
PointInRegion	dd 0

nWrByte	dd	0
temp	db	"B"
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
	mov	dOut,eax	;dOut-���������� ����� ������ �������

	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-���������� ����� ������ �������
;��������� ������ � ������� (2,5)
	mov	con.xx,2
	mov	con.yy,5
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
;������� ����������� �� ���� ����� ��������� �����
	push	0
	push	offset NumWri	
	push	len_mes1
	push	offset mes1
	push	dOut
	call	WriteConsoleA
;��������� ������ � ������� (2,6)
	mov	con.xx,2
	mov	con.yy,6
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������

	push	0
	push	offset NumWri	
	push	80
	push	offset inFile
	push	dIn
	call	ReadConsoleA
	lea	eax,inFile
	sub	NumWri,2
	add	eax,NumWri
	mov	[eax],byte ptr 0

;��������� ������ � ������� (2,7)
	mov	con.xx,2
	mov	con.yy,7
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
;������� ����������� �� ���� ����� ��������� �����
	push	0
	push	offset NumWri	
	push	len_mes2
	push	offset mes2
	push	dOut
	call	WriteConsoleA
;��������� ������ � ������� (2,8)
	mov	con.xx,2
	mov	con.yy,8
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������

	push	0
	push	offset NumWri	
	push	80
	push	offset outFile
	push	dIn
	call	ReadConsoleA
	lea	eax,outFile
	sub	NumWri,2
	add	eax,NumWri
	mov	[eax],byte ptr 0
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
	cmp	eax,0ffffffffh
	jz	exit	;�������
	mov	hinFile,eax

;�������� ������� ���� "������������ ����"  ��� ��������� ����� inFile
	push	NULL
	push	0	;������ ����� - �������
	push	0
	push	PAGE_READWRITE
	push	NULL
	push	hinFile
	call	CreateFileMappingA
;��������� ����� 
	cmp	eax,0
	jz	exit	;�������
	mov	hMapinFile,eax

;������������� �������� ������  ��� ��������� ����� inFile �� �������� ������������ ��������
	push	NULL
	push	0	;�������� ������� ������������ ����� � �����
	push	0
	push	FILE_MAP_WRITE	
	push	hMapinFile
	call	MapViewOfFile
;��������� ����� �������� �����
	cmp	eax,0
	jz	exit	;�������
	mov	PointInRegion,eax
	mov	ebx,eax	;����� ������ ��������� ����� � ������ � ebx
;------------------ inFile -----------------------------------------------------
	mov	ebx,eax	;����� ����� � ������ � ebx
	cmp	[ebx].biSize,28h
	jne	exit_err1	;��� �� bmp-����
	cmp	[ebx].biBitCount,18h
	jne	exit_err2	;��� �� TrueColor ����
;�������������� True -> Gray
;------------------ outFile ----------------------------------------------------
;�������� ������� ���� "����" ��� ��������� ����� outFile
	push	NULL
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_ALWAYS	
	push	NULL
	push	0
 	push	GENERIC_READ+GENERIC_WRITE	;��������� ������ � ������ � ����
	push	offset outFile	
	call	CreateFileA
;��������� ����� 
	cmp	eax,0ffffffffh
	jz	exit	;�������
	mov	houtFile,eax

;�������� ������� ���� "������������ ����"  ��� ��������� ����� outFile
;;��������� ����� ��������� ����� TrueColor � �������� 
;(�������� ����� ����������� �� ��� ������ (� ��������))
	mov	eax,[ebx].biWidth
	mul	dword ptr [ebx].biHeight
	mov	pixSizeLow,eax	;������� �������� ������� ������ � ��������
	mov	pixSizeHi,edx	;������� �������� ������� ������ � ��������
;� eax ������ ���������� ���������� ����������� � ������
	add	eax,54+4*256	;54-������ �������������� ��������� 
				;4*256-������ ������� �������� ��������
;� eax ������ ��������� ����� � ������
	mov	outFileSize,eax

	push	NULL
	push	eax	;������ ��������� �����
	push	NULL
	push	PAGE_READWRITE	;PAGE_WRITECOPY
	push	NULL
	push	houtFile
	call	CreateFileMappingA
;��������� ����� 
	cmp	eax,0
	jz	exit	;�������
	mov	hMapoutFile,eax

;������������� �������� ������  ��� ��������� ����� outFile �� �������� ������������ ��������
	push	outFileSize
	push	0	;�������� ������� ������������ ����� � �����
	push	0
	push	FILE_MAP_WRITE	;FileMapAllAccess		
	push	hMapoutFile	
	call	MapViewOfFile
;��������� ����� �������� �����
	cmp	eax,0
	jz	exit	;�������
	mov	PointOutRegion,eax
	mov	edi,eax	;����� ������ ��������� ����� � ������ � edi

;��������� ��������� ��������� �����:
	mov	ax,[ebx].bfType	
	mov	[edi].bfType,ax
	mov	eax,outFileSize	
	mov	[edi].bfSize,eax	;����� ������ �����
	mov	[edi].bfReserved1,0
	mov	[edi].bfReserved2,0
	mov	[edi].bfOffBits,54+4*256
	mov	[edi].biSize,28h
	mov	eax,[ebx].biWidth
	mov	[edi].biWidth,eax	;������ ������ � ��������
	mov	eax,[ebx].biHeight	
	mov	[edi].biHeight,eax	;������ ������ � ��������
	mov	[edi].biPlanes,1	;����� �������� ����������	
	mov	[edi].biBitCount,8	;����� ��� �� ������
	mov	[edi].biCompression,0	;����� ������	
	mov	eax,outFileSize
	sub	eax,54+4*256
	mov	[edi].biSizeImage,eax	;������ ���������� ���������� �����������
	mov	eax,[ebx].biXPelsPerMeter	
	mov	[edi].biXPelsPerMeter,eax	;������ ������ � ��������
	mov	eax,[ebx].biYPelsPerMeter	
	mov	[edi].biYPelsPerMeter,eax	;������ ������ � ��������
	mov	[edi].biClrUsed,100h	;����� ������ � �����������	
	mov	[edi].biClrImportant,0	;����� ������ ������ � �����������
;��������� ������ ������
	add	edi,54
	mov	ecx,128
	movq	rmmx0,initRMMX0
	movq	rmmx1,initRMMX1	
	xor	esi,esi
m3:
	movq	[edi+esi*8],rmmx0
	paddusb	rmmx0,rmmx1
	dec	ecx
	inc	esi
	jcxz	m1
	jmp	m3
;------------------ outFile ----------------------------------------------------
m1:	
	mov	ecx,pixSizeLow
	add	edi,4*256	;[edi]-�� ������ ���������� ���������� ����������� � �������� �����
	add	ebx,[ebx]+0ah	
	dec	ebx	;� ebx ����� � ����� ������ ����������� - 1
	xor	esi,esi
;�������� � �������� �������� �������� ��� ��������������
m2:	
	punpcklbw	rmmx0,[ebx][esi*4]
	psrlw	rmmx0,8
	pmullw	rmmx0,porog
	movq	rmmx1,rmmx0
	psllq	rmmx1,16
	paddusw	rmmx0,rmmx1
	psllq	rmmx1,16
	paddusw	rmmx0,rmmx1
	psrlw	rmmx0,8	;����� �� 256	
	movq	RabObl,rmmx0
	mov	al,byte ptr RabObl+6
	mov	[edi],al
	add	ebx,3
	dec	ecx
	inc	edi
	jecxz	m5
	jmp	m2	;�� ������ ������� ��� ������ ����� edx �� ���� (������� ����)
m5:	jmp	exit
exit_err1:
;��������� ������ � ������� (5,10)
	mov	con.xx,5
	mov	con.yy,10
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
;������� ��������� �� ������
	push	0
	push	offset NumWri	
	push	len_mes2
	push	offset mesErr1
	push	dOut
	call	WriteConsoleA
	jmp	exit	;return
exit_err2:
;��������� ������ � ������� (5,10)
	mov	con.xx,5
	mov	con.yy,10
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
;������� ��������� �� ������
	push	0
	push	offset NumWri	
	push	len_mes2
	push	offset mesErr2
	push	dOut
	call	WriteConsoleA
;	jmp	return
;��������� �����
exit:
	emms
;��������� ������ � ������� (5,12)
	mov	con.xx,5
	mov	con.yy,10
	push	con
	push	dOut
	call	SetConsoleCursorPosition
;������� ��������� � ������� ����� �������
	push	0
	push	offset NumWri	
	push	len_mesRet
	push	offset mesRet
	push	dOut
	call	WriteConsoleA
	push	0
	push	offset NumWri	
	push	80
	push	offset inFile
	push	dIn
	call	ReadConsoleA	

	push	NULL
	push	PointInRegion
	call	FlushViewOfFile

	push	hinFile
	call	CloseHandle
	push	hMapinFile
	call	CloseHandle

	push	outFileSize	
	push	PointOutRegion
	call	FlushViewOfFile

	push	houtFile
	call	CloseHandle
	push	hMapoutFile
	call	CloseHandle
;����� �� ����������
return:
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start