;********************************
;макрос побитного вывода на консоль содержимого регистра al
;********************************
;ВХОД: ничего
;ВЫХОД: значение регистра al на экране
;********************************
ShowAX MACRO
LOCAL PutBit, Put0, Next
	push	ax
	push	bx
	push	cx
	push	dx
;поехали
	mov	cx, 16
	mov	bx, 1000000000000000b
	push	ax
PutBit:
	pop	ax
	push	ax
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
	pop	ax
	ENDM
;********************************
.model SMALL
.stack 256
.data
.code
main proc
	mov	ax, @data
	mov	ds, ax
	mov	ax, 1110111011101110b
ShowAX
exit:
	mov	ax, 4c00h
	int	21h
main endp
end main
