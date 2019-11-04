;--------------------------------------------------------------------------------;
;prg15_102.asm - реализация программы инвертирования строки с двусвязными списками
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
prev	dd	0	;адрес предыдущего элемента
info	db	0	;содержательная часть (в нашем случае - символ)
next	dd	0	;адрес следующего элемента
ends
Head_list	struc	;структура - заголовок списка
first	dd	0	;адрес первого элемента двусвязного списка
info	db	0ffh	;0ffh - признак заголовка списка
last	dd	0	;адрес последнего элемента двусвязного списка
ends
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
.data
mas	db	80 dup (' ')	;в эту строку вводим
mas_rev	db	80 dup (' ')	;из этой строки выводим
len_mas_rev=$-mas_rev
Hand_Head	dd	0
Doubly_Head_list	Head_list	<>;заголовок списка
con	Coord	<>
dOut	dd	0
dIn	dd	0
NumWri	dd	0
mes1	db	'Введите строку символов (до 80) для инвертирования (с точкой на конце):'
len_mes1=$-mes1
.code
;описание макрокоманд работы со связанным списком:
create_doubly_list	macro	head:REQ
;используем кучу, выделяемую процессу по умолчанию (1 Мбайт), но при необходимости можно создать и доп. кучу с помощью HeapCreate
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	Hand_Head,eax	;сохраняеи дескриптор
;создание списка - формирование головы списка
;head - имя переменной для хранения заголовка двусвязного списка
	mov	head.first,offset head
	mov	head.last,offset head
endm
add_list	macro	descr:REQ,head:REQ,H_Head:REQ
;добавление элемента в двусвязный список
;вход:
;descr - имя структуры-элемента списка
;head - имя переменной для хранения заголовка двусвязного списка
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
	mov	ebx,eax	;в ebx адрес блока памяти для формирования нового элемента списка
;формируем поля связи в последнем (перед добавлением), добавляемом (новом) элементе и заголовке списка
	mov	[ebx].next,offset head
	mov	eax,head.last
	mov	[ebx].prev,eax
	mov	[eax].next,ebx
	mov	head.last,ebx
;теперь нужно присвоить полю [ebx].info нового элемента списка нужное значение
;восстанавливаем регистры
	pop	eax
endm

start	proc	near
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
;создаем связанный список, для чего инициализируем заголовок списка
	create_doubly_list	Doubly_Head_list
;вводим символы строки с клавиатуры до тех пор, пока не встретится "."
	lea	esi,mas
cycl:
	mov	al,[esi]
	cmp	al,"."
	je	rev_out
	add_list	item_list,Doubly_Head_list,Hand_Head
	mov	[ebx].info,al
	inc	esi
	jmp	cycl
;вывод строки в обратном порядке
rev_out:
	mov	esi,offset mas_rev
	mov	ebx,Doubly_Head_list.last
cycl2:
	mov	al,[ebx].info
	mov	[esi],al
	inc	esi
	mov	ebx,[ebx].prev
	cmp	[ebx].info,0ffh	;дошли до последнего элемента списка?
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
;задержим ввод до нажатия любой клавиши
	push	0
	push	offset NumWri
	push	80
	push	offset mas
	push	dIn
	call	ReadConsoleA
exit:
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
