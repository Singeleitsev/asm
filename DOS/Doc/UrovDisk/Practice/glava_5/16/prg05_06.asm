;----------------------------------------------------------
;prg05_06.asm - ��������� ����� ���������� �������� �������� 01h 21h
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
	mov	ah,01h
	int	21h
	cmp	al,0	;����������� ���???
	jne	m2
;������������ ����������� ���
;� � �
	jmp	m3
m2:
	stosb	;��������� ������ ��������
m3:	loop	m1
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
