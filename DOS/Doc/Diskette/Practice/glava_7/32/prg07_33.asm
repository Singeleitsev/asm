;----------------------------------------------------------
;prg07_33.asm - Win32-консольное приложение дл€ Win32 дл€ исследовани€ работы функции GetLogicalDriveStrings API Win32.
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
extrn	GetLogicalDriveStringsA:PROC
extrn	GetLastError:PROC
.data
TitleText	db	'ѕолучение информации о дисках в Win32',0
info_buf	db	10 dup (0)
.code
start	proc	near
;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	ax,ax
	jz	exit	;неудача
;-----------GetLogicalDriveStrings------------------------------------
	push	offset info_buf
	push	0
	call	GetLogicalDriveStringsA
	cmp	eax,0
	jz	exit	;выход в случае неудачи
;вызываем функцию второй раз, когда известно количество байт, потребное дл€ записи списка корневых каталогов
	push	offset info_buf
	push	eax
	call	GetLogicalDriveStringsA
	cmp	eax,0
	jz	exit	;выход в случае неудачи
;-------------------------------------------------------
;результат смотрим в отладчике TD32.exe
;Е Е Е
exit:
;выход из приложени€
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
