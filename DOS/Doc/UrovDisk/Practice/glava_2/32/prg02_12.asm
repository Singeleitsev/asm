;--------------------------------------------------------------------------------;
;prg02_12.asm - ��������� ���������� � ������������� ��������� ������.
;����: ������������ ������ ����� � ������.
;�����: �������� ������ � ������.
;--------------------------------------------------------------------------------;
.486
.model flat,STDCALL	;������ ������ flat,
;STDCALL - �������� ���������� � ����� � (������ ������), 
;	���������� ��������� ������ �� ����� ����
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
.data
mas	db	37h,12h,8h,65h,4h,54h,11h,02h,32h,5h,4h,87h,7h,21h,65h,45h,22h,11h,77h,51h,26h,73h,35h,12h,49h,37h,52h
l_mas=$-mas
Hand_Head	dd	0	;��������� ����
HeadTree	dd	0	;��������� ������ ������
NewNode	dd	0	;��������� ����������
.code
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
	push	ecx	;HeapAlloc ������ ecx, ��������� � ��� ��������� ��������
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

start	proc	near
;����� ����� � ���������:
	call	BuildBinTree
exit:
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
