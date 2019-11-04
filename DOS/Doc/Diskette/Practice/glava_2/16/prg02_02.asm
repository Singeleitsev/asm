;----------------------------------------------------------
;prg02_02.asm - программа демонстрирующая вложение структуры в текущую структуру в программе на ассемблере.
;----------------------------------------------------------
masm
model small
element	struc
INN	dd	0	;ИНН
fio	db	30 dup (' ')	;Ф.И.О.
	struc
y_birthday	dw	1962	;год рождения
m_birthday	db	05	;месяц рождения
d_birthday	db	30	;месяц рождения
	ends
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
