;----------------------------------------------------------
;prg07_19.asm - ��������� ������������ ����������� ����� ����, � ����� ������� �������� ���������.
;----------------------------------------------------------
masm
model small
.stack	256
.486
.code
main:
	mov	ax,@data	;����� �������� ������ - � ������� ax
	mov	ds,ax	;ax � ds
;-----��������� ����� ������ �� MS DOS----------------
	mov	al,00
	mov	ah,30h	;����� ������� DOS
	int	21h
	jc	exit	;������� � ������ ������
;----- AL = ������� ����� ������, AH = ������� ����� ������----------------
	nop	;��� ������������
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
