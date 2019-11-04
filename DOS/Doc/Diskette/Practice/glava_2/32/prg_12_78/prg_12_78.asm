;--------------------------------------------------------------------------------;
;prg_12_78.asm - программа построения лексикографического дерева.
;Вход: текстовый файл inFile.txt.
;Выход: вывод на экран статистики о встречаемости слов в тексте.
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
extrn	GetStdHandle:PROC
extrn	CreateFileA:PROC
extrn	GetFileSize:PROC
extrn	ReadFile:PROC
extrn	GetProcessHeap:PROC
extrn	HeapAlloc:PROC
extrn	SetConsoleCursorPosition:PROC
extrn	WriteConsoleA:PROC
extrn	ReadConsoleA:PROC
;макроопределения типов
SSHORT	equ	<dw	0>
;объявления структур:
node_tree	struc	;узел дерева
s_word	db	10 dup (' ')	;содержательная часть
freq	db	0	;частота встречаемости в тексте
l_son	dd	0	;указатель на старшего (левого) сына
r_son	dd	0	;указатель на младшего (правого) сына
ends
Coord	struc
xx	SSHORT
yy	SSHORT
Coord	ends
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
	push	edi
	mov	ecx,descr.size_item
	mov	edi,descr.p_top
	mov	[edi],rg_item
	add	descr.p_top,ecx
;восстанавливаем регистры
	pop	edi
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
	mov	ecx,descr.size_item
	sub	descr.p_top,ecx
	mov	ecx,descr.p_top
	cmp	ecx,descr.p_start
	jae	m1
	stc
	jmp	exit_pop
m1:	mov	esi,descr.p_top
	mov	rg_item,[esi]
exit_pop:
	pop	esi
	pop	ecx
endm
.data
Hand_Head	dd	0	;описатель кучи
HeadTree	dd	0	;указатель на корень дерева
NewNode	dd	0	;временная переменная
lpBuf	db	'inFile.txt'	;имя файла
lpBufSize=$-lpBuf
hFile	dd	0	;дескриптор файла
FileSize	dd	0	;размер файла
buf_start	dd	0	;адрес блока для текста программы из общей кучи процесса
dOut	dd	0	;дескриптор вывода консоли
dIn	dd	0	;дескриптор ввода консоли
tek_pos	dd	0	;номер тек. поз. в буфере с текстом файла
NumWri	dd	0	;количество символов очередной строки, выведенной на экран
;информация для стека:
;дескриптор стека:
doubleWord_stk	desc_stk	<>
count_call	dd	0	;счетчик количества рекурсивного вызова процедуры
con	Coord	<>
;начальные значения координат для вывода на экран
xxx	dw	1	;
yyy	dw	1	;
.code
LRBeat	proc
	inc	count_call	;подсчет количества вызовов процедуры (для согласования количества записей и извлечений из стека)
;рекурсивная процедура обхода дерева - слева направо (левое поддерево, корень, правое поддерево)
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
@@m2:
;вывод на экран
;установим курсор в позицию (2,5)
	mov	ax,xxx
	mov	con.xx,ax
	mov	ax,yyy
	mov	con.yy,ax
	inc	xxx
	inc	yyy
	push	con
	push	dOut
	call	SetConsoleCursorPosition
	cmp	eax,0
	jz	exit	;если неуспех
	mov	eax,11
	add	[ebx].freq,30h
	inc	[ebx].freq	;корректируем счетчик в 1 (так как отсчет в осн. прогр. с 0)
	push	0	;зарезервирован
	push	offset NumWri	;действительное количество выведенных символов
	push	eax	;длина строки
	push	ebx	;указатель на строку
	push	dOut
	call	WriteConsoleA
	cmp	eax,0
	jz	exit	;если неуспех
	mov	ebx,[ebx].r_son
cmp	ebx,0
je	@@m1
push_stk	doubleWord_stk,ebx
	call	LRBeat
@@exit_p:
	dec	count_call
	ret
LRBeat	endp
start	proc	near	;точка входа в программу:
;запрос консоли
	call	AllocConsole
;проверить успех запроса консоли
	test	ax,ax
	jz	exit	;неудача
; получим дескрипторы ввода и вывода консоли
	push	STD_OUTPUT_HANDLE
	call	GetStdHandle
	mov	dOut,eax	;dOut-дескриптор вывода консоли
	push	STD_INPUT_HANDLE
	call	GetStdHandle
	mov	dIn,eax	;dIn-дескриптор ввода консоли
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
;читаем файл в динамически выделяемую область памяти
;открываем файл
;HANDLE CreateFile(LPCTSTR lpFileName,DWORD dwDesiredAccess,DWORD
;dwShareMode,LPSECURITY_ATTRIBUTES lpSecurityAttributes,DWORD dwCreationDisposition,DWORD 
;dwFlagsAndAttributes,HANDLE hTemplateFile);
	push	0
	push	0	;атрибуты (они игнорируются)
	push	OPEN_EXISTING	;открыть существующий файл, если его нет ? ошибка
	push	0	;защита файла не требуется
	push	FILE_SHARE_READ	;разрешено совместное использование файла (по чтению)
	push	GENERIC_READ	;разрешено чтение из файла
	push	offset lpBuf	;имя файла
	call	CreateFileA
	cmp	eax,0ffffffffh
	je	exit	;если неуспех
	mov	hFile,eax	;дескриптор файла
;определим размер файла
;DWORD GetFileSize(HANDLE hFile,LPDWORD lpFileSizeHigh);
	push	0
	push	hFile
	call	GetFileSize
	cmp	eax,0
	jz	exit	;если неуспех
	mov	FileSize,eax	;сохраним размер файла
