;----------------------------------------------------------
;prg07_24.asm - ��������� ������������ ���������� ������� 7160h (CL=0) ���������� 21h ��� ��������� ������� ����.
;----------------------------------------------------------
masm
model small
.data
filename	db	'my_file with long name.txt',0
point_fname	dd	filename
PathFull	db	260 dup (0)
point_Path	dd	PathFull
.stack	256
.486
.code
main:
	mov	ax,@data	;����� �������� ������ - � ������� ax
	mov	ds,ax	;ax � ds
;----------------------------------------------------------------------
	lds	si,point_fname	;��������� ��������� �� ��� �����
	les	di,point_Path	;��������� ��������� �� ����� ��� ������� ����
	mov	ax,7160h	;����� ������� DOS
	mov	ch,80h	; CH=80h - �������� ��� �����; CH=0 - �������� ������ ����
	mov	CL,0	;�������� ������ ����
	int	21h
	jc	exit
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main