INCLUDE minica1.inc		;PutBCD
INCLUDE minica2.inc		;PutASCII
;********************************
;макрос преобразования целого беззнакового двоичного числа
;длиной до 2^8 байт в неупакованное BCD-представление
;********************************
;ВХОД: имя переменной, содержащей исходное двоичное число,
;длина этой переменной в байтах (!),
;имя переменной-буфера для хранения распакованного
;шестнадцатеричного представления исходного двоичного числа,
;длина переменной-буфера в байтах (buf_len = 2 * num_len),
;имя переменной, в которую будет помещено BCD-представление
;длина переменной-ответа
;ВЫХОД: значение переменной-ответа - неупакованное BCD-число
;********************************
Bin2BCD MACRO num, num_len, buf, buf_len, var, var_len
LOCAL HDTB, DBuf, DDigit, CmpBuf0, Over
	push	ax
	push	bx
	push	cx
	push	dx
	push	di
	push	si
;Дописать модуль распаковки bin -> BCH
	mov	si, num_len
	mov	di, buf_len
	xor	ax, ax
HDTB:
	dec	si
	dec	di
	mov	al, num[si]	;ax:00D3
	and	ax, 0Fh		;ax:0003
	mov	buf[di], al	;|03|
        dec     di
	mov	al, num[si]	;ax:00D3
	mov	cx, 4
	shr	ax, cl		;ax:000D
	mov	buf[di], al	;|0D|
	cmp	si, 0
	jne	HDTB
;модуль многократного деления буфера вплоть до сведения его к нулю
	xor	di, di		;byte counter in 'var'
DBuf:				;Divide 'buf' by 10
;модуль беззнакового деления целого распакованного
;шестнадцатеричного числа из отрезка [0, 2^(2^16)) на 10
;построен по принципу деления "столбиком"
	xor	si, si		;byte counter in 'num'
	xor	ax, ax
	mov	bx, 0A10h
DDigit:				;Divide digit of 'buf' by 10
	mov	al, ah		;ax:0000; ax:0202; ax:0808
	xor	ah, ah		;ax:0000; ax:0002; ax:0008
	mul	bl		;ax:0000; ax:0020; ax:0080
	add	al, buf[si]	;ax:0002 ;ax:0026; ax:0087
	div	bh		;ah:02, al:00 ;ah:08, al: 03
	mov	buf[si], al	;|00|; |03|
	inc	si
	cmp	si, buf_len
	jl	DDigit
	mov	al, ah		;ax:0909
	xor	ah, ah		;ax:0009
	mov	var[di], al	;first digit of result's gotten
	inc	di
;сравниваем 'buf' с нулем, если 'buf' = 0,
;то макрос завершает работу
	xor	bx, bx
CmpBuf0:
	cmp	bx, buf_len
	je	Over
        cmp     buf[bx], 0      ;если проверенная цифра больше 0,
        jg      DBuf            ;то дальше проверять не нужно
	inc	bx
        jmp     CmpBuf0         ;если равна нулю, идем дальше
Over:
	pop	si
	pop	di
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	ENDM
;********************************
.model SMALL
.stack 256
.data
num	db	32 dup (0FFh) 
num_len=$-num
buf	db	2*num_len dup (0)
buf_len=$-buf
var	db	79 dup (0)
var_len=$-var
.code
main proc
	mov	ax, @data
	mov	ds, ax
Bin2BCD num, num_len, buf, buf_len, var, var_len
PutBCD var, var_len
exit:
	mov	ax, 4c00h
	int	21h
main endp
end main
