;--------------------------------------------------------------------------------;
;prg15_102.asm - реализация программы инвертирования строки с односвязными списками
;Вход: символьная строка с клавиатуры.
;Выход: вывод на экран инвертированной обратной строки.
;--------------------------------------------------------------------------------;
.486
.model flat,STDCALL	;модель памяти flat,
;STDCALL - передача параметров в стиле С (справа налево), 
;	вызываемая процедура чистит за собой стек
include	WindowConA.inc
;Объявление внешними используемых в данной программе функций Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	ExitProcess:PROC
extrn	GetStdHandle:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	GetProcessHeap:PROC
extrn	HeapAlloc:PROC
extrn	HeapFree:PROC
extrn	ReadConsoleA:PROC
extrn	WriteConsoleA:PROC
;макроопределения типов
SSHORT	equ	<dw	0>
item_list	struc	;элемент списка
next	dd	0	;адрес следующего элемента
info	db	0	;содержательная часть (в нашем случае - символ)
ends
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
.data
;char_item	item_list	<>
mas	db	80 dup (' ')	;в эту строку вводим
mas_rev	db	80 dup (' ')	;из этой строки выводим
len_mas_rev=$-mas_rev
Hand_Head	dd	0
Head_list	dd	0ffffffffh	;указатель на начало списка (0ffffffffh - список пуст)
con	Coord	<>
dOut	dd	0
dIn	dd	0
NumWri	dd	0
mes1	db	'Введите строку символов (до 80) для инвертирования (с точкой на конце):'
len_mes1=$-mes1
.code
;описание макрокоманд работы со связанным списком:
create_list	macro	descr:REQ,head:REQ
;создание списка - формирование головы списка и первого элемента
;descr - имя структуры-элемента списка
;head - имя переменной для хранения указателя на начало списка
;сохраняем регистры
	push	eax
;используем кучу, выделяемую процессу по умолчанию (1 Мбайт),
;но при необходимости можно создать и доп. кучу с помощью HeapCreate
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	Hand_Head,eax	;сохраняеи дескриптор
;запрашиваем блок памяти из кучи:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	type descr	;размер структуры
	push	0	;флаги не задаем
	push	eax	;описатель кучи Hand_Head
	call	HeapAlloc
	mov	ebx,eax
;указатель на элемент в указатель на начало списка head
	mov	eax,head
	mov	[ebx].next,eax
	mov	head,ebx
;теперь нужно проинициализировать поле info первого элемента списка [ebx].info
;восстанавливаем регистры
	pop	eax
endm
add_list	macro	descr:REQ,head:REQ,H_Head:REQ
;добавление элемента в связанный список
;вход:
;descr - имя структуры-элемента списка
;head - имя переменной для хранения указателя на начало списка
;H_Head - имя переменной, в которой хранится дескриптор кучи
;сохраняем регистры
	push	eax
;запрашиваем блок памяти из кучи под новый элемент списка:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	type descr	;размер структуры
	push	0	;флаги не задаем
	mov	eax,H_Head
	push	eax	;описатель кучи Hand_Head
	call	HeapAlloc
	mov	ebx,eax
;указатель на элемент в указатель на начало списка head
	mov	eax,head
	mov	[ebx].next,eax
	mov	head,ebx
;теперь нужно присвоить полю [ebx].info нового элемента списка нужное значение
;восстанавливаем регистры
	pop	eax
endm
create_item	macro	descr:REQ,H_Head:REQ
;создание элемента в куче для последующего добавления в связанный список
;вход:
;descr - имя структуры-элемента списка
;H_Head - имя переменной, в которой хранится дескриптор кучи
;выход: регистр edx - адрес выделенной области памяти для элемента в куче
;сохраняем регистры
	push	eax
;запрашиваем блок памяти из кучи под новый элемент списка:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	type descr	;размер структуры
	push	0	;флаги не задаем
	mov	eax,H_Head
	push	eax	;описатель кучи Hand_Head
	call	HeapAlloc
	mov	edx,eax
;теперь в программе нужно присвоить полям нового элемента списка нужные значения
;восстанавливаем регистры
	pop	eax
endm
start	proc	near
;точка входа в программу:
;точка входа в программу: запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	ax,ax
	jz	exit	;неудача
;вывод строки текста - приглашения на ввод строки для инвертирования
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
;вывести приглашение на строки
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
	push	offset mas
	push	dIn
	call	ReadConsoleA
;создаем связанный список
create_list	item_list,Head_list
;первый элемент обрабатываем отдельно
	lea	esi,mas
	mov	al,[esi]
	cmp	al,"."
	je	rev_out
	mov	[ebx].info,al
;вводим остальные символы строки с клавиатуры до тех пор пока не встретится "."
cycl:	inc	esi
	mov	al,[esi]
	cmp	al,"."
	je	rev_out
	add_list	item_list,Head_list,Hand_Head
	mov	[ebx].info,al
	jmp	cycl
;вывод строки в обратном порядке
rev_out:
	mov	esi,offset mas_rev
	mov	ebx,Head_list
cycl2:
	mov	al,[ebx].info
	mov	[esi],al
	inc	esi
	mov	ebx,[ebx].next
	cmp	ebx,0ffffffffh
	jne	cycl2
;выводим инвертированную строку на экран
;установим курсор в позицию (2,7)
	mov	con.xx,2
	mov	con.yy,7
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
;вывести инвертированную строку
	push	0
	push	offset NumWri
	push	len_mas_rev
	push	offset mas_rev
	push	dOut
	call	WriteConsoleA
;выход из приложения
exit:
;задержим ввод до нажатия любой клавиши
	push	0
	push	offset NumWri
	push	80
	push	offset mas
	push	dIn
	call	ReadConsoleA
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
