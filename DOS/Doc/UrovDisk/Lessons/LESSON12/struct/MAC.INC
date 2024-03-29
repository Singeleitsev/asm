;mac.inc
GetStr	macro	Buf,MaxLen
	local	m,TmpBuf
;���� ������ ������������ ����� (������� 0ah int 21h)
;�� �����:
;Buf - ����� ������ ���� ����� ������� ����
;MaxLen - ������������ ����� �������� ������
;�� ������ - ��������� ������ �� ������ Buf
;al - ����� ��������� ������
	jmp	m
TmpBuf	label	byte	;��������� ����� �������� ��� ������� 0ah (int 21h)
	rept	MaxLen+3	;���. ��� ����� - ��������� ����������
	db	' '
	endm
m:
	SaveReg	<ds,es,dx,cx>
	xor	cx,cx
	mov	cs:TmpBuf,MaxLen+1
	mov	ah,0ah
	push	ds
	pop	es
	push	cs
	pop	ds
	lea	dx,cs:TmpBuf
	int	21h
	mov	al,cs:TmpBuf+1
;��������� TmpBuf � Buf �� �������  �� ��� ����� ����� (��� �������� ��������� ��������):
	mov	cl,al	;����� ��������� ������ � al
	lea	si,cs:TmpBuf+2	;������ - ds:si
	lea	di,buf	;���� - es:di
rep	movsb
	LoadReg	<cx,dx,es,ds>
	endm

mov_string	macro	dest,src,len
;��������� �����
;�� ����� ��������������: ������-��������� - src, ������-��������� - dest
;���������� �������� ds (��� ���������) � es (��� ���������) ������ ���� ��������� 
;����������� ���������� �� ������ ������������
	mov	cx,len
	lea	si,src
	lea	di,dest
rep	movsb	
	endm

null_string	macro	dest,len
	local	m,Z_String
;������� ������ ������������ ����� ���������
;�� �����:
;dest - ����� ������
;len - ����� ��������� ������
	jmp	m
Z_String	label	byte	;������ ������
	rept	len
	db	' '
	endm
m:
	SaveReg	<ds,es,cx,si,di>
	mov	cx,len
	push	ds
	pop	es	;����� dest (��������) - es:di
	push	cs
	pop	ds	;����� Z_String (��������) - ds:si
	lea	si,cs:Z_String
	lea	di,dest
rep	movsb	
	LoadReg	<di,si,cx,es,ds>
	endm
OutStr	macro	str
;����� ������ �� �����.
;�� ����� - ������������� ������ ��������� ������.
;������ ������ ������������� �������� '$'.
;�� ������- ��������� �� ������.
	SaveReg	<ax,dx>
	mov	ah,09h
	lea	dx,str
	int	21h
	LoadReg	<dx,ax>
	endm

GetChar	macro
;���� ������� � ����������.
;�� ������ - � al �������� ������.
	mov	ah,01h
	int	21h
	endm

OutChar macro
;����� ������� �� �����.
;�� ����� - � dl ��������� ������.
	push	ax
	mov	ah,02h
	int	21h
	pop	ax
endm

SaveReg	macro	RegList
;���������� ��������� � ������ RegList ��������� � �����
;������ ��������� ������ ���� �������� � ������� ������, 
;�������� - <ax,bx,cx>
	irp	reg,<RegList>
	push	reg
	endm
	endm

LoadReg	macro	RegList
;�������������� ��������� � ������ RegList ��������� �� �����
;������ ��������� ������ ���� �������� � ������� ������, 
;�������� - <ax,bx,cx>
	irp	reg,<RegList>
	pop	reg
	endm
	endm

clear_r	macro	rg
;������� �������� rg
	xor	rg,rg
	endm

conv_16_2	macro
;������ �������������� ������� ����������������� �����
;� �� �������� ���������� � al
	sub	al,30h
	cmp	al,9h
	jle	$+4
	sub	al,7h
	endm

init_ds	macro
;������ ��������� ds �� ������� ������
	mov	ax,data
	mov	ds,ax
	xor	ax,ax
	endm

delay	macro	time
	local	ext,iter	
;������ ��������. �� ����� - �������� ���������� �������� (� ���).
	push	cx
	mov	cx,time
ext:	push	cx
	mov	cx,5000	;��� �������� ����� ��������, ������ �� ������������������ ����������.
iter:	loop	iter
	pop	cx
	loop	ext
	pop	cx
	endm

_Exit	macro
;����� �� ���������.
	mov	ax,4c00h
	int	21h
	endm

