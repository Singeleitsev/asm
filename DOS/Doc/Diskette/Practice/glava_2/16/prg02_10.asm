;--------------------------------------------------------------------------------;
;prg02_10.asm - пример приложения для Win32
;(работа с кольцевой очередью) с использованием функций
;API Win32 для работы с кучей
;Вход: строка символов, содержащая буквы и цифры.
;Выход: нет. В динамике работа программы наблюдается под управлением отладчика.
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
desc_que	struc	;дескриптор очереди
;имя очереди - имя экземпляра очереди
;перед обращением к макрокомандам необходимо проинициализировать поля структуры size_que и size_item_que
p_start_que	dd	0	;адрес блока (начала области памяти для очереди) из общей кучи процесса (A1)
p_end_que	dd	0	;адрес конца блока в общей куче процесса (Amax)
size_que	dd	0	;размер очереди в байтах
p_head	dd	0	;указатель головы очереди (P1)
p_tail	dd	0	;указатель хвоста очереди (P2)
size_item_que	dd	1	;размер элемента очереди в байтах (по умолчанию 1 байт)
Hand_Head	dd	0	;описатель общей кучи процесса
ends
.data
char_que	desc_que	<>
string	db	"gfvfvds4gdff2gfd9gfff7ddf3gdf1teeeeee6gfd9sdgdf4"
l_string=$-string
temp	db	0
dOut	dd	0	;дескриптор вывода консоли
NumWri	dd	0	;количество символов очередной строки, выведенной на экран
mes_e	db	"Очередь переполнена"
len_mes_e=$-mes_e
con	Coord	<>
.code
;описание макрокоманд работы с очередью:
create_que	macro	descr:REQ,SizeQue:REQ
;создание очереди
;descr - имя структуры-дескриптора стека
;SizeQue - размер очереди (задается явно, значения по умолчанию нет!)
;сохраняем регистры
	push	eax
;используем кучу, выделяемую процессу по умолчанию
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	descr.Hand_Head,eax
	mov	descr.size_que,SizeQue
;запрашиваем блок памяти из кучи:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	descr.size_que	;размер очереди
	push	0	;флаги не задаем
	push	eax	;описатель кучи
	call	HeapAlloc
	mov	descr.p_start_que,eax	;адрес блока из общей кучи процесса
	mov	descr.p_head,eax	;указатель головы очереди
	mov	descr.p_tail,eax	;указатель хвоста очереди
	add	eax,SizeQue
	mov	descr.p_end_que,eax	;адрес конца блока из общей кучи процесса
;восстанавливаем регистры
	pop	eax
endm
delete_que	macro	descr:REQ
;удаление очереди
;для этого освобождаем блок
;descr - имя структуры-дескриптора очереди
;BOOL HeapFree(HANDLE hHeap, DWORD dwFlags, LPVOID lpMem);
	push	descr.p_start_que
	push	0
	push	descr.Hand_Head
	call	HeapFree
endm
push_que	macro	descr:REQ,adr_item:REQ
local	exit,m1,m2,m5
;добавление элемента в очередь [2]
;в случае неудачи (переполения очереди) cf=1
;descr - имя структуры-дескриптора очереди
;adr_item - адрес добавляемого элемента в памяти, размер его должен соответствовать size_item_que
;сохраняем регистры
	push	ecx
	push	esi
	push	edi
	push	ebx
;указатели головы и хвоста в esi и edi
	mov	esi,descr.p_head
	mov	edi,descr.p_tail
;1 - достигнут конец блока памяти, выделенного для очереди?
	cmp	descr.p_end_que,edi
	je	m5
;2 - проверяем заполненность очереди
	mov	ebx,edi
	add	ebx,descr.size_item_que
	cmp	ebx,esi
	jne	m1
	stc	;cf=1 - места в очереди нет => выходим
	jmp	exit
;3 - заносим элемент в очередь
m1: 	clc
	mov	ecx,descr.size_item_que
	mov	esi,adr_item
	mov	edi,descr.p_tail
rep	movsb
;4 - модификация указателя
	mov	descr.p_tail,edi	;поправляем указатель на хвост
	jmp	exit	;выходим
