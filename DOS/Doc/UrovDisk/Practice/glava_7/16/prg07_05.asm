;----------------------------------------------------------
;prg07_05.asm - ��������� ������������ �������� ����� �������� 3Eh.
;----------------------------------------------------------
masm
model small
.data
handle	dw	0	;���������� �����
filename	db	'my_file.txt',0
point_fname	dd	filename
.stack	256
.486
.code
main:
	mov	ax,@data	;����� �������� ������ - � ������� ax
	mov	ds,ax	;ax � ds
	xor	cx,cx	;�������� ����� - ������� ����
	lds	dx,point_fname	;��������� ��������� �� ��� �����
	mov	ah,5bh	;����� ������� DOS
	int	21h	;��������� ����
	jnc	m1	;������� �������� �����
	mov	al,02h	;����� �������
	mov	ah,3dh	;����� ������� DOS
	int	21h	;��������� ����
	jc	exit	;�������, � ������ ������
m1:
;-------------------------------------------------------------------
;�������� ��� �������� �������� �����:
	mov	handle,ax	;�������� ���������� �����
m2:
;��������� ����:
	mov	ah,3eh
	mov	bx,handle
	int	21h
	jnc	exit	;�������, ���� ��� ������
;��������� ������
;� � �
	jmp	m2	;��������� �������� ��������
;-------------------------------------------------------------------
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
