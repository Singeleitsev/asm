;----------------------------------------------------------
;prg02_09.asm - ��������� �� ���������� ��� ������������ ������ ��������� ������������� �� ������� ������ ����� ���������� �� ��������������� ���������
;����: ���� � ���������� ���� (������ �� ����� 10 ��������).
;�����: ����� ����, ��������� ��������, �� �����.
;----------------------------------------------------------
masm
model small
elem_tab	struc
state	db	0	;���� ���������
len_id	db	0	;����� �������������
buf_id	db	8 dup (20h)	;����� ��� �������� ��������������
ends
buf_0ah	struc
len_buf	db	9	;����� buf_in
len_in	db	0	;�������������� ����� ���������� ����� (��� ����� 0dh)
buf_in	db	9 dup (20h)	;����� ��� ����� (� ������ 0dh)
ends
.data
tab	elem_tab	64 dup (<>)
len_tab	db	64
len_elem	dw	10
buf	buf_0ah	<>
	db	0dh,0ah,'$'	;��� ������ �������� 09h (int 21h)
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
;������ ����� � ����������
m1:
	lea	dx,buf
	mov	ah,0ah
	int	21h
;����������� ������ ����� ���������� �����
;���� ������, �� �� �����
	cmp	buf.buf_in,20h
	je	exit
;--------������� �������� ���������� ���-�������-------------------
	xor	bx,bx
	mov	cl,buf.len_in
	xor	si,si
	xor	ax,ax
m2:
	mov	bl,buf.buf_in[si]
	add	ax,bx
	inc	si
	loop	m2
;�������� �
	mov	bx,61803
	mul	bx
;��� M=64 p=6;
;�������� ������������ � edx �� dx:ax
	mov	cx,16
m3:
	clc
	rcl	ax,1
	rcl	edx,1
	loop	m3
	bsr	ecx,edx	;� ecx ����� ������ ��������� ������� � edx (������������ �������)
	inc	cl
	ror	edx,cl
;�������� � ������ ���� edx
	mov	cx,6	;�������� � ax ����� p=6 ���
m4:
	clc
	rcl	edx,1
	rcl	ax,1
	loop	m4
;-----------------------------------------------------------------
;���������� ����� � �������, �� �������� ����� �������� �������������
	mov	bx,ax	;�������� ��� �� ������ ��������
m5:
	mul	len_elem	;�������� �� 10 (����� �������� �������)
	lea	di,tab
	add	di,ax
;����������� ��������� ��������
	test	[di].state,01h
	jnz	displ	;������� �� ����������� ��������������, ���� ��������� ��������
;��������� ������� �������
	or	[di].state,01h	;���������� ��� 0 - ��� ���������
;��������� �������������� � ��� ����� � ������� �������
push	ds
pop	es
	lea	si,buf.len_in
	mov	cl,buf.len_in
	inc	cx	;����� ���� ����� ���������
	add	di,len_id
rep	movsb
	jmp	m1
displ:
;������� �������������, ��������� ��������, �� �����
	lea	dx,buf
	mov	ah,09h
	int	21h
;------------�������������----------------------------------------------
;���� ����� ��� ��������������, ���������� �������� � �������, ����� ��������� �������������
	inc	bx
	mov	ax,bx
	jmp	m5
;----------------------------------------------------------------------
exit:
	mov	ax,4c00h
	int	21h
end	main
