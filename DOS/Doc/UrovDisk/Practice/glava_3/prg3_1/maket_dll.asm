;----------------------------------------------------------
;		dll
;----------------------------------------------------------
.486
locals
.model flat,STDCALL	;модель памяти flat,
;STDCALL - передача параметров в стиле С (справа налево), 
;	вызываемая процедура чистит за собой стек
%NOINCL	;запретить вывод текста включаемых файлов
include	WindowConA.inc
;Объявление внешними используемых в данной программе функций Win32 (ASCII):
extrn	GetStdHandle:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	SetConsoleTextAttribute:PROC
extrn	WriteConsoleA:PROC
extrn	ExitProcess:PROC
extrn	GetVersion:proc
extrn	Ellipse:proc
extrn	InvalidateRect:proc
;объявление процедур DLL-библиотеки общедоступными
publicdll	WriteCon
publicdll	DrawPattern_1
publicdll	DrawPattern_2
;макроопределения типов
SSHORT	equ	<dw	0>
;структура для установки положения курсора в консоли:
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
.data
con	Coord	<>
dIn	dd	0	;дескриптор ввода консоли
dOut	dd	0	;дескриптор вывода консоли
NumWri	dd	0	;количество действительно введенных-выведенных символов
.code
;минимальный код инициализации закоментирован
;dllEntry	proc	
;arg	@@hInst:dword,	@@event:dword,@@no_use:dword
;@@m:		mov	eax,1
;		ret
;dllEntry	endp	
WriteCon	proc	
arg	@@adr_str:dword,@@len_str:dword
;получим стандартные дескрипторы ввода-вывода
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-дескриптор вывода консоли
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-дескриптор ввода консоли
;выведем строку
;установим курсор в позицию (2,6)
	mov	con.xx,2
	mov	con.yy,6
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax, 0
	jz	exit	;если неуспех
;выведем строку в окно консоли с различных позиций и с разными цветами
;курсор в позиции (2,6)
	mov	ecx,10	;строку выведем 10 раз
	mov	bl,10000001b	;начальные атрибуты
m1:
push	ecx
	inc	con.xx
	inc	con.yy
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
;определим атрибуты выводимых символов - будем получать их циклически сдвигом - регистр bl
	xor	eax,eax
	rol	bl,1
	mov	al,bl
	push	eax
	push	dOut
	call	SetConsoleTextAttribute
	cmp	eax,0
	jz	exit	;если неуспех
;вывести строку
	push	0
	push	offset NumWri	;действительное количество выведенных на экран
	push	@@len_str	;Len_TitleText	;длина строки для вывода на экран
	push	@@adr_str	;offset TitleText	;адрес строки для вывода на экран
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;если неуспех
pop	ecx
	loop	m1
exit:
	mov	eax,0ffffffffh
	mov	edx,0ffffffffh
	mov	ebx,0ffffffffh
	mov	ecx,0ffffffffh
	ret
endp	WriteCon
DrawPattern_1	proc
;-------------------------------------------------------------------
;DrawPattern_1 - рекурсивная процедура рисования узора (без использования локальных переменных)
;-------------------------------------------------------------------
arg	@@hwnd:dword,@@hdc:dword,@@x:dword,@@y:dword,@@r:dword,@@p:dword
;рисуем окружность
;рекурсивно вызываем DrawPattern_1(hwnd,hdc,x,y,r,p)
;BOOL Ellipse(HDC hdc, int nLeftRect, int nTopRect, int nRightRect,int nBottomRect); 
	mov	eax,@@y
	sub	eax,@@r
	push	eax	;y-координата нижнего правого угла описывающего окружность прямоугльника
	mov	eax,@@x
	sub	eax,@@r
	push	eax	;x-координата нижнего правого угла описывающего окружность прямоугльника
	mov	eax,@@y
	add	eax,@@r
	push	eax	;y-координата верхнего левого угла описывающего окружность прямоугльника
	mov	eax,@@x
	add	eax,@@r
	push	eax	;x-координата верхнего левого  угла описывающего окружность прямоугльника
	push	@@hdc	;контекст устройства
	call	Ellipse	;рисуем окружность
;	jz	@@End_Draw
;и еще четыре меньшего порядка
	dec	@@p
	cmp	@@p,0
	je	@@End_Draw
	shr	@@r,1	;делим на 2
