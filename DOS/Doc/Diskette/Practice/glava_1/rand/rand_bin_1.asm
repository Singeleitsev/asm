;----------------------------------------------------------
;rand_bin_1.asm - программа генерации высокослучайных двоичных наборов (сокращенный вариант).
;¬ход: y, c - в соответствие с указанными выше ограничени€ми.
;¬ыход: dl - значение очередного случайного числа.
;----------------------------------------------------------
masm
model small
.486
.SALL
include incPr.inc
.data
Y	db	35h	;0bh
C	db	33h	;03h
.stack	256
.486
.code
main:
	mov	dx,@data	
	mov	ds,dx	
	xor	dx,dx
cycl:	shl	Y,1
	jnc	m1
	mov	al,Y
	xor	al,C
	mov	Y,al
m1:
;вывод на экран (в файл - командна€ строка rand_bin.exe > p.txt)
	mov	dl,Y
	mov	ah,02
	int	21h
	jmp	cycl
end_cycl:
	mov	ax,4c00h
	int	21h
end	main
