;----------------------------------------------------------
;prg09_02.asm - ��������� ������������ ������� ��������� ���������� CRC (�������-��������).
;----------------------------------------------------------
masm
model small
.stack	256
.486
.data
;�������� ������� ������������������ � ��������
bit_string	db	"6476c8",35h,0dah
len_bit_string=$-bit_string
adr_bit_string	dd	bit_string
polinom	dw	4003h
.code
main:
	mov	ax,@data	;����� �������� ������ - � ������� ax
	mov	ds,ax	;ax � ds
	xor	ax,ax
	lds	si,adr_bit_string
	mov	cx,len_bit_string
	mov	bx,polinom
	shl	ebx,16	;���������� polinom � XOR � EAX
m1:	push	cx	;��������� �����
	mov	cx,8
	lodsb
m2:	shl	eax,1
	jnc	m3	;������� ������� �� ����� - ��������� ����� (������� ��� �� ����������)
;������� ������� ����� - ��������� XOR:
	xor	eax,ebx	;eax(31..16) XOR polinom
m3:	loop	m2
	pop	cx
	loop	m1
;�������� ������� ���� ������ N
	mov	cl,24+1	; N=16 (������� ��������) + 8 (�. �. �������� � eax)+1(��� loop)
m4:	shl	eax,1
	jnc	m5	;������� ������� �� ����� - ��������� ����� (������� ��� �� ����������)
;������� ������� ����� - ��������� XOR:
	xor	eax,ebx	;eax(31..16) XOR polinom
m5:	loop	m4
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main 
