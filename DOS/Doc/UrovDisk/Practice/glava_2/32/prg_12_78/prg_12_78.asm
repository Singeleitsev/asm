;--------------------------------------------------------------------------------;
;prg_12_78.asm - ��������� ���������� ������������������� ������.
;����: ��������� ���� inFile.txt.
;�����: ����� �� ����� ���������� � ������������� ���� � ������.
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
node_tree	struc	;���� ������
s_word	db	10 dup (' ')	;�������������� �����
freq	db	0	;������� ������������� � ������
l_son	dd	0	;��������� �� �������� (������) ����
r_son	dd	0	;��������� �� �������� (�������) ����
ends
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
;��� ������������ �����
desc_stk	struc	;���������� �����
;��� ����� - ��� ���������� ���������
;����� ���������� � ������������� ���������� ������������������� ���� ��������� size_stk � size_item
p_start	dd	0	;����� ����� (������ ������� ������ ��� �����) �� ����� ���� ��������
size_stk	dd	0	;������ ����� � ������
p_top	dd	0	;����� ������� �����
size_item	dd	4	;������ �������� ����� � ������ (�� ��������� 4 �����)
HandHead	dd	0	;��������� ����� ���� ��������
ends
;�������� ����������� ������ �� ������:
create_stk	macro	HandHead:REQ,descr:REQ,SizeStk:=<256>
;�������� �����
;HandHead - ����� � ���������� ����
;descr - ��� ���������-����������� �����
;SizeStk - ������ ����� � ������ (�� ��������� 256 ����)
;��������� ��������
	push	eax
;���������� ����, ���������� �������� �� ���������
	mov	descr.size_stk,SizeStk
;����������� ���� ������ �� ����:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	SizeStk
	push	0	;����� �� ������
	push	HandHead	;��������� ����
	call	HeapAlloc
	mov	descr.p_start,eax	;����� ����� �� ����� ���� ��������
	mov	descr.p_top,eax	;��������� ��� �������
;��������������� ��������
	pop	eax
endm
push_stk	macro	descr:REQ,rg_item:REQ
;���������� �������� � ����
;descr - ��� ���������-����������� �����
;rg_item - �������, ���������� �������� ����������� � ����, ������ ��� ������ ��������������� size_item
;��������� ��������
	push	ecx
	push	edi
	mov	ecx,descr.size_item
	mov	edi,descr.p_top
	mov	[edi],rg_item
	add	descr.p_top,ecx
;��������������� ��������
	pop	edi
	pop	ecx
endm
pop_stk	macro	descr:REQ, rg_item:REQ
local	exit_pop,m1
;���������� �������� �� �����
;descr - ��� ���������-����������� �����
;rg_item - �������, � ������� ����������� ��������� ������� �����, ������ ��� ������ ��������������� size_item
;cf=1 - ��� ������� ������ �� ������� �����
;��������� ��������
	push	ecx
	push	esi
	mov	ecx,descr.size_item
	sub	descr.p_top,ecx
	mov	ecx,descr.p_top
	cmp	ecx,descr.p_start
	jae	m1
	stc
	jmp	exit_pop
m1:	mov	esi,descr.p_top
	mov	rg_item,[esi]
exit_pop:
	pop	esi
	pop	ecx
endm
.data
Hand_Head	dd	0	;��������� ����
HeadTree	dd	0	;��������� �� ������ ������
NewNode	dd	0	;��������� ����������
lpBuf	db	'inFile.txt'	;��� �����
lpBufSize=$-lpBuf
hFile	dd	0	;���������� �����
FileSize	dd	0	;������ �����
buf_start	dd	0	;����� ����� ��� ������ ��������� �� ����� ���� ��������
dOut	dd	0	;���������� ������ �������
dIn	dd	0	;���������� ����� �������
tek_pos	dd	0	;����� ���. ���. � ������ � ������� �����
NumWri	dd	0	;���������� �������� ��������� ������, ���������� �� �����
;���������� ��� �����:
;���������� �����:
doubleWord_stk	desc_stk	<>
count_call	dd	0	;������� ���������� ������������ ������ ���������
con	Coord	<>
;��������� �������� ��������� ��� ������ �� �����
xxx	dw	1	;
yyy	dw	1	;
.code
LRBeat	proc
	inc	count_call	;������� ���������� ������� ��������� (��� ������������ ���������� ������� � ���������� �� �����)
