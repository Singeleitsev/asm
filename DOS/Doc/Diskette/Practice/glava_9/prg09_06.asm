;----------------------------------------------------------
;prg09_06.asm - программа вычисления CRC32 по прямому табличному алгоритму.
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
;CRC32-таблица для прямого табличного алгоритма вычисления CRC32
tabl_32_direct	dd	256 dup (0)
len_tabl_32_direct =$-tabl_32_direct
adr_tabl_32_direct	dd	tabl_32_direct
polinom	dd	04c11db7h
.code
main:
	mov	ax,@data	;адрес сегмента данных - в регистр ax
	mov	ds,ax	;ax в ds
;-------------расчитываем CRC-32 таблицу---------------------------------
	les	di,adr_tabl_32_direct
	add	di,len_tabl_32_direct-4
	std	;идем назад по таблице
	mov	cx,255
	mov	ebx,polinom
m1:
	xor	eax,eax
	shrd	eax,ecx,8
	push	cx	;вложенные циклы
	mov	cx,8
m2:	shl	eax,1
	jnc	m3	;старшие разряды не равны - выполняем сдвиг (частное нас не интересует)
;старшие разряды равны - выполняем XOR:
	xor	eax,ebx	;ax XOR polinom
m3:	loop	m2
	pop	cx
	stosd
	loop	m1
;-------------закончили расчет CRC-32 таблицы----------------------------
	mov	eax, 0FFFFFFFFh
	lds	si,adr_bit_string
	mov	cx,len_bit_string
m4:
	xor	ebx,ebx
	shld	ebx,eax,8
	shl	eax,8
	xor	bl,[si]
	xor	eax, tabl_32_direct[bx]
	inc	si
	loop	m4
;запишем crc-32 в конец (или начало, см. обсуждение ниже) последовательности:
	xor	eax, 0FFFFFFFFh
	mov	crc_32,eax	;добавляем в конец исходной последовательности
exit:
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывания с номером 21h
end	main		;конец программы с точкой входа main 
