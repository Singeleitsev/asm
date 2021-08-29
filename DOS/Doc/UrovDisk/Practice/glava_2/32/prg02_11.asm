;--------------------------------------------------------------------------------;
;prg02_11.asm - ��������� ���������� � ������������� ��������� ��������.
;����: ���������� ������ �������������� ������������ ����� � ������� �������.
;�����: ����� �� ��������� � ���������� �������������.
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
;���������� �������� � ����������������:
item_list_state	struc	;������� ������ ���������
prev_state	dd	0	;����� ����������� �������� ���������
id_state_state	db	0	;������������� ��������� - �������� �������� (0..n)
current_state	dd	0	;����� �������� �������� ���������
point_cross	dd	0	;��������� �� ������ ������ ��������� ��� ����� ���������
ends
create_list_state	macro	Hand_Head:REQ,descr:REQ,head:REQ, N_state:REQ
;�������� ������ ���������
;����:
;Hand_Head - ���������� ���� �������� �� ���������
;descr - ��� ���������-�������� ������ ���������
;N_state - ���������� ���������
;�����:
;head - ��� ���������� ��� �������� ��������� �� ����� ������ ���������
;��������� ��������
	push	eax
	push	ebx
;���������� ����, ���������� �������� �� ��������� (1 �����), �� ��� ������������� ����� ������� � ���. ���� � ������� HeapCreate
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	Hand_Head,eax	;��������� ����������
;����������� � �������������� ����� ������ �� ����:
	xor	ebx,ebx	;����� ����� ��������� �� ��������. ��������
	xor	ecx,ecx	;dl ? ����� �������� ��������� (��������)
rept	N_state
	push	ecx
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	type descr	;������ ���������
	push	0	;����� �� ������
	push	Hand_Head	;��������� ����
	call	HeapAlloc
	mov	[eax].prev_state,ebx	;���������� ����� ��������. (if ebx=0, �� ��� ������)
	mov	ebx,eax	;���������� ����� �������� � ebx
	mov	[eax].current_state,eax	;� � descr.current_state
	pop	ecx
	mov	[eax].id_state_state,cl
	inc	cl
endm
;��������� �� ��������� ������� ������ ��������� � ����-��������� �� ������ ������ head
	mov	head,ebx
;��������������� ��������
	pop	ebx
	pop	eax
endm
item_list_cross	struc	;������� ������ ���������
simbol	db	0	;������� ������, ��� ������� ������� ��������� � ��������� ���� (���� id_state_cross � next_item)
id_state_cross	db	0	;������������� ��������� � ������ ���������, � ������� ������������ �������
point_state	dd	0	;����� �������� ���������, � ������� ������������ �������
next_item	dd	0	;����� ���������� �������� � ������ ��������� ��� ����� ���������
ends
create_item_cross	macro	sim:REQ,state:REQ,descr:REQ,head:REQ, Hand_Head:REQ
local	m1,@@cycl,exit_m
;�������� �������� ������ ��������� ��� ������������� ���������
;����:
;������� ebx - ����� ����������� (��� ���� descr.next_item).��� ������� ������ ���� ����� ����
;sim - ������ ASCII, ��� ����������� �������� ������������ ������� � ��������� state
;descr - ��� ���������-�������� ������ ���������
;state - ����� ���������, � ������� ������������ ������� (���� ����������, �� � ������� <>)
;head - ��� ���������� ��� �������� ��������� �� ����� ������ ���������
;Hand_Head - ���������� ���� �������� �� ���������
;�����:
;������� ebx - ����� ���������� �������� ������ ���������
;���� cf=1 - ������: ��� ������ ���������
;��������� ��������
	push	eax
;����������� � �������������� ���� ������ �� ����:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	type descr	;������ ���������
	push	0	;����� �� ������
	push	Hand_Head	;��������� ����
	call	HeapAlloc
	mov	[eax].next_item,ebx	;����� �����������
	mov	ebx,eax	;���������� ����� ��������
	mov	[eax].simbol,"&sim"	;�������������� ���� simbol �������� ��������
	mov	[eax].id_state_cross,state	;����� ��������� � ���� descr.id_state_cross
;������ ����� ���������� ����� �������� � ������ ��������� state ��� ���������� ���������� ��������� � ������������� ���� point_state
	push	ebx
	mov	ebx,head
	clc
