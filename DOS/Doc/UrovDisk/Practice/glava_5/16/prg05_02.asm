;----------------------------------------------------------
;prg05_02.asm - ��������� �� ���������� ��� ����� ������ � ������������� ������� ����� ������� 10h
;----------------------------------------------------------
masm
model small
.stack	256
.486
.data
string	db	5 dup	(0)
len_string =$-string
adr_string	dd	string
.code
main:
	mov	ax,@data
	mov	ds,ax
	mov	cx,len_string
	les	di,adr_string
m1:
	mov	ah,010h
	int	16h
	stosb
	loop	m1
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
