;--------------------------------------------------------------------------------;
;prg12_51.asm - ��������� �������� ������������ �����������
;������ � ������ - �������������� ������ �� ������
;����: ������ ��������.
;�����: ��������� �� ����� � ��� ����������� ������ ��� ���.
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
desc_stk	struc	;���������� �����
;��� ����� - ��� ���������� ���������
;����� ���������� � ������������� ���������� ������������������� ���� ��������� size_stk � size_item
p_start	dd	0	;����� ����� (������ ������� ������ ��� �����) �� ����� ���� ��������
size_stk	dd	0	;������ ����� � ������
p_top	dd	0	;����� ������� �����
size_item	dd	1	;������ �������� ����� � ������ (�� ��������� 1 ����)
Hand_Head	dd	0	;��������� ����� ���� ��������
ends
.data
temp	db	0
char_stk	desc_stk	<>
string	db	"a<a(kk{k)p>pp"
l_string=$-string
dOut	dd	0	;���������� ������ �������
NumWri	dd	0	;���������� �������� ��������� ������, ���������� �� �����
mes_e	db	"������ - ������ �������������"
len_mes_e=$-mes_e
mes_ok	db	" ��, ������ �����������"
len_mes_ok=$-mes_ok
con	Coord	<>
.code
;�������� ����������� ������ �� ������:
create_stk	macro	descr:REQ,SizeStk:=<256>
;�������� �����
;descr - ��� ���������-����������� �����
;SizeStk - ������ ����� � ������ (�� ��������� 256 ����)
;��������� ��������
	push	eax
;���������� ����, ���������� �������� �� ���������
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	descr.Hand_Head,eax
	mov	descr.size_stk,SizeStk
;����������� ���� ������ �� ����:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	SizeStk
	push	0	;����� �� ������
	push	eax	;��������� ����
	call	HeapAlloc
	mov	descr.p_start,eax	;����� ����� �� ����� ���� ��������
	mov	descr.p_top,eax	;��������� ��� �������
;��������������� ��������
	pop	eax
endm
init_stk	macro	descr:REQ
;������� ����� (�������� ���� ��������� ��� �������� ������ �����)
;descr - ��� ���������-����������� �����
;��������� ��������
	push	eax
;���������� ����, ���������� �������� �� ���������
	mov	eax,descr.p_start	;����� ����� �� ����� ���� ��������
	mov	descr.p_top,eax
;��������������� ��������
	pop	eax
endm
delete_stk	macro	descr:REQ
;�������� �����
;��� ����� ����������� ����
;descr - ��� ���������-����������� �����
;BOOL HeapFree(HANDLE hHeap, DWORD dwFlags, LPVOID lpMem);
	push	descr.p_start
	push	0
	push	descr.Hand_Head
	call	HeapFree
endm
push_stk	macro	descr:REQ,adr_item:REQ
;���������� �������� � ����
;descr - ��� ���������-����������� �����
;adr_item - ����� ������������ �������� � ������, ������ ��� ������ ��������������� size_item
;��������� ��������
	push	ecx
	mov	ecx,descr.size_item
	mov	esi,adr_item
	mov	edi,descr.p_top
rep	movsb
	mov	descr.p_top,edi
;��������������� ��������
	pop	ecx
endm
TestEmptyStk	macro	descr:REQ,label_err:REQ
;�������� �� ������� �����
;label_err - �����, �� ������� ���������� ������� � ������, ���� ���� ����
	mov	eax, descr.p_top
	cmp	eax, descr.p_start
	je	label_err
endm
pop_stk	macro	descr:REQ,adr_item:REQ
local	exit_pop,m1
;���������� �������� �� ����� � ������� ������
;descr - ��� ���������-����������� �����
;adr_item - ����� �������� � ������, � ������� ����������� ������� �����
;��������� ��������
;����� ������ ����� ���������� ��������� cf: ���� cf=1 => ������, ���� ����
	push	ecx
	push	esi
	mov	ecx,descr.size_item
	mov	esi,descr.p_top
	cmp	esi,descr.p_start
	jne	m1
	stc	;cf=1 => ���� ����
	jmp	exit_pop
m1:
	sub	esi,descr.size_item
	mov	descr.p_top,esi
	mov	edi,adr_item
rep	movsb
exit_pop:	;��������������� ��������
	pop	esi
	pop	ecx
endm
TestTopStk	macro	descr:REQ,adr_item:REQ
;���������� �������� �� ������� ����� ��� ��� �������� ������
;descr - ��� ���������-����������� �����
;adr_item - ����� �������� � ������, � ������� ���������� �������� �������� �� ������� �����
;��������� ��������
	push	ecx
	mov	ecx,descr.size_item
	mov	edi,descr.p_top
	sub	edi,descr.size_item
	mov	descr.p_top,edi
	mov	esi,adr_item
rep	movsb
;��������������� ��������
	pop	ecx
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
;�������� �����
	create_stk	char_stk
;����������� ������
	mov	ecx,l_string
	lea	ebx,string
	jmp	cycl
e_xit:	jmp	exit
cycl:	jcxz	e_xit
	cmp	byte ptr [ebx],"("
	je	m_push
	cmp	byte ptr [ebx],"["
	je	m_push
	cmp	byte ptr [ebx],"{"
	je	m_push
	cmp	byte ptr [ebx],"<"
	je	m_push
	cmp	byte ptr [ebx],")"
	jne	m1
;��������� ������� �� ������� ����� � ����������� ���
	TestEmptyStk	char_stk,mes_error
	pop_stk	char_stk,<offset temp>
	cmp	temp,"("
	jne	mes_error
	jmp	r_next
m1:	cmp	byte ptr [ebx],"]"
	jne	m2
;��������� ������� �� ������� ����� � ����������� ���
	TestEmptyStk	char_stk,mes_error
	pop_stk	char_stk,<offset temp>
	cmp	temp,"["
	jne	mes_error
	jmp	r_next
m2:	cmp	byte ptr [ebx],"}"
	jne	m3
;��������� ������� �� ������� ����� � ����������� ���
	TestEmptyStk	char_stk,mes_error
	pop_stk	char_stk,<offset temp>
	cmp	temp,"{"
	jne	mes_error
	jmp	r_next
m3:	cmp	byte ptr [ebx],">"
	jne	r_next
;��������� ������� �� ������� ����� � ����������� ���
	TestEmptyStk	char_stk,mes_error
	pop_stk	char_stk,<offset temp>
	cmp	temp,"<"
	jne	mes_error
	jmp	r_next
m_push:
;��������� ������ � ����
	push_stk	char_stk,ebx
r_next:
	add	ebx,char_stk.size_item
	dec	ecx
	jmp	cycl
mes_error:	;����� �� ����� ��������� �� ������
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
	jmp	exit_exit
exit:
;���������� ���� �� ������� 
	pop_stk	char_stk,<offset temp>
	jnc	mes_error	;���� �� ����
;����� �� �����
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
	lea	ebx,mes_ok
	mov	eax,len_mes_ok
	push	0	;��������������
	push	offset NumWri	;�������������� ���������� ���������� ��������
	push	eax	;����� ������
	push	ebx	;��������� �� ������
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;���� �������
;����� �� ����������
exit_exit:
;������� ���� ������ �� ������
	delete_stk	char_stk
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
