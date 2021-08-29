;----------------------------------------------------------
;prg07_36.asm - Win32-консольное приложение для исследования порядка использования файлов, проецируемых в память.
;----------------------------------------------------------
.486
.model flat, STDCALL	;модель памяти flat
;STDCALL - передача параметров в стиле С (справа налево)
;вызываемая процедура чистит за собой стек
%NOINCL	;запретить вывод текста включаемых файлов
include	WindowConA.inc
;Объявление внешними используемых в данной программе функций Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	SetConsoleTitleA:PROC
extrn	ExitProcess:PROC
extrn	GetStdHandle:PROC
extrn	CreateFileA:PROC
extrn	CreateFileMappingA:PROC
extrn	MapViewOfFile:PROC
extrn	UnmapViewOfFile:PROC
extrn	CloseHandle:PROC
extrn	FlushFileBuffers:PROC
extrn	FlushViewOfFile:PROC
extrn	WriteFile:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	ReadConsoleA:PROC
extrn	WriteConsoleA:PROC
extrn	GetFileSize:PROC
;макроопределения типов
SSHORT	equ	<dw	0>
;структура для установки положения курсора в консоли:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
.data
TitleText	db	'Пример использования отображенных в память файлов',0
NumWri	dd	0
inFile	db	80 dup (20)
con	Coord	<>
xxx	dw	0
yyy	dw	0
FileSize	dd	0	;размер файла
hinFile	dd	0
hMapinFile	dd	0
mes1	db	'Введите путь к исходному файлу:'
len_mes1=$-mes1
dOut	dd	0
dIn	dd	0
PointInRegion	dd	0
.code
start	proc	near
;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	ax, ax
	jz	exit	;неудача
;текст окна заголовка
	push	offset TitleText
	call	SetConsoleTitleA
;вывод строки текста
;вначале получим дескрипторы ввода и вывода консоли
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut, eax	;dOut-дескриптор ввода вывода консоли
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn, eax	;dIn-дескриптор ввода вывода консоли
;установим курсор в позицию (2, 5)
	mov	con.xx, 2
	mov	con.yy, 5
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax, 0
	jz	exit	;если неуспех
;вывести приглашение на ввод имени исходного файла
	push	0
	push	offset NumWri
	push	len_mes1
	push	offset mes1
	push	dOut
	call	WriteConsoleA
;установим курсор в позицию (2, 6)
	mov	con.xx, 2
	mov	con.yy, 6
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax, 0
	jz	exit	;если неуспех
	push	0
	push	offset NumWri	
	push	80
	push	offset inFile
	push	dIn
	call	ReadConsoleA	;читаем имя входного файла
	lea	eax, inFile
	sub	NumWri, 2
	add	eax, NumWri
	mov	[eax], byte ptr 0	;сформировали ASCIIZ-строку
;------------------ inFile -----------------------------------------------------
;открытие объекта ядра "файл" для исходного файла inFile
	push	NULL
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_ALWAYS
	push	NULL
	push	0
	push	GENERIC_READ+GENERIC_WRITE	;разрешено чтение и запись в файл
	push	offset inFile
	call	CreateFileA
;проверить успех
	cmp	eax, 0ffffffffh
	jz	exit	;неудача
	mov	hinFile, eax
;создание объекта ядра "проецируемый файл" для исходного файла inFile
	push	NULL
	push	0	;размер файла - текущий
	push	0
	push	PAGE_READWRITE
	push	NULL
	push	hinFile
	call	CreateFileMappingA
;проверить успех
	cmp	eax, 0
	jz	exit	;неудача
	mov	hMapinFile, eax
;проецирование файловых данных для исходного файла inFile на адресное пространство процесса
	push	NULL
	push	0	;смещение первого считываемого байта в файле
	push	0
	push	FILE_MAP_WRITE
	push	hMapinFile
	call	MapViewOfFile
;проверить успех открытия файла
	cmp	eax, 0
	jz	exit	;неудача
	mov	PointInRegion, eax
	mov	ebx, eax	;адрес начала исходного файла в памяти в ebx
;------------------ inFile -----------------------------------------------------
;определим размер файла
;DWORD GetFileSize(HANDLE hFile,LPDWORD lpFileSizeHigh);
	push	0
	push	hinFile
	call	GetFileSize
	cmp	eax,0
	jz	exit	;если неуспех
	mov	FileSize,eax	;сохраним размер файла
;------------------------------------------------------------------------------
;вывод на экран
;установим курсор в начальную позиция (0,0))
cycl:
	mov	ax,xxx
	mov	con.xx,ax
	mov	ax,yyy
	mov	con.yy,ax
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
;------------------- WriteConsoleA----------------------------------------
	push	0	;зарезервирован
	push	offset NumWri	;действительное количество выведенных символов
	push	FileSize	;длина выводимой строки (для простоты равна длине файла)
	push	PointInRegion	;указатель на начало выводимой строки в отображении файла
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
;	jz	exit	;если неуспех - можно не делать, так как все равно закрывать объекты ядра
;------------------------------------------------------------------------
;разрываем связь файла на диске и его отображения
	push	NULL
	push	PointInRegion
	call	FlushViewOfFile
;закрываем объекты ядра "проекция файла" и "файл"
	push	hinFile
	call	CloseHandle
	push	hMapinFile
	call	CloseHandle
;выход из приложения
exit:
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
