;----------------------------------------------------------
;prg07_28.asm - программа демонстрации поиска файла по шаблону.
;----------------------------------------------------------
masm
model small
WIN32_FIND_DATA	struc
DwFlleAttributes	dd	?
FtCreationTime	dd	2 dup(?)
FtLastAccessTime	dd	2 dup(?)
FtLastWriteTime	dd	2 dup(?)
NFileSizeHigh	dd	?	;размер файла в байтах (старшее слово)
NFileSizeLow	dd	?	;размер файла в байтах (младшее слово)
DwReservedO	dd	0	;резерв
DwReservedl	dd	0	;резерв
CFileName	db	260 dup(?)
CAlternateFileName	db	14 dup(?)
WIN32_FIND_DATA	ends
.data
find_	WIN32_FIND_DATA	<>
point_find_	dd	find_
f_name_pattern	db	'file_*.*',0
point_f_name_pattern	dd	f_name_pattern
filename	db	'file_05.txt',0	;искомый файл
len_filename=$-filename
handle	dw	0
.stack	256
.486
.code
main:
	mov	ax,@data	;адрес сегмента данных - в регистр ax
	mov	ds,ax	;ax в ds
;----------------------------------------------------------------------
	mov	CL,0	; атрибуты искомого файла
	mov	ch,0	; дополнителные атрибуты дл€ поиска
	lds	dx,point_f_name_pattern	;формируем указатель на строку с шаблоном
	les	di,point_find_	;формируем указатель на экземпл€р структуры WIN32_FIND_DATA
	mov	ax,714eh	;номер функции DOS
	int	21h
	jc	exit
;в ax был возвращен дескриптор - если нужно, то его необходимо сохранить:
	mov	handle,ax
;провер€ем тот ли это файл:
m1:
	mov	cx,len_filename
	lea	di,find_.CfileName
	lea	si,filename
repe	cmpsb
	jz	exit
;продолжаем поиск - в bx дескриптор, полученный от 714eh:
	mov	bx,handle
	les	di,point_find_	;формируем указатель на экземпл€р структуры WIN32_FIND_DATA
	mov	ax,714fh	;номер функции DOS
	xor	si,si	;формат даты
	int	21h
	jnc	m1
exit:
;завершить поиск
	mov	ax,71a1h
	mov	bx,handle
	int	21h
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывани€ с номером 21h
end	main		;конец программы с точкой входа main
