;----------------------------------------------------------
;prg05_05.asm - ��������� ��� ������ � ����� �� ������
;----------------------------------------------------------
masm
model small
.stack	256
.486
.data
string	db	"dfsh3453637869�����������"
len_string =$-string
adr_string	dd	string
.code
main:
	mov	ax,@data
	mov	ds,ax
	xor	dx,dx
	mov	cx,25
;----------------------------------------------------------------
m1:
	mov	al,1	;����� ������ - ������ � ����� ������
	xor	bh,bh	;����� �������������
	mov	bl,7	;�������
push	cx
	mov	cx,len_string	;����� ��������� ������
	les	bp,adr_string	;����� ������ � ���� ES:BP
	mov	ah,13h
	int	10h
	inc	dh	;������ ������ ������
	inc	dl	;������� ������ ������
pop	cx
	loop	m1
;���������� � ������������ ���� �����
	mov	al,4	;4 ������
	mov	bh,0
;	mov	bh,01000000b	;������� ���
	mov	ch,5
	mov	cl,5
	mov	dh,10
	mov	dl,30
	mov	ah,06h
	int	10h
exit:
;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