;(x-r,y)
	push	@@p	;порядок узора
	push	@@r	;радиус окружности
	push	@@y	;y-координата
	mov	eax,@@x
	sub	eax,@@r
	push	eax	;x-координата
	push	@@hdc	;контекст устройства
	push	@@hwnd
	call	DrawPattern_1
;(x+r,y)
	push	@@p	;порядок узора
	push	@@r	;радиус окружности
	push	@@y	;y-координата
	mov	eax,@@x
	add	eax,@@r
	push	eax	;x-координата
	push	@@hdc	;контекст устройства
	push	@@hwnd
	call	DrawPattern_1
;(x,y-r)
	push	@@p	;порядок узора
	push	@@r	;радиус окружности
	mov	eax,@@y
	sub	eax,@@r
	push	eax	;y-координата
	push	@@x	;x-координата
	push	@@hdc	;контекст устройства
	push	@@hwnd
	call	DrawPattern_1
;(x,y+r)
	push	@@p	;порядок узора
	push	@@r	;радиус окружности
	mov	eax,@@y
	add	eax,@@r
	push	eax	;y-координата
	push	@@x	;x-координата
	push	@@hdc	;контекст устройства
	push	@@hwnd
	call	DrawPattern_1
@@End_Draw:
;генерация сообщения WM_PAINT для вывода изображения на экран
	push	0
	push	NULL
	push	@@hwnd
	call	InvalidateRect
	ret
endp	DrawPattern_1
DrawPattern_2	proc	
;-------------------------------------------------------------------
;DrawPattern_2 - рекурсивная процедура рисования узора (c использования локальных переменных)
;-------------------------------------------------------------------
arg	@@hwnd:dword,@@hdc:dword,@@x:dword,@@y:dword,@@r:dword,@@p:dword
;рисуем окружность
;рекурсивно вызываем DrawPattern_2(hwnd,hdc,x,y,r,p)
;BOOL Ellipse(HDC hdc, int nLeftRect, int nTopRect, int nRightRect,int nBottomRect); 
	dec	@@p
	cmp	@@p,0
	je	@@End_Draw
	shr	@@r,1	;делим на 2
;сохраняем в стеке параметры для Ellipse
	mov	eax,@@y
	sub	eax,@@r
	push	eax	;y-координата нижнего правого угла описывающего окружность прямоугльника
	mov	eax,@@x
	sub	eax,@@r
	push	eax	;x-координата нижнего правого угла описывающего окружность прямоугльника
	mov	eax,@@y
	add	eax,@@r
	push	eax	;y-координата верхнего левого угла описывающего окружность прямоугльника
	mov	eax,@@x
	add	eax,@@r
	push	eax	;x-координата верхнего левого  угла описывающего окружность прямоугльника
	push	@@hdc	;контекст устройства
;вызываем DrawPattern для изображения еще четырех окружностей меньшего порядка
;(x-r,y)
	push	@@p	;порядок узора
	push	@@r	;радиус окружности
	push	@@y	;y-координата
	mov	eax,@@x
	sub	eax,@@r
	push	eax	;x-координата
	push	@@hdc	;контекст устройства
	push	@@hwnd
	call	DrawPattern_2
;(x+r,y)
	push	@@p	;порядок узора
	push	@@r	;радиус окружности
	push	@@y	;y-координата
	mov	eax,@@x
	add	eax,@@r
	push	eax	;x-координата
	push	@@hdc	;контекст устройства
	push	@@hwnd
	call	DrawPattern_2
;(x,y-r)
	push	@@p	;порядок узора
	push	@@r	;радиус окружности
	mov	eax,@@y
	sub	eax,@@r
	push	eax	;y-координата
	push	@@x	;x-координата
	push	@@hdc	;контекст устройства
	push	@@hwnd
	call	DrawPattern_2
;(x,y+r)
	push	@@p	;порядок узора
	push	@@r	;радиус окружности
	mov	eax,@@y
	add	eax,@@r
	push	eax	;y-координата
	push	@@x	;x-координата
	push	@@hdc	;контекст устройства
	push	@@hwnd
	call	DrawPattern_2
@@End_Draw:
;рисуем окружности на обратном ходе
;BOOL Ellipse(HDC hdc, int nLeftRect, int nTopRect, int nRightRect,int nBottomRect); 
	push	ebp
	mov	ebp,[esp]
	push	[ebp-4]
	push	[ebp-8]
	push	[ebp-12]
	push	[ebp-16]
	push	[ebp-20]
	call	Ellipse	;рисуем окружность
	pop	ebp
	ret
endp	DrawPattern_2
end	
;dllEntry

