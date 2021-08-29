;----------------------------------------------------------
;prg05_13.asm - программа на ассемблере для обработки событий мыши.
;----------------------------------------------------------
.486
.model flat,STDCALL	;модель памяти flat,
;STDCALL - передача параметров в стиле С (справа налево), 
;	вызываемая процедура чистит за собой стек
%NOINCL	;запретить вывод текста включаемых файлов
include	WindowConA.inc
;Объявление внешними используемых в данной программе функций Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	SetConsoleTitleA:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	GetStdHandle:PROC
extrn	ReadConsoleInputA:PROC
extrn	WriteConsoleA:PROC
extrn	ExitProcess:PROC
;макроопределения типов
SSHORT	equ	<dw	0>
;структура для установки положения курсора в консоли:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
;структура INPUT_RECORD для обработки событий мыши:
INPUT_RECORD struc
EventType	dw	0
	dw	0
	struc	; dwMousePosition
x_M	dw	0
y_M	dw	0
	ends
dwButtonState	dd	0
dwControlKeyState	dd	0
dwEventFlags	dd	0
ends
.data
INPUT_RECORD_buf	INPUT_RECORD	<>
n_record	dd	0	;количество возвращаемых записей о событиях мыши
con	Coord	<>
dIn	dd	0	;дескриптор ввода консоли
dOut	dd	0	;дескриптор вывода консоли
NumWri	dd	0	;количество действительно введенных-выведенных символов
TitleText	db	"Работа с мышью в консоли",0
Text_Out	db	"Событие мыши: нажата левая кнопка!"
Len_Text=$-Text_Out
.code
start	proc	near	;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	eax,eax
	jz	exit	;неудача
;-------------------------------------------------------
;получим стандартные дескрипторы ввода-вывода
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-дескриптор вывода консоли
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-дескриптор ввода консоли
;выведем строку в заголовок окна консоли:
	push	offset TitleText
	call	SetConsoleTitleA
	test	eax,eax	;проверить успех вывода заголовка
	jz	exit	;неудача
cycl:	;почти бесконечный цикл до нажатия правой кнопки мыши
	mov	INPUT_RECORD_buf.EventType,0
	push	offset	n_record
	push	1
	push	offset INPUT_RECORD_buf
	push	dIn
	call	ReadConsoleInputA
	cmp	eax,0
	jz	exit	;если неуспех
	cmp	INPUT_RECORD_buf.EventType,MOUSE_EVENT
	jne	cycl
;какое событие мыши произошло?
	bt	INPUT_RECORD_buf.dwButtonState ,0	;нажата левая кнопка?
	jc	left_but
	bt	INPUT_RECORD_buf.dwButtonState ,1	;нажата правая кнопка?
	jc	exit
	jmp	cycl
left_but:
;при нажатии левой кнопки мыши выведем строку в окно консоли:
;установим курсор в текущую позицию мыши
	mov	ax,INPUT_RECORD_buf.x_M
	mov	con.xx,ax
	mov	ax,INPUT_RECORD_buf.y_M
	mov	con.yy,ax
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
	push	0
	push	offset NumWri	;действительное количество выведенных на экран символов
	push	Len_Text	;длина строки для вывода на экран
	push	offset Text_Out	;адрес строки для вывода на экран
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;если неуспех
	jmp	cycl
exit:	;выход из приложения
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
