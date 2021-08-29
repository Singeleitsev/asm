;----------------------------------------------------------
;prg09_08.asm - ��������� ���������� ������� ��� ����������� ��������� CRC32 � �������� 0EDB88320h.
;----------------------------------------------------------masm
model small
.stack	256
.486
.data
;CRC32-������� ��� ����������� ���������� ��������� ���������� CRC32
tabl_32_mirror	dd	256 dup (0)
len_tabl_32_mirror=$-tabl_32_mirror
adr_tabl_32_mirror	dd	tabl_32_mirror
polinom	dd	0EDB88320h
.code
main:
	mov	ax,@data	;����� �������� ������ - � ������� ax
	mov	ds,ax	;ax � ds
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
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
