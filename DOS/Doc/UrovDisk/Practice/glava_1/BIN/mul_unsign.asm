;----------------------------------------------------------
;mul_unsign.asm - ��������� ��������� ����� �������� 1 ���� ��� ����� �����.
;����: multiplier1 � multiplier2 - ��������� �������� 1 ����.
;�����: product - �������� ������������.
;----------------------------------------------------------
MASM
MODEL small
STACK	256
.data
;�������� � multiplier1 � multiplier2 ����� ������
product	label	word
product_l	label	byte
multiplier1	db	?	;��������� 1 (������� ����� ������������)
product_h	db	0	;������� ����� ������������
multiplier2	db	?	;��������� 2
.code
mul_unsign	proc
	mov	al,multiplier1
	mul	multiplier2
;������� ���������:
	jnc	no_carry	;��� ������������ - �� no_carry
;������������ �������� ������������
	mov	product_h,ah	;������� ����� ����������
no_carry:	mov	product_l,al	;������� ����� ����������
	ret
mul_unsign	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	mul_unsign
	mov	ax,4c00h
	int	21h
end	main
