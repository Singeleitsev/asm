;----------------------------------------------------------
;prg29_102.asm - программа на ассемблере транспонирования матрицы.
;Вход: mas[n] - матрица m*n.
;Выход: _mas[n] - транспонированная матрица n*m.
;----------------------------------------------------------
masm
model small
.data
m	dw	3	;i=0..2
n	dw	4	;j=0..3
;задаем матрицу 3*4 (m*n):
mas	db	02h,04h,06h,08h,16h,24h,38h,45h,47h,48h,57h,56h
s_mas=$-mas
_mas	db	s_mas dup (0ffh)
temp	db	0
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
	xor	ecx,ecx
	mov	cx,m
	xor	si,si	;i:=0
m1:
	push	cx	;цикл по i
	mov	cx,n
	xor	di,di	;j:=0
;локализуем masij по формуле: masij=n*i+j
m2:
	mov	ax,n
	mul	si	;предполагаем, что результат в рамках ax
	add	ax,di	; n*i+j
	mov	bx,ax
	mov	al,mas[bx]
	mov	temp,al
;локализуем место-приемник в _masij по формуле: _masij=masji=m*i+j
	mov	ax,m
	mul	di	;предполагаем, что результат в рамках ax
	add	ax,si
	mov	bx,ax	;_masij=masji=m*i+j
	mov	al,temp
	mov	_mas[bx],al
	inc	di	;j:=j+1
	loop	m2
	inc	si
	pop	cx	;восстанавливаем счетчик внешнего цикла
	loop	m1
	mov	ax,4c00h
	int	21h
end	main
