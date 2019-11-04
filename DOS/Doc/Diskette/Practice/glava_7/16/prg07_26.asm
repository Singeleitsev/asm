;----------------------------------------------------------
;prg07_26.asm - программа демонстрации применени€ функции 71A6h прерывани€ 21h дл€ получени€ информации о файле по описателю.
;----------------------------------------------------------
masm
model small
BY_HANDLE_FILE_INFORMATION	struc
	DwFileAttributes	dd	?
	FtCreationTime	dd	2 dup(?)
	FtLastAccessTime	dd	2 dup(?)
	FtLastWriteTime	dd	2 dup(?)
	DwVolumeSerialNumber	dd	?
	NFileSizeHigh	dd	?
	NfileSizeLow	dd	?
	NnumberOfLinks	dd	?
	NFileIndexHigh	dd	?
	NFileIndexLow	dd	?
BY_HANDLE_FILE_INFORMATION	ends
.data
file_info_	BY_HANDLE_FILE_INFORMATION	<>
point_find_	dd	file_info_
filename	db	'my_file with long name.txt',0	;файл, о котором будем получать информацию
point_fname	dd	filename
handle	dw	0
.stack	256
.486
.code
main:
	mov	ax,@data	;адрес сегмента данных - в регистр ax
	mov	ds,ax	;ax в ds
;----------------------------------------------------------------------
	mov	bx,0100h+0400h	;не использовать буферизацию + содержимое DI в псевдоним
	mov	dx,1	;открыть файл, если он существует, иначе вернуть ошибку
	lds	si,point_fname	;формируем указатель на им€ файла
	mov	di,7	;добавить в конец псевдонима символ 7
repeat:
	mov	ax,716ch	;номер функции DOS
	xor	cx,cx	;атрибуты файла - обычный файл - доступ дл€ чтени€-записи
	int	21h	;открываем файл
	jnc	m1	; если файл существовал, то переход
	mov	dx,10h	;создать файл
	jmp	repeat	;переход - повторим открытие файла
m1:
;-------------------------------------------------------------------
	mov	handle,ax	;сохраним дескриптор файла
;действи€ при успешном открытии файла:
;Е Е Е
;-------------------------------------------------------------------
;получаем информацию о файле
	mov	bx,handle
	stc	;это об€зательно
	lds	dx,point_find_	;формируем указатель на структуру BY_HANDLE_FILE_INFORMATION
	mov	ax,71a6h
	int	21h
;обрабатываем полученную информацию Е Е Е
exit:
;выход из программы
	mov	ax,4c00h	;пересылка 4c00h в регистр ax
	int	21h	;вызов прерывани€ с номером 21h
end	main		;конец программы с точкой входа main
