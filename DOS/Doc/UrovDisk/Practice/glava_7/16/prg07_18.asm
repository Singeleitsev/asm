;----------------------------------------------------------
;prg07_18.asm - ��������� ������������ ��������� �������� �������� �������� 47h.
;----------------------------------------------------------
masm
model small
.data
dname	db	"e:\tools",0
point_dname	dd	dname
d_cur_name	db	64 dup (20h),0
point_d_cur_name	dd	d_cur_name
.stack	256
.486
.code
main:
	mov	ax,@data	;����� �������� ������ - � ������� ax
	mov	ds,ax	;ax � ds
;-----������� ������� ������� �� ������� \tools ----------------
	lds	dx,point_dname	;��������� ��������� �� ������ � ������ ������ ��������
	mov	ah,3bh	;����� ������� DOS
	int	21h
	jc	exit	;������� � ������ ������
;-----������� ������� �������----------------
	lds	si,point_d_cur_name	;��������� ��������� �� ������ � ������ ������ ��������
	mov	ah,47h	;����� ������� DOS
	int	21h
	jc	exit	;������� � ������ ������
	nop	;��� ������������
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main