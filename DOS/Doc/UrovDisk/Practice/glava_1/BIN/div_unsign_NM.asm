;----------------------------------------------------------
;div_unsign_NM.asm - программа на ассемблере деления (N+M)-разрядного беззнакового целого на число размером N байт
;(порядок - старший байт по младшему адресу (не Intel))
;Вход: U и V - u=um+n-1..+u1u0 - делимое; v=vn-1…v1v0-
;делитель, m - длина делимого;n - длина делителя; b=256 -
;основание системы счисления.
;Выход: q=qmqm-1…q1q0 - частное, r=rn-1…r1r0 - остаток.
;Ограничения: vn-1№0 OR 0ffh; N>1.
;----------------------------------------------------------
masm
model small,c
.data
;значения в u и v нужно внести
u0	db	0	;дополнительный старший байт делимого для нормализации
u	db	1fh,0c3h,12h,0ffh	;делимое
m=$-u	;длина в байтах значения u
v0	db	0	;для компенсирующего сложения 0vn-1…v1v0
v	db	3fh,50h	;делитель
n=$-v	;длина в байтах значения v
mm=m-n
w	db	m+1 dup (0)	;для промежуточных вычислений
q	db	mm dup (0)	;частное
qq	dw	0	;частичное частное	;qq	db	0
rr	dw	0	;частичный остаток
r	db	n dup (0)	;остаток
d	db	0
temp	dw	0
temp_r	db	n dup (0)
borrow	db	0	;факт заема на шаге D4
k	db	0	;перенос 0 Ј k < 255
b	dw	100h	;размер машинного слова
carry	db	0

.stack	256
.486
.code
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

mul_unsign_NM	macro	u,i,v,j,w
local	m2,m4,m6
	push	si
;очистим w
	push	ds
	pop	es
	xor	al,al
	lea	di,w
	mov	cx,i+j
rep	stosb

;m1
	mov	bx,j-1	;j=0..m-1
	mov	cx,j
m2:
	push	cx	;вложенные циклы
	cmp	v[bx],0
	je	m6
;m3
	mov	si,i-1	;i=0..n-1
	mov	cx,i
	mov	k,0
m4:
	mov	al,u[si]
mul	byte ptr v[bx]
	xor	dx,dx
	mov	dl,w[bx+si+1]
	add	ax,dx
	xor	dx,dx
	mov	dl,k
	add	ax,dx	;t=(ax) ? временная переменная
	push	dx
	xor	dx,dx
	div	b	;t mod b
	mov	ah,dl
	pop	dx
	mov	k,al
	mov	w[bx+si+1],ah
;m5
	dec	si
	loop	m4
	mov	al,k
	mov	w[bx],al
m6:
	dec	bx
	pop	cx
	loop	m2
	pop	si
	endm

sub_sign_N	macro	minuend,deduction,N
local	cycl,m1
;старший байт по младшему адресу
	push	si
	mov	cl,N
	mov	si,N-1
cycl:	mov	al,deduction[si]
	sbb	minuend[si],al
;	jnc	m1
;	neg	minuend[si]
m1:	dec	si
	loop	cycl
	pop	si
	endm

add_unsign_N	macro	carry,summand_1,summand_2,N
	local	cycl,end_p
	mov	cl,N
	mov	si,N-1
cycl:	mov	al,summand_2[si]
	adc	summand_1[si],al
	dec	si
	loop	cycl
	jnc	end_p
	adc	carry,0
end_p:	nop
	endm

div_sign_N	macro	u,N,v,w,r
local	m1
;старший байт по младшему адресу
	mov	r,0
	lea	si,u	;j=0
	xor	di,di	;j=0
	mov	cx,N
	xor	dx,dx
	xor	bx,bx
m1:	mov	ax,256	;основание с.с.
	mul	word ptr r	;результат в dx:ax
	mov	bl,[si]
	add	ax,bx
	div	v
;сформировать результат:
	mov	w[di],al	;частное
	mov	r,ah	;остаток в r
	inc	si
	inc	di
	loop	m1
;если нужно - получим модуль (уберите знаки комментария)
;	mov	cx,N	;длина операнда
;	lea	bx,w
;	call	calc_abs_r
	endm

div_unsign_NM	proc
;НАЧ_ПРОГ
;//шаг 1 - нормализация:
;D1 - нормализация
;d:=b/(v[n-1]+1)
	xor	ax,ax
	mov	dl,v
	inc	dl	;vn-1+1
	mov	ax,b
	div	dl
	mov	d,al	;d=b/(v1+1)
;u[n+m…0]:=u[n+m-1…0]*d
	mul_unsign_NM	u,m,d,1,w
	cld
	push	ds
	pop	es
	lea	si,w
	lea	di,u0
	mov	cx,m+1
