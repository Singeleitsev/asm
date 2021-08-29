;----------------------------------------------------------
;prg09_03.asm - ��������� ���������� ����������� ������� �� ������ �������� 1021h ������� 16.
;----------------------------------------------------------masm
model small
.stack	256
.486
.data
;CRC-�������
tabl_16	dw	256 dup (0)
len_tabl_16=$-tabl_16
adr_tabl_16	dd	tabl_16
polinom	dw	1021h
.code
main:
	mov	ax,@data	;����� �������� ������ - � ������� ax
	mov	ds,ax	;ax � ds
	les	di,adr_tabl_16
	add	di,len_tabl_16-2
	std	;���� ����� �� �������
	mov	cx,255
	mov	bx,polinom
m1:
	xor	ax,ax
	mov	ah,cl	;������ � ������� ��� ���������� CRC
	push	cx	;��������� �����
	mov	cx,8
m2:	shl	ax,1
	jnc	m3	;������� ������� �� ����� - ��������� ����� (������� ��� �� ����������)
;������� ������� ����� - ��������� XOR:
	xor	ax,bx	;ax XOR polinom
m3:	loop	m2
	pop	cx
	stosw
	loop	m1
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main 
