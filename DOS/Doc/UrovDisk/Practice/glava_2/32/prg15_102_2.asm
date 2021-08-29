;--------------------------------------------------------------------------------;
;prg15_102.asm - ���������� ��������� �������������� ������ � ����������� ��������
;����: ���������� ������ � ����������.
;�����: ����� �� ����� ��������������� �������� ������.
;--------------------------------------------------------------------------------;
.486
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
include	WindowConA.inc
;���������� �������� ������������ � ������ ��������� ������� Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	ExitProcess:PROC
extrn	GetStdHandle:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	GetProcessHeap:PROC
extrn	HeapAlloc:PROC
extrn	HeapFree:PROC
extrn	ReadConsoleA:PROC
extrn	WriteConsoleA:PROC
;���������������� �����
SSHORT	equ	<dw	0>
item_list	struc	;������� ������
prev	dd	0	;����� ����������� ��������
info	db	0	;�������������� ����� (� ����� ������ - ������)
next	dd	0	;����� ���������� ��������
ends
Head_list	struc	;��������� - ��������� ������
first	dd	0	;����� ������� �������� ����������� ������
info	db	0ffh	;0ffh - ������� ��������� ������
last	dd	0	;����� ���������� �������� ����������� ������
ends
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
.data
mas	db	80 dup (' ')	;� ��� ������ ������
mas_rev	db	80 dup (' ')	;�� ���� ������ �������
len_mas_rev=$-mas_rev
Hand_Head	dd	0
Doubly_Head_list	Head_list	<>;��������� ������
con	Coord	<>
dOut	dd	0
dIn	dd	0
NumWri	dd	0
mes1	db	'������� ������ �������� (�� 80) ��� �������������� (� ������ �� �����):'
len_mes1=$-mes1
.code
;�������� ����������� ������ �� ��������� �������:
create_doubly_list	macro	head:REQ
;���������� ����, ���������� �������� �� ��������� (1 �����), �� ��� ������������� ����� ������� � ���. ���� � ������� HeapCreate
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	Hand_Head,eax	;��������� ����������
;�������� ������ - ������������ ������ ������
;head - ��� ���������� ��� �������� ��������� ����������� ������
	mov	head.first,offset head
	mov	head.last,offset head
endm
add_list	macro	descr:REQ,head:REQ,H_Head:REQ
;���������� �������� � ���������� ������
;����:
;descr - ��� ���������-�������� ������
;head - ��� ���������� ��� �������� ��������� ����������� ������
;H_Head - ��� ����������, � ������� �������� ���������� ����
;��������� ��������
	push	eax
;����������� ���� ������ �� ���� ��� ����� ������� ������:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	type descr	;������ ���������
	push	0	;����� �� ������
	mov	eax,H_Head
	push	eax	;��������� ���� Hand_Head
	call	HeapAlloc
	mov	ebx,eax	;� ebx ����� ����� ������ ��� ������������ ������ �������� ������
;��������� ���� ����� � ��������� (����� �����������), ����������� (�����) �������� � ��������� ������
	mov	[ebx].next,offset head
	mov	eax,head.last
	mov	[ebx].prev,eax
	mov	[eax].next,ebx
	mov	head.last,ebx
;������ ����� ��������� ���� [ebx].info ������ �������� ������ ������ ��������
;��������������� ��������
	pop	eax
endm

start	proc	near
;����� ����� � ���������: ������ �������
	call	AllocConsole
;��������� ����� ������� �������
	test	ax,ax
	jz	exit	;�������
;����� ������ ������ - ����������� �� ���� ������ ��� ��������������
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
;������� ����������� �� ������
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
	push	offset mas
	push	dIn
	call	ReadConsoleA
;������� ��������� ������, ��� ���� �������������� ��������� ������
	create_doubly_list	Doubly_Head_list
;������ ������� ������ � ���������� �� ��� ���, ���� �� ���������� "."
	lea	esi,mas
cycl:
	mov	al,[esi]
	cmp	al,"."
	je	rev_out
	add_list	item_list,Doubly_Head_list,Hand_Head
	mov	[ebx].info,al
	inc	esi
	jmp	cycl
;����� ������ � �������� �������
rev_out:
	mov	esi,offset mas_rev
	mov	ebx,Doubly_Head_list.last
cycl2:
	mov	al,[ebx].info
	mov	[esi],al
	inc	esi
	mov	ebx,[ebx].prev
	cmp	[ebx].info,0ffh	;����� �� ���������� �������� ������?
	jne	cycl2
;������� ��������������� ������ �� �����
;��������� ������ � ������� (2,7)
	mov	con.xx,2
	mov	con.yy,7
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;���� �������
;������� ��������������� ������
	push	0
	push	offset NumWri
	push	len_mas_rev
	push	offset mas_rev
	push	dOut
	call	WriteConsoleA
;����� �� ����������
;�������� ���� �� ������� ����� �������
	push	0
	push	offset NumWri
	push	80
	push	offset mas
	push	dIn
	call	ReadConsoleA
exit:
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