@@cycl:
	cmp	[ebx].id_state_state,state
	je	m1
	jc	exit_m
	mov	ebx,[ebx].prev_state	;����� ����������� ��������� � ������ ���������
	cmp	ebx,0	;��������� �������?
	jne	@@cycl
	stc
	jmp	@@cycl
m1:	;�����!
	mov	[eax].point_state,ebx
exit_m:
;��������������� ��������
	pop	ebx
	pop	eax
endm

def_point_item_state	macro	N_state:REQ,head:REQ
local	@@cy,@@m1
;��������� ��������
;����:
;N_state - ����� ���������
;head - ��� ������, ��� �������� ��������� �� ������ ���������
;�����: ������� ebx - ����� �������� � ������ ���������
	mov	eax,head
@@cy:
	cmp	[eax].id_state_state,N_state	;���� �
	je	@@m1	;�����?
	mov	eax,[eax].prev_state	;����� ���������� ���������
	cmp	eax,0	;��������� �������?
	jne	@@cy
	stc	;cf=1 ���� ��������� � ����� ������� �� ����������
	jmp	@@cy
@@m1:	;�����!
endm
.data
string	db	"+3.0e-5"	;������ � ������������ ������ ��� ������������
l_string=$-string
HeadListState	dd	0	;��������� �� ����� ������ ���������
CurState	db	0	;����� �������� ���������
Heap_proc	dd	0	;���������� ���� �������� �� ��������� (Hand_Head)
dOut	dd	0	;���������� ������ �������
NumWri	dd	0	;���������� �������� ��������� ������, ���������� �� �����
mes_e	db	"������� ������������� ����� ������������"
len_mes_e=$-mes_e
mes_ok	db	"O'key"
len_mes_ok=$-mes_e
con	Coord	<>
.code
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
;������� ����������� ������ ���������
create_list_state	Heap_proc,item_list_state, HeadListState,10
;������� ������ ��������� ��� ��������� 0
	xor	ebx,ebx	;��� ������� ������ create_item_cross ��� ��������� 0
irpc	simb,<+->
create_item_cross	simb,1,item_list_cross,HeadListState,Heap_proc
endm
irpc	simb,<0123456789>
create_item_cross	simb,2,item_list_cross,HeadListState,Heap_proc
endm
;� ebx ����� ���������� �������� � ������ ��������� ��������� 0
;������ ����� ���������� ����� �������� ��������� 0 ��� �������� ����������� ������ ���������
def_point_item_state	0,HeadListState
;����������� ������ ��������� ��������� 0 � �������� ��������� 0 � ������ ���������
	mov	[eax].point_cross,ebx
;�� �� ��� ��������� ���������
;������� ������ ��������� ��� ��������� 1
	xor	ebx,ebx	;��� ������� ������ create_item_cross ��� ��������� 1
irpc	simb,<0123456789>
create_item_cross	simb,2,item_list_cross,HeadListState,Heap_proc
endm
;� ebx ����� ���������� �������� � ������ ��������� ��������� 1
;������ ����� ���������� ����� �������� ��������� 1 ��� �������� ����������� ������ ���������
def_point_item_state	1,HeadListState
;����������� ������ ��������� ��������� 1 � �������� ��������� 1 � ������ ���������
	mov	[eax].point_cross,ebx
;������� ������ ��������� ��� ��������� 2
	xor	ebx,ebx	;��� ������� ������ create_item_cross ��� ��������� 2
irpc	simb,<0123456789>
create_item_cross	simb,2,item_list_cross,HeadListState,Heap_proc
endm
create_item_cross	<.>,3,item_list_cross,HeadListState,Heap_proc
;� ebx ����� ���������� �������� � ������ ��������� ��������� 2
;������ ����� ���������� ����� �������� ��������� 2 ��� �������� ����������� ������ ���������
def_point_item_state	2,HeadListState
;����������� ������ ��������� ��������� 2 � �������� ��������� 2 � ������ ���������
	mov	[eax].point_cross,ebx
;������� ������ ��������� ��� ��������� 3
	xor	ebx,ebx	;��� ������� ������ create_item_cross ��� ��������� 3
irpc	simb,<0123456789>
create_item_cross	simb,4,item_list_cross,HeadListState,Heap_proc
endm
;� ebx ����� ���������� �������� � ������ ��������� ��������� 3
;������ ����� ���������� ����� �������� ��������� 3 ��� �������� ����������� ������ ���������
def_point_item_state	3,HeadListState
;����������� ������ ��������� ��������� 3 � �������� ��������� 3 � ������ ���������
	mov	[eax].point_cross,ebx
