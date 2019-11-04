;----------------------------------------------------------
;prg07_29.asm - Win32-программа консольного приложени€ дл€ исследовани€ работы функции CopyFile API Win32.
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
extrn	CopyFileA:PROC
.data
TitleText	db	' опирование файлов в Win32',0
s_file	db	"p",0	;им€ входного файла
d_file	db	"p1",0	;им€ выходного файла
.code
start	proc	near
;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	ax,ax
	jz	exit	;неудача
;-----------CopyFileA------------------------------------
	mov	eax,1
	push	eax
	push	offset d_file
	push	offset s_file
	call	CopyFileA
	cmp	eax,0
	jz	exit	;выход в случае неудачи
;-------------------------------------------------------
;Е Е Е
exit:
;выход из приложени€
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
