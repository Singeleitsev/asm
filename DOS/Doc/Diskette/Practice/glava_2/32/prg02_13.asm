;--------------------------------------------------------------------------------;
;prg02_13.asm - программа обхода двоичного дерева поиска (слева направо).
;Вход: произвольный масиив чисел в памяти.
;Выход: двоичное дерево в памяти.
;--------------------------------------------------------------------------------;
.486
.model flat,STDCALL	;модель памяти flat,
;STDCALL - передача параметров в стиле С (справа налево), 
;	вызываемая процедура чистит за собой стек
locals
;Объявление внешними используемых в данной программе функций Win32 (ASCII):
extrn	AllocConsole:PROC
extrn	ExitProcess:PROC
extrn	GetProcessHeap:PROC
extrn	HeapAlloc:PROC
extrn	HeapFree:PROC
;объявления структур:
node_tree	struc	;узел дерева
simbol	db	0	;содержательная часть
l_son	dd	0	;указатель на старшего (левого) сына
r_son	dd	0	;указатель на младшего (правого) сына
ends

;для программного стека
desc_stk	struc	;дескриптор стека
;имя стека - имя экземпляра структуры
;перед обращением к макрокомандам необходимо проинициализировать поля структуры size_stk и size_item
p_start	dd	0	;адрес блока (начала области памяти для стека) из общей кучи процесса
size_stk	dd	0	;размер стека в байтах
p_top	dd	0	;адрес вершины стека
size_item	dd	4	;размер элемента стека в байтах (по умолчанию 4 байта)
HandHead	dd	0	;описатель общей кучи процесса
ends

;описание макрокоманд работы со стеком:

create_stk	macro	HandHead:REQ,descr:REQ,SizeStk:=<256>
;создание стека
;HandHead - адрес с описателем кучи
;descr - имя структуры-дескриптора стека
;SizeStk - размер стека в байтах (по умолчанию 256 байт)
;сохраняем регистры
	push	eax
;используем кучу, выделяемую процессу по умолчанию
;HANDLE GetProcessHeap (VOID);
;	call	GetProcessHeap
;	mov	descr.HandHead,eax
	mov	descr.size_stk,SizeStk
;запрашиваем блок памяти из кучи:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	SizeStk
	push	0	;флаги не задаем
	push	HandHead	;описатель кучи
	call	HeapAlloc
	mov	descr.p_start,eax	;адрес блока из общей кучи процесса
	mov	descr.p_top,eax	;дублируем для вершины
;восстанавливаем регистры
	pop	eax
endm

push_stk	macro	descr:REQ,rg_item:REQ
;добавление элемента в стек
;descr - имя структуры-дескриптора стека
;rg_item - регистр, содержимое которого добавляется в стек, размер его должен соответствовать size_item
;сохраняем регистры
	push	ecx
;	push	esi
	push	edi

	mov	ecx,descr.size_item
;	mov	esi,adr_item
	mov	edi,descr.p_top
	mov	[edi],rg_item
	add	descr.p_top,ecx
;восстанавливаем регистры
	pop	edi
;	pop	esi
	pop	ecx
endm

pop_stk	macro	descr:REQ, rg_item:REQ
local	exit_pop,m1
;извлечение элемента из стека
;descr - имя структуры-дескриптора стека
;rg_item - регистр, в который извлекается содежимое вершины стека, размер его должен соответствовать size_item
;cf=1 - при попытке чтения из пустого стека
;сохраняем регистры
	push	ecx
	push	esi
;	push	edi
	mov	ecx,descr.size_item
	sub	descr.p_top,ecx
	mov	ecx,descr.p_top
	cmp	ecx,descr.p_start
	jae	m1
	stc
	jmp	exit_pop
m1:	mov	esi,descr.p_top
	mov	rg_item,[esi]
;	mov	esi,adr_item
;rep	movsb
;восстанавливаем регистры
;	pop	edi
exit_pop:
	pop	esi
	pop	ecx
endm
.data
;исходный массив:
mas	db	37h,12h,8h,65h,4h,54h,11h,02h,32h,5h,4h,87h,7h,21h,65h,45h,22h,11h,77h,51h,26h,73h,35h,12h,49h,37h,52h
l_mas=$-mas
;упорядоченный массив (результат см. в отладчике):
ordered_array	db	l_mas dup (0)
Hand_Head	dd	0	;описатель кучи
HeadTree	dd	0	;указатель на корень дерева
NewNode	dd	0	;временная переменная
;информация для стека:
;дескриптор стека:
doubleWord_stk	desc_stk	<>
count_call	dd	0	;счетчик количества рекурсивного вызова процедуры
.code
BuildBinTree	proc
;формируем корень дерева и указатель на дерево HeadTree
;для размещения дерева используем кучу, выделяемую процессу по умолчанию (1 Мбайт), но при необходимости можно создать и доп. кучу с помощью HeapCreate
;HANDLE GetProcessHeap (VOID);
	call	GetProcessHeap
	mov	Hand_Head,eax	;сохраняеи дескриптор
