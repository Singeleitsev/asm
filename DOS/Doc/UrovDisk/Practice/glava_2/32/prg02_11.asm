;--------------------------------------------------------------------------------;
;prg02_11.asm - программа построения и инициализации конечного автомата.
;Вход: символьная строка представляющая вещественное число в научном формате.
;Выход: вывод на сообщения о результате распознавания.
;--------------------------------------------------------------------------------;
.486
.model flat,STDCALL	;модель памяти flat,
;STDCALL - передача параметров в стиле С (справа налево), 
;	вызываемая процедура чистит за собой стек
%NOINCL	;запретить вывод текста включаемых файлов
include	WindowConA.inc
;Объявление внешними используемых в данной программе функций Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	ExitProcess:PROC
extrn	GetProcessHeap:PROC
extrn	GetStdHandle:PROC
extrn	HeapAlloc:PROC
extrn	HeapFree:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	WriteConsoleA:PROC
;макроопределения типов
SSHORT	equ	<dw	0>
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
;объявления структур и макроопределений:
item_list_state	struc	;элемент списка состояний
prev_state	dd	0	;адрес предыдущего элемента состояния
id_state_state	db	0	;идентификатор состояния - двоичное значение (0..n)
current_state	dd	0	;адрес элемента текущего состояния
point_cross	dd	0	;указатель на начало списка переходов для этого состояния
ends
create_list_state	macro	Hand_Head:REQ,descr:REQ,head:REQ, N_state:REQ
;создание списка состояний
;вход:
;Hand_Head - дескриптор кучи процесса по умолчанию
;descr - имя структуры-элемента списка состояний
;N_state - количество состояний
;выход:
;head - имя переменной для хранения указателя на конец списка состояний
;сохраняем регистры
	push	eax
	push	ebx
;используем кучу, выделяемую процессу по умолчанию (1 Мбайт), но при необходимости можно создать и доп. кучу с помощью HeapCreate
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	Hand_Head,eax	;сохраняем дескриптор
;запрашиваем и инициализируем блоки памяти из кучи:
	xor	ebx,ebx	;здесь будут указатели на предыдущ. элементы
	xor	ecx,ecx	;dl ? номер элемента состояния (двоичный)
rept	N_state
	push	ecx
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	type descr	;размер структуры
	push	0	;флаги не задаем
	push	Hand_Head	;описатель кучи
	call	HeapAlloc
	mov	[eax].prev_state,ebx	;запоминаем адрес предыдущ. (if ebx=0, то это первый)
	mov	ebx,eax	;запоминаем адрес текущего в ebx
	mov	[eax].current_state,eax	;и в descr.current_state
	pop	ecx
	mov	[eax].id_state_state,cl
	inc	cl
endm
;указатель на последний элемент списка состояний в поле-указатель на начало списка head
	mov	head,ebx
;восстанавливаем регистры
	pop	ebx
	pop	eax
endm
item_list_cross	struc	;элемент списка переходов
simbol	db	0	;входной символ, при котором автомат переходит в состояние ниже (поля id_state_cross и next_item)
id_state_cross	db	0	;идентификатор состояния в списке состояний, в которое производится переход
point_state	dd	0	;адрес элемента состояния, в которое производится переход
next_item	dd	0	;адрес следующего элемента в списке переходов для этого состояния
ends
create_item_cross	macro	sim:REQ,state:REQ,descr:REQ,head:REQ, Hand_Head:REQ
local	m1,@@cycl,exit_m
;создание элемента списка переходов для определенного состояния
;вход:
;регистр ebx - адрес предыдущего (для поля descr.next_item).Для первого должен быть равен нулю
;sim - символ ASCII, при поступлении которого производится переход в состояние state
;descr - имя структуры-элемента списка переходов
;state - номер состояния, в которое производится переход (если двузначное, то в скобках <>)
;head - имя переменной для хранения указателя на конец списка состояний
;Hand_Head - дескриптор кучи процесса по умолчанию
;выход:
;регистр ebx - адрес созданного элемента списка переходов
;флаг cf=1 - ошибка: нет такого состояния
;сохраняем регистры
	push	eax
;запрашиваем и инициализируем блок памяти из кучи:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	type descr	;размер структуры
	push	0	;флаги не задаем
	push	Hand_Head	;описатель кучи
	call	HeapAlloc
	mov	[eax].next_item,ebx	;адрес предыдущего
	mov	ebx,eax	;запоминаем адрес текущего
	mov	[eax].simbol,"&sim"	;инициализируем поле simbol текущего элемента
	mov	[eax].id_state_cross,state	;номер состояния в поле descr.id_state_cross
;теперь нужно определить адрес элемента в списке состояний state для выполнения дальнейших переходов и инициализации поля point_state
	push	ebx
	mov	ebx,head
	clc
