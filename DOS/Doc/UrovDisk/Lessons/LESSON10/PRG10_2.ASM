;prg_10_2.asm
model small
.stack	100h
.data
len equ	10	;������⢮ ����⮢ � mas
mas	db	1,0,9,8,0,7,8,0,2,0
.code
start:
	mov	ax,@data
	mov	ds,ax
	mov	cx,len	;����� ���� mas � cx
	xor	ax,ax
	xor si,si
cycl:
	jcxz	exit	;�஢�ઠ cx �� 0, �᫨ 0, � �� ��室
	cmp	mas[si],0	;�ࠢ���� ��।��� ����� mas � 0
	jne m1	;�᫨ �� ࠢ��, � �� m1
	inc	al	;� al ���稪 �㫥��� ����⮢
m1:
	inc	si	;��३� � ᫥���饬� ������
	dec	cx	;㬥����� cx �� 1;
	jmp cycl
exit:
	mov	ax,4c00h
	int	21h	;������ �ࠢ����� ����樮���� ��⥬�
end	start

