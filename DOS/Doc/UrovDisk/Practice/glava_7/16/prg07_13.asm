;----------------------------------------------------------
;prg07_13.asm - ��������� ����������� ����� ����������, �� ������� ���������� �������� 56h.
;----------------------------------------------------------
masm
model small
.data
fname_s	db	"maket.asm",0
point_fname_s	dd	fname_s
fname_d	db	"e:\maket.asm",0
point_fname_d	dd	fname_d
.stack	256
.486
.code
main:
	mov	ax,@data	;����� �������� ������ � ������� ax
	mov	ds,ax	;ax � ds
;-----���������� ���� �� �������� � �������� �������-------------------
	lds	dx,point_fname_s	;��������� ��������� �� ������ fname_s (���. ����)
	les	di,point_fname_d	;��������� ��������� �� ������ fname_d (������� ����)
	mov	ah,56h	;����� ������� DOS
	int	21h
	jc	exit	;������� � ������ ������
;� cx �������� (��. ����)
	nop	;��� ������������
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
