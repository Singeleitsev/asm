;--------------------------------------------------------------------------------;
;prg02_15.asm - программа обхода двоичного дерева поиска (слева направо) c возможностью удаления узла (процедура delNodeTree)
;полный текст на дискете
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
delItem	db	17	;удаляемый элемент

.code
delNodeTree	proc
	inc	count_call	;подсчет количества вызовов процедуры (для согласования количества записей и извлечений из стека)
	cmp	ebx,0	;дерево пустое или элемента со значением delItem в дереве нет
	je	@@exit_pp	;выход, если это так
	cmp	al,[ebx].simbol	;al<[ebx].simbol
	jae	@@m1	;переход, если нет
lea	edi,[ebx].l_son
	mov	ebx,[ebx].l_son
	call	delNodeTree
	jmp	@@exit_p	;выход
@@m1:
	cmp	al,[ebx].simbol	;al>[ebx].simbol
	jbe	@@m2	;переход, если нет
lea	edi,[ebx].r_son	;
	mov	ebx,[ebx].r_son
	call	delNodeTree
	jmp	@@exit_p	;выход
@@m2:
;элемент найден, т.е. al=[ebx].simbol
;удаление элемента с одним потомком (младшим или старшим)
	cmp	[ebx].r_son,0
	jne	@@m3
	mov	eax,ebx
	mov	ebx,[ebx].l_son
	mov	[edi],ebx
	jmp	@@m_del
@@m3:
	cmp	[ebx].l_son,0
	jne	@@m4
	mov	eax,ebx
	mov	ebx,[ebx].r_son
	mov	[edi],ebx
	jmp	@@m_del
@@m4:
;удаление элемента с двумя потомками - для этого существует отдельная процедура del (рекурсивная)
	mov	eax,[ebx].l_son
;адрес поля с адресом младшего (левого) сына для случая, если он не имеет правого потомка
	lea	edi,[ebx].l_son
	call	del	;передаваемые параметры - указатели в eax и ebx, адрес в edi
@@m_del:
;удаление элемента (освобождение памяти)
;BOOL HeapFree(HANDLE hHeap,  // handle to heap 
;DWORD dwFlags, // heap free options 
;LPVOID lpMem   // pointer to memory);
	push	eax	;адрес освобождаемого блока
	push	0
	push	Hand_Head	;описатель кучи
	call	HeapFree
@@exit_pp:	;на эту метку переход, если дерево пустое или элемента со значением delItem в дереве нет
;подчистим за собой стек и на выход
	mov	ecx,count_call
	dec	ecx
	jecxz	$+10	;на команду "jmp	@@exit_p	;и на выход"
	pop	NewNode	;pop "в никуда"
	loop	$-6
	jmp	@@exit_p	;и на выход
@@exit_p:
	dec	count_call
	ret
delNodeTree	endp
del	proc
;вспомогательная рекурсивная процедура исключения узла из дерева [4]
;на входе - регистры eax и ebx
;в eax адрес ближайшего левого узла для удаляемого элемента - мы должны спуститься вдоль его самой правой ветви
;edi - адрес поля с адресом младшего (левого) сына для случая если он не имеет правого потомка
	inc	count_call	;подсчет количества вызовов процедуры
	cmp	[eax].r_son,0
	je	@@m1
	lea	edi,[eax].r_son	;адрес со старшим сыном у папы
	mov	eax,[eax].r_son
	call	del
	jmp	@@exit_p
@@m1:
;переписываем содержательную часть из самого правого элемента в содержательную часть удаляемого элемента
	push	eax
	mov	al,[eax].simbol
	mov	[ebx].simbol,al
	pop	eax
	push	eax
;настраиваем ссылку на сына у его папы
	mov	eax,[eax].l_son
	mov	[edi],eax
	pop	eax
@@exit_p:	
	dec	count_call
	ret
del	endp
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
;точка входа в программу prg02_13.asm:
;формируем двоичное дерево поиска
	call	BuildBinTree
;готовимся и вызываем delNodeTree для удаления из дерева узла со значением delItem
;ebx= содержимое указателя на корень дерева (mov	ebx,HeadTree)
;al=delItem - исключаемый элемент размером в байт в регистре al
;count_call=0
	mov	count_call,0
	mov	ebx,HeadTree
	mov	al,delItem
	call	delNodeTree
;проверим результат:
;обходим узлы двоичного дерева слева направо и извлекаем значения из содержательной части
	create_stk	Hand_Head,doubleWord_stk
	push	ds
	pop	es
	lea	edi,ordered_array
	mov	ebx,HeadTree
	push_stk	doubleWord_stk,ebx	;указатель на корень в наш стек
	mov	count_call,0
	call	LRBeat
exit:
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
