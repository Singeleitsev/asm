;--------------------------------------------------------------------------------;
;prg4_67_d.asm - поиск строки P в массиве строк (файле). Длина строк определяется динамически.
;Вход: текстовый файл shaltai.txt и строка P ("Шалтай").
;Выход: сообщение о количестве вхождений строки P в строки файла shaltai.txt.
;--------------------------------------------------------------------------------;
masm
.486
.model flat,STDCALL	;модель памяти flat,
;STDCALL - передача параметров в стиле С (справа налево), 
;	вызываемая процедура чистит за собой стек
%NOINCL	;запретить вывод текста включаемых файлов
include	WindowConA.inc
;Объявление внешними используемых в данной программе функций Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	ExitProcess:PROC
extrn	GetStdHandle:PROC
extrn	CreateFileA:PROC
extrn	GetFileSize:PROC
extrn	ReadFile:PROC
extrn	GetProcessHeap:PROC
extrn	HeapAlloc:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	WriteConsoleA:PROC
extrn	ReadConsoleA:PROC
;макроопределения типов
SSHORT	equ	<dw	0>
;объявления структур:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
.data
mes	db	"Вхождений строки - "
;задаем массив P - аргумент поиска
p	db	"Балта"	;цель поиска - слово "Балта" в файле shaltai.txt
len_p=$-p
	db	" - "
	db	"в строку файла "
	db	0	;старшая часть преобразованного номера строки
n_str_f	db	0	;младшая часть преобразованного номера строки
	db	" - "
count	db	0	;счетчик вхождений P в S (однозначный)
Len_disp=$-mes
Hand_Head	dd	0	;описатель кучи
lpBuf	db	'shaltai.txt'	;имя файла
lpBufSize=$-lpBuf
hFile	dd	0	;дескриптор файла
FileSize	dd	0	;размер файла
buf_start	dd	0	;адрес блока для текста программы из общей кучи процесса
dOut	dd	0	;дескриптор вывода консоли
dIn	dd	0	;дескриптор ввода консоли
con	Coord	<>
;начальные значения координат для вывода на экран
xxx	dw	1	;
yyy	dw	1	;
NewNode	dd	0
NumWri	dd	0
.stack	256
.code
start	proc	near	;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	ax,ax
	jz	exit	;неудача
; получим дескрипторы ввода и вывода консоли
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-дескриптор вывода консоли
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-дескриптор ввода консоли
;для размещения файла используем кучу, выделяемую процессу по умолчанию (1 Мбайт)
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	Hand_Head,eax	;сохраняем дескриптор
;читаем файл в динамически выделяемую область памяти
;открываем файл
;HANDLE CreateFile(LPCTSTR lpFileName,DWORD dwDesiredAccess,DWORD ;dwShareMode,LPSECURITY_ATTRIBUTES lpSecurityAttributes,DWORD dwCreationDisposition,DWORD ;dwFlagsAndAttributes,HANDLE hTemplateFile);
	push	0
	push	0	;атрибуты (они игнорируются)
	push	OPEN_EXISTING	;открыть существующий файл, если его нет ? ошибка
	push	0	;защита файла не требуется
	push	FILE_SHARE_READ	;разрешено совместное использование файла (по чтению)
	push	GENERIC_READ	;разрешено чтение из файла
	push	offset lpBuf	;имя файла
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
;запрашиваем блок памяти из кучи:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	FileSize
	push	0	;флаги не задаем
	push	Hand_Head	;описатель кучи
	call	HeapAlloc
	mov	buf_start,eax	;адрес блока с текстом программы из общей кучи процесса
;читаем файл
;BOOL ReadFile(HANDLE hFile,LPVOID lpBuffer,DWORD nNumberOfBytesToRead,LPDWORD lpNumberOfBytesRead,LPOVERLAPPED lpOverlapped);
	push	0
	push	offset FileSize	;сколько байт прочитано реально
	push	FileSize
	push	buf_start	;буфер, в который читаем файл
	push	hFile
	call	ReadFile
	cmp	eax,0
	jz	exit	;если неуспех
push	ds
pop	es
	cld
	mov	ecx,FileSize
	mov	edi,buf_start	;адрес буфера с текстом файла в edi
cycl1:
push	ecx
push	edi
	mov	ebx,ecx
	mov	al,0dh	;0dh ->al
repne	scasb
	jcxz	e_exit
	jmp	$+7
e_exit:	jmp	exit
pop	edi
	sub	ebx,ecx
	xchg	ebx,ecx
	mov	al,p	;P[0]->al
next_search:
repne	scasb
	jcxz	end_str	;достигнут конец строки
;проверяем возможное совпадение
push	ecx
	lea	esi,p
	inc	esi
	mov	ecx,len_p-1
repe	cmpsb
	jz	eq_substr
;строка p <> подстроке в s
	mov	edx,len_p-1
	sub	edx,ecx
pop	ecx
	sub	ecx,edx	;учли пройденное при сравнении cmpsb
	jmp	next_search
end_str:
	inc	edi
	inc	ebx
	xchg	ebx,ecx
;преобразуем в символьное представление счетчик вхождений count
	mov	al,count
	aam
	add	ax,3030h
	lea	esi,count
	mov	[esi-1],ah
	mov	[esi],al
;вывод на экран
push	ecx	;1 - сохраняем, так как портится стек функциями API Win32
;установим курсор в начальную позицию (1,1)
	mov	ax,xxx
	mov	con.xx,ax
	mov	ax,yyy
	mov	con.yy,ax
	inc	xxx
	inc	yyy
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
	mov	eax,Len_disp
	lea	ebx,mes
	push	0	;зарезервирован
	push	offset NumWri	;действительное количество выведенных символов
	push	eax	;длина строки
	push	ebx	;указатель на строку
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;если неуспех
	mov	count,0	;обнуляем счетчик вхождений в строку
pop	ecx	;1 - восстанавливаем
	jmp	cycl1
eq_substr:
pop	ecx
	sub	ecx,len_p-1	;учли пройденное при сравнении cmpsb
	inc	count
	jmp	next_search
exit:
pop	ecx	;1
;выход из программы - задержим ввод до нажатия любой клавиши
	push	0
	push	offset NumWri
	push	4
	push	offset NewNode	;этот адрес любой
	push	dIn
	call	ReadConsoleA
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
