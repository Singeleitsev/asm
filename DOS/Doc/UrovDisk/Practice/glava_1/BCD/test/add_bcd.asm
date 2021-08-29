masm
model small
add_bcd	macro	summand_1,len_1,summand_2,len_2,sum
local	m1,m2,m3
;--------------------------------------------------------------------------------;
;add_bcd summand_1,len_1,summand_2,len_2,sum - ������������ �������� ������������� BCD-����� �������� len_1 � len_2 ���� � ��������� ���������� � sum.
;����: summand_1 � summand_2 - ������ ������� ���� ���������; len_1 � len_2 - ����� ��������� � ������.
;�����: sum - ����� �������� ����� ���� �����. ����������, ����� ��� ���� ����� ����� �� ������� ������, ��� ����� ������ �������� ����������.
;������� ���������� ���� - ������� ���� �� �������� ������ (Intel).
;--------------------------------------------------------------------------------;
	push	si
	push	bx
	mov	ax,len_1
	cmp	ax,len_2
	jna	m2
	mov	cx,len_1	;����� �������� ��� �������� (��. ����)
	push	cx
	mov	cx,len_2	;����� �������� ��� �������� (��. ����)
	push	cx
	mov	cx,ax
	lea	bx,summand_1	;����� �������� ��������� ��� ��������
	lea	si,summand_2	;����� �������� ��������� ��� movsb
	jmp	m3
m2:
	mov	cx,len_2	;����� �������� ��� �������� (��. ����)
	push	cx
	mov	cx,len_1	;����� �������� ��� �������� (��. ����)
	push	cx
	mov	cx,len_2
	lea	bx,summand_2	;����� �������� ��������� ��� ��������
	lea	si,summand_1	;����� �������� ��������� ��� movsb
m3:
;��������� sum ������ - ����� ���������� ����:
	cld
	push	ds
	pop	es
	xor	al,al
	lea	di, sum
rep	stosb
;��������� �������� (�� �����) BCD-����� � sum:
	cld
;����� ��������� ��. ����
	lea	di, sum
	pop	cx	;����� ���� ���������� ���� � �����. �������� BCD-�����
rep	movsb

	pop	cx	;���� �� ��������
	xor	si,si
m1:	mov	al,[bx][si]
	adc	al, sum[si]
	aaa
	mov	sum[si],al
	inc	si
	loop	m1
	adc	sum[si],0
	pop	bx
	pop	si
	endm
.data
sum_1	db	9,3,4,5,9	;�������� � summand_1 � summand_2 ����� ������
l_1=$-sum_1
sum_2	db	9,9,9,9
l_2=$-sum_2
sum	db	6 dup (0)	;n=max(len_1,len_2)+1

.stack	256
.486

.code
main:
	mov	dx,@data	
	mov	ds,dx	

	add_bcd	sum_1,l_1,sum_2,l_2,sum

	mov	ax,4c00h
	int	21h	
end	main		