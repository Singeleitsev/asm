;----------------------------------------------------------
;prg05_12.asm - программа демонстрирующая использование пользовательского обработчика события.
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
extrn	GetStdHandle:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	SetConsoleTextAttribute:PROC
extrn	ReadConsoleA:PROC
extrn	WriteConsoleA:PROC
extrn	MessageBeep:PROC
extrn	SetConsoleCtrlHandler:PROC
extrn	ExitProcess:PROC
;макроопределения типов
SSHORT	equ	<dw	0>
;структура для установки положения курсора в консоли:
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
Text_CTRL_C	db	"Нажаты CTRL+C"
Len_Text_CTRL=$-Text_CTRL_C
Text_BREAK	db	"Нажаты CTRL+BREAK"
Len_BREAK=$-Text_BREAK
.code
CtrlHandler	proc
arg @@dwCtrlType:DWORD
uses ebx,edi, esi	;эти регистры обязательно должны сохраняться
;анализируем тип сигнала управления
	cmp	@@dwCtrlType,CTRL_C_EVENT
	je	h_CTRL_C_EVENT
	cmp	@@dwCtrlType,CTRL_BREAK_EVENT
	je	h_CTRL_BREAK_EVENT
	jmp	h_default
h_CTRL_C_EVENT:
;при нажатии CTRL+C выводим сообщение и звук:
;установим курсор
	inc	con.xx
	inc	con.yy
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
;вывести строку
	push	0
	push	offset NumWri	;действительное количество выведенных на экран
	push	Len_Text_CTRL	;длина строки для вывода на экран
	push	offset Text_CTRL_C	;адрес строки для вывода на экран
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;если неуспех
;и звук:
;BOOL MessageBeep(UINT uType);
	push	0FFFFFFFFh
	call	MessageBeep
	cmp	eax,0
	jz	exit	;если неуспех
;возвращаем признак обработки
	mov	eax,1
	jmp	exit_CtrlHandler
h_CTRL_BREAK_EVENT:
;при нажатии CTRL+BREAK выводим сообщение и звук:
;установим курсор
	inc	con.xx
	inc	con.yy
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
;вывести строку
	push	0
	push	offset NumWri	;действительное количество выведенных на экран символов
	push	Len_BREAK	;длина строки для вывода на экран
	push	offset Text_BREAK	;адрес строки для вывода на экран
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;если неуспех
;и звук:
;BOOL MessageBeep(UINT uType);
	push	0FFFFFFFFh
	call	MessageBeep
	cmp	eax,0
	jz	exit	;если неуспех
;возвращаем признак обработки
	mov	eax,1
	jmp	exit_CtrlHandler
h_default:
	mov	eax,0ffffffffh	;возвращаем -1	;все остальное не обрабатываем
exit_CtrlHandler:
	ret
CtrlHandler	endp
start	proc	near	;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	eax,eax
	jz	exit	;неудача
;-------------------------------------------------------
;работаем … … …
;получим стандартные дескрипторы ввода-вывода
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-дескриптор вывода консоли
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-дескриптор ввода консоли
;установим функцию-обработчик сигналов управления
	push	TRUE
	push	offset cs: CtrlHandler
	call	SetConsoleCtrlHandler
	cmp	eax, 0
	jz	exit	;если неуспех
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
	push	80	;размер буфера TitleText для ввода
	push	offset TitleText
	push	dIn
	call	ReadConsoleA	;читаем имя входного файла
	cmp	eax, 0
	jz	exit	;если неуспех
;выведем введенную строку в заголовок окна консоли:
	push	offset TitleText
	call	SetConsoleTitleA
;проверить успех вывода заголовка
	test	eax,eax
	jz	exit	;неудача
;выведем строку в окно консоли с различных позиций и с разными цветами
;установим курсор в позицию
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
;определим атрибуты выводимых символов - будем получать их циклически сдвигом регистр bl
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
	push	offset NumWri	;действительное количество выведенных на экран символов
	push	NumWri	;длина строки для вывода на экран
	push	offset TitleText	;адрес строки для вывода на экран
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;если неуспех
pop	ecx
	loop	m1
;-------------------------------------------------------
exit:	;выход из приложения
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