;запрашиваем и инициализируем блок памяти из кучи для корня дерева:
	xor	ebx,ebx	;здесь будет указатель на предыдущий узел
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	type node_tree	;размер структуры для узла дерева
	push	0	;флаги не задаем
	push	eax	;описатель кучи (он же в Hand_Head)
	call	HeapAlloc
	mov	HeadTree,eax	;запоминаем указатель на корень дерева
	mov	ebx,eax	;и в ebx
;подчистим выделенную область памяти в куче
	push	ds
	pop	es
	mov	edi,eax
	mov	ecx,type node_tree
	mov	al,0
rep	stosb
;первое число из mas в корень дерева
	lea	esi,mas
	lodsb	;число в al
	mov	[ebx].simbol,al
;далее в цикле работаем с деревом и массивом mas
	mov	ecx,l_mas-1
@@cycl1:
	push	ecx	;HeapAlloc портит ecx
;запрашиваем блок памяти из кучи для узла дерева:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	type node_tree	;размер структуры для узла дерева
	push	0	;флаги не задаем
	push	Hand_Head	;описатель кучи
	call	HeapAlloc
	pop	ecx
	mov	ebx,eax	;запоминаем указатель на узел дерева в ebx
	mov	NewNode,eax	;и во врем. перем.
;подчистим выделенную область памяти в куче
	mov	edi,eax
	push	ecx
	mov	ecx,type node_tree
	mov	al,0
rep	stosb
	pop	ecx
;читаем очередное число из mas и записываем его в новый узел
	lodsb	;число в al
	mov	[ebx].simbol,al
;ищем место в дереве согласно условиям упорядочивания и настраиваем указатели в узлах дерева
	mov	ebx,HeadTree
m_search:
	cmp	al,[ebx].simbol
	mov	edi,ebx	;продублируем
	jae	m1	;если al >= [ebx].simbol 
;если меньше, то идем по левой ветке
	mov	ebx,[ebx].l_son
	cmp	ebx,0
	jne	m_search
;если этого сына нет, то добавляем его к папе
	mov	ebx,NewNode
	mov	[edi].l_son,ebx
	jmp	end_cycl1
;если больше или равно, то по правой
m1:
	mov	ebx,[ebx].r_son
	cmp	ebx,0
	jne	m_search
;если этого сына нет, то добавляем его к папе
	mov	ebx,NewNode
	mov	[edi].r_son,ebx
end_cycl1:
	loop	@@cycl1
;двоичное дерево поиска построено
	ret
BuildBinTree	endp
LRBeat	proc
;рекурсивная процедура обхода дерева - слева направо (левое поддерево, корень, правое поддерево)
	inc	count_call	;подсчет количества вызовов процедуры (для согласования количества записей и извлечений из стека)
	cmp	ebx,0
	je	@@exit_p
	mov	ebx,[ebx].l_son
	cmp	ebx,0
	je	@@m1
	push_stk	doubleWord_stk,ebx
@@m1:	call	LRBeat
	pop_stk	doubleWord_stk,ebx
	jnc	@@m2
;подчистим за собой стек и на выход
	mov	ecx,count_call
	dec	ecx
	pop	NewNode	;pop "в никуда"
	loop	$-6
	jmp	@@exit_p
@@m2:	mov	al,[ebx].simbol
	stosb
	mov	ebx,[ebx].r_son
cmp	ebx,0
je	@@m1
push_stk	doubleWord_stk,ebx
	call	LRBeat
@@exit_p:
	dec	count_call
	ret
LRBeat	endp
start	proc	near
;точка входа в программу:
;формируем двоичное дерево поиска
	call	BuildBinTree
;обходим узлы двоичного дерева слева направо и извлекаем значения из содержательной части
;нам понадобится свой стек (размер (256 байт) нас устроит, но макроопределение мы подкорректировали)
	create_stk	Hand_Head,doubleWord_stk
	push	ds
	pop	es
	lea	edi,ordered_array
	mov	ebx,HeadTree
push_stk	doubleWord_stk,ebx	;указатель на корень в наш стек
	call	LRBeat
exit:
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
