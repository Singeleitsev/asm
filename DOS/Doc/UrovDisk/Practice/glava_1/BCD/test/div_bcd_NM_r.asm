;--------------------------------------------------------------------------------;
;div_bcd_NM_r.asm - деление неупакованных BCD-чисел u и v размером n+m и n байт.
;Вход: u=u1u2u3…um+n - делимое; v=v1v2…vn - делитель, b=256 - основание систмы счисления.
;Выход: q=q1q2…qm - частное, r=r1r2…rn ? остаток.
;Порядок следования байт - старший байт по младшему адресу (не Intel) !!!!!!!.
;--------------------------------------------------------------------------------;
masm
model small,c
.data
;значения в u и v нужно внести
u0	db	0	;дополнительный байт для нормализации
u	db	1,0,3,5,9,4,6	;делимое
m=$-u	;длина в байтах значения u
v0	db	0	;для сложения 0v1v2..vn
v	db	5,9,1	;делитель
n=$-v	;длина в байтах значения v
mm=m-n
w	db	m+1 dup (0)	;для промежуточных вычислений
q	db	mm dup (0)	;частное
qq	db	0
r	db	n dup (0)	;остаток
b	dw	10	;основание системы счисления
d	db	0
temp	dw	0
temp_r	db	n dup (0)
borrow	db	0	;факт заема на шаге D4
k	db	0	;перенос 0 =< k < 255
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

mul_bcd_r	macro	u,i,v,j,w
local	m2,m4,m6
	push	si
;очистим w
cld
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
	mul	v[bx]
	xor	dx,dx
	mov	dl,w[bx+si+1]
	add	ax,dx
	xor	dx,dx
	mov	dl,k
	add	ax,dx	;t=(ax) ? временная переменная
;	push	dx
;	xor	dx,dx
aam	;корректируем результат - (ah)=цифра переноса; (al)=результат
;	div	b	;t mod b
;	mov	ah,dl
;	pop	dx
	mov	k,ah
	mov	w[bx+si+1],al
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

sub_bcd_r	macro	minuend,len_m,deduction,len_d,difference
local	temp,m1,m2,exit_m
	push	si
;копируем уменьшаемое в difference:
push	ds
pop	es
cld
	lea	si,minuend
	lea	di,difference
	mov	cx,len_m
	push	cx
rep	movsb
;копируем вычитаемое во врем. область temp:
	jmp	m1
temp	db	len_m dup (0)
m1:
std
	lea	si,deduction+len_m-1
	lea	di,cs:temp+len_m-1
	mov	cx,len_d
	push	cs
	pop	es
rep	movsb
mov	si,len_m-1
	pop	cx
m2:	mov	al,minuend[si]
	sbb	al,cs:temp[si]
	aas
	mov	difference[si],al
	dec	si
	loop	m2
	jc	m3	;на обработку заема из старшего разряда
	jmp	exit_m
m3:	nop	;если нужно, то допишите фрагмент обработки заема из старшего разряда
exit_m:
	pop	si
	endm

add_bcd_r	macro	summand_1,len_1,summand_2,len_2,w
local	m1,m2,m3
	push	si
	push	bx
	mov	ax,len_1
	cmp	ax,len_2
	jna	m2
	mov	cx,len_1	;длина большего для сложения (см. ниже)
	push	cx
	mov	cx,len_2	;длина меньшего для сложения (см. ниже)
	push	cx
	mov	cx,ax
	lea	bx,summand_1	;адрес большего источника для сложения
	lea	si,summand_2-1	;адрес меньшего источника для movsb
add	si,len_2	;смещение конца меньшего
mov	ax,len_1
push	bx
mov	bx,ax
	jmp	m3
m2:
	mov	cx,len_2	;длина большего для сложения (см. ниже)
	push	cx
	mov	cx,len_1	;длина меньшего для сложения (см. ниже)
	push	cx
	mov	cx,len_2
	lea	bx,summand_2	;адрес большего источника для сложения
	lea	si,summand_1-1	;адрес меньшего источника для movsb
	add	si,len_1	;смещение конца меньшего
