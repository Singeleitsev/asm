rCMOS	macro
;макро чтени€ значений CMOS
;на входе: al - адрес €чейки, значение которой читаем
;на входе выходе: al - прочтенное значение
	out	70h,al
	xor	ax,ax
	in	al,71h	;вводим в регистр al из порта значение €чейки cmos
	endm
wCMOS	macro	svalue:REQ
;макро ввода значени€ в €чейку CMOS
;svalue - записываемое значение в виде 16-й константы
;al - адрес €чейки, в которую производитс€ запись
	out	70h,al
	mov	al,svalue
	out	71h,al
	endm
DalBax	macro
;макро преобразовани€ упакованного BCD из al в символьное в ax
;al - упакованное BCD
;ax - два символа (уже в перевернутом виде)
	rol	al,4
	mov	ah,al
	shr	ah,4
	and	ax,0f0fh
	or	ax,3030h
	endm