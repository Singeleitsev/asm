;----------------------------------------------------------
;prg09_06.asm - ��������� ���������� CRC32 �� ������� ���������� ���������.
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
;CRC32-������� ��� ������� ���������� ��������� ���������� CRC32
tabl_32_direct	dd	256 dup (0)
len_tabl_32_direct =$-tabl_32_direct
adr_tabl_32_direct	dd	tabl_32_direct
polinom	dd	04c11db7h
.code
main:
	mov	ax,@data	;����� �������� ������ - � ������� ax
	mov	ds,ax	;ax � ds
;-------------����������� CRC-32 �������---------------------------------
	les	di,adr_tabl_32_direct
	add	di,len_tabl_32_direct-4
	std	;���� ����� �� �������
	mov	cx,255
	mov	ebx,polinom
m1:
	xor	eax,eax
	shrd	eax,ecx,8
	push	cx	;��������� �����
	mov	cx,8
m2:	shl	eax,1
	jnc	m3	;������� ������� �� ����� - ��������� ����� (������� ��� �� ����������)
;������� ������� ����� - ��������� XOR:
	xor	eax,ebx	;ax XOR polinom
m3:	loop	m2
	pop	cx
	stosd
	loop	m1
;-------------��������� ������ CRC-32 �������----------------------------
	mov	eax, 0FFFFFFFFh
	lds	si,adr_bit_string
	mov	cx,len_bit_string
m4:
	xor	ebx,ebx
	shld	ebx,eax,8
	shl	eax,8
	xor	bl,[si]
	xor	eax, tabl_32_direct[bx]
	inc	si
	loop	m4
;������� crc-32 � ����� (��� ������, ��. ���������� ����) ������������������:
	xor	eax, 0FFFFFFFFh
	mov	crc_32,eax	;��������� � ����� �������� ������������������
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main 