mov	ax,len_2
push	bx
mov	bx,ax
m3:
;заполняем w нулями - длина определена выше:
cld
	xor	al,al
	lea	di,w
rep	stosb
;пересылка меньшего (по длине) BCD-числа в w:
std
	push	ds
	pop	es
;адрес источника см. выше
lea	di,w[bx]
pop	bx
	pop	cx	;длина была определена выше и соотв. меньшему BCD-числу
rep	movsb
	pop	cx	;цикл по большему
mov	si,cx
m1:	mov	al,[bx][si-1]
	adc	al,w[si]
	aaa
	mov	w[si],al
	dec	si
	loop	m1
	adc	w[si],0
	pop	bx
	pop	si
	endm

div_bcd_1_r	macro	u,N,v,w,r
local	m1
;старший байт по младшему адресу !!!!!!!
	mov	r,0
	lea	si,u	;j=0
	xor	di,di	;j=0
	mov	cx,N
	xor	dx,dx
	xor	bx,bx
m1:
;	mov	ax,256	;основание с.с.
;	mul	r	;результат в dx:ax
;	mov	bl,[si]
;	add	ax,bx
	mov	ah,r
	mov	al,[si]
	aad
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

div_bcd_NM_r	proc
;D1 ? нормализация
	xor	ax,ax
	mov	dl,v
	inc	dl	;v1+1
	mov	ax,b
	div	dl
	mov	d,al	;d=b/(v1+1)
mul_bcd_r	u,m,d,1,w
	cld
	push	ds
	pop	es
	lea	si,w
	lea	di,u0
	mov	cx,m+1
rep	movsb

mul_bcd_r	v,n,d,1,w
	cld
	push	ds
	pop	es
	lea	si,w+1
	lea	di,v
	mov	cx,n
rep	movsb

;D2:
	mov	si,0	;n=0
;D3:
@@m7:	mov	al,u0[si]
	cmp	v,al
	jne	@@m1
	mov	qq,9	;qq=b-1
	jmp	@@m2
@@m1:	xor	ax,ax
	mov	al,u0[si]
	mul	b
	xor	dx,dx
	mov	dl,u0[si+1]
	add	ax,dx
	mov	bl,v	;v->bx
div	bl
	mov	qq,al
@@m2:
;проверим выполнение неравенства:
@@m4:	mul	v+1
	mov	temp,ax	;temp=v2*qq
	xor	ax,ax
	mov	al,u0[si]
	mul	b
	xor	edx,edx
	mov	dl,u0[si+1]
add	dx,ax
	mov	al,qq
	mul	v	;eax=qq*v1
sub	dx,ax
xchg	dx,ax
	mul	b
	xor	bx,bx
	mov	bl,u0[si+2]
	add	ax,bx
	cmp	temp,ax
	jna	@@m3
	dec	qq
	mov	al,qq
	jmp	@@m4
@@m3:
;D4
	mul_bcd_r	v,n,qq,1,w
	mov	bx,si
	push	si
	sub_bcd_r	u0[bx],<n+1>,w,<n+1>,u0[bx]	;v<->w
	jnc	@@m5	;переход, если нет заема (результат положительный)
	mov	borrow,1	;запоминаем факт заема, получаем дополнение
	pop	si
;D5
@@m5:	mov	al,qq
	mov	q[si],al
	cmp	borrow,1	;был заем на шаге D4 ??
	jne	@@m6
;D6 ? компенсирующее сложение
	mov	borrow,0	;сбросим факт заема
	dec	q[si]
	mov	bx,si
	push	si
	add_bcd_r	u0[bx],<n+1>,v0,<n+1>,u0	;перенос не нужен
;D7
@@m6:	pop	si
	inc	si
	cmp	si,mm
	jle	@@m7
;D8 ? денормализация
	mov	bx,si
	div_bcd_1_r	u0[bx],N,d,r,temp_r
	ret
div_bcd_NM_r	endp

main:
	mov	dx,@data	
	mov	ds,dx	

	call	div_bcd_NM_r

	mov	ax,4c00h	
	int	21h	
end	main		