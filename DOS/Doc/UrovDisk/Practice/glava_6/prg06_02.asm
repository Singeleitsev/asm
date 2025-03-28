;----------------------------------------------------------
;prg06_02.asm - ��������� �������������� ������ ����������� ����� � ���������� ���� �� ��������� 0..4294967295 � ������������� �������� �������������.
;����: ���� � ���������� ����� � ���������� ������� ��������� (�� ����� 10 ����).
;�����: �������� �����-��������� �������������� � �������� EAX.
;----------------------------------------------------------
masm
model small
.data
string	db	12 dup (0)	;������������ ����� ������� �� 10 ���� (12 - � ������ 0d0ah)
len_string=$-string
ten	dd	10
string_e	db	0dh,0ah,"��������� ����� �� ������� �������� !!!$"
adr_string_e	dd	string_e
.stack	256
.486
.code
main:
	mov	ax,@data	;����� �������� ������ � ������� ax
	mov	ds,ax	;ax � ds
	xor	edx,edx
;---------������ � ����������---------------------------------------------
	mov	bx,0	;����������� ���������� - ����������
	mov	cx,len_string
	lea	dx,string	;��������� ��������� �� ������ string
	mov	ah,3fh	;����� ������� DOS
	int	21h
	jc	exit	;������� � ������ ������
;� �������� AL - ���������� ������������� ��������� ���������� ����
	mov	ecx,eax
	sub	ecx,2	; ������������ ������� ����� (����� �� ��������� 0d0ah, �������� 3fh)
	jecxz	exit	;����� �� ���� �������
	dec	ecx	;�� �������� �� 10 ��������� ����� �����
	jecxz	m2	;������� ����������� �����
	lea	si,string	;��������� ��������� �� ������ string
	xor	eax,eax	;eax:=0
m1:
	xor	edx,edx
	mov	dl,[si]
	and	dl,0fh
	add	eax,edx
	mul	ten
	jc	exit_e	;��������� ����� �� ������� ��������
	inc	si
	loop	m1
m2:
	mov	dl,[si]
	and	dl,0fh	;����������� ASCII->BCD
	add	eax,edx	;��������� �������������� � �������� eax
	jnc	exit	;��������� ����� �� ������� ��������
exit_e:	;������� ������ string_e �� �����
	lds	dx,adr_string_e	;����� ������ � DS:DX
	mov	ah,09h
	int	21h
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
