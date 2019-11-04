;prg_8_7.asm
masm
model	small
stack	256
.data
a	db	5
b	db	10
c	db	2
y	dw	0
.code
main:	;точка входа в программу
	mov	ax,@data
	mov	ds,ax
;...
	xor	ax,ax
	mov	al,a
	cbw
.386
	movsx	bx,b
	add	ax,bx
	idiv	c	;в al - частное, в ah - остаток
	exit:
	mov	ax,4c00h	;стандартный выход
	int	21h
end main			;конец программы

