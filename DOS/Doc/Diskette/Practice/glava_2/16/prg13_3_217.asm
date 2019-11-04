;----------------------------------------------------------
;prg13_3_217.asm - программа на ассемблере транспонировани€ матрицы в линейном пор€дке.
;¬ход: mas[n] - матрица m*n.
;¬ыход: _mas[n] - транспонированна€ матрица n*m.
;----------------------------------------------------------
masm
model small
.data
m	db	3	;i=0..2
n	db	4	;j=0..3
mn	dw	0	;m*n-1
;задаем матрицу 3*4 (m*n):
mas	db	02h,04h,06h,08h,16h,24h,38h,45h,47h,48h,57h,56h
s_mas=$-mas
_mas	db	s_mas dup (0ffh)
temp	db	0
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
	xor	ecx,ecx
;определ€ем m*n-1
	mov	al,m
	mul	n
	dec	ax
	mov	cx,ax	;cx:=m*n-1
	mov	mn,ax	;mn:=m*n-1
	xor	si,si	;i:=0
m1:
	mov	bl,mas[si]
;определ€ем место вставки в _mas Е
	xor	ax,ax
	mov	al,m
	mul	si
	div	mn
	mov	di,dx
;Е и вставл€ем
	mov	_mas[di],bl
	inc	si
	loop	m1
;последний элемент на свое место:
	mov	bl,mas[si]
	mov	_mas[si],bl
;конец
	mov	ax,4c00h
	int	21h
end	main
