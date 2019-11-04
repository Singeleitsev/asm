;********************************
;макрос преобразования целого беззнакового двоичного числа
;длиной до 2^16 байт в неупакованное BCD-представление
;********************************
;ВХОД: имя переменной, содержащей исходное двоичное число,
;длина этой переменной в байтах (!),
;имя переменной, в которую будет помещено BCD-представление
;длина переменной-ответа (var_len = (целое (1,2 * num_len)) + 1
;ВЫХОД: значение переменной-ответа - неупакованное BCD-число
;********************************
Bin2BCD MACRO num, num_len, var, var_len
LOCAL DNum, DDigit, CmpNum0, Over
	push	ax
	push	bx
	push	di
	push	si
;модуль многократного деления буфера вплоть до сведения его к нулю
	xor	di, di		;byte counter in 'var'
DNum:				;Divide 'num' by 10
;модуль беззнакового деления целого шестнадцатеричного
;числа из отрезка [0, 2^(2^16)) на 10
;построен по принципу деления "столбиком"
	xor	si, si		;byte counter in 'num'
	xor	ax, ax
	mov	bx, 0Ah
DDigit:				;Divide digit of 'num' by 10
	mov	al, num[si]	;ax:0001; ax:019C; ax:02EE; ax:00E0
	div	bl		;ax:0100; ax:0229; ax:004B; ax:0416
	mov	num[si], al	;|00|; |29|; |4B|; |16|
	inc	si
	cmp	si, num_len
	jl	DDigit
;	cmp	di, var_len	;Check for free space
;	jge	Over		;If not enough then stop computing
	mov	var[di], ah	;first digit of result's gotten
	inc	di
;сравниваем 'num' с нулем, если 'num' = 0,
;то макрос завершает работу
	xor	bx, bx
CmpNum0:
	cmp	bx, num_len
	je	Over
        cmp     num[bx], 0      ;если проверенная цифра больше 0,
        jne	DNum            ;то дальше проверять не нужно
	inc	bx
        jmp     CmpNum0         ;если равна нулю, идем дальше
Over:
	pop	si
	pop	di
	pop	bx
	pop	ax
	ENDM
;********************************