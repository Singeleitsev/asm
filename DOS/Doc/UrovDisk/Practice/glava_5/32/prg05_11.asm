;----------------------------------------------------------
;prg05_11.asm - программа ввода-вывода в консоль c изменеием атрибутов выводимого текста
;----------------------------------------------------------
.486
.model flat,STDCALL	;модель пам€ти flat,
;STDCALL - передача параметров в стиле — (справа налево), 
;	вызываема€ процедура чистит за собой стек
%NOINCL	;запретить вывод текста включаемых файлов
include	WindowConA.inc
;ќбъ€вление внешними используемых в данной программе функций Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	SetConsoleTitleA:PROC
extrn	GetStdHandle:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	SetConsoleTextAttribute:PROC
extrn	ReadConsoleA:PROC
extrn	WriteConsoleA:PROC
extrn	ExitProcess:PROC
;макроопределени€ типов
SSHORT	equ	<dw	0>
;структура дл€ установки положени€ курсора в консоли:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
.data
con	Coord	<>
dIn	dd	0	;дескриптор ввода консоли
dOut	dd	0	;дескриптор вывода консоли
NumWri	dd	0	;количество действительно введенных-выведенных символов
TitleText	db	80 dup (0),0
.code
start	proc	near	;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	eax,eax
	jz	exit	;неудача
;-------------------------------------------------------
;работаем Е Е Е
;получим стандартные дескрипторы ввода-вывода
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-дескриптор вывода консоли
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-дескриптор ввода консоли
;введем строку
;установим курсор в позицию (2,6)
	mov	con.xx,2
	mov	con.yy,6
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax, 0
	jz	exit	;если неуспех
	push	0
	push	offset NumWri	;количество действительно введенных символов
	push	80	;размер буфера TitleText дл€ ввода
	push	offset TitleText
	push	dIn
	call	ReadConsoleA	;читаем им€ входного файла
	cmp	eax, 0
	jz	exit	;если неуспех
;выведем введенную строку в заголовок окна консоли:
	push	offset TitleText
	call	SetConsoleTitleA
;проверить успех вывода заголовка
	test	eax,eax
	jz	exit	;неудача
;выведем строку в окно консоли с различных позиций и с разными цветами
;установим курсор в позицию (2,5)
	mov	ecx,10	;строку выведем 10 раз
	mov	bl,10000001b	;начальные атрибуты
m1:
push	ecx
	inc	con.xx
	inc	con.yy
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
;определим атрибуты выводимых символов - будем получать их циклически сдвигом - регистр bl
	xor	eax,eax
	rol	bl,1
	mov	al,bl
	push	eax
	push	dOut
	call	SetConsoleTextAttribute
	cmp	eax,0
	jz	exit	;если неуспех
;вывести строку
	push	0
	push	offset NumWri	;действительное количество выведенных на экран
	push	NumWri	;длина строки дл€ вывода на экран
	push	offset TitleText	;адрес строки дл€ вывода на экран
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;если неуспех
pop	ecx
	loop	m1
;-------------------------------------------------------
exit:	;выход из приложени€
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
