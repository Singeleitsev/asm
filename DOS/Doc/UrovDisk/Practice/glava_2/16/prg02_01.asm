;----------------------------------------------------------
;prg02_01.asm - программа демонстрирующая описание и использование структуры в программе на ассемблере.
;----------------------------------------------------------
masm
model small
element	struc
INN	dd	0	;ИНН
name	db	30 dup (' ')	;Ф.И.О.
y_birthday	dw	1962	;год рождения
m_birthday	db	05	;месяц рождения
d_birthday	db	30	;месяц рождения
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
	mov	al,s1.m_birthday
;конец
	mov	ax,4c00h
	int	21h
end	main
