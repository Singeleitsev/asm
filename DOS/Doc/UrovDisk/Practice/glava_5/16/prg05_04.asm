;----------------------------------------------------------
;prg05_04.asm, ��������������� ������ � �������� �������.
;----------------------------------------------------------
masm
model small
.stack	256
.486
.code
main:
	xor	bh,bh
	mov	dh,10
	mov	dl,10
	mov	ah,02h
	int	10h	;���������� ������� ������� (10,10)
;���������� ������ � ������� � �����������
	mov	al, "a"
	mov	bl,10001100b	;������� - ����-������� ��������
	mov	cx,5	;��������� 5 ���
	mov	ah,09h
	int	10h
;��������� ������ �� ������� ������� �����������:
	mov	ah,08h
	int	10h
;������� ������� ������� �������
	xor	bh,bh
	mov	ah,03h
	int	10h	;���������� ������� ������� (10,10)
;��� ���������� ������� � ���������
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
