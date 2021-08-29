;----------------------------------------------------------
;prg10_06.asm - программа поворота изображения на месте с использованием средств XMM-расширения.
;----------------------------------------------------------
.486
.model flat,STDCALL	;модель памяти flat,
;STDCALL - передача параметров в стиле С (справа налево), 
;	вызываемая процедура чистит за собой стек
%NOINCL	;запретить вывод текста включаемых файлов
include	WindowConA.inc
include xmm_32.inc
;Объявление внешними используемых в данной программе функций Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	SetConsoleTitleA:PROC
extrn	ExitProcess:PROC
.stack	256
.586
.data
;координаты квадрата (необходимо инициализировать) x0,y0,x1,y1,x2,y2,x3,y3
mas_xy	dd	8 dup (0.0)
a	dd	0.0	;угол (необходимо инициализировать)
sin_a	dd	0.0
cos_a	dd	0.0
null	dd	0.0
TitleText	db	'Скалярное произведение двух векторов',0
.code
start	proc	near	;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	eax,eax
	jz	exit	;неудача
;выведем заголовок окна консоли SetConsoleTitle:
	push	offset TitleText
	call	SetConsoleTitleA
;проверить успех вывода заголовка
	test	eax,eax
	jz	exit	;неудача
;-------------------------------------------------------
	lea	esi,mas_xy
	mov	ecx,4	;цикл 4 раза - по количеству вершин
	finit
;вычисляем sin a и cos a;
	fld	a	;включаем в стек угол
	fsin	;вычисляем sin a
	fxch	;меняем st(0)<?>st(1)
	fcos	;вычисляем cos a
	fxch	;меняем st(0)<?>st(1)
	fstp	a	;выталкиваем а
	fstp	cos_a	;выталкиваем cos_a
	fstp	sin_a	;выталкиваем sin_a
;поворот изображения
;готовим xmm-регистр rxmm2 со значениями углов
	movlps	rxmm2,sin_a
	movhps	rxmm2,sin_a	;rxmm2= cos_a sin_a cos_a sin_a
	movss	rxmm2,null
	subss	rxmm2,sin_a	;rxmm2= cos_a sin_a cos_a -sin_a
cycl:
	movlps	rxmm0,[esi]	;rxmm0= ? ? yi xi
	movhps	rxmm0,[esi]	;rxmm0= yi xi yi xi
	shufps	rxmm0,rxmm0,0b0h	; rxmm0= xi yi yi xi
	mulps		rxmm0,rxmm2	; rxmm0=rxmm0*rxmm2= xi*cos_a yi*sin_a yi* cos_a xi*(-sin_a)
	shufps	rxmm1,rxmm0,31h	;rxmm1=? xi*cos_a ? yi* cos_a
	addps	rxmm0,rxmm1	;rxmm0= ? (xi*cos_a+yi*sin_a) ? (yi* cos_a+xi*(-sin_a))
	shufps	rxmm0,rxmm0,2	;rxmm0= ? ? (yi* cos_a+xi*(-sin_a)) (xi*cos_a+yi*sin_a)
;сохраняем результат:
	movlps	[esi],rxmm0
;готовимся к вычислению нового положения для следующей координаты
	add	esi,8
	loop	cycl
exit:	;выход из программы
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
