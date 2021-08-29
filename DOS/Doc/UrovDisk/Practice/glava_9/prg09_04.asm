;----------------------------------------------------------
;prg09_04.asm - ��������� ���������� CRC � �������������� ������� ���������� ���������.
;----------------------------------------------------------masm
model small
.stack	256
.486
.data
;�������� ������� ������������������ � ��������
bit_string	db	"6476c8"
len_bit_string=$-bit_string
adr_bit_string	dd	bit_string
;CRC-�������
tabl_16	dw	256 dup (0)
len_tabl_16=$-tabl_16
adr_tabl_16	dd	tabl_16
polinom	dw	1021h
.code
main:
	mov	ax,@data	;����� �������� ������ - � ������� ax
	mov	ds,ax	;ax � ds
;-------------����������� CRC-�������---------------------------------
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
;-------------��������� ������ CRC-�������----------------------------
	xor	ax,ax
	xor	bx,bx
	lds	si,adr_bit_string
	mov	cx,len_bit_string
m4:
	mov	bl,ah
	shl	ax,8
	xor	bl,[si]
	xor	ax,tabl_16[bx]
	inc	si
	loop	m4
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main 
