;--------------------------------------------------------------------------------;
;prg02_14.asm - программа обхода двоичного дерева поиска (слева направо) c возможностью поиска (процедура addNodeTree).
;¬ход: двоичное дерево в пам€ти.
;¬ыход: извлечение значений из содержательной части элементов по мере их обхода (без отображени€ на экране).
;полный текст на дискете
;--------------------------------------------------------------------------------;
;
Е Е Е
.data
Е Е Е
NewItem	db	17	;новый элемент
Е Е Е
.code
Е Е Е
start	proc	near
;точка входа в программу prg02_13.asm:
;формируем двоичное дерево поиска
	call	BuildBinTree
;готовимс€ и вызываем addNodeTree дл€ добавлени€ к дереву нового узла со значением NewItem
;count_call=0
;edi=0
;eax= адрес указател€ на корень дерева (lea	eax,HeadTree)
;ebx= содержимому указател€ на корень дерева (mov	ebx,HeadTree)
	mov	count_call,0
	xor	edi,edi
	lea	eax,HeadTree
	mov	ebx,HeadTree
	call	addNodeTree
;обходим узлы двоичного дерева слева направо и извлекаем значени€ из содержательной части
;нам понадобитс€ свой стек (размер (256 байт) нас устроит, но макроопределение мы подкорректировали)
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
