;----------------------------------------------------------
; программа вызывающа€ функцию WriteCon из dll
;----------------------------------------------------------
.486
.model flat,STDCALL	;модель пам€ти flat,
;STDCALL - передача параметров в стиле — (справа налево), 
;	вызываема€ процедура чистит за собой стек
%NOINCL	;запретить вывод текста включаемых файлов
include	WindowConA.inc
includelib	maket_dll.lib	;не об€зательно
;ќбъ€вление внешними используемых в данной программе функций Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	ExitProcess:PROC
extrn	WriteCon:PROC
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
TitleText	db	"—трока выводитс€ процедурой из DLL"
Len_TitleText=$-TitleText
;Len_Text	dd	Len_TitleText
.code
start	proc	near	;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	eax,eax
	jz	exit	;неудача
;-------------------------------------------------------
;работаем Е Е Е
	push	Len_TitleText
	push	offset TitleText
	call	WriteCon
;-------------------------------------------------------
exit:	;выход из приложени€
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