;5 - проверяем заполненность очереди
m5:
	cmp	descr.p_start_que,esi
	jne	m2
	stc	;cf=1 - места в очереди нет => выходим
	jmp	exit
;6 - заносим элемент в очередь
m2:	clc
	mov	ecx,descr.size_item_que
	mov	esi,adr_item
	mov	edi,descr.p_tail
rep	movsb
;7 - модификация указателя
	mov	edi,descr.p_start_que
	mov	descr.p_tail,edi	;указатель на хвост = адресу начала блока
;выходим
exit:
;восстанавливаем регистры
	pop	ebx
	pop	edi
	pop	esi
	pop	ecx
endm
pop_que	macro	descr:REQ,adr_item:REQ
local	exit,m1,m2,m5
;извлечение элемента из очереди [2]
;в случае неудачи (если очередь пуста) - cf=1
;descr - имя структуры-дескриптора очереди
;adr_item - адрес области памяти, куда извлекается элемент (ее размер должен соответствовать size_item_que)
;сохраняем регистры
	push	ecx
	push	esi
	push	edi
;указатели головы и хвоста в esi и edi
	mov	esi,descr.p_head
	mov	edi,descr.p_tail
;1 - проверка наличия элементов в очереди
	cmp	esi,edi
	jne	m1
	stc	;очередь пуста
	jmp	exit	;на выход
;2 - извлечение элемента
m1:
	mov	ecx,descr.size_item_que
	mov	esi,descr.p_head
	mov	edi,adr_item
rep	movsb
	dec	esi
;удаляемый элемент замещаем двоичным нулем
	mov	edi,esi
	xor	al,al
	stosb
;3-4 - корректируем указатель на голову
	cmp	esi,descr.p_end_que
	jne	m2
	mov	esi,descr.p_start_que
	mov	descr.p_head,esi	;указатель на голову = адресу начала блока
	jmp	exit	;на выход
m2:
	add	esi,descr.size_item_que	;корректируем указатель на голову
	mov	descr.p_head,esi
;выходим
exit:
;восстанавливаем регистры
	pop	edi
	pop	esi
	pop	ecx
endm
init_que	macro	descr:REQ
;очистка очереди (удаление всех элементов без удаления самой очереди)
;descr - имя структуры-дескриптора очереди
;сохраняем регистры
	push	eax
;используем кучу, выделяемую процессу по умолчанию
	mov	eax,descr.p_start_que	;адрес блока из общей кучи процесса
	mov	descr.p_head,eax
	mov	descr.p_tail,eax
;восстанавливаем регистры
	pop	eax
endm
TestEmptyQue	macro	descr:REQ
local	exit
	push	eax
;проверка на пустоту очереди
	mov	eax,descr.p_head
	cmp	eax,descr.p_tail
	jne	exit
	stc	;cf=1 - очередь пуста
exit:
	pop	eax
endm
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
;создание очереди
	create_que	char_que,10
;читаем символы строки
	lea	esi,string
	mov	ecx,l_string+1	;+1 для обработки всех элементов, включая последний
	push	ecx
	jmp	cycl
e_xit:	jmp	exit
cycl:	pop	ecx
	jcxz	e_xit
	lodsb	;в al очередной символ строки
	dec	ecx
	push	ecx
;анализируем очередной символ строки
	cmp	al,31h
	jb	m1
	cmp	al,39h
	ja	m1
;удаляем из очереди элементы
	xor	ecx,ecx
	mov	cl,al
	sub	cl,30h	;преобразуем символ цифры в двоичный эквивалент
m2:	pop_que	char_que,<offset temp>
	jc	cycl	;если очередь пуста
	loop	m2
	jmp	cycl
;добавляем элементы в очередь
m1:
	mov	temp,al
	push_que	char_que, <offset temp>
	jnc	cycl	;успех
;вывод на экран сообщения об ошибке - отсутствие места в очереди
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
	jmp	cycl
;выход из приложения
exit:
;удаляем блок памяти с очередью
	delete_que	char_que
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
