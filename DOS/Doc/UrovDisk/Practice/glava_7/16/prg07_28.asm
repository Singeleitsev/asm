;----------------------------------------------------------
;prg07_28.asm - ��������� ������������ ������ ����� �� �������.
;----------------------------------------------------------
masm
model small
WIN32_FIND_DATA	struc
DwFlleAttributes	dd	?
FtCreationTime	dd	2 dup(?)
FtLastAccessTime	dd	2 dup(?)
FtLastWriteTime	dd	2 dup(?)
NFileSizeHigh	dd	?	;������ ����� � ������ (������� �����)
NFileSizeLow	dd	?	;������ ����� � ������ (������� �����)
DwReservedO	dd	0	;������
DwReservedl	dd	0	;������
CFileName	db	260 dup(?)
CAlternateFileName	db	14 dup(?)
WIN32_FIND_DATA	ends
.data
find_	WIN32_FIND_DATA	<>
point_find_	dd	find_
f_name_pattern	db	'file_*.*',0
point_f_name_pattern	dd	f_name_pattern
filename	db	'file_05.txt',0	;������� ����
len_filename=$-filename
handle	dw	0
.stack	256
.486
.code
main:
	mov	ax,@data	;����� �������� ������ - � ������� ax
	mov	ds,ax	;ax � ds
;----------------------------------------------------------------------
	mov	CL,0	; �������� �������� �����
	mov	ch,0	; ������������� �������� ��� ������
	lds	dx,point_f_name_pattern	;��������� ��������� �� ������ � ��������
	les	di,point_find_	;��������� ��������� �� ��������� ��������� WIN32_FIND_DATA
	mov	ax,714eh	;����� ������� DOS
	int	21h
	jc	exit
;� ax ��� ��������� ���������� - ���� �����, �� ��� ���������� ���������:
	mov	handle,ax
;��������� ��� �� ��� ����:
m1:
	mov	cx,len_filename
	lea	di,find_.CfileName
	lea	si,filename
repe	cmpsb
	jz	exit
;���������� ����� - � bx ����������, ���������� �� 714eh:
	mov	bx,handle
	les	di,point_find_	;��������� ��������� �� ��������� ��������� WIN32_FIND_DATA
	mov	ax,714fh	;����� ������� DOS
	xor	si,si	;������ ����
	int	21h
	jnc	m1
exit:
;��������� �����
	mov	ax,71a1h
	mov	bx,handle
	int	21h
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
