;----------------------------------------------------------
;div_unsign.asm - программа на ассемблере деления без учета знака значения размером 2 байта на значение размером 1 байт.
;Вход: u - делимое; v - делитель.
;Выход: w - частное, r - остаток.
;----------------------------------------------------------
MASM
MODEL small
STACK	256
.data
;значения в u и v нужно внести
u	dw	?	;делимое
v	db	?	;делитель
w	db	0
r	db	0
.code
div_unsign	proc
	mov	ax,u
	div	v
;сформировать результат:
	mov	r,ah	;остаток
	mov	w,al	;частное
	ret
div_unsign	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	div_unsign
	mov	ax,4c00h
	int	21h
end	main
