;----------------------------------------------------------
;prg09_09.asm - ��������� ���������� ���� CRC32 �� ������� ��������� ��� ����������� ��������� CRC32 � �������� 0EDB88320h.
;----------------------------------------------------------masm
model small
.stack	256
.486
.data
;�������� ������� ������������������ � ��������
bit_string	db	"123456789"
len_bit_string=$-bit_string
crc_32	dd	0	;���� �� �������� ������������ �������� CRC32
adr_bit_string	dd	bit_string
;CRC32-������� ��� ����������� ���������� ��������� ���������� CRC32
tabl_32_mirror	dd	256 dup (0)
len_tabl_32_mirror=$-tabl_32_mirror
adr_tabl_32_mirror	dd	tabl_32_mirror
polinom	dd	0EDB88320h
.code
main:
	mov	ax,@data	;����� �������� ������ � ������� ax
	mov	ds,ax	;ax � ds
;-------------����������� ���������� CRC32-�������---------------------------------
	les	di,adr_tabl_32_mirror
	add	di,len_tabl_32_mirror-4
	std	;���� ����� �� �������
	mov	cx,255
	mov	ebx,polinom
m1:
	xor	eax,eax
	mov	al,cl	;������ � ������� ��� ���������� CRC
	push	cx	;��������� �����
	mov	cx,8
m2:	shr	eax,1
	jnc	m3	;������� ������� �� ����� - ��������� ����� (������� ��� �� ����������)
;������� ������� ����� - ��������� XOR:
	xor	eax,ebx	;ax XOR polinom
m3:	loop	m2
	pop	cx
	stosd
	loop	m1
;-------------��������� ������ CRC32-�������----------------------------
	xor	bx,bx
	mov	eax, 0FFFFFFFFh
	lds	si,adr_bit_string
	mov	cx,len_bit_string
m4:
	mov	bl,al
	shr	eax,8
	xor	bl,[si]
	xor	eax,tabl_32_mirror[bx]
	inc	si
	loop	m4
	xor	eax, 0FFFFFFFFh
;������� crc-32 � ����� ������������������:
	mov	crc_32,eax	;��������� � ����� �������� ������������������
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