;����������� ��������� ������ ������ - ����� ������� (����� ���������, ������, ������ ���������)
	cmp	ebx,0
	je	@@exit_p
	mov	ebx,[ebx].l_son
	cmp	ebx,0
	je	@@m1
	push_stk	doubleWord_stk,ebx
@@m1:	call	LRBeat
	pop_stk	doubleWord_stk,ebx
	jnc	@@m2
;��������� �� ����� ���� � �� �����
	mov	ecx,count_call
	dec	ecx
	pop	NewNode	;pop "� ������"
	loop	$-6
	jmp	@@exit_p
@@m2:
;����� �� �����
;��������� ������ � ������� (2,5)
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
	mov	eax,11
	add	[ebx].freq,30h
	inc	[ebx].freq	;������������ ������� � 1 (��� ��� ������ � ���. �����. � 0)
	push	0	;��������������
	push	offset NumWri	;�������������� ���������� ���������� ��������
	push	eax	;����� ������
	push	ebx	;��������� �� ������
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;���� �������
	mov	ebx,[ebx].r_son
cmp	ebx,0
je	@@m1
push_stk	doubleWord_stk,ebx
	call	LRBeat
@@exit_p:
	dec	count_call
	ret
LRBeat	endp
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
;��������� ������ ������ � ��������� �� ������ HeadTree
;��� ���������� ������ ���������� ����, ���������� �������� �� ��������� (1 �����), �� ��� ������������� ����� ������� � ���. ���� � ������� HeapCreate
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	Hand_Head,eax	;��������� ����������
;����������� � �������������� ���� ������ �� ���� ��� ����� ������:
	xor	ebx,ebx	;����� ����� ��������� �� ���������� ����
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	type node_tree	;������ ��������� ��� ���� ������
	push	0	;����� �� ������
	push	eax	;��������� ���� (�� �� � Hand_Head)
	call	HeapAlloc
	mov	HeadTree,eax	;���������� ��������� �� ������ ������
	mov	ebx,eax	;� � ebx
;��������� ���������� ������� ������ � ����
	push	ds
	pop	es
	mov	edi,eax
	mov	ecx,type node_tree
	mov	al,0
rep	stosb
;������ ���� � ����������� ���������� ������� ������
;��������� ����
;HANDLE CreateFile(LPCTSTR lpFileName,DWORD dwDesiredAccess,DWORD
;dwShareMode,LPSECURITY_ATTRIBUTES lpSecurityAttributes,DWORD dwCreationDisposition,DWORD 
;dwFlagsAndAttributes,HANDLE hTemplateFile);
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
;��� ����� � ������, � ������� ����� ������ ����, ���������� ����, ���������� �������� �� ��������� (���������� �� ��� �������� �����)
;����������� ���� ������ �� ����:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	FileSize
	push	0	;����� �� ������
	push	Hand_Head	;��������� ����
	call	HeapAlloc
	mov	buf_start,eax	;����� ����� � ������� ��������� �� ����� ���� ��������
;������ ����
;BOOL ReadFile(HANDLE hFile,LPVOID lpBuffer,DWORD nNumberOfBytesToRead,
;LPDWORD lpNumberOfBytesRead,LPOVERLAPPED lpOverlapped);
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
	mov	ecx,FileSize
;������ ����� �� ������ � ������� ����� � ������ ������
	mov	esi,buf_start
	lea	edi,[ebx].s_word
m12:
	lodsb
	cmp	al," "
	je	@@cycl01
	stosb
	dec	ecx
	jecxz	@@cycl1
	jmp	m12	;����� ���������� ������ - ���� ����� ?
