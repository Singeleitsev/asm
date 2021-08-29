;--------------------------------------------------------------------------------;
;prg02_10.asm - ������ ���������� ��� Win32
;(������ � ��������� ��������) � �������������� �������
;API Win32 ��� ������ � �����
;����: ������ ��������, ���������� ����� � �����.
;�����: ���. � �������� ������ ��������� ����������� ��� ����������� ���������.
;--------------------------------------------------------------------------------;
.486
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
%NOINCL	;��������� ����� ������ ���������� ������
include	WindowConA.inc
;���������� �������� ������������ � ������ ��������� ������� Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	ExitProcess:PROC
extrn	GetProcessHeap:PROC
extrn	GetStdHandle:PROC
extrn	HeapAlloc:PROC
extrn	HeapFree:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	WriteConsoleA:PROC
;���������������� �����
SSHORT	equ	<dw	0>
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
desc_que	struc	;���������� �������
;��� ������� - ��� ���������� �������
;����� ���������� � ������������� ���������� ������������������� ���� ��������� size_que � size_item_que
p_start_que	dd	0	;����� ����� (������ ������� ������ ��� �������) �� ����� ���� �������� (A1)
p_end_que	dd	0	;����� ����� ����� � ����� ���� �������� (Amax)
size_que	dd	0	;������ ������� � ������
p_head	dd	0	;��������� ������ ������� (P1)
p_tail	dd	0	;��������� ������ ������� (P2)
size_item_que	dd	1	;������ �������� ������� � ������ (�� ��������� 1 ����)
Hand_Head	dd	0	;��������� ����� ���� ��������
ends
.data
char_que	desc_que	<>
string	db	"gfvfvds4gdff2gfd9gfff7ddf3gdf1teeeeee6gfd9sdgdf4"
l_string=$-string
temp	db	0
dOut	dd	0	;���������� ������ �������
NumWri	dd	0	;���������� �������� ��������� ������, ���������� �� �����
mes_e	db	"������� �����������"
len_mes_e=$-mes_e
con	Coord	<>
.code
;�������� ����������� ������ � ��������:
create_que	macro	descr:REQ,SizeQue:REQ
;�������� �������
;descr - ��� ���������-����������� �����
;SizeQue - ������ ������� (�������� ����, �������� �� ��������� ���!)
;��������� ��������
	push	eax
;���������� ����, ���������� �������� �� ���������
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	descr.Hand_Head,eax
	mov	descr.size_que,SizeQue
;����������� ���� ������ �� ����:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	descr.size_que	;������ �������
	push	0	;����� �� ������
	push	eax	;��������� ����
	call	HeapAlloc
	mov	descr.p_start_que,eax	;����� ����� �� ����� ���� ��������
	mov	descr.p_head,eax	;��������� ������ �������
	mov	descr.p_tail,eax	;��������� ������ �������
	add	eax,SizeQue
	mov	descr.p_end_que,eax	;����� ����� ����� �� ����� ���� ��������
;��������������� ��������
	pop	eax
endm
delete_que	macro	descr:REQ
;�������� �������
;��� ����� ����������� ����
;descr - ��� ���������-����������� �������
;BOOL HeapFree(HANDLE hHeap, DWORD dwFlags, LPVOID lpMem);
	push	descr.p_start_que
	push	0
	push	descr.Hand_Head
	call	HeapFree
endm
push_que	macro	descr:REQ,adr_item:REQ
local	exit,m1,m2,m5
;���������� �������� � ������� [2]
;� ������ ������� (����������� �������) cf=1
;descr - ��� ���������-����������� �������
;adr_item - ����� ������������ �������� � ������, ������ ��� ������ ��������������� size_item_que
;��������� ��������
	push	ecx
	push	esi
	push	edi
	push	ebx
;��������� ������ � ������ � esi � edi
	mov	esi,descr.p_head
	mov	edi,descr.p_tail
;1 - ��������� ����� ����� ������, ����������� ��� �������?
	cmp	descr.p_end_que,edi
	je	m5
;2 - ��������� ������������� �������
	mov	ebx,edi
	add	ebx,descr.size_item_que
	cmp	ebx,esi
	jne	m1
	stc	;cf=1 - ����� � ������� ��� => �������
	jmp	exit
;3 - ������� ������� � �������
m1: 	clc
	mov	ecx,descr.size_item_que
	mov	esi,adr_item
	mov	edi,descr.p_tail
rep	movsb
;4 - ����������� ���������
	mov	descr.p_tail,edi	;���������� ��������� �� �����
	jmp	exit	;�������
;5 - ��������� ������������� �������
m5:
	cmp	descr.p_start_que,esi
	jne	m2
	stc	;cf=1 - ����� � ������� ��� => �������
	jmp	exit
;6 - ������� ������� � �������
m2:	clc
	mov	ecx,descr.size_item_que
	mov	esi,adr_item
	mov	edi,descr.p_tail
rep	movsb
;7 - ����������� ���������
	mov	edi,descr.p_start_que
	mov	descr.p_tail,edi	;��������� �� ����� = ������ ������ �����
;�������
exit:
;��������������� ��������
	pop	ebx
	pop	edi
	pop	esi
	pop	ecx
endm
pop_que	macro	descr:REQ,adr_item:REQ
local	exit,m1,m2,m5
;���������� �������� �� ������� [2]
;� ������ ������� (���� ������� �����) - cf=1
;descr - ��� ���������-����������� �������
;adr_item - ����� ������� ������, ���� ����������� ������� (�� ������ ������ ��������������� size_item_que)
;��������� ��������
	push	ecx
	push	esi
	push	edi
;��������� ������ � ������ � esi � edi
	mov	esi,descr.p_head
	mov	edi,descr.p_tail
;1 - �������� ������� ��������� � �������
	cmp	esi,edi
	jne	m1
	stc	;������� �����
	jmp	exit	;�� �����
;2 - ���������� ��������
m1:
	mov	ecx,descr.size_item_que
	mov	esi,descr.p_head
	mov	edi,adr_item
rep	movsb
	dec	esi
;��������� ������� �������� �������� �����
	mov	edi,esi
	xor	al,al
	stosb
;3-4 - ������������ ��������� �� ������
	cmp	esi,descr.p_end_que
	jne	m2
	mov	esi,descr.p_start_que
	mov	descr.p_head,esi	;��������� �� ������ = ������ ������ �����
	jmp	exit	;�� �����
m2:
	add	esi,descr.size_item_que	;������������ ��������� �� ������
	mov	descr.p_head,esi
;�������
exit:
;��������������� ��������
	pop	edi
	pop	esi
	pop	ecx
endm
init_que	macro	descr:REQ
;������� ������� (�������� ���� ��������� ��� �������� ����� �������)
;descr - ��� ���������-����������� �������
;��������� ��������
	push	eax
;���������� ����, ���������� �������� �� ���������
	mov	eax,descr.p_start_que	;����� ����� �� ����� ���� ��������
	mov	descr.p_head,eax
	mov	descr.p_tail,eax
;��������������� ��������
	pop	eax
endm
TestEmptyQue	macro	descr:REQ
local	exit
	push	eax
;�������� �� ������� �������
	mov	eax,descr.p_head
	cmp	eax,descr.p_tail
	jne	exit
	stc	;cf=1 - ������� �����
exit:
	pop	eax
endm
start	proc	near
;����� ����� � ���������:
;������ �������
	call	AllocConsole
;��������� ����� ������� �������
	test	ax,ax
	jz	exit	;�������
;������� ���������� ������ �������
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-���������� ������ �������
;�������� �������
	create_que	char_que,10
;������ ������� ������
	lea	esi,string
	mov	ecx,l_string+1	;+1 ��� ��������� ���� ���������, ������� ���������
	push	ecx
	jmp	cycl
e_xit:	jmp	exit
cycl:	pop	ecx
	jcxz	e_xit
	lodsb	;� al ��������� ������ ������
	dec	ecx
	push	ecx
;����������� ��������� ������ ������
	cmp	al,31h
	jb	m1
	cmp	al,39h
	ja	m1
;������� �� ������� ��������
	xor	ecx,ecx
	mov	cl,al
	sub	cl,30h	;����������� ������ ����� � �������� ����������
m2:	pop_que	char_que,<offset temp>
	jc	cycl	;���� ������� �����
	loop	m2
	jmp	cycl
;��������� �������� � �������
m1:
	mov	temp,al
	push_que	char_que, <offset temp>
	jnc	cycl	;�����
;����� �� ����� ��������� �� ������ - ���������� ����� � �������
;��������� ������ � ������� (2,5)
	mov	ax,2
	mov	con.xx,ax
	mov	ax,5
	mov	con.yy,ax
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
	lea	ebx,mes_e
	mov	eax,len_mes_e
	push	0	;��������������
	push	offset NumWri	;�������������� ���������� ���������� ��������
	push	eax	;����� ������
	push	ebx	;��������� �� ������
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;���� �������
	jmp	cycl
;����� �� ����������
exit:
;������� ���� ������ � ��������
	delete_que	char_que
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
