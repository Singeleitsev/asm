;----------------------------------------------------------
;prg09_09.asm - программа вычисления кода CRC32 на стороне источника для зеркального алгоритма CRC32 и полинома 0EDB88320h.
;----------------------------------------------------------masm
model small
.stack	256
.486
.data
;исходная битовая последовательность в символах
bit_string	db	"123456789"
len_bit_string=$-bit_string
crc_32	dd	0	;сюда мы поместим рассчитанное значение CRC32
adr_bit_string	dd	bit_string
;CRC32-таблица для зеркального табличного алгоритма вычисления CRC32
tabl_32_mirror	dd	256 dup (0)
len_tabl_32_mirror=$-tabl_32_mirror
adr_tabl_32_mirror	dd	tabl_32_mirror
polinom	dd	0EDB88320h
.code
main:
	mov	ax,@data	;адрес сегмента данных в регистр ax
	mov	ds,ax	;ax в ds
;-------------расчитываем зеркальную CRC32-таблицу---------------------------------
	les	di,adr_tabl_32_mirror
	add	di,len_tabl_32_mirror-4
	std	;идем назад по таблице
	mov	cx,255
	mov	ebx,polinom
m1:
	xor	eax,eax
	mov	al,cl	;индекс в таблице для вычисления CRC
	push	cx	;вложенные циклы
	mov	cx,8
m2:	shr	eax,1
	jnc	m3	;старшие разряды не равны - выполняем сдвиг (частное нас не интересует)
;старшие разряды равны - выполняем XOR:
	xor	eax,ebx	;ax XOR polinom
m3:	loop	m2
	pop	cx
	stosd
	loop	m1
;-------------закончили расчет CRC32-таблицы----------------------------
	xor	bx,bx
	mov	eax, 0FFFFFFFFh
	lds	si,adr_bit_string
	mov	cx,len_bit_string
m4:
	mov	bl,al
	shr	eax,8
	xor	bl,[si]
	xor	eax,tabl_32_mirror[bx]
	inc	si
	loop	m4
	xor	eax, 0FFFFFFFFh
;запишем crc-32 в конец последовательности:
	mov	crc_32,eax	;добавляем в конец исходной последовательности
exit:
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывания с номером 21h
end	main		;конец программы с точкой входа main