;������� ������ ��������� ��� ��������� 4
	xor	ebx,ebx	;��� ������� ������ create_item_cross ��� ��������� 4
irpc	simb,<0123456789>
create_item_cross	simb,4,item_list_cross,HeadListState,Heap_proc
endm
create_item_cross	<e>,5,item_list_cross,HeadListState,Heap_proc
create_item_cross	< >,9,item_list_cross,HeadListState,Heap_proc
;� ebx ����� ���������� �������� � ������ ��������� ��������� 4
;������ ����� ���������� ����� �������� ��������� 4 ��� �������� ����������� ������ ���������
def_point_item_state	4,HeadListState
;����������� ������ ��������� ��������� 4 � �������� ��������� 4 � ������ ���������
	mov	[eax].point_cross,ebx
;������� ������ ��������� ��� ��������� 5
	xor	ebx,ebx	;��� ������� ������ create_item_cross ��� ��������� 5
irpc	simb,<+->
create_item_cross	simb,6,item_list_cross,HeadListState,Heap_proc
endm
irpc	simb,<0123456789>
create_item_cross	simb,7,item_list_cross,HeadListState,Heap_proc
endm
;� ebx ����� ���������� �������� � ������ ��������� ��������� 5
;������ ����� ���������� ����� �������� ��������� 5 ��� �������� ����������� ������ ���������
def_point_item_state	5,HeadListState
;����������� ������ ��������� ��������� 5 � �������� ��������� 5 � ������ ���������
	mov	[eax].point_cross,ebx
;������� ������ ��������� ��� ��������� 6
	xor	ebx,ebx	;��� ������� ������ create_item_cross ��� ��������� 6
irpc	simb,<0123456789>
create_item_cross	simb,7,item_list_cross,HeadListState,Heap_proc
endm
;� ebx ����� ���������� �������� � ������ ��������� ��������� 6
;������ ����� ���������� ����� �������� ��������� 6 ��� �������� ����������� ������ ���������
def_point_item_state	6,HeadListState
;����������� ������ ��������� ��������� 6 � �������� ��������� 6 � ������ ���������
	mov	[eax].point_cross,ebx
;������� ������ ��������� ��� ��������� 7
	xor	ebx,ebx	;��� ������� ������ create_item_cross ��� ��������� 7
irpc	simb,<0123456789>
create_item_cross	simb,7,item_list_cross,HeadListState,Heap_proc
endm
create_item_cross	< >,9,item_list_cross,HeadListState,Heap_proc
;� ebx ����� ���������� �������� � ������ ��������� ��������� 7
;������ ����� ���������� ����� �������� ��������� 7 ��� �������� ����������� ������ ���������
def_point_item_state	7,HeadListState
;����������� ������ ��������� ��������� 7 � �������� ��������� 7 � ������ ���������
	mov	[eax].point_cross,ebx
;�������� ������� ������, ��������� ������ �� ������� ������ string
	lea	esi,string
	mov	ecx,l_string
;����� �������� ��������� � ������� dl
	mov	dl,CurState
@@cycl2:
;���� ����� �������� �������� ���������
def_point_item_state	dl,HeadListState	;����� � eax
;������ ����������� ������
	mov	bl,[esi]	;��������� ������ � bl
;����� �� ������ ��������� �������� ���������
	mov	eax,[eax].point_cross	;� eax ����� ������� �������� � ������ ��������� ��� ����� ���������
;���������� ������ � �������� ������ ��������� � �������� ������ string
@@cycl1:
	cmp	[eax].simbol,bl
	je	next_cur_state
	cmp	[eax].next_item,0	;��� ��������� �������
	je	exit_error	;������� �� ������ - ������� �� ����������
;��������� � ���������� �������� � ������ ���������
	mov	eax,[eax].next_item
	jmp	@@cycl1
next_cur_state:
;������ ��������� ��������� �������
	mov	dl,[eax].id_state_cross
	inc	esi
	loop	@@cycl2
;�����������, � ����� ��������� �������� ��� ������ - ���� ��� ���� �� �������� ���������, �� ����� (4(S4) ��� 7(S7)) ��� ������� - ����� ������ ���������:
	cmp	dl,4
	je	exit_ok
	cmp	dl,7
	je	exit_ok
;����� �� ����������
exit_error:
;�������� �� ������ (������� �� ����������) - ����� ���������
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
	jmp	exit
exit_ok:
;�������� �� ��������� ������������� ������� - ����� ���������
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
exit:
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
