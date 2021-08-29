;----------------------------------------------------------
;rand_mix_cong_1.asm - датчик линейной (смешанной) 
;конгруэнтной последовательности случайных чисел (c>0).
;Вход: X0, a, c, m - в соответствие с указанными выше 
;ограничениями.
;Выход: dl - значение очередного случайного числа.
;----------------------------------------------------------
masm
model small
.486
.data
m	db	128	;128=27
a	db	9
x	db	3	;начальное значение
c	dw	3
.stack	256
.486
.code
main:
	mov	dx,@data	
	mov	ds,dx	
	xor	dx,dx
	mov	cl,7	;значение степени m=27 в cl
;первое число в последовательности x=3
cycl:
;вычисляем очередное случайное число X=(a*X) mod m
	mov	al,x
	mul	a	;a*x в ah:al
	add	ax,c
	shrd	ax,ax,cl
	xor	al,al
	rol	ax,cl	;в al случайное число
;вывод в файл - командная строка rand_mult_cong.exe > p.txt
	mov	x,al
	mov	dl,al
	mov	ah,02
	int	21h
	jmp	cycl
end_cycl:
	mov	ax,4c00h
	int	21h
end	main