;для блока в памяти, в который будем читать файл, используем кучу, выделяемую процессу по умолчанию (дескриптор мы уже получили ранее)
;запрашиваем блок памяти из кучи:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	FileSize
	push	0	;флаги не задаем
	push	Hand_Head	;описатель кучи
	call	HeapAlloc
	mov	buf_start,eax	;адрес блока с текстом программы из общей кучи процесса
;читаем файл
;BOOL ReadFile(HANDLE hFile,LPVOID lpBuffer,DWORD nNumberOfBytesToRead,
;LPDWORD lpNumberOfBytesRead,LPOVERLAPPED lpOverlapped);
	push	0
	push	offset FileSize	;сколько байт прочитано реально
	push	FileSize
	push	buf_start	;буфер, в который читаем файл
	push	hFile
	call	ReadFile
	cmp	eax,0
	jz	exit	;если неуспех
push	ds
pop	es
	mov	ecx,FileSize
;первое слово из буфера с текстом файла в корень дерева
	mov	esi,buf_start
	lea	edi,[ebx].s_word
m12:
	lodsb
	cmp	al," "
	je	@@cycl01
	stosb
	dec	ecx
	jecxz	@@cycl1
	jmp	m12	;конец построения дерева - одно слово ?
;далее в цикле работаем с деревом и содержимым файла
;читаем очередное слово из буфера с текстом файла
@@cycl01:
	dec	ecx	;подровняем ecx под номер текущей позиции
	mov	tek_pos,esi	;сохраним номер тек. позиции в буфере с текстом файла
@@cycl1:
push	ecx	;сохраняем ecx, так как HeapAlloc портит ecx
;запрашиваем блок памяти из кучи для узла дерева:
;LPVOID HeapAlloc(HANDLE hHeap, DWORD dwFlags, DWORD dwBytes);
	push	type node_tree	;размер структуры для узла дерева
	push	0	;флаги не задаем
	push	Hand_Head	;описатель кучи
	call	HeapAlloc
pop	ecx	;восстанавливаем ecx
	mov	NewNode,eax	; запоминаем указатель на узел дерева во врем. перем.
;подчистим выделенную область памяти в куче
	mov	edi,eax
push	ecx
	mov	ecx,type node_tree
	mov	al,0
rep	stosb
pop	ecx
;читаем очередное слово из буфера с текстом файла и записываем его в новый узел
;в esi содержимое соответствует текущей позиции в буфере buf_start
	mov	esi,tek_pos	;восстановим номер тек. позиции в буфере с текстом файла
	mov	edi,NewNode
	add	edi,s_word	;указатель на поле s_word нового узла дерева
m13:
	lodsb
	cmp	al," "
	je	m134
	stosb
	dec	ecx
	jecxz	m1344
	jmp	m13
;ищем место в дереве согласно условиям упорядочивания и настраиваем указатели в узлах дерева
m134:
	dec	ecx	;подровняем ecx под номер текущей позиции
	mov	tek_pos,esi	;сохраним номер тек. позиции в буфере с текстом файла
m1344:
	mov	ebx,HeadTree	;указатель на корень дерева
push	ecx
m_search:
	mov	esi,ebx	;дублируем
	add	esi,s_word	;указатель на поле s_word
	mov	edi,NewNode
	add	edi,s_word	;указатель на поле s_word нового узла дерева
	mov	ecx,10	;максимальное количество символов в слове
repe	cmpsb
	jcxz	m14	;цепочки совпадают
;цепочки не совпали => выясняем их соотношение и настраиваем указатели в узлах дерева
	dec	esi
	dec	edi
	mov	al,[edi]
	cmp	al,[esi]
	ja	m15	;новое слово лексикографически больше в очередном узле
;новое слово лексикографически меньше, чем слово в очередном узле
;если меньше, то идем по левой ветке
	mov	eax,[ebx].l_son
	cmp	eax,0
	je	m145
	mov	ebx,eax
	jmp	m_search	;продолжаем поиск места в дереве
m145:
;если этого сына нет, то добавляем его к папе
push	NewNode
pop	[ebx].l_son	;mov	[ebx].l_son,NewNode
	jmp	end_cycl1
m15:	;новое слово лексикографически больше, чем слово в очередном узле - идем по правой ветке
	mov	eax,[ebx].r_son
	cmp	eax,0
	je	m156
	mov	ebx,eax
	jmp	m_search	;продолжаем поиск места в дереве
m156:
;если этого сына нет, то добавляем его к папе
push	NewNode
pop	[ebx].r_son	;mov	[ebx].r_son,NewNode
	jmp	end_cycl1
m14:	;слова совпадают
	inc	[ebx].freq
end_cycl1:
pop	ecx
	jecxz	displ_lex_order
	jmp	@@cycl1
;лексикографическое дерево поиска построено
displ_lex_order:
;обход дерева слева направо и вывод на экран:
;обходим узлы двоичного дерева слева направо и извлекаем значения из содержательной части
;нам понадобится свой стек (размер (256 байт) нас устроит, но макроопределение мы подкорректировали)
	create_stk	Hand_Head,doubleWord_stk
	mov	ebx,HeadTree
push_stk	doubleWord_stk,ebx	;указатель на корень в наш стек
	call	LRBeat
exit:
;выход из программы
;задержим ввод до нажатия любой клавиши
	push	0
	push	offset NumWri
	push	4
	push	offset NewNode	;этот адрес любой
	push	dIn
	call	ReadConsoleA
;готовим вызов VOID ExitProcess(UINT uExitCode)
	push	0
	call	ExitProcess
start	endp
end	start