@@cycl:
	cmp	[ebx].id_state_state,state
	je	m1
	jc	exit_m
	mov	ebx,[ebx].prev_state	;адрес предыдущего состояния в списке состояний
	cmp	ebx,0	;последний элемент?
	jne	@@cycl
	stc
	jmp	@@cycl
m1:	;нашли!
	mov	[eax].point_state,ebx
exit_m:
;восстанавливаем регистры
	pop	ebx
	pop	eax
endm

def_point_item_state	macro	N_state:REQ,head:REQ
local	@@cy,@@m1
;сохраняем регистры
;вход:
;N_state - номер состояния
;head - имя ячейки, где хранится указатель на список состояний
;выход: регистр ebx - адрес элемента в списке состояний
	mov	eax,head
@@cy:
	cmp	[eax].id_state_state,N_state	;ищем …
	je	@@m1	;нашли?
	mov	eax,[eax].prev_state	;адрес следующего состояния
	cmp	eax,0	;последний элемент?
	jne	@@cy
	stc	;cf=1 если состояния с таким номером не существует
	jmp	@@cy
@@m1:	;нашли!
endm
.data
string	db	"+3.0e-5"	;строка с вещественным числом для тестирования
l_string=$-string
HeadListState	dd	0	;указатель на хвост списка состояний
CurState	db	0	;номер текущего состояния
Heap_proc	dd	0	;дескриптор кучи процесса по умолчанию (Hand_Head)
dOut	dd	0	;дескриптор вывода консоли
NumWri	dd	0	;количество символов очередной строки, выведенной на экран
mes_e	db	"Лексема вещественного числа неправильная"
len_mes_e=$-mes_e
mes_ok	db	"O'key"
len_mes_ok=$-mes_e
con	Coord	<>
.code
start	proc	near
;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	ax,ax
	jz	exit	;неудача
;получим дескриптор вывода консоли
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-дескриптор вывода консоли
;создаем односвязный список состояний
create_list_state	Heap_proc,item_list_state, HeadListState,10
;создаем список переходов для состояния 0
	xor	ebx,ebx	;для первого вызова create_item_cross для состояния 0
irpc	simb,<+->
create_item_cross	simb,1,item_list_cross,HeadListState,Heap_proc
endm
irpc	simb,<0123456789>
create_item_cross	simb,2,item_list_cross,HeadListState,Heap_proc
endm
;в ebx адрес последнего элемента в списке переходов состояния 0
;теперь нужно определить адрес элемента состояния 0 для привязки полученного списка переходов
def_point_item_state	0,HeadListState
;привязываем список переходов состояния 0 к элементу состояния 0 в списке состояний
	mov	[eax].point_cross,ebx
;то же для остальных состояний
;создаем список переходов для состояния 1
	xor	ebx,ebx	;для первого вызова create_item_cross для состояния 1
irpc	simb,<0123456789>
create_item_cross	simb,2,item_list_cross,HeadListState,Heap_proc
endm
;в ebx адрес последнего элемента в списке переходов состояния 1
;теперь нужно определить адрес элемента состояния 1 для привязки полученного списка переходов
def_point_item_state	1,HeadListState
;привязываем список переходов состояния 1 к элементу состояния 1 в списке состояний
	mov	[eax].point_cross,ebx
;создаем список переходов для состояния 2
	xor	ebx,ebx	;для первого вызова create_item_cross для состояния 2
irpc	simb,<0123456789>
create_item_cross	simb,2,item_list_cross,HeadListState,Heap_proc
endm
create_item_cross	<.>,3,item_list_cross,HeadListState,Heap_proc
;в ebx адрес последнего элемента в списке переходов состояния 2
;теперь нужно определить адрес элемента состояния 2 для привязки полученного списка переходов
def_point_item_state	2,HeadListState
;привязываем список переходов состояния 2 к элементу состояния 2 в списке состояний
	mov	[eax].point_cross,ebx
;создаем список переходов для состояния 3
	xor	ebx,ebx	;для первого вызова create_item_cross для состояния 3
irpc	simb,<0123456789>
create_item_cross	simb,4,item_list_cross,HeadListState,Heap_proc
endm
;в ebx адрес последнего элемента в списке переходов состояния 3
;теперь нужно определить адрес элемента состояния 3 для привязки полученного списка переходов
def_point_item_state	3,HeadListState
;привязываем список переходов состояния 3 к элементу состояния 3 в списке состояний
	mov	[eax].point_cross,ebx
;создаем список переходов для состояния 4
	xor	ebx,ebx	;для первого вызова create_item_cross для состояния 4
