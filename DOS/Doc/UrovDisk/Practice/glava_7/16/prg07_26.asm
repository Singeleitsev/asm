;----------------------------------------------------------
;prg07_26.asm - ��������� ������������ ���������� ������� 71A6h ���������� 21h ��� ��������� ���������� � ����� �� ���������.
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
filename	db	'my_file with long name.txt',0	;����, � ������� ����� �������� ����������
point_fname	dd	filename
handle	dw	0
.stack	256
.486
.code
main:
	mov	ax,@data	;����� �������� ������ - � ������� ax
	mov	ds,ax	;ax � ds
;----------------------------------------------------------------------
	mov	bx,0100h+0400h	;�� ������������ ����������� + ���������� DI � ���������
	mov	dx,1	;������� ����, ���� �� ����������, ����� ������� ������
	lds	si,point_fname	;��������� ��������� �� ��� �����
	mov	di,7	;�������� � ����� ���������� ������ 7
repeat:
	mov	ax,716ch	;����� ������� DOS
	xor	cx,cx	;�������� ����� - ������� ���� - ������ ��� ������-������
	int	21h	;��������� ����
	jnc	m1	; ���� ���� �����������, �� �������
	mov	dx,10h	;������� ����
	jmp	repeat	;������� - �������� �������� �����
m1:
;-------------------------------------------------------------------
	mov	handle,ax	;�������� ���������� �����
;�������� ��� �������� �������� �����:
;� � �
;-------------------------------------------------------------------
;�������� ���������� � �����
	mov	bx,handle
	stc	;��� �����������
	lds	dx,point_find_	;��������� ��������� �� ��������� BY_HANDLE_FILE_INFORMATION
	mov	ax,71a6h
	int	21h
;������������ ���������� ���������� � � �
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
