;----------------------------------------------------------
;prg07_22.asm - ��������� ������������ ���������� ������� 716Ch ��� �������� ��� �������� ����� � ������� ������.
;----------------------------------------------------------
masm
model small
.data
handle	dw	0	;���������� �����
filename	db	'my_file with long name.txt',0
point_fname	dd	filename
.stack	256
.486
.code
main:
	mov	ax,@data	;����� �������� ������ - � ������� ax
	mov	ds,ax	;ax � ds
;----------------------------------------------------------------------
	mov	bx,0100h+0400h	;�� ������������ ����������� + ���������� DI � ���������
	mov	dx,1	;������� ����, ���� �� ����������, ����� ������� ������
	lds	si,point_fname	;��������� ��������� �� ��� �����
	mov	di,7	;�������� � ����� ���������� ������ 7
repeat:
	mov	ax,716ch	;����� ������� DOS
	xor	cx,cx	;�������� ����� - ������� ���� - ������ ��� ������-������
	int	21h	;��������� ����
	jnc	m1	; ���� ���� �����������, �� �������
	mov	dx,10h	;������� ����
	jmp	repeat	;������� - �������� �������� �����
m1:
;-------------------------------------------------------------------
	mov	handle,ax	;�������� ���������� �����
;�������� ��� �������� �������� �����:
;-------------------------------------------------------------------
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main