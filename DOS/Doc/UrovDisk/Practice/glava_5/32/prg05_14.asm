;----------------------------------------------------------
;prg05_14.asm - программа на ассемблере для обработки событий клавиатуры.
;Выход: при нажатии любой кнопки мыши.
;----------------------------------------------------------
.486
.model flat,STDCALL	;модель памяти flat,
;STDCALL - передача параметров в стиле С (справа налево), 
;	вызываемая процедура чистит за собой стек
%NOINCL	;запретить вывод текста включаемых файлов
include	WindowConA.inc
;Объявление внешними испbKeyDown=1, когда клавиша нажатаользуемых в данной программе функций Win32 (ASCII):
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
;структура INPUT_RECORD для обработки событий мыши и клавиатуры:
INPUT_RECORD	struc
EventType	dw	0
;	dw	0
BkeyDown			db	0
	db	5 dup (0)
WRepeatCount		dw	0
WVirtualKeyCode	dw	0
WVirtualScanCode	dw	0
AsciiChar			db	0
	db	2 dup (0)
dwControlKeyState	dd	0
	ends
.data
INPUT_RECORD_buf	INPUT_RECORD	<>
	db	0ffh
n_record	dd	0	;количество возвращаемых записей о событиях мыши
con	Coord	<>
dIn	dd	0	;дескриптор ввода консоли
dOut	dd	0	;дескриптор вывода консоли
NumWri	dd	0	;количество действительно введенных-выведенных символов
	db	0ffh
TitleText	db	"Работа с клавиатурой и мышью в консоли",0
adr_Text	dd	0	;адрес строки для вывода на экран
len_Text	dd	0	;длина строки для вывода на экран
Text_Out	db	"Событие клавиатуры: нажата и отпущена клавиша клавиатуры - правый Alt!"
Len_Text_Out=$-Text_Out
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
cycl:	; бесконечный (при желании) цикл до нажатия любой кнопки мыши
	mov	INPUT_RECORD_buf.EventType,0
	push	offset	n_record
	push	1
	push	offset INPUT_RECORD_buf
	push	dIn
	call	ReadConsoleInputA
	cmp	eax,0
 	jz	exit	;если неуспех
	cmp	INPUT_RECORD_buf.EventType,MOUSE_EVENT
	jne	key
	jmp	exit
key:
	cmp	INPUT_RECORD_buf.EventType,KEY_EVENT
	jne	cycl
;какое событие клавиатуры произошло?
	cmp	INPUT_RECORD_buf.dwControlKeyState,RIGHT_ALT_PRESSED
	jne	cycl
	mov	len_Text,Len_Text_Out
	mov	adr_Text,offset Text_Out
;выводим строку в окно консоли:
;установим курсор в текущую позицию мыши
	inc	con.xx
	inc	con.yy
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
	push	0
	push	offset NumWri	;действительное количество выведенных на экран символов
	push	dword ptr len_Text	;длина строки для вывода на экран
	push	dword ptr adr_Text	;адрес строки для вывода на экран
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
