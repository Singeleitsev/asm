;--------------------------------------------------------------------------------;
;prg12_51.asm - программа проверки правильности расстановки
;скобок в тексте - иллюстрируется работа со стеком
;Вход: строка символов.
;Выход: сообщение на экран о том согласованы скобки или нет.
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
desc_stk	struc	;дескриптор стека
;имя стека - имя экземпляра структуры
;перед обращением к макрокомандам необходимо проинициализировать поля структуры size_stk и size_item
p_start	dd	0	;адрес блока (начала области памяти для стека) из общей кучи процесса
size_stk	dd	0	;размер стека в байтах
p_top	dd	0	;адрес вершины стека
size_item	dd	1	;размер элемента стека в байтах (по умолчанию 1 байт)
Hand_Head	dd	0	;описатель общей кучи процесса
ends
.data
temp	db	0
char_stk	desc_stk	<>
string	db	"a<a(kk{k)p>pp"
l_string=$-string
dOut	dd	0	;дескриптор вывода консоли
NumWri	dd	0	;количество символов очередной строки, выведенной на экран
mes_e	db	"Ошибка - скобки несогласованы"
len_mes_e=$-mes_e
mes_ok	db	" Ок, скобки согласованы"
len_mes_ok=$-mes_ok
con	Coord	<>
.code
;описание макрокоманд работы со стеком:
create_stk	macro	descr:REQ,SizeStk:=<256>
;создание стека
;descr - имя структуры-дескриптора стека
;SizeStk - размер стека в байтах (по умолчанию 256 байт)
;сохраняем регистры
	push	eax
;используем кучу, выделяемую процессу по умолчанию
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	descr.Hand_Head,eax
	mov	descr.size_stk,SizeStk
;запрашиваем блок памяти из кучи:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	SizeStk
	push	0	;флаги не задаем
	push	eax	;описатель кучи
	call	HeapAlloc
	mov	descr.p_start,eax	;адрес блока из общей кучи процесса
	mov	descr.p_top,eax	;дублируем для вершины
;восстанавливаем регистры
	pop	eax
endm
init_stk	macro	descr:REQ
;очистка стека (удаление всех элементов без удаления самого стека)
;descr - имя структуры-дескриптора стека
;сохраняем регистры
	push	eax
;используем кучу, выделяемую процессу по умолчанию
	mov	eax,descr.p_start	;адрес блока из общей кучи процесса
	mov	descr.p_top,eax
;восстанавливаем регистры
	pop	eax
endm
delete_stk	macro	descr:REQ
;удаление стека
;для этого освобождаем блок
;descr - имя структуры-дескриптора стека
;BOOL HeapFree(HANDLE hHeap, DWORD dwFlags, LPVOID lpMem);
	push	descr.p_start
	push	0
	push	descr.Hand_Head
	call	HeapFree
endm
push_stk	macro	descr:REQ,adr_item:REQ
;добавление элемента в стек
;descr - имя структуры-дескриптора стека
;adr_item - адрес добавляемого элемента в памяти, размер его должен соответствовать size_item
;сохраняем регистры
	push	ecx
	mov	ecx,descr.size_item
	mov	esi,adr_item
	mov	edi,descr.p_top
rep	movsb
	mov	descr.p_top,edi
;восстанавливаем регистры
	pop	ecx
endm
TestEmptyStk	macro	descr:REQ,label_err:REQ
;проверка на пустоту стека
;label_err - метка, на которую необходимо перейти в случае, если стек пуст
	mov	eax, descr.p_top
	cmp	eax, descr.p_start
	je	label_err
endm
pop_stk	macro	descr:REQ,adr_item:REQ
local	exit_pop,m1
;извлечение элемента из стека в область памяти
;descr - имя структуры-дескриптора стека
;adr_item - адрес элемента в памяти, в который извлекается вершина стека
;сохраняем регистры
;после вызова макро необходимо проверить cf: если cf=1 => ошибка, стек пуст
	push	ecx
	push	esi
	mov	ecx,descr.size_item
	mov	esi,descr.p_top
	cmp	esi,descr.p_start
	jne	m1
	stc	;cf=1 => стек пуст
	jmp	exit_pop
m1:
	sub	esi,descr.size_item
	mov	descr.p_top,esi
	mov	edi,adr_item
rep	movsb
exit_pop:	;восстанавливаем регистры
	pop	esi
	pop	ecx
endm
TestTopStk	macro	descr:REQ,adr_item:REQ
;извлечение элемента из вершины стека без его удаления оттуда
;descr - имя структуры-дескриптора стека
;adr_item - адрес элемента в памяти, в который помещается значение элемента из вершины стека
;сохраняем регистры
	push	ecx
	mov	ecx,descr.size_item
	mov	edi,descr.p_top
	sub	edi,descr.size_item
	mov	descr.p_top,edi
	mov	esi,adr_item
rep	movsb
;восстанавливаем регистры
	pop	ecx
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
;создание стека
	create_stk	char_stk
;анализируем строку
	mov	ecx,l_string
	lea	ebx,string
	jmp	cycl
e_xit:	jmp	exit
cycl:	jcxz	e_xit
	cmp	byte ptr [ebx],"("
	je	m_push
	cmp	byte ptr [ebx],"["
	je	m_push
	cmp	byte ptr [ebx],"{"
	je	m_push
	cmp	byte ptr [ebx],"<"
	je	m_push
	cmp	byte ptr [ebx],")"
	jne	m1
;извлекаем элемент из вершины стека и анализируем его
	TestEmptyStk	char_stk,mes_error
	pop_stk	char_stk,<offset temp>
	cmp	temp,"("
	jne	mes_error
	jmp	r_next
m1:	cmp	byte ptr [ebx],"]"
	jne	m2
;извлекаем элемент из вершины стека и анализируем его
	TestEmptyStk	char_stk,mes_error
	pop_stk	char_stk,<offset temp>
	cmp	temp,"["
	jne	mes_error
	jmp	r_next
m2:	cmp	byte ptr [ebx],"}"
	jne	m3
;извлекаем элемент из вершины стека и анализируем его
	TestEmptyStk	char_stk,mes_error
	pop_stk	char_stk,<offset temp>
	cmp	temp,"{"
	jne	mes_error
	jmp	r_next
m3:	cmp	byte ptr [ebx],">"
	jne	r_next
;извлекаем элемент из вершины стека и анализируем его
	TestEmptyStk	char_stk,mes_error
	pop_stk	char_stk,<offset temp>
	cmp	temp,"<"
	jne	mes_error
	jmp	r_next
m_push:
;включение скобки в стек
	push_stk	char_stk,ebx
r_next:
	add	ebx,char_stk.size_item
	dec	ecx
	jmp	cycl
mes_error:	;вывод на экран сообщения об ошибке
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
	jmp	exit_exit
exit:
;определяем стек на пустоту 
	pop_stk	char_stk,<offset temp>
	jnc	mes_error	;стек не пуст
;вывод на экран
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
;выход из приложения
exit_exit:
;удаляем блок памяти со стеком
	delete_stk	char_stk
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
