;--------------------------------------------------------------------------------;
;prg02_14.asm - ��������� ������ ��������� ������ ������ (����� �������) c ������������ ������ (��������� addNodeTree).
;����: �������� ������ � ������.
;�����: ���������� �������� �� �������������� ����� ��������� �� ���� �� ������ (��� ����������� �� ������).
;������ ����� �� �������
;--------------------------------------------------------------------------------;
;
� � �
.data
� � �
NewItem	db	17	;����� �������
� � �
.code
� � �
start	proc	near
;����� ����� � ��������� prg02_13.asm:
;��������� �������� ������ ������
	call	BuildBinTree
;��������� � �������� addNodeTree ��� ���������� � ������ ������ ���� �� ��������� NewItem
;count_call=0
;edi=0
;eax= ����� ��������� �� ������ ������ (lea	eax,HeadTree)
;ebx= ����������� ��������� �� ������ ������ (mov	ebx,HeadTree)
	mov	count_call,0
	xor	edi,edi
	lea	eax,HeadTree
	mov	ebx,HeadTree
	call	addNodeTree
;������� ���� ��������� ������ ����� ������� � ��������� �������� �� �������������� �����
;��� ����������� ���� ���� (������ (256 ����) ��� �������, �� ���������������� �� �����������������)
	create_stk	Hand_Head,doubleWord_stk
	push	ds
	pop	es
	lea	edi,ordered_array
	mov	ebx,HeadTree
	push_stk	doubleWord_stk,ebx	;��������� �� ������ � ��� ����
	call	LRBeat
exit:
;������� ����� VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
