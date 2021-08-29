;----------------------------------------------------------
;mul_sign_NM_I.asm - программа на ассемблере умножения N-байтного числа на число размером M байт
;(порядок - младший байт по младшему адресу (Intel))
;Вход: U и V - множители со знаком размерностью N и M байт соответственно; b=256 - размерность ;машинного слова.
;Выход: W - модуль произведения размерностью N+M байт.
;----------------------------------------------------------
MASM
MODEL small
STACK	256
.data
;значения в U и V нужно внести
;Помните, что задание отрицательных многобайтных значений в ;сегменте данных должно производится в дополнительном коде ;(и в порядке байт характерном для МП Intel)!
U	db	?	;множитель 1 размерностью N байт
i=$-U
V	db	?	;множитель 2 размерностью M байт
j=$-V
len_product=$-U
W	db	len_product dup (0)
k	db	0	;перенос 0 Ј k < 255
b	dw	100h	;размер машинного слова
sign	db	0	;информация о знаке
.code
.486
;включить описание процедур calc_complement, calc_abs, mul_unsign_NM_I
calc_complement	proc
	xor	si,si
	neg	byte ptr [bx]	;дополнение первого байта
	cmp	byte ptr [bx],0	;нулевой операнд - особый случай
	jne	short $+3
	stc		;установить cf, так как есть перенос
	dec	cx
	jcxz	@@m1	;для однобайтного операнда
@@cycl:	inc	si
	not	byte ptr [bx][si]
	adc	byte ptr [bx][si],0
	loop	@@cycl
@@m1:
	ret
calc_complement	endp
calc_abs	proc
;определим знак операнда
	mov	si,cx
	dec	si
	test	byte ptr [bx][si],80h	;проверяем знак операнда
	jz	@@exit	;число положительное
	call	calc_complement
@@exit:	ret
calc_abs	endp
mul_unsign_NM_I	proc
;НАЧ_ПРОГ
;m1
;ДЛЯ j:= 0 ДО M-1 //J изменяется в диапазоне 0..M-1
	xor	bx,bx
	mov	cx,j
m2:
;НАЧ_БЛОК_1
	push	cx	;вложенные циклы
;//проверка на равенство нулю очередного элемента множителя (не обязательно)
;ЕСЛИ v[j]==0 ТО ПЕРЕЙТИ_НА m6
	cmp	v[bx],0
	je	m6
;m3
;k:=0; i:=n-1 //i изменяется в диапазоне 0..N-1
;ДЛЯ i:= 0 ДО N-1
	xor	si,si
	mov	cx,i
	mov	k,0
m4:
;НАЧ_БЛОК_2
;//перемножаем очередные элементы множителей
;temp_word:=u[i]*v[j]+w[i+j]+k
	mov	al,u[si]
	mul	byte ptr v[bx]
	xor	dx,dx
	mov	dl,w[bx+si]
	add	ax,dx
	xor	dx,dx
	mov	dl,k
	add	ax,dx	;t=(ax) - временная переменная
;w[i+j]:=temp_word MOD b //остаток от деления temp_word\b -> w[i+j]
;k:=temp_word\b //целая часть частного temp_word\b -> k
	push	dx
	xor	dx,dx
	div	b	;t mod b
	mov	ah,dl
	pop	dx
	mov	k,al
	mov	w[bx+si],ah
;m5
	inc	si
	loop	m4
;КОН_БЛОК_2
;w[i+j]:=k
	mov	al,k
	mov	w[bx+si],al
;m6:
m6:
	inc	bx
	pop	cx
	loop	m2
;КОН_БЛОК_1
	ret
;КОН_ПРОГ
mul_unsign_NM_I	endp

mul_sign_NM_I	proc
;НАЧ_ПРОГ
;определим знак результата
;ЕСЛИ БИТ_7_БАЙТА((u[i-1] AND 80h) XOR v[j-1])==1 ТО sign:=1 //результат будет отрицательным
	xor	ax,ax
	mov	si,i-1
	mov	al,u[si]
	and	al,80h
	mov	si,j-1
	xor	al,v[si]
	bt	ax,7
	jnc	$+7
	mov	sign,1	;результат будет отрицательным
;получим модули сомножителей:
;u:=|u|
;v:=|v|
	lea	bx,v
	mov	cx,j
	call	calc_abs
	lea	bx,u
	mov	cx,i
	call	calc_abs
;теперь умножаем
;w:= mul_unsign_NM_I()	//в этой точке - модуль результата
	call	mul_unsign_NM_I
;в этой точке получили модуль результата, далее, если нужно
;восстанавливаем знак результата и получаем его дополнение (если нужно)
;ЕСЛИ sign==0 ТО ПЕРЕЙТИ_НА @@m
	cmp	sign,0
	je	@@m
mov	cx,i+j
lea	bx,w
call	calc_complement
;w:=calc_complement()
;m:
;этой точке получили дополнение результата
@@m:
	ret
;КОН_ПРОГ
mul_sign_NM_I	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	mul_sign_NM_I
	mov	ax,4c00h
	int	21h
end	main
