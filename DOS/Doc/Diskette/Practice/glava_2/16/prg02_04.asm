;----------------------------------------------------------
;prg02_04.asm - программа демонстрирующая взаимное вложение объединений и структур в программе на ассемблере.
;----------------------------------------------------------
masm
model small
element	struc
INN	dd	0	;ИНН
fio	db	30 dup (' ')	;Ф.И.О.
	union
	struc
y_birthday_1	dw	1962	;год рождения
m_birthday_1	db	06	;месяц рождения
d_birthday_1	db	03	;месяц рождения
	ends
	struc
d_birthday_2	db	?	;месяц рождения
m_birthday_2	db	?	;месяц рождения
y_birthday_2	dw	?	;год рождения
	ends
	ends	;конец объединения
nationality	db	20	;национальность
;и так далее
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
;конец
	mov	ax,4c00h
	int	21h
end	main
