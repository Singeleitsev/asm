.model SMALL
.stack 256
.data
.code
main proc
	mov	ax, @data
	mov	ds, ax
;Write Pixel At 12, 40
	mov	ah, 0Ch			;0Ch int 21h - Write Pixel
	mov	al, 48h			;White Color
	mov	bh, 0			;PG_NUM
	mov	cx, 34			;HOR_POS
	mov	dx, 8			;VER_POS
M2:
	int	10h
	inc	cx
	inc	dx
	cmp	cx, 50
	jl	M2
exit:
        mov     ax, 4c00h
        int     21h
main endp
end main

