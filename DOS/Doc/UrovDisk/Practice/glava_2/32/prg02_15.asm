;--------------------------------------------------------------------------------;
;prg02_15.asm - ��������� ������ ��������� ������ ������ (����� �������) c ������������ �������� ���� (��������� delNodeTree)
;������ ����� �� �������
;--------------------------------------------------------------------------------;
.486
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
locals
;���������� �������� ������������ � ������ ��������� ������� Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	ExitProcess:PROC
extrn	GetProcessHeap:PROC
extrn	HeapAlloc:PROC
extrn	HeapFree:PROC
;���������� ��������:
node_tree	struc	;���� ������
simbol	db	0	;�������������� �����
l_son	dd	0	;��������� �� �������� (������) ����
r_son	dd	0	;��������� �� �������� (�������) ����
ends

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
;HANDLE GetProcessHeap (VOID);
;	call	GetProcessHeap
;	mov	descr.HandHead,eax
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
;	push	esi
	push	edi

	mov	ecx,descr.size_item
;	mov	esi,adr_item
	mov	edi,descr.p_top
	mov	[edi],rg_item
	add	descr.p_top,ecx
;��������������� ��������
	pop	edi
;	pop	esi
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
;	push	edi
	mov	ecx,descr.size_item
	sub	descr.p_top,ecx
	mov	ecx,descr.p_top
	cmp	ecx,descr.p_start
	jae	m1
	stc
	jmp	exit_pop
m1:	mov	esi,descr.p_top
	mov	rg_item,[esi]
;	mov	esi,adr_item
;rep	movsb
;��������������� ��������
;	pop	edi
exit_pop:
	pop	esi
	pop	ecx
endm

.data
mas	db	37h,12h,8h,65h,4h,54h,11h,02h,32h,5h,4h,87h,7h,21h,65h,45h,22h,11h,77h,51h,26h,73h,35h,12h,49h,37h,52h
l_mas=$-mas
;������������� ������ (��������� ��. � ���������):
ordered_array	db	l_mas dup (0)
Hand_Head	dd	0	;��������� ����
HeadTree	dd	0	;��������� �� ������ ������
NewNode	dd	0	;��������� ����������
;���������� ��� �����:
;���������� �����:
doubleWord_stk	desc_stk	<>
count_call	dd	0	;������� ���������� ������������ ������ ���������
delItem	db	17	;��������� �������

.code
delNodeTree	proc
	inc	count_call	;������� ���������� ������� ��������� (��� ������������ ���������� ������� � ���������� �� �����)
	cmp	ebx,0	;������ ������ ��� �������� �� ��������� delItem � ������ ���
	je	@@exit_pp	;�����, ���� ��� ���
	cmp	al,[ebx].simbol	;al<[ebx].simbol
	jae	@@m1	;�������, ���� ���
lea	edi,[ebx].l_son
	mov	ebx,[ebx].l_son
	call	delNodeTree
	jmp	@@exit_p	;�����
@@m1:
	cmp	al,[ebx].simbol	;al>[ebx].simbol
	jbe	@@m2	;�������, ���� ���
lea	edi,[ebx].r_son	;
	mov	ebx,[ebx].r_son
	call	delNodeTree
	jmp	@@exit_p	;�����
@@m2:
;������� ������, �.�. al=[ebx].simbol
;�������� �������� � ����� �������� (������� ��� �������)
	cmp	[ebx].r_son,0
	jne	@@m3
	mov	eax,ebx
	mov	ebx,[ebx].l_son
	mov	[edi],ebx
	jmp	@@m_del
@@m3:
	cmp	[ebx].l_son,0
	jne	@@m4
	mov	eax,ebx
	mov	ebx,[ebx].r_son
	mov	[edi],ebx
	jmp	@@m_del
@@m4:
;�������� �������� � ����� ��������� - ��� ����� ���������� ��������� ��������� del (�����������)
	mov	eax,[ebx].l_son
;����� ���� � ������� �������� (������) ���� ��� ������, ���� �� �� ����� ������� �������
	lea	edi,[ebx].l_son
	call	del	;������������ ��������� - ��������� � eax � ebx, ����� � edi
