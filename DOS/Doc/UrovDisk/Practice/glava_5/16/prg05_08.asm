;----------------------------------------------------------
;prg05_08.asm - ��������� ������������� ������ ������ �������� 02h int 21h
;----------------------------------------------------------
masm
model small
.stack	256
.486
.data
string	db	"������ ��� ������ �������� 02h"
len_string=$-string
.code
main:
	mov	ax,@data
	mov	ds,ax
;������� ������ string �� �����
	mov	cx,len_string	;����� ������
	lea	si,string	;����� ������
	mov	ah,02h
m1:	mov	dl,byte ptr	[si]
	int	21h
	inc	si
	loop	m1
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
