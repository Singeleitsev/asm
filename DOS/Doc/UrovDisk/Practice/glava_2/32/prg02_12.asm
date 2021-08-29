;--------------------------------------------------------------------------------;
;prg02_12.asm - программа построения и инициализации двоичного дерева.
;Вход: произвольный масиив чисел в памяти.
;Выход: двоичное дерево в памяти.
;--------------------------------------------------------------------------------;
.486
.model flat,STDCALL	;модель памяти flat,
;STDCALL - передача параметров в стиле С (справа налево), 
;	вызываемая процедура чистит за собой стек
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
.data
mas	db	37h,12h,8h,65h,4h,54h,11h,02h,32h,5h,4h,87h,7h,21h,65h,45h,22h,11h,77h,51h,26h,73h,35h,12h,49h,37h,52h
l_mas=$-mas
Hand_Head	dd	0	;описатель кучи
HeadTree	dd	0	;указатель корень дерева
NewNode	dd	0	;временная переменная
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
	push	ecx	;HeapAlloc портит ecx, возвращая в нем некоторое значение
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

start	proc	near
;точка входа в программу:
	call	BuildBinTree
exit:
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
