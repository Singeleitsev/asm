masm
model small
.486
.stack 256
DIV_N_BY_10	MACRO u, N, v, w, r
local	@@M1
	push	si
	push	cx
	push	dx
	push	bx
	push	ax
	mov	r, 0		;начальное значение остатка - 0
	mov	si, N-1		;старшую цифру - в младший байт результата
	mov	cx, N		;столько циклов
	xor	dx, dx
	xor	bx, bx
@@M1:	mov	ax, 256		;основание степени счисления
	mul	word ptr r		;результат в dx:ax
	mov	bl, u[si]
	add	ax, bx
	div	v
	mov	w[si], al	;частное
	shr	ax, 8
	mov	r, ax
	dec	si
	loop	@@M1
	pop	ax
	pop	bx
	pop	dx
	pop	cx
	pop	si
		ENDM
.data
string	db 10 dup (0)		;10 bytes is maximum length of decimal answer
len_string=$-string
adr_string	dd string
bin_dd	label BYTE
	dd 0ffffffffh		;это число преобразуем
len_bin_dd=$-bin_dd
ten	db 10
remainder	dw 0
.code
main:
	mov	ax, @data
	mov	ds, ax
	xor	bx, bx
continue:
	DIV_N_BY_10 bin_dd, len_bin_dd, ten, bin_dd, remainder
	mov	ax, remainder
	or	al, 30h		;преобразуем в символьное представление
	mov	string[bx], al
	inc	bx
	cmp	bin_dd, 0
	jne	continue
	mov	ah, 2
	mov	si, len_string
	dec	si
	mov	cx, len_string
M1:
	mov	dl, string[si]
	int	21h
	dec	si
	loop	M1
exit:
	mov	ax, 4c00h
	int	21h
end main