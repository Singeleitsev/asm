;----------------------------------------------------------
;		dll
;----------------------------------------------------------
.486
locals
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
%NOINCL	;��������� ����� ������ ���������� ������
include	WindowConA.inc
;���������� �������� ������������ � ������ ��������� ������� Win32 (ASCII):
extrn	GetStdHandle:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	SetConsoleTextAttribute:PROC
extrn	WriteConsoleA:PROC
extrn	ExitProcess:PROC
extrn	GetVersion:proc
;���������� ��������� WriteCon �������������
publicdll	WriteCon
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
.code
dllEntry	proc	
arg	@@hInst:dword,	@@event:dword,@@no_use:dword
@@m:		mov	eax,1
		ret
dllEntry	endp	

WriteCon	proc	
arg	@@adr_str:dword,@@len_str:dword
;������� ����������� ����������� �����-������
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-���������� ������ �������
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-���������� ����� �������
;������� ������
;��������� ������ � ������� (2,6)
	mov	con.xx,2
	mov	con.yy,6
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax, 0
	jz	exit	;���� �������
;������� ������ � ���� ������� � ��������� ������� � � ������� �������
;������ � ������� (2,6)
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
	push	@@len_str	;Len_TitleText	;����� ������ ��� ������ �� �����
	push	@@adr_str	;offset TitleText	;����� ������ ��� ������ �� �����
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;���� �������
pop	ecx
	loop	m1
exit:
	mov	eax,0ffffffffh
	mov	edx,0ffffffffh
	mov	ebx,0ffffffffh
	mov	ecx,0ffffffffh
	ret
endp	WriteCon
end	dllEntry

