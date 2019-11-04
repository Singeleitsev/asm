INCLUDE dos.inc
;*****************************************************************************
;Макрос посимвольного ввода десятичного числа без последующих преобразований
;*****************************************************************************
;Вход: имя переменной, куда будет помещено ASCII-представление
;введенного числа и размерность этого числа в байтах
;Выход: значение указанной переменной в памяти
;*****************************************************************************
GetASCII MACRO var, len
local get1
	push	ax		;store registers
	push	bx
	push	cx
        xor     ax, ax
        mov     ah, 1h		;1h int 21h (ввод 1 символа с консоли с эхом)
        xor     bx, bx
        mov     cx, len        ;столько раз повторим цикл
get1:
        int     21h             ;получаем символ (в al)
        mov     var[bx],al     ;отправляем по адресу
        inc     bx              ;прибавляем адрес
        loop    get1
	pop	cx		;restore registers
	pop	bx
	pop	ax
        ENDM
;*****************************************************************************
;Макрос непосредственного вывода на экран числа в ASCII-представлении
;(без пробела, перехода на следующую строку и возврата каретки).
;*****************************************************************************
;Вход: имя переменной, содержащей число в ASCII-представлении, и ее размер.
;Выход: строка на экране.
;*****************************************************************************
PutASCII        MACRO var, len
local M1
	push	ax		;store registers
	push	dx
	push	cx
	push	si
	mov	ah, 2h		;int 21h func 2h
	xor	si, si
        mov     cx, len
M1:
        mov     dl, var[si]
	int	21h
	inc	si
	loop	M1
	pop	si		;restore registers
	pop	cx
	pop	dx
	pop	ax
		ENDM
;*****************************************************************************
.model small
.stack 256
.data
mes_1   db      10, 13, 'Enter 8 characters: $'
mes_2	db	10, 13, 'You entered: $'
num     db      8 dup (0)
num_len	equ	$-num
.code
main	proc
	mov	ax, @data
	mov	ds, ax

@DispStr mes_1
GetASCII num, num_len
@DispStr mes_2
PutASCII num, num_len
	
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main
