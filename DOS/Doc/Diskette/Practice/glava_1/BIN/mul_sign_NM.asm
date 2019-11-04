;---------------------------------------------------------
;mul_sign_NM.asm - программа на ассемблере умножения N-байтного числа на число размером M байт
;(порядок - старший байт по младшему адресу (не Intel))
;Вход: U и V - множители со знаком размерностью N и M байт соответственно; b=256 - размерность ;машинного слова.
;Выход: W - модуль произведения размерностью N+M байт.
;----------------------------------------------------------
MASM
MODEL small
STACK	256
.486
.data
;значения в U и V нужно внести
;Помните, что задание отрицательных многобайтных значений в ;сегменте данных должно производится в дополнительном коде ;(и в порядке байт - старший байт по младшему адресу)!
U	db	?	;множитель 1 размерностью N байт
i=$-U
V	db	?	;множитель 2 размерностью M байт
j=$-V
len_product=$-U
W	db	len_product dup (0)	;результат длиной N+M байт
k	db	0	;перенос 0 Ј k < 255
b	dw	100h	;размер машинного слова
sign	db	0	;информация о знаке
.code
.486
;включить описание процедур calc_complement_r, calc_abs_r, ;mul_unsign_NM
calc_complement_r	proc
	dec	cx
	mov	si,cx
	neg	byte ptr [bx][si]	;дополнение первого байта
	cmp	byte ptr [bx][si],0	;operand=0 - особый случай
	jne	short $+3
	stc		;установить cf, так как есть перенос
	jcxz	@@exit_cycl	;для однозначного числа
@@cycl:	dec	si
	not	byte ptr [bx][si]
	adc	byte ptr [bx][si],0
	loop	@@cycl
@@exit_cycl:	ret
calc_complement_r	endp
calc_abs_r	proc
;определим знак операнда
	test	byte ptr [bx],80h	;проверяем знак operand
	jz	@@exit	;число положительное
	call	calc_complement_r
@@exit:	ret
calc_abs_r	endp
mul_unsign_NM	proc
;НАЧ_ПРОГ
;m1
	mov	bx,j-1
	mov	cx,j
;ДЛЯ j:=M-1 ДО 0 //J изменяется в диапазоне M-1..0
;НАЧ_БЛОК_1
m2:
	push	cx	;вложенные циклы
;//проверка на равенство нулю очередного элемента множителя (не обязательно)
;ЕСЛИ v[j]==0 ТО ПЕРЕЙТИ_НА m6
	cmp	v[bx],0
	je	m6
;k:=0; i:=n-1 //i изменяется в диапазоне N-1.. 0
;m3
	mov	si,i-1	;i=0..n-1
	mov	cx,i
	mov	k,0
;ДЛЯ i:=N-1 ДО 0
;НАЧ_БЛОК_2
;//перемножаем очередные элементы множителей
m4:
;temp_word:=u[i]*v[j]+w[i+j+1]+k
	mov	al,u[si]
	mul	byte ptr v[bx]
	xor	dx,dx
	mov	dl,w[bx+si+1]
	add	ax,dx
	xor	dx,dx
	mov	dl,k
	add	ax,dx	;t=(ax) - временная переменная
;w[i+j+1]:=temp_word MOD b //остаток от деления temp_word\b -> w[i+j+1]
;k:=temp_word\b //целая часть частного temp_word\b -> k
	push	dx
	xor	dx,dx
	div	b
	mov	ah,dl
	pop	dx
	mov	k,al
	mov	w[bx+si+1],ah
;m5
	dec	si
	loop	m4
;КОН_БЛОК_2
;w[j]:=k
	mov	al,k
	mov	w[bx],al
m6:
	dec	bx
	pop	cx
	loop	m2
;КОН_БЛОК_1
	ret
;КОН_ПРОГ
mul_unsign_NM	endp
mul_sign_NM	proc
;НАЧ_ПРОГ
;определим знак результата
; ЕСЛИ БИТ_7_БАЙТА((u[0] AND 80h) XOR v[0])==1 ТО sign:=1
	xor	ax,ax
	mov	al,u
	and	al,80h
	xor	al,v
	bt	ax,7
	jnc	$+7
	mov	sign,1	;результат будет отрицательным
;получим модули сомножителей:
;u:=|u|
;v:=|v|
	lea	bx,v
	mov	cx,j
	call	calc_abs_r
	lea	bx,u
	mov	cx,i
	call	calc_abs_r
;теперь умножаем
;w:=mul_unsign_NM()
	call	mul_unsign_NM
;в этой точке - модуль результата
;восстанавливаем знак результата
;ЕСЛИ sign==0 ТО ПЕРЕЙТИ_НА @@m
	xor	si,si
	cmp	sign,0
	je	@@m
;//для отрицательного результата вычислить дополнение значения w длиной i+j
;w:=calc_complement_r(); w[0]:=0-w[0]
	mov	cx,i+j
	lea	bx,w
	call	calc_complement_r
;в этой точке - двоичное дополнение результата
@@m:
	ret
;КОН_ПРОГ
mul_sign_NM	endp
main:
	mov	dx,@data
	mov	ds,dx
	call	mul_sign_NM
	mov	ax,4c00h
	int	21h
end	main
