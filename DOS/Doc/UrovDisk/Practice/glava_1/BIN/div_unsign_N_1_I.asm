;----------------------------------------------------------
;div_unsign_N_1_I.asm - программа на ассемблере деления без учета знака значения размером N байт на значение размером 1 байт.
;Порядок следования байт - младший байт по младшему адресу (Intel)
;Вход: u - делимое; v - делитель.
;Выход: w - частное, r - остаток.
;----------------------------------------------------------
MASM
MODEL small
STACK	256
.data
;значения в u и v нужно внести
u	db	?	;делимое
N=$-u	;длина в байтах значения u
v	db	?	;делитель
w	db	N dup (0)
r	dw	0	;остаток
.code
div_unsign_N_1_I	proc
	mov	r,0
	mov	si,N-1	;j=N-1
	mov	cx,N
	xor	dx,dx
	xor	bx,bx
@@m1:	mov	ax,256	;основание с.с.
	mul	word ptr r	;результат в dx:ax
	mov	bl,u[si]
	add	ax,bx
	div	v
;сформировать результат:
	mov	w[si],al	;частное
	shr	ax,8
	mov	r,ax	;остаток в r
	dec	si
	loop	@@m1
	ret
div_unsign_N_1_I	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	div_unsign_N_1_I
	mov	ax,4c00h
	int	21h
end	main
