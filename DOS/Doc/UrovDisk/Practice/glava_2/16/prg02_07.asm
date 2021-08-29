;----------------------------------------------------------
;prg02_07.asm - ��������� �� ���������� ��� �������� ���������� ����, ������������ � ������������ �������� �����
;����: ���� � ���������� 20 ���� (������ �� ����� 10 ��������).
;�����: ����� ���������� �������� �� �����.
;----------------------------------------------------------
masm
model small
buf_0ah	struc
len_buf	db	11	;����� buf_in
len_in	db	0	;�������������� ����� ���������� ����� (��� ����� 0dh)
buf_in	db	11 dup (20h)	;����� ��� ����� (� ������ 0dh)
ends
.data
tab	db	26 dup (0)
buf	buf_0ah	<>
	db	0dh,0ah,'$'	;��� ������ �������� 09h (int 21h)
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
;������ ����� � ����������
	mov	cx,20
	lea	dx,buf
	mov	ah,0ah
m1:	int	21h
;����������� ������ ����� ���������� �����
;��������� ���-�������: A=C*1-97
	mov	bl,buf.buf_in
	sub	bl,97
	inc	[bx]
	loop	m1
;������� ��������� �������� �� �����
;������ ����� buf
push	ds
pop	es
	xor	al,al
	lea	di,buf
	mov	cx,type buf_0ah
rep	stosb
	mov	cx,26
;������ � buf.buf_in
	lea	dx,buf
	mov	bl,97
m2:
push	bx
	mov	buf.buf_in,bl
;����� ��������� ���-�������: A=C*1-97 � ����������� "����������" � ���������� ���
	sub	bl,97
	mov	al,[bx]
	aam
	or	ax,03030h	;� ax ����� � ���������� ����
	mov	buf.len_in,al
	mov	buf.len_buf,ah
;������ �������:
	mov	ah,09h
	int	21h
pop	bx
	inc	bl
	loop	m2
exit:
	mov	ax,4c00h
	int	21h
end	main
