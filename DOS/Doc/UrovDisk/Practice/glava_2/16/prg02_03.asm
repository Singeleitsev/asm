;----------------------------------------------------------
;prg02_03.asm - программа демонстрирующая вложение структуры в другую структуру в программе на ассемблере.
;----------------------------------------------------------
masm
model small
birthday struc
y_birthday	dw	1962	;год рождения
m_birthday	db	05	;месяц рождения
d_birthday	db	30	;день рождения
ends
element	struc	
INN	dd	0	;ИНН
Birthday	struc	{m_birthday=06, d_birthday=21}
fio	db	30 dup (' ')	;Ф.И.О.
nationality	db	20	;национальность
;и так далее
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
;конец
	mov	ax,4c00h
	int	21h
end	main
