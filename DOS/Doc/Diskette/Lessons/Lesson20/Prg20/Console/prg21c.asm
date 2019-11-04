;prg21c.asm
;Пример консольного приложения для Win32
;(с использованием команд MMX-расширения и файлов, проецируемых в память)
.486
.model flat,STDCALL	;модель памяти flat,
;STDCALL - передача параметров в стиле С (справа налево), 
;	вызываемая процедура чистит за собой стек
%NOINCL	;запретить вывод текста включаемых файлов
include mmx32.inc
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
;структура bmp-файла	(по книге Тома Свана "Форматы файлов Windows")
;макроопределения типов
SSHORT	equ	<dw	0>
UINT	equ	<dw	0>
DDWORD	equ	<dd	0>
LONG	equ	<dd	0>
WWORD	equ	<dw	0>
BBYTE	equ	<db	0>
;структура для установки положения курсора в консоли:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
;заголовок bmp-файла
BitMapFileHeader	struc
bfType	UINT	;символы "B" и "М"
bfSize	DDWORD	;размер файла в байтах
bfReserved1	UINT	;резерв
bfReserved2	UINT	;резерв
bfOffBits	DDWORD	;смещение в байтах к началу растрового изображения
;характеристики растрового изображения
biSize	DDWORD	;размер данной структуры в байтах (должно быть равно 00000028h)
biWidth	LONG	;ширина изображения в пикселах
biHeight	LONG	;высота изображения в пикселах
biPlanes	WWORD	;число цветовых плоскостей (должно быть равно 1)
biBitCount	WWORD	;число бит на пиксел (должно быть равно 1, 4, 8, 24)
biCompression	DDWORD	;метод сжатия
biSizeImage	DDWORD	;размер собственно растрового изображения в байтах
biXPelsPerMeter	LONG	;разрешение по горизонтали в пикселах на метр	
biYPelsPerMeter	LONG	;разрешение по вертикали в пикселах на метр
biClrUsed	DDWORD	;число цветов в изображении
biClrImportant	DDWORD	;число важных цветов изображения
BitMapFileHeader	ends

.data
NumWri	dd	0
inFile	db	80 dup (20)
outFile	db	80 dup (20)
con	Coord	<>
hinFile	dd	0
houtFile	dd	0
hMapinFile	dd	0
hMapoutFile	dd	0
TitleText	db	'MMX преобразование bmp-файла',0
mes1	db	'Введите путь к исходному файлу TrueColor:'
len_mes1=$-mes1
mes2	db	'Введите путь к выходному файлу :'
len_mes2=$-mes2
mesErr1	db	'Это не bmp-файл:'
len_mesErr1=$-mesErr1
mesErr2	db	'Это не TrueColor-файл:'
len_mesErr2=$-mesErr2
mesRet	db	'Нажмите любую клавишу для выхода'
len_mesRet=$-mesRet
dOut	dd	0
dIn	dd	0
porog	label	dword
	dw	0000h	
	dw	004dh
	dw	0097h
	dw	001ch	;00 77 151 28
RabObl	dd	0	
	dd	0	
pixSizeLow	dd	0
pixSizeHi	dd	0
i8	dd	8
outFileSize	dd	0
initRMMX0	label	dword
	db	00,00,00,00,01,01,01,00		
initRMMX1	label	dword
	db	02,02,02,00,02,02,02,00		
PointOutRegion	dd 0
PointInRegion	dd 0

nWrByte	dd	0
temp	db	"B"
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
	mov	dOut,eax	;dOut-дескриптор ввода вывода консоли

	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-дескриптор ввода вывода консоли
;установим курсор в позицию (2,5)
	mov	con.xx,2
	mov	con.yy,5
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
;вывести приглашение на ввод имени исходного файла
	push	0
	push	offset NumWri	
	push	len_mes1
	push	offset mes1
	push	dOut
	call	WriteConsoleA
;установим курсор в позицию (2,6)
	mov	con.xx,2
	mov	con.yy,6
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех

	push	0
	push	offset NumWri	
	push	80
	push	offset inFile
	push	dIn
	call	ReadConsoleA
	lea	eax,inFile
	sub	NumWri,2
	add	eax,NumWri
	mov	[eax],byte ptr 0

