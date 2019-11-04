;*****************************************************************************
;Макрос консольного ввода строки ASCII-символов
;*****************************************************************************
;ВХОД: длина и адрес переменной, куда будет помещена введенная строка
;ВЫХОД: значение указанной переменной в памяти
;*****************************************************************************
GetStrASCII MACRO str_len, str_adr
        push	ax		;store registers
	push	bx
	push	cx
	push	dx
	mov	bx, 0		;standard descriptor: keyboard
	mov	cx, str_len
	lds	dx, str_adr
	mov	ah, 3Fh		;3Fh int 21h: read from file
        int     21h
	pop	dx		;restore registers
	pop	cx
	pop	bx
	pop	ax
        jc      exit
        ENDM
;*****************************************************************************
;Макрос непосредственного вывода на экран ASCII-строки
;*****************************************************************************
;Вход: длина и адрес переменной, содержащей ASCII-строку.
;Выход: ASCII-символы на экране
;*****************************************************************************
PutStrASCII  MACRO str_len, str_adr
	push	ax			;store registers
	push	bx
	push	cx
	push	dx
	mov	bx, 1		;standard descriptor: screen
	mov	cx, str_len
	lds	dx, str_adr
	mov	ah, 40h		;40h int 21h: write to file
	int	21h
	pop	dx		;restore registers
	pop	cx
	pop	bx
	pop	ax
        jc      exit
	ENDM
;*****************************************************************************
.model small
.stack 256
.data
mes1   db      'Enter 8 characters: '
mes1_len=$-mes1
mes1_adr       dd mes1
mes2   db      'You entered: '
mes2_len=$-mes2
mes2_adr       dd mes2
num     db	10 dup (0)	;this means you can enter 10-2=8 symbols
num_len=$-num
num_adr dd num
.code
main	proc
	mov	ax, @data
	mov	ds, ax
PutStrASCII mes1_len, mes1_adr
GetStrASCII num_len, num_adr
PutStrASCII mes2_len, mes2_adr
PutStrASCII num_len, num_adr	
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main
