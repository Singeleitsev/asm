;----------------------------------------------------------
;prg02_04.asm - ��������� ��������������� �������� �������� ����������� � �������� � ��������� �� ����������.
;----------------------------------------------------------
masm
model small
element	struc
INN	dd	0	;���
fio	db	30 dup (' ')	;�.�.�.
	union
	struc
y_birthday_1	dw	1962	;��� ��������
m_birthday_1	db	06	;����� ��������
d_birthday_1	db	03	;����� ��������
	ends
	struc
d_birthday_2	db	?	;����� ��������
m_birthday_2	db	?	;����� ��������
y_birthday_2	dw	?	;��� ��������
	ends
	ends	;����� �����������
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
	mov	al,s1.m_birthday_1
	mov	s1.m_birthday_2,0ffh
	mov	al,s1.m_birthday_2
;�����
	mov	ax,4c00h
	int	21h
end	main
