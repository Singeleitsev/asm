;Листинг 20.6. Исследование работы команды fscale
.586p
masm
model	use16 small
.stack	100h
.data	;сегмент данных
y_real	dt	45.56	;y_real=4004 b63d 70a3 d70a 3d71
.code	
main	proc	;начало процедуры main
	mov	ax, @data
	mov	ds, ax
	fld	y_real	;st(0)=4004 b63d 70a3 d70a 3d71 (45.56)
	fxtract		;st(1)=4001 a000 ... 0000 (5)
;st(0)=3fff b63d 70a3 d70a 3d71 (1.42375)
	fscale		;st(0)= 4004 b63d 70a3 d70a 3d71 (45.56)
exit:
... ... ...

