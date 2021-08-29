;----------------------------------------------------------
;prg09_05.asm - ��������� ���������� CRC-������� ��� �������� 04c11db7.
;----------------------------------------------------------masm
model small
.stack	256
.486
.data
;CRC32-������� ��� ������� ���������� ��������� ���������� CRC32
tabl_32_direct	dd	256 dup (0)
len_tabl_32_direct =$-tabl_32_direct
adr_tabl_32_direct	dd	tabl_32_direct
polinom	dd	04c11db7h
.code
main:
	mov	ax,@data	;����� �������� ������ - � ������� ax
	mov	ds,ax	;ax � ds
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
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main 
