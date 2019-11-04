;********************************
;макрос побитного вывода на консоль содержимого регистра al
;********************************
;ВХОД: ничего
;ВЫХОД: значение регистра al на экране
;********************************
ShowAX MACRO
LOCAL PutBit, Put0, Next
	push	bx
	push	cx
	push	dx
	push	ax ;суем последним, чтобы его значение было в вершине стека
;переводим на новую строку и возвращаем каретку
	mov	ax, 0200h
	mov	dx, 0Ah
	int	21h
	mov	dx, 0Dh
	int	21h
;поехали
	mov	cx, 16
	mov	bx, 1000000000000000b
PutBit:
	pop	ax	;тащим из стека исходное значение ax
	push	ax	;и возвращаем его в стек
	and	ax, bx		;ax:1000 0000 0000 0000

	cmp	ax, 0
	je	Put0
	mov	ax, 0200h
	mov	dx, 0031h
	int	21h
	jmp	Next
Put0:
	mov	ax, 0200h
	mov	dx, 0030h
	int	21h
Next:
	shr	bx, 1		;dx:0100 0000 0000 0000
	loop	PutBit
	pop	ax
	pop	dx
	pop	cx	
	pop	bx
	ENDM
;********************************
