;Листинг 20.11. Возведение числа в произвольную степень
.586p
masm
model	use16 small
.stack	100h
.data	;сегмент данных
flag	db	0
p1	dd	0
y	dt	2.0	;основание степени
x	dt	-2.0	;показатель степени
.code
main	proc	;начало процедуры main
	mov	ax, @data
	mov	ds, ax
	finit
	fld	y
	fld	x
	ftst
	fstsw	ax
	sahf
	jnc	m1	;переход если x >=0
	inc	flag	;взведем flag, если x<0
	fabs		;|x|
m1:	fxch
	fyl2x
	fst	st(1)
	fabs		;|z|
;сравним |z| c единицей:
	fld1
	fcom
	fstsw	ax
	sahf
	jp	exit	;операнды не сравнимы
	jnc	m2	;если |z|<1, то переход на m2
	jz	m3	;если |z|=1, то переход на m3
;если |z|>1, то приводим к формуле z=z1+z2, где z1-целое, z2-дробное и z2<1:
	xor	ecx, ecx	;счетчик вычитаний
m12:	inc	cx
	fsub	st(1), st(0)	
	fcom
	fstsw	ax
	sahf	
	jp	exit	;операнды не сравнимы
	jz	m12
	jnc	m2	;если |z|<1, то переход на m2
	jmp	m12	;если |z|>1, то переход на m12
m3:	mov	p1, 1
	jmp	$+7
m2:	mov	p1, ecx
	fxch
	f2xm1
	fadd		;компенсируем 1
	fild	p1	;показатель степени для fscale
	fld1
	fscale
	fxch
	fincstp
	fmul
;проверка на отрицательную степень
	cmp	flag, 1
	jnz	exit
	fld1
	fxch
	fdiv
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main