;установим курсор в позицию (2,7)
	mov	con.xx,2
	mov	con.yy,7
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
;вывести приглашение на ввод имени выходного файла
	push	0
	push	offset NumWri	
	push	len_mes2
	push	offset mes2
	push	dOut
	call	WriteConsoleA
;установим курсор в позицию (2,8)
	mov	con.xx,2
	mov	con.yy,8
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех

	push	0
	push	offset NumWri	
	push	80
	push	offset outFile
	push	dIn
	call	ReadConsoleA
	lea	eax,outFile
	sub	NumWri,2
	add	eax,NumWri
	mov	[eax],byte ptr 0
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
	cmp	eax,0ffffffffh
	jz	exit	;неудача
	mov	hinFile,eax

;создание объекта ядра "проецируемый файл"  для исходного файла inFile
	push	NULL
	push	0	;размер файла - текущий
	push	0
	push	PAGE_READWRITE
	push	NULL
	push	hinFile
	call	CreateFileMappingA
;проверить успех 
	cmp	eax,0
	jz	exit	;неудача
	mov	hMapinFile,eax

;проецирование файловых данных  для исходного файла inFile на адресное пространство процесса
	push	NULL
	push	0	;смещение первого считываемого байта в файле
	push	0
	push	FILE_MAP_WRITE	
	push	hMapinFile
	call	MapViewOfFile
;проверить успех открытия файла
	cmp	eax,0
	jz	exit	;неудача
	mov	PointInRegion,eax
	mov	ebx,eax	;адрес начала исходного файла в памяти в ebx
;------------------ inFile -----------------------------------------------------
	mov	ebx,eax	;адрес файла в памяти в ebx
	cmp	[ebx].biSize,28h
	jne	exit_err1	;это не bmp-файл
	cmp	[ebx].biBitCount,18h
	jne	exit_err2	;это не TrueColor файл
;преобразование True -> Gray
;------------------ outFile ----------------------------------------------------
;открытие объекта ядра "файл" для выходного файла outFile
	push	NULL
	push	FILE_ATTRIBUTE_NORMAL
	push	OPEN_ALWAYS	
	push	NULL
	push	0
 	push	GENERIC_READ+GENERIC_WRITE	;разрешено чтение и запись в файл
	push	offset outFile	
	call	CreateFileA
;проверить успех 
	cmp	eax,0ffffffffh
	jz	exit	;неудача
	mov	houtFile,eax

;создание объекта ядра "проецируемый файл"  для выходного файла outFile
;;вычисляем длину выходного файла TrueColor в пикселах 
;(умножаем длину изображения на его высоту (в пикселах))
	mov	eax,[ebx].biWidth
	mul	dword ptr [ebx].biHeight
	mov	pixSizeLow,eax	;младшая половина размера растра в пикселах
	mov	pixSizeHi,edx	;старшая половина размера растра в пикселах
;в eax размер собственно растрового изображения в байтах
	add	eax,54+4*256	;54-размер фиксированного заголовка 
				;4*256-размер массива цветовых значений
;в eax размер выходного файла в байтах
	mov	outFileSize,eax

	push	NULL
	push	eax	;размер выходного файла
	push	NULL
	push	PAGE_READWRITE	;PAGE_WRITECOPY
	push	NULL
	push	houtFile
	call	CreateFileMappingA
;проверить успех 
	cmp	eax,0
	jz	exit	;неудача
	mov	hMapoutFile,eax

;проецирование файловых данных  для выходного файла outFile на адресное пространство процесса
	push	outFileSize
	push	0	;смещение первого считываемого байта в файле
	push	0
	push	FILE_MAP_WRITE	;FileMapAllAccess		
	push	hMapoutFile	
	call	MapViewOfFile
;проверить успех открытия файла
	cmp	eax,0
	jz	exit	;неудача
	mov	PointOutRegion,eax
	mov	edi,eax	;адрес начала выходного файла в памяти в edi