rep	movsb
;v[n-1…0]:=v[n-1…0]*d
	mul_unsign_NM	v,n,d,1,w
	cld
	push	ds
	pop	es
	lea	si,w+1
	lea	di,v
	mov	cx,n
rep	movsb
;//шаг 2 - начальная установка j:
;mm:=m-n; j:=mm
;D2:
	mov	si,0	;n=0 (? n=n+m)
;D3:
@@m7:
;//шаг 3 - вычислить частичное частное qq :
;qq:=(u[j+n]*b+u[j+n-1]) / v[n-1]
;rr:=(u[j+n]*b+u[j+n-1]) MOD v[n-1]
@@m1:	xor	ax,ax
	mov	al,u0[si]
	mul	b
	shl	eax,16
	shrd	eax,edx,16	;результат умножения в eax
	xor	edx,edx
	mov	dl,u0[si+1]
	add	eax,edx
	shld	edx,eax,16	;восстановили пару dx:ax для деления
	xor	bx,bx
	mov	bl,v	;v->bx
	div	bx
	mov	qq,ax
	mov	rr,dx
@@m2:
;проверим выполнение неравенства:
;ДЕЛАТЬ ПОКА tf
;НАЧ_БЛОК_1
;ЕСЛИ qq==b OR qq*v[n-2] > b*rr+ u[j+n-1] ТО 
;НАЧ_БЛОК_2
;qq:=qq-1
;rr:=rr+v[n-1]
;ЕСЛИ rrіb ТО tf:=FALSE
;КОН_БЛОК_2
;ИНАЧЕ tf:=FALSE
;КОН_БЛОК_1
@@m4:	
	mov	ax,qq
	cmp	ax,b	;qq<>b
	je	@@m9	;на qq=qq-1
;qq*vn-2>b*rr+uj+n-2
	mul	v+1	;qq*vn-2
	mov	temp,ax	;temp=vn-2*qq
	xor	ax,ax
	mov	ax,b
	mul	rr
	xor	dx,dx
	mov	dl,u0[si+2]
	add	ax,dx
	cmp	temp,ax	;qq*vn-2 > b*rr+uj+n-2
	jna	@@m8
@@m9:
	dec	qq
	xor	ax,ax
	mov	al,v
	add	rr,ax
	jmp	@@m4
@@m8:
@@m3:
;D4
;//шаг 4 - умножить и вычесть:
;u[j+n…j]:=u[j+n…j]-qq*v[n-1…0]
	mul_unsign_NM	v,n,qq,1,w
	mov	bx,si
	push	si
	sub_sign_N	u0[bx],w,<n+1>	;v<->w
;ЕСЛИ u[j+n…j]<0 ТО	;запоминаем факт заема, получаем дополнение
;НАЧ_БЛОК_3
;borrow:=1
;u[j+n…j]:=calc_complement_r(u[j+n…j])
;КОН_БЛОК_3
	jnc	@@m5	;переход, если нет заема (результат положительный)
	mov	borrow,1	;запоминаем факт заема, получаем дополнение
	pop	si
	lea	bx,u0[si]
	mov	cx,n+1
	call calc_complement_r
;D5
;//шаг 5 - проверка остатка:
;q[j]:=qq
@@m5:	mov	ax,qq
	mov	q[si],al
;ЕСЛИ borrow<>1 ТО
	cmp	borrow,1	;был заем на шаге D4 ??
	jne	@@m6
;НАЧ_БЛОК_4
;//шаг 6 - компенсирующее сложение:
;q[j]:= q[j]-1
;u[j+n…j]:=u[j+n…j]+v[n-1…0]
;КОН_БЛОК_4
;D6 - компенсирующее сложение
	mov	borrow,0	;сбросим факт заема
	dec	q[si]
	mov	bx,si
	push	si
	add_unsign_N	carry,u0[bx],v0,<n+1>	;перенос не нужен
;D7
;//шаг 7 - цикл по j:
;j:=j-1
@@m6:	pop	si
	inc	si
;ЕСЛИ jі0 ТО ПЕРЕЙТИ_НА @@m7
	cmp	si,mm
	jle	@@m7
;D8 - денормализация
;//шаг 8 - денормализация:
;//вычислим остаток:
;r[n-1…0]:=u[n-1…0]/d
	mov	bx,si
	div_sign_N	u0[bx],N,d,r,temp_r
	ret
;//q[m…0] - частное, r[n-1…0] ? астаток
;КОН_ПРОГ
div_unsign_NM	endp


main:
	mov	dx,@data	
	mov	ds,dx	

	call	div_unsign_NM

	mov	ax,4c00h	
	int	21h	
end	main		