;----------------------------------------------------------
;prg02_03.asm - ��������� ��������������� �������� ��������� � ������ ��������� � ��������� �� ����������.
;----------------------------------------------------------
masm
model small
birthday struc
y_birthday	dw	1962	;��� ��������
m_birthday	db	05	;����� ��������
d_birthday	db	30	;���� ��������
ends
element	struc	
INN	dd	0	;���
Birthday	struc	{m_birthday=06, d_birthday=21}
fio	db	30 dup (' ')	;�.�.�.
nationality	db	20	;��������������
;� ��� �����
ends
.data
	dd	0ffffffffh
s1	element	<,<>>
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
ideal
	mov	al,s1.m_birthday
;�����
	mov	ax,4c00h
	int	21h
end	main
