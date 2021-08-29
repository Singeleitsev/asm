;----------------------------------------------------------
;div_unsign_N_1.asm - программа на ассемблере делени€ без учета знака значени€ размером N байт на значение размером 1 байт.
;ѕор€док следовани€ байт - старший байт по младшему адресу (не Intel)
;¬ход: u - делимое; v - делитель.
;¬ыход: w - частное, r - остаток.
;----------------------------------------------------------
MASM
MODEL small
STACK	256
.data
;значени€ в u и v нужно внести
u	db	?	;делимое
N=$-u	;длина в байтах значени€ u
v	db	?	;делитель
w	db	N dup (0)
r	dw	0	;остаток
.code
div_unsign_N_1	proc
	mov	r,0
	xor	si,si	;j=0
	mov	cx,N
	xor	dx,dx
	xor	bx,bx
@@m1:	mov	ax,256	;основание с.с.
	mul	r	;результат в dx:ax
	mov	bl,u[si]
	add	ax,bx
	div	v
;сформировать результат:
	mov	w[si],al	;частное
	shr	ax,8
	mov	r,ax	;остаток в r
	inc	si
	loop	@@m1
	ret
div_unsign_N_1	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	div_unsign_N_1
	mov	ax,4c00h
	int	21h
end	main
