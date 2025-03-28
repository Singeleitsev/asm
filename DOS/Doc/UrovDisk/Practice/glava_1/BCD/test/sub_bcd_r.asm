masm
model small
sub_bcd_r	macro	minuend,len_m,deduction,len_d,difference
local	temp,m1,m2,exit_m
;--------------------------------------------------------------------------------;
;sub_bcd_r minuend,len_m,deduction,len_d,difference - ������������ ��������� ������������� BCD-����� �������� len_m � len_d ���� � ��������� ���������� � difference.
;����: minuend � deduction - ������ ������� ���� ������������ � �����������; len_m � len_d - ����� ������������ � ����������� � ������.
;�����: difference - ����� �������� ����� ���� ��������. ����� ���� difference ������ ���� �� ������ ����� ������������.
;������� ���������� ���� - ������� ���� �� �������� ������ (�� Intel).
;--------------------------------------------------------------------------------;
	push	si
;�������� ����������� � difference:
push	ds
pop	es
cld
	lea	si,minuend
	lea	di,difference
	mov	cx,len_m
	push	cx
rep	movsb
;�������� ���������� �� ����. ������� temp:
	jmp	m1
temp	db	len_m dup (0)
m1:
std
	lea	si,deduction+len_m-1
	lea	di,cs:temp+len_m-1
	mov	cx,len_d
	push	cs
	pop	es
rep	movsb
mov	si,len_m-1
	pop	cx
m2:	mov	al,minuend[si]
	sbb	al,cs:temp[si]
	aas
	mov	difference[si],al
	dec	si
	loop	m2
	jc	m3	;�� ��������� ����� �� �������� �������
	jmp	exit_m
m3:	nop	;���� �����, �� �������� �������� ��������� ����� �� �������� �������
exit_m:
	pop	si
	endm

.data
;�������� � minuend � deduction ����� ������
min	db	9,3,4,5,9	;�����������
l_m=$-min		;����� � ������ �������� minuend
ded	db	9,9,9,9	;����������
l_d=$- ded		;����� � ������ �������� deduction
dif	db	l_m dup (0)

.stack	256
.486

.code
main:
	mov	dx,@data	
	mov	ds,dx	

	sub_bcd_r	min,l_m, ded,l_d, dif

	mov	ax,4c00h
	int	21h	
end	main		