;����� � ����� �������� � ������� � ���������� �����
;������ ��������� ����� �� ������ � ������� �����
@@cycl01:
	dec	ecx	;���������� ecx ��� ����� ������� �������
	mov	tek_pos,esi	;�������� ����� ���. ������� � ������ � ������� �����
@@cycl1:
push	ecx	;��������� ecx, ��� ��� HeapAlloc ������ ecx
;����������� ���� ������ �� ���� ��� ���� ������:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	type node_tree	;������ ��������� ��� ���� ������
	push	0	;����� �� ������
	push	Hand_Head	;��������� ����
	call	HeapAlloc
pop	ecx	;��������������� ecx
	mov	NewNode,eax	; ���������� ��������� �� ���� ������ �� ����. �����.
;��������� ���������� ������� ������ � ����
	mov	edi,eax
push	ecx
	mov	ecx,type node_tree
	mov	al,0
rep	stosb
pop	ecx
;������ ��������� ����� �� ������ � ������� ����� � ���������� ��� � ����� ����
;� esi ���������� ������������� ������� ������� � ������ buf_start
	mov	esi,tek_pos	;����������� ����� ���. ������� � ������ � ������� �����
	mov	edi,NewNode
	add	edi,s_word	;��������� �� ���� s_word ������ ���� ������
m13:
	lodsb
	cmp	al," "
	je	m134
	stosb
	dec	ecx
	jecxz	m1344
	jmp	m13
;���� ����� � ������ �������� �������� �������������� � ����������� ��������� � ����� ������
m134:
	dec	ecx	;���������� ecx ��� ����� ������� �������
	mov	tek_pos,esi	;�������� ����� ���. ������� � ������ � ������� �����
m1344:
	mov	ebx,HeadTree	;��������� �� ������ ������
push	ecx
m_search:
	mov	esi,ebx	;���������
	add	esi,s_word	;��������� �� ���� s_word
	mov	edi,NewNode
	add	edi,s_word	;��������� �� ���� s_word ������ ���� ������
	mov	ecx,10	;������������ ���������� �������� � �����
repe	cmpsb
	jcxz	m14	;������� ���������
;������� �� ������� => �������� �� ����������� � ����������� ��������� � ����� ������
	dec	esi
	dec	edi
	mov	al,[edi]
	cmp	al,[esi]
	ja	m15	;����� ����� ����������������� ������ � ��������� ����
;����� ����� ����������������� ������, ��� ����� � ��������� ����
;���� ������, �� ���� �� ����� �����
	mov	eax,[ebx].l_son
	cmp	eax,0
	je	m145
	mov	ebx,eax
	jmp	m_search	;���������� ����� ����� � ������
m145:
;���� ����� ���� ���, �� ��������� ��� � ����
push	NewNode
pop	[ebx].l_son	;mov	[ebx].l_son,NewNode
	jmp	end_cycl1
m15:	;����� ����� ����������������� ������, ��� ����� � ��������� ���� - ���� �� ������ �����
	mov	eax,[ebx].r_son
	cmp	eax,0
	je	m156
	mov	ebx,eax
	jmp	m_search	;���������� ����� ����� � ������
m156:
;���� ����� ���� ���, �� ��������� ��� � ����
push	NewNode
pop	[ebx].r_son	;mov	[ebx].r_son,NewNode
	jmp	end_cycl1
m14:	;����� ���������
	inc	[ebx].freq
end_cycl1:
pop	ecx
	jecxz	displ_lex_order
	jmp	@@cycl1
;������������������ ������ ������ ���������
displ_lex_order:
;����� ������ ����� ������� � ����� �� �����:
;������� ���� ��������� ������ ����� ������� � ��������� �������� �� �������������� �����
;��� ����������� ���� ���� (������ (256 ����) ��� �������, �� ���������������� �� �����������������)
	create_stk	Hand_Head,doubleWord_stk
	mov	ebx,HeadTree
push_stk	doubleWord_stk,ebx	;��������� �� ������ � ��� ����
	call	LRBeat
exit:
;����� �� ���������
;�������� ���� �� ������� ����� �������
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