irpc	simb,<0123456789>
create_item_cross	simb,4,item_list_cross,HeadListState,Heap_proc
endm
create_item_cross	<e>,5,item_list_cross,HeadListState,Heap_proc
create_item_cross	< >,9,item_list_cross,HeadListState,Heap_proc
;в ebx адрес последнего элемента в списке переходов состояния 4
;теперь нужно определить адрес элемента состояния 4 для привязки полученного списка переходов
def_point_item_state	4,HeadListState
;привязываем список переходов состояния 4 к элементу состояния 4 в списке состояний
	mov	[eax].point_cross,ebx
;создаем список переходов для состояния 5
	xor	ebx,ebx	;для первого вызова create_item_cross для состояния 5
irpc	simb,<+->
create_item_cross	simb,6,item_list_cross,HeadListState,Heap_proc
endm
irpc	simb,<0123456789>
create_item_cross	simb,7,item_list_cross,HeadListState,Heap_proc
endm
;в ebx адрес последнего элемента в списке переходов состояния 5
;теперь нужно определить адрес элемента состояния 5 для привязки полученного списка переходов
def_point_item_state	5,HeadListState
;привязываем список переходов состояния 5 к элементу состояния 5 в списке состояний
	mov	[eax].point_cross,ebx
;создаем список переходов для состояния 6
	xor	ebx,ebx	;для первого вызова create_item_cross для состояния 6
irpc	simb,<0123456789>
create_item_cross	simb,7,item_list_cross,HeadListState,Heap_proc
endm
;в ebx адрес последнего элемента в списке переходов состояния 6
;теперь нужно определить адрес элемента состояния 6 для привязки полученного списка переходов
def_point_item_state	6,HeadListState
;привязываем список переходов состояния 6 к элементу состояния 6 в списке состояний
	mov	[eax].point_cross,ebx
;создаем список переходов для состояния 7
	xor	ebx,ebx	;для первого вызова create_item_cross для состояния 7
irpc	simb,<0123456789>
create_item_cross	simb,7,item_list_cross,HeadListState,Heap_proc
endm
create_item_cross	< >,9,item_list_cross,HeadListState,Heap_proc
;в ebx адрес последнего элемента в списке переходов состояния 7
;теперь нужно определить адрес элемента состояния 7 для привязки полученного списка переходов
def_point_item_state	7,HeadListState
;привязываем список переходов состояния 7 к элементу состояния 7 в списке состояний
	mov	[eax].point_cross,ebx
;конечный автомат создан, проверяем работу на примере строки string
	lea	esi,string
	mov	ecx,l_string
;номер текущего состояния в регистр dl
	mov	dl,CurState
@@cycl2:
;ищем адрес элемента текущего состояния
def_point_item_state	dl,HeadListState	;адрес в eax
;читаем посимвольно строку
	mov	bl,[esi]	;очередной символ в bl
;пошли по списку переходов текущего состояния
	mov	eax,[eax].point_cross	;в eax адрес первого элемента в списке переходов для этого состояния
;сравниваем символ в элементе списка переходов с символом строки string
@@cycl1:
	cmp	[eax].simbol,bl
	je	next_cur_state
	cmp	[eax].next_item,0	;это последний элемент
	je	exit_error	;переход по ошибке - лексема не правильная
;переходим к следующему элементу в списке переходов
	mov	eax,[eax].next_item
	jmp	@@cycl1
next_cur_state:
;делаем следующее состояние текущим
	mov	dl,[eax].id_state_cross
	inc	esi
	loop	@@cycl2
;анализируем, в каком состоянии оказался наш сканер - если это одно из конечных состояний, то успех (4(S4) или 7(S7)) или неуспех - любое другое состояние:
	cmp	dl,4
	je	exit_ok
	cmp	dl,7
	je	exit_ok
;выход из приложения
exit_error:
;действия по ошибке (лексема не правильная) - вывод сообщения
;установим курсор в позицию (2,5)
	mov	ax,2
	mov	con.xx,ax
	mov	ax,5
	mov	con.yy,ax
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
	lea	ebx,mes_e
	mov	eax,len_mes_e
	push	0	;зарезервирован
	push	offset NumWri	;действительное количество выведенных символов
	push	eax	;длина строки
	push	ebx	;указатель на строку
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;если неуспех
	jmp	exit
exit_ok:
;действия по успешному распознаванию лексемы - вывод сообщения
;установим курсор в позицию (2,5)
	mov	ax,2
	mov	con.xx,ax
	mov	ax,5
	mov	con.yy,ax
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
	lea	ebx,mes_ok
	mov	eax,len_mes_ok
	push	0	;зарезервирован
	push	offset NumWri	;действительное количество выведенных символов
	push	eax	;длина строки
	push	ebx	;указатель на строку
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;если неуспех
exit:
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
