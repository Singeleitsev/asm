;Листинг 20.7. Исследование работы команды frndint
.586p
masm
model	use16 small
.stack	100h
.data	;сегмент данных
mem16	dw	0
y_real	dt	10.0
x_3	dd	3.0
.code
main	proc	;начало процедуры main
	mov	ax, @data
	mov	ds, ax
	fld	y_real
	fld	x_3
	fdiv		;st(0)=3.333...33
	fstcw	mem16
	and	mem16, 1111001111111111b
	fldcw	mem16
	frndint		;rc=0, st(0)=3
	fld	y_real	
	fld	x_3	
	fdiv		;st(0)=3.333...33
	fstcw	mem16
	and	mem16, 1111001111111111b
	or	mem16, 1111011111111111b
	fldcw	mem16
	frndint		;rc=01, st(0)=3
	fld	y_real
	fld	x_3
	fdiv		;st(0)=3.333...33
	fstcw	mem16
	and	mem16, 1111001111111111b
	or	mem16, 1111101111111111b
	fldcw	mem16
	frndint		;rc=10, st(0)=4
	fld	y_real
	fld	x_3
	fdiv		;st(0)=3.333...33
	fstcw	mem16
	and	mem16, 1111001111111111b
	or	mem16, 1111111111111111b
	fldcw	mem16
	frndint		;rc=11, st(0)=3
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main

