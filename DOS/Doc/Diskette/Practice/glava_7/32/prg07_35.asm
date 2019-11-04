;----------------------------------------------------------
;prg07_35.asm - Win32-консольное приложение дл€ исследовани€ работы функций работы с каталогами API Win32.
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
extrn	GetCurrentDirectoryA:PROC
extrn	SetCurrentDirectoryA:PROC
extrn	GetSystemDirectoryA:PROC
extrn	GetWindowsDirectoryA:PROC
extrn	CreateDirectoryA:PROC
extrn	RemoveDirectoryA:PROC
extrn	GetLastError:PROC
.data
TitleText	db	'–абота с каталогами в Win32',0
NewDir	db	"Ќовый каталог",0
dir_buf	db	50 dup ("?")
size_dir_buf=$-dir_buf
Parent	db	"..",0
.code
start	proc	near
;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	ax,ax
	jz	exit	;неудача
;-----------GetCurrentDirectory------------------------------------
;определим текущий каталог
	push	offset dir_buf
	push	size_dir_buf
	call	GetCurrentDirectoryA
	cmp	eax,0
	jz	exit	;выход в случае неудачи
;----------- CreateDirectory ------------------------------------
;создадим каталог
	push	0
	push	offset NewDir
	call	CreateDirectoryA
	cmp	eax,0
	jz	exit	;выход в случае неудачи
;-----------SetCurrentDirectory------------------------------------
;сделаем новый каталог текущим
	push	offset NewDir
	call	SetCurrentDirectoryA
	cmp	eax,0
	jz	exit	;выход в случае неудачи
;-----------GetCurrentDirectory------------------------------------
;проверим новый текущий каталог
	push	offset dir_buf
	push	size_dir_buf
	call	GetCurrentDirectoryA
	cmp	eax,0
	jz	exit	;выход в случае неудачи
;-----------SetCurrentDirectory------------------------------------
;вернемс€ в родительский каталог
	push	offset Parent
	call	SetCurrentDirectoryA
	cmp	eax,0
	jz	exit	;выход в случае неудачи
;-----------GetCurrentDirectory------------------------------------
;проверим новый текущий каталог
	push	offset dir_buf
	push	size_dir_buf
	call	GetCurrentDirectoryA
	cmp	eax,0
	jz	exit	;выход в случае неудачи
;-----------RemoveDirectory------------------------------------
;удалим новый текущий каталог
	push	offset NewDir
	call	RemoveDirectoryA
	cmp	eax,0
	jz	exit	;выход в случае неудачи
;-----------GetSystemDirectory------------------------------------
;определим системный каталог
	mov	eax,size_dir_buf
	push	eax
	push	offset dir_buf
	call	GetSystemDirectoryA
	cmp	eax,0
	jz	exit	;выход в случае неудачи
;-----------GetWindowsDirectory------------------------------------
;определим основной каталог Windows
	mov	eax,size_dir_buf
	push	eax
	push	offset dir_buf
	call	GetWindowsDirectoryA
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
