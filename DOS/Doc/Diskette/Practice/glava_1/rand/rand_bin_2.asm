;----------------------------------------------------------
;rand_bin_2.asm - программа генерации высокослучайных двоичных наборов (полный вариант).
;Вход: y, c - в соответствие с указанными выше ограничениями.
;Выход: dl - значение очередного случайного числа.
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
;получаем очередное значение Y
	push	ds
	push	40h
	pop	ds
	mov	eax,dword ptr ds:006ch
	pop	ds
	mov	Y,al
	xor	dl,dl
	mov	ecx,8	;формируем случайные 8-ми битовые наборы в регистре dl
cycl:
	shl	Y,1
	jnc	m1
	mov	al,Y
	xor	al,C
	mov	Y,al
	jmp	$+5	;на shrd
m1:
	mov	al,Y
	shr	al,1
	rcl	dl,1
	loop	cycl
;вывод на экран (в файл - командная строка rand_bin.exe > p.txt) очередного значения
;	mov	dl,Y
	mov	ah,02
	int	21h
exit:
	mov	ax,4c00h
	int	21h
end	main
