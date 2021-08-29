;----------------------------------------------------------
;prg02_07.asm - программа на ассемблере для подсчета количества слов, начинающихся с определенной строчной буквы
;Вход: ввод с клавиатуры 20 слов (длиной не более 10 символов).
;Выход: вывод результата подсчета на экран.
;----------------------------------------------------------
masm
model small
buf_0ah	struc
len_buf	db	11	;длина buf_in
len_in	db	0	;действительная длина введенного слова (без учета 0dh)
buf_in	db	11 dup (20h)	;буфер для ввода (с учетом 0dh)
ends
.data
tab	db	26 dup (0)
buf	buf_0ah	<>
	db	0dh,0ah,'$'	;для вывода функцией 09h (int 21h)
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
;вводим слова с клавиатуры
	mov	cx,20
	lea	dx,buf
	mov	ah,0ah
m1:	int	21h
;анализируем первую букву введенного слова
;вычисляем хеш-функцию: A=C*1-97
	mov	bl,buf.buf_in
	sub	bl,97
	inc	[bx]
	loop	m1
;выводим результат подсчета на экран
;чистим буфер buf
push	ds
pop	es
	xor	al,al
	lea	di,buf
	mov	cx,type buf_0ah
rep	stosb
	mov	cx,26
;символ в buf.buf_in
	lea	dx,buf
	mov	bl,97
m2:
push	bx
	mov	buf.buf_in,bl
;опять вычисляем хеш-функцию: A=C*1-97 и преобразуем "количество" в символьный вид
	sub	bl,97
	mov	al,[bx]
	aam
	or	ax,03030h	;в ax длина в символьном виде
	mov	buf.len_in,al
	mov	buf.len_buf,ah
;теперь выводим:
	mov	ah,09h
	int	21h
pop	bx
	inc	bl
	loop	m2
exit:
	mov	ax,4c00h
	int	21h
end	main