@@m_del:
;�������� �������� (������������ ������)
;BOOL HeapFree(HANDLE hHeap,  // handle to heap 
;DWORD dwFlags, // heap free options 
;LPVOID lpMem   // pointer to memory);
	push	eax	;����� �������������� �����
	push	0
	push	Hand_Head	;��������� ����
	call	HeapFree
@@exit_pp:	;�� ��� ����� �������, ���� ������ ������ ��� �������� �� ��������� delItem � ������ ���
;��������� �� ����� ���� � �� �����
	mov	ecx,count_call
	dec	ecx
	jecxz	$+10	;�� ������� "jmp	@@exit_p	;� �� �����"
	pop	NewNode	;pop "� ������"
	loop	$-6
	jmp	@@exit_p	;� �� �����
@@exit_p:
	dec	count_call
	ret
delNodeTree	endp
del	proc
;��������������� ����������� ��������� ���������� ���� �� ������ [4]
;�� ����� - �������� eax � ebx
;� eax ����� ���������� ������ ���� ��� ���������� �������� - �� ������ ���������� ����� ��� ����� ������ �����
;edi - ����� ���� � ������� �������� (������) ���� ��� ������ ���� �� �� ����� ������� �������
	inc	count_call	;������� ���������� ������� ���������
	cmp	[eax].r_son,0
	je	@@m1
	lea	edi,[eax].r_son	;����� �� ������� ����� � ����
	mov	eax,[eax].r_son
	call	del
	jmp	@@exit_p
@@m1:
;������������ �������������� ����� �� ������ ������� �������� � �������������� ����� ���������� ��������
	push	eax
	mov	al,[eax].simbol
	mov	[ebx].simbol,al
	pop	eax
	push	eax
;����������� ������ �� ���� � ��� ����
	mov	eax,[eax].l_son
	mov	[edi],eax
	pop	eax
@@exit_p:	
	dec	count_call
	ret
del	endp
BuildBinTree	proc
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
;������ ����� �� mas � ������ ������
	lea	esi,mas
	lodsb	;����� � al
	mov	[ebx].simbol,al
;����� � ����� �������� � ������� � �������� mas
	mov	ecx,l_mas-1
@@cycl1:
	push	ecx	;HeapAlloc ������ ecx
;����������� ���� ������ �� ���� ��� ���� ������:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	type node_tree	;������ ��������� ��� ���� ������
	push	0	;����� �� ������
	push	Hand_Head	;��������� ����
	call	HeapAlloc
	pop	ecx
	mov	ebx,eax	;���������� ��������� �� ���� ������ � ebx
	mov	NewNode,eax	;� �� ����. �����.
;��������� ���������� ������� ������ � ����
	mov	edi,eax
	push	ecx
	mov	ecx,type node_tree
	mov	al,0
rep	stosb
	pop	ecx
;������ ��������� ����� �� mas � ���������� ��� � ����� ����
	lodsb	;����� � al
	mov	[ebx].simbol,al
;���� ����� � ������ �������� �������� �������������� � ����������� ��������� � ����� ������
	mov	ebx,HeadTree
m_search:
	cmp	al,[ebx].simbol
	mov	edi,ebx	;������������
	jae	m1	;���� al >= [ebx].simbol 
;���� ������, �� ���� �� ����� �����
	mov	ebx,[ebx].l_son
	cmp	ebx,0
	jne	m_search
;���� ����� ���� ���, �� ��������� ��� � ����
	mov	ebx,NewNode
	mov	[edi].l_son,ebx
	jmp	end_cycl1
;���� ������ ��� �����, �� �� ������
m1:
	mov	ebx,[ebx].r_son
	cmp	ebx,0
	jne	m_search
;���� ����� ���� ���, �� ��������� ��� � ����
	mov	ebx,NewNode
	mov	[edi].r_son,ebx
end_cycl1:
	loop	@@cycl1
;�������� ������ ������ ���������
	ret
BuildBinTree	endp
LRBeat	proc
;����������� ��������� ������ ������ - ����� ������� (����� ���������, ������, ������ ���������)
	inc	count_call	;������� ���������� ������� ��������� (��� ������������ ���������� ������� � ���������� �� �����)
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
@@m2:	mov	al,[ebx].simbol
	stosb
	mov	ebx,[ebx].r_son
cmp	ebx,0
je	@@m1
push_stk	doubleWord_stk,ebx
	call	LRBeat
@@exit_p:
	dec	count_call
	ret
LRBeat	endp
start	proc	near
;����� ����� � ��������� prg02_13.asm:
;��������� �������� ������ ������
	call	BuildBinTree
;��������� � �������� delNodeTree ��� �������� �� ������ ���� �� ��������� delItem
;ebx= ���������� ��������� �� ������ ������ (mov	ebx,HeadTree)
;al=delItem - ����������� ������� �������� � ���� � �������� al
;count_call=0
	mov	count_call,0
	mov	ebx,HeadTree
	mov	al,delItem
	call	delNodeTree
;�������� ���������:
;������� ���� ��������� ������ ����� ������� � ��������� �������� �� �������������� �����
	create_stk	Hand_Head,doubleWord_stk
	push	ds
	pop	es
	lea	edi,ordered_array
	mov	ebx,HeadTree
	push_stk	doubleWord_stk,ebx	;��������� �� ������ � ��� ����
	mov	count_call,0
	call	LRBeat
exit:
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
