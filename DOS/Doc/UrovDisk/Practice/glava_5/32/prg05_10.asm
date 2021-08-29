;----------------------------------------------------------
;prg05_10.asm - программа минимального консольного приложени€ Windows
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
extrn	ExitProcess:PROC
.data
TitleText	db	'ћинимальное консольное приложение Win32',0
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
;работаем Е Е Е
;-------------------------------------------------------
exit:	;выход из приложени€
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
