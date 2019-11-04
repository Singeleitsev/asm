;----------------------------------------------------------
;prg07_31.asm - Win32-программа консольного приложения для исследования работы с файлами на ассемблере - построчное чтение и вывод на экран содержимого файла.
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
extrn	GetModuleHandleA:PROC
extrn	GetModuleFileNameA:PROC
extrn	SearchPathA:PROC
extrn	GetFileSize:PROC
extrn	ReadFile:PROC
extrn	GetProcessHeap:PROC
extrn	HeapAlloc:PROC
;макроопределения типов
SSHORT	equ	<dw	0>
;структура для установки положения курсора в консоли:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
.data
lpBuf	db	260 dup (20h)
lpBufSize=$-lpBuf
lpNameFileInBuf	dd	0
sAsm	db	"asm"
hFile	dd	0
FileSize	dd	0
con	Coord	<>
TitleText	db	'Работа с файлами в Win32',0
dOut	dd	0	;дескриптор вывода консоли
dIn	dd	0	;дескриптор ввода консоли
HandHead	dd	0	;адрес кучи
p_start	dd	0	;адрес блока для текста программы из общей кучи процесса
NumWri	dd	0	;количество символов очередной строки, выведенной на экран
.code
start	proc	near
;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	ax,ax
	jz	exit	;неудача
;текст окна заголовка
	push	offset TitleText
	call	SetConsoleTitleA
;вывод строки текста
;вначале получим дескрипторы ввода и вывода консоли
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-дескриптор вывода консоли
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-дескриптор ввода консоли
;установим курсор в позицию (2,5)
	mov	con.xx,2
	mov	con.yy,5
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
;имя исходного файла программы получаем, исходя из двух предположений:
;1. имя исходного файла совпадает с именем его исполняемого модуля
;2. оба файла расположены либо в одном каталоге
;HMODULE GetModuleHandle(LPCTSTR lpModuleName);
	push	0
	call	GetModuleHandleA
;DWORD GetModuleFileName(HMODULE hModule,LPTSTR lpFilename,DWORD nSize);
	push	lpBufSize
	push	offset lpBuf
	push	eax	;описатель на этот .exe-файл, полученный GetModuleHandle
	call	GetModuleFileNameA
;в eax длина полного пути к исполняемому файлу (с расширением .exe)
	mov	lpNameFileInBuf,eax
;для получения имени исходного файла заменим расширение .exe на .asm
	std
	mov	esi,offset sAsm
	add	esi,2
	mov	edi,offset lpBuf
	dec	eax
	add	edi,eax
	push	ds
	pop	es
	mov	ecx,3
rep	movsb
;открываем файл
;HANDLE CreateFile(LPCTSTR lpFileName,DWORD dwDesiredAccess,DWORD ;dwShareMode,LPSECURITY_ATTRIBUTES lpSecurityAttributes,DWORD dwCreationDisposition,DWORD ;dwFlagsAndAttributes,HANDLE hTemplateFile);
	push	0
	push	0	;атрибуты (они игнорируются)
	push	OPEN_EXISTING	;открыть существующий файл, если его нет - ошибка
	push	0	;защита файла не требуется
	push	FILE_SHARE_READ	;разрешено совместное использование файла (по чтению)
	push	GENERIC_READ	;разрешено чтение из файла
	push	offset lpBuf
	call	CreateFileA
	cmp	eax,0ffffffffh
	je	exit	;если неуспех
	mov	hFile,eax	;дескриптор файла
;определим размер файла
;DWORD GetFileSize(HANDLE hFile,LPDWORD lpFileSizeHigh);
	push	0
	push	hFile
	call	GetFileSize
	cmp	eax,0
	jz	exit	;если неуспех
	mov	FileSize,eax	;сохраним размер файла
;выделяем блок в памяти, в который будем читать файл
;HandHead - адрес с описателем кучи
;используем кучу, выделяемую процессу по умолчанию
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	HandHead,eax
;запрашиваем блок памяти из кучи:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	FileSize
	push	0	;флаги не задаем
	push	HandHead	;описатель кучи
	call	HeapAlloc
	mov	p_start,eax	;адрес блока с текстом программы из общей кучи процесса
;читаем файл
;BOOL ReadFile(HANDLE hFile,LPVOID lpBuffer,DWORD nNumberOfBytesToRead,LPDWORD lpNumberOfBytesRead,LPOVERLAPPED lpOverlapped);
	push	0
	push	offset FileSize	;сколько байт прочитано реально
	push	FileSize
	push	p_start	;буфер, в который читаем файл
	push	hFile
	call	ReadFile
	cmp	eax,0
	jz	exit	;если неуспех
;теперь можно построчно и на экран
;устанавливаем курсор
;установим курсор в позицию (2,5)
	mov	con.xx,1
	mov	con.yy,5
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
	cld
	mov	edi,p_start
	mov	esi,p_start
	mov	ecx,FileSize
cycl:
	mov	al,0dh
repne	scasb
	cmp	byte ptr [edi],0ah
	jne	$-5
	inc	edi
	dec	ecx
	jecxz	exit	;весь файл прочитан
	mov	eax,edi
	sub	eax,esi	;в eax - длина строки для вывода на экран, а в esi - ее адрес
;вывести очередную строку
;сохраним то, что скоро портиться
	push	eax
	push	ecx
	push	0
	push	offset NumWri
	push	eax
	push	esi
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;если неуспех
;достанем консервацию
	pop	ecx
	pop	eax
	add	esi,eax
	jmp	cycl
;закрываем файлы
exit:
;выход из приложения
return:
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
