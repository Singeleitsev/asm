;----------------------------------------------------------
;div_bcd_NM_r.asm - деление неупакованных BCD-чисел u и v размером n+m и n байт.
;¬ход: u=u1u2u3Еum+n - делимое; v=v1v2Еvn - делитель, b=256 - основание системы счислени€.
;¬ыход: q=q1q2Еqm - частное, r=r1r2Еrn - остаток.
;ѕор€док следовани€ байт - старший байт по младшему адресу (не Intel) (!).
;----------------------------------------------------------
masm
model small,c
.data
;значени€ в u и v нужно внести
u0	db	0	;дополнительный байт дл€ нормализации
u	db	1,0,3,5,9,4,6	;делимое
m=$-u	;длина в байтах значени€ u
v0	db	0	;дл€ сложени€ 0v1v2..vn
v	db	5,9,1	;делитель
n=$-v	;длина в байтах значени€ v
mm=m-n
w	db	m+1 dup (0)	;дл€ промежуточных вычислений
q	db	mm dup (0)	;частное
qq	db	0
r	db	n dup (0)	;остаток
b	dw	10	;основание системы счислени€
d	db	0
temp	dw	0
temp_r	db	n dup (0)
borrow	db	0	;факт заема на шаге D4
k	db	0	;перенос 0 =< k < 255
carry	db	0
.stack	256
.486
.code
;вставить описание макрокоманд calc_complement_r, mul_bcd_r, sub_bcd_r, add_bcd_r, div_bcd_1_r
;Е Е Е
div_bcd_NM_r	proc
;D1 ? нормализаци€
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
;D8 ? денормализаци€
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
