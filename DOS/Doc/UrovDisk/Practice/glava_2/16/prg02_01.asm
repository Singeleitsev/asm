;----------------------------------------------------------
;prg02_01.asm - ��������� ��������������� �������� � ������������� ��������� � ��������� �� ����������.
;----------------------------------------------------------
masm
model small
element	struc
INN	dd	0	;���
name	db	30 dup (' ')	;�.�.�.
y_birthday	dw	1962	;��� ��������
m_birthday	db	05	;����� ��������
d_birthday	db	30	;����� ��������
nationality	db	20	;��������������
;� ��� �����
ends
.data
s1	element	<>
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
	mov	al,s1.m_birthday
;�����
	mov	ax,4c00h
	int	21h
end	main
