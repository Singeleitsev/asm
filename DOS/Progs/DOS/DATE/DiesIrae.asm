INCLUDE PutASCII.inc
.model SMALL
.stack 256
.data
MSG	db	10,13, 'WARNING!!!', 10,13, 'System Clock Is NOT Corrected!', 10,13, 'Press Any Key To Continue...', 10, 13
MSG_Len=$-MSG

.code
main proc
	mov	ax, @data
	mov	ds, ax

Set_DATE:
	mov	ax, 2B00h	;2Bh int 21h - Set Date
	mov	cx, 07C2h	;1986
	mov	dh, 04h		;04
	mov	dl, 01Ah	;26
	int	21h
	cmp	al, 00h
	jz	Set_TIME
	jmp	WORSTCASE

Set_TIME:
	mov	ax, 2D00h	;2Dh int 21h - Set Time
	mov	ch, 01h		;01
	mov	cl, 017h	;23
	mov	dh, 028h	;40
	mov	dl, 00h		;00
	int	21h
	cmp	al, 00h
	jg	WORSTCASE

Chk_DATE:
	mov	ax, 2A00h	;2Ah int 21h - Get Date
	int	21h
	cmp	cx, 07C2h
	jne	WORSTCASE
	cmp	dx, 041Ah
	jne	WORSTCASE
Chk_TIME:
	mov	ax, 2C00h	;2Ch int 21h - Get Time
	int	21h
	cmp	cx, 0117h
	jz	exit

WORSTCASE:
PutASCII MSG, MSG_Len
	mov	ax, 0700h	;07h int 21h - Get Char
	int	21h

exit:
        mov     ax, 4c00h
        int     21h
main endp
end main

