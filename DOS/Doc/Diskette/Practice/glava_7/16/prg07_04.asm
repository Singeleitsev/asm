;----------------------------------------------------------
;prg07_04.asm - ��������� ������������ �������� ��� �������� ����� � ������������ ������������� � ������� �������� �������� 6Ch.
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
	mov	bx,2	;����� ������� ������� - ������ ��� ������-������
	mov	dx,1	;���� ���� ����������, �� ������� ���, � �������� ������ ������� ������ (��� ������������)
	lds	si,point_fname	;��������� ��������� �� ��� �����
	mov	ah,6ch	;����� ������� DOS
	int	21h	;��������� ����
	jnc	m1	; ���� ���� �����������, �� �������
	mov	dx,10h	;������� ����
	mov	ah,6ch	;����� ������� DOS
	int	21h	;��������� ����
	jc	exit	;�������, � ������ ������
m1:
;-------------------------------------------------------------------
;�������� ��� �������� �������� �����:
	mov	handle,ax	;�������� ���������� �����
;-------------------------------------------------------------------
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
