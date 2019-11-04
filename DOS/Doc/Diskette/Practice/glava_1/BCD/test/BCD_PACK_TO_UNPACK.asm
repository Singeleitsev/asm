masm
model small
.data
p	db	89h,23h,30h
n=$-p
u	db	n*2 dup (0)
.stack	256
.486
.code
BCD_PACK_TO_UNPACK	macro	PACK,N,UNPACK
local	cycl
;--------------------------------------------------------------------------------;
;BCD_PACK_TO_UNPACK PACK,N,UNPACK ? макрокоманда преобразования упакованного BCD-числа размером N байт в неупакованное BCD-число размером N*2 байт
;Вход: PACK - адрес упакованного BCD-числа, UNPACK - адрес неупакованного BCD-числа, N - длина PACK в байтах.
;Порядок следования байт - младший байт по младшему адресу (Intel).
;Выход: UNPACK - результат преобразования размером N*2 байт.
;--------------------------------------------------------------------------------;
	push	eax
	push	ecx
	push	es
	push	edi
	push	esi
	push	ds
	pop	es
	mov	ecx,N
	cld		;порядок обработки BCD-цифр - начиная с младшей
	lea	edi,UNPACK
	lea	esi,PACK
cycl:	xor	ax,ax
	lodsb		;загрузить очередные 2 упакованные BCD-цифры из PACK в al
	ror	ax,4
	ror	ah,4
;	xchg	al,ah	;восстановить правильный порядок следования цифр
	stosw
	loop	cycl
	pop	esi
	pop	edi
	pop	es
	pop	ecx
	pop	eax
	endm
main:
	mov	dx,@data	
	mov	ds,dx	

	BCD_PACK_TO_UNPACK	P,N,U

	mov	ax,4c00h	
	int	21h	
end	main		