;----------------------------------------------------------
;prg07_32.asm - Win32-программа консольного приложени€ дл€ Win32 дл€ исследовани€ работы функции GetFileInformationByHandle API Win32.
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
extrn	MoveFileA:PROC
extrn	CreateFileA:PROC
extrn	GetFileInformationByHandle:PROC
extrn	GetLastError:PROC
;описание структур
FILETIME	struc
DwLowDateTime	dd	?	;младшие 32 бита значени€ времени
DwHighDateTime	dd	?	;старшие 32 бита значени€ времени
FILETIME ends
BY_HANDLE_FILE_INFORMATION	struc
DwFileAttributes	dd	0	;атрибуты файла
	struc
FtCreationTime_DwLowDateTime	dd	?	;младшие 32 бита значени€ времени создани€ файла
FtCreationTime_DwHighDateTime	dd	?	;старшие 32 бита значени€ времени создани€ файла
	ends
	struc
FtLastAccessTime_DwLowDateTime	dd	?	;младшие 32 бита значени€ времени посл. доступа
FtLastAccessTime_DwHighDateTime	dd	?	;старшие 32 бита значени€ времени посл. доступа
	ends
	struc
FtLastWriteTime_DwLowDateTime	dd	?	;младшие 32 бита значени€ времени посл. записи
FtLastWriteTime_DwHighDateTime	dd	?	;старшие 32 бита значени€ времени посл. записи
	ends
dwVolumeSerialNumber	dd	0	;серийный номер тома, на котором находитс€ файл
nFileSizeHigh	dd	0	;старшие 32 бита размера файла
nFileSizeLow	dd	0	;младшие 32 бита размера файла
nNumberOfLinks	dd	0	;число ссылок на файл
nFileIndexHigh	dd	0	;старшие 32 бита идентификатора файла
nFileIndexLow	dd	0	;младшие 32 бита идентификатора файла
	ends
.data
info	BY_HANDLE_FILE_INFORMATION	<>
TitleText	db	'ѕолучение информации о файле в Win32',0
lpBuf	db	"p",0
hFile	dd	0
.code
start	proc	near
;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	ax,ax
	jz	exit	;неудача
;----------------------CreateFile--------------------------------------
;открываем файл
	push	0
	push	0	;атрибуты (они игнорируютс€)
	push	OPEN_EXISTING	;открыть существующий файл, если его нет - ошибка
	push	0	;защита файла не требуетс€
	push	FILE_SHARE_READ	;разрешено совместное использование файла (по чтению)
	push	GENERIC_READ	;разрешено чтение из файла
	push	offset lpBuf
	call	CreateFileA
	cmp	eax,0ffffffffh
	je	exit	;если неуспех
	mov	hFile,eax	;дескриптор файла
;-----------GetFileInformationByHandle------------------------------------
	push	offset info
	push	hFile
	call	GetFileInformationByHandle
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