;формируем заголовок выходного файла:
	mov	ax,[ebx].bfType	
	mov	[edi].bfType,ax
	mov	eax,outFileSize	
	mov	[edi].bfSize,eax	;общий размер файла
	mov	[edi].bfReserved1,0
	mov	[edi].bfReserved2,0
	mov	[edi].bfOffBits,54+4*256
	mov	[edi].biSize,28h
	mov	eax,[ebx].biWidth
	mov	[edi].biWidth,eax	;ширина растра в пикселах
	mov	eax,[ebx].biHeight	
	mov	[edi].biHeight,eax	;высота растра в пикселах
	mov	[edi].biPlanes,1	;число цветовых плоскостей	
	mov	[edi].biBitCount,8	;число бит на пиксел
	mov	[edi].biCompression,0	;метод сжатия	
	mov	eax,outFileSize
	sub	eax,54+4*256
	mov	[edi].biSizeImage,eax	;размер собственно растрового изображения
	mov	eax,[ebx].biXPelsPerMeter	
	mov	[edi].biXPelsPerMeter,eax	;ширина растра в пикселах
	mov	eax,[ebx].biYPelsPerMeter	
	mov	[edi].biYPelsPerMeter,eax	;высота растра в пикселах
	mov	[edi].biClrUsed,100h	;число цветов в изображении	
	mov	[edi].biClrImportant,0	;число важных цветов в изображении
;формируем массив цветов
	add	edi,54
	mov	ecx,128
	movq	rmmx0,initRMMX0
	movq	rmmx1,initRMMX1	
	xor	esi,esi
m3:
	movq	[edi+esi*8],rmmx0
	paddusb	rmmx0,rmmx1
	dec	ecx
	inc	esi
	jcxz	m1
	jmp	m3
;------------------ outFile ----------------------------------------------------
m1:	
	mov	ecx,pixSizeLow
	add	edi,4*256	;[edi]-на начало собственно растрового изображения в выходном файле
	add	ebx,[ebx]+0ah	
	dec	ebx	;в ebx адрес в файле начала изображения - 1
	xor	esi,esi
;загрузка в регистры цветовых значений для преобразования
m2:	
	punpcklbw	rmmx0,[ebx][esi*4]
	psrlw	rmmx0,8
	pmullw	rmmx0,porog
	movq	rmmx1,rmmx0
	psllq	rmmx1,16
	paddusw	rmmx0,rmmx1
	psllq	rmmx1,16
	paddusw	rmmx0,rmmx1
	psrlw	rmmx0,8	;делим на 256	
	movq	RabObl,rmmx0
	mov	al,byte ptr RabObl+6
	mov	[edi],al
	add	ebx,3
	dec	ecx
	inc	edi
	jecxz	m5
	jmp	m2	;не забыть сделать для случая когда edx не пуст (большой файл)
m5:	jmp	exit
exit_err1:
;установим курсор в позицию (5,10)
	mov	con.xx,5
	mov	con.yy,10
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
;вывести сообщение об ошибке
	push	0
	push	offset NumWri	
	push	len_mes2
	push	offset mesErr1
	push	dOut
	call	WriteConsoleA
	jmp	exit	;return
exit_err2:
;установим курсор в позицию (5,10)
	mov	con.xx,5
	mov	con.yy,10
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
;вывести сообщение об ошибке
	push	0
	push	offset NumWri	
	push	len_mes2
	push	offset mesErr2
	push	dOut
	call	WriteConsoleA
;	jmp	return
;закрываем файлы
exit:
	emms
;установим курсор в позицию (5,12)
	mov	con.xx,5
	mov	con.yy,10
	push	con
	push	dOut
	call	SetConsoleCursorPosition
;вывести сообщение о нажатии любой клавиши
	push	0
	push	offset NumWri	
	push	len_mesRet
	push	offset mesRet
	push	dOut
	call	WriteConsoleA
	push	0
	push	offset NumWri	
	push	80
	push	offset inFile
	push	dIn
	call	ReadConsoleA	

	push	NULL
	push	PointInRegion
	call	FlushViewOfFile

	push	hinFile
	call	CloseHandle
	push	hMapinFile
	call	CloseHandle

	push	outFileSize	
	push	PointOutRegion
	call	FlushViewOfFile

	push	houtFile
	call	CloseHandle
	push	hMapoutFile
	call	CloseHandle
;выход из приложения
return:
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start