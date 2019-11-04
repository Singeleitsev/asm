masm
model small
.data
u	db	08h,09h,02h,03h,03h
n=$-u
p	db	n/2+1 dup (0)	;+1 -на всякий случай
.stack	256
.486
.code
BCD_UNPACK_TO_PACK	macro	UNPACK,N,PACK
local	cycl
;--------------------------------------------------------------------------------;
;BCD_UNPACK_TO_PACK UNPACK,N,PACK ? макрокоманда преобразования неупакованного BCD-числа размером N байт в упакованное BCD-число.
;Вход: UNPACK - адрес неупакованного BCD-числа, PACK - адрес упакованного BCD-числа,N - длина UNPACK в байтах.
;Порядок следования байт - младший байт по младшему адресу (Intel).
;Выход: UNPACK - результат преобразования размером N*2 байт.
;--------------------------------------------------------------------------------;
	push	eax
	push	ecx
	push	es
	push	edi
	push	esi
	push	ebx
	push	ds
	pop	es
	mov	ecx,N
;определяем N/2 (размерность PACK) и если оно нечетное, то округляем в большую сторону
	shr	ecx,1	;делим на 2
	bt	ecx,0
	jc	$+4
	setc	bl
	inc	ecx	;добавляем 1 для округления в больщую сторону
;предыдущие три команды можно заменить одной: 	adc	ecx,0
;теперь в ecx правильное значение сч. цикла, в соответствии с размерностью UNPACK
	cld		;порядок обработки BCD-цифр - начиная с младшей
	lea	edi,PACK
	lea	esi,UNPACK
cycl:	xor	ax,ax
	lodsw		;загрузить очередные 2 неупакованные BCD-цифры из UNPACK в ax
	rol	ah,4
	rol	ax,4
	stosb
	loop	cycl
	cmp	bl,0
	jne	$+7
	and	byte ptr [edi-1],0f0h
	pop	ebx
	pop	esi
	pop	edi
	pop	es
	pop	ecx
	pop	eax
	endm


main:
	mov	dx,@data	
	mov	ds,dx	

	BCD_UNPACK_TO_PACK	U,N,P

	mov	ax,4c00h	
	int	21h	
end	main		