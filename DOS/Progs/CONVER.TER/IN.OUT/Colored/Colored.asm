;*****************************************************************************
;Макрос вывода на экран начиная с заданной позиции 
;строки символов с атрибутом цвета
;!!!Сама переменная при этом никаких изменений не претерпевает,
;то есть ей можно будет оперировать в дальнейшем по ходу программы!!!
;*****************************************************************************
;Вход: переменная, содержащая строку символов, и ее размерность.
;Выход: экран.
;*****************************************************************************
DispCharAttr	MACRO _mes, _len, _x, _y, _attr
local M1
	push	ax		;store registers
	push	dx
	push	cx
	push	si
	xor	bh, bh
	xor	si, si		;No. of byte to be written
	mov	cx, 1		;byte is to be written once
	mov	bl, _attr	;gray field dark red symbols
	mov	ah, 2		;2h int 10h (set cursor pos.)
	mov	dl, _x		;column No.
	mov	dh, _y		;row No.
M1:
	int	10h		;set cursor pos.
	mov	ah, 9		;9h int 10h (write char&attrib to videomem)
	mov	al, _mes[si]	;load next byte to be written
	int	10h		;write symbol
	inc	si
	inc	dl
	mov	ah, 2
	cmp	si, _len
	jl	M1
	pop	si		;restore registers
	pop	cx
	pop	dx
	pop	ax
	ENDM
;*****************************************************************************
.model small
.stack 256
.data
rect_top	db 201,7 dup (205),187
rect_top_len=$-rect_top
rect_side	db 186
rect_side_len=$-rect_side
rect_bot	db 200,7 dup (205),188
rect_bot_len=$-rect_bot
mes	db	'Я гений'
len=$-mes
x	db 36
y	db 11
attr	db 1110100b
.code
main	proc
	mov	ax, @data
	mov	ds, ax
DispCharAttr rect_top, rect_top_len, x, y, attr
DispCharAttr rect_side, rect_side_len, 36, 12, attr
DispCharAttr mes, len, 37, 12, attr
DispCharAttr rect_side, rect_side_len, 44, 12, attr
DispCharAttr rect_bot, rect_bot_len, 36, 13, attr
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main
