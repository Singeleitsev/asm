;prg_10_4.asm
model small
.stack	100h
.data
len equ	10	;������⢮ ����⮢ � mas
mas	db	1,0,9,8,0,7,8,0,2,0
message	db	'� ���� mas ��� ����⮢, ࠢ��� ���,$'
.code
start:
	mov	ax,@data
	mov	ds,ax
	mov	cx,len	;����� ���� mas � cx
	xor	ax,ax
	xor si,si
	jcxz	exit	;�஢�ઠ cx �� 0, �᫨ 0, � �� ��室
	mov	si,-1	;��⮢�� si � ����樨 ����⮢ ���� mas
cycl:
	inc	si
	cmp	mas[si],0	;�ࠢ���� ��।��� ����� mas � 0
	loopnz	cycl
	jz	exit	;��祬� ��諨 �� 横��?
;�뢮� ᮮ�饭��, �᫨ ��� �㫥��� ����⮢ � mas
 	mov	ah,9
	mov	dx,offset message
 	int	21h
exit:
	mov	ax,4c00h
	int	21h	;������ �ࠢ����� ����樮���� ��⥬�
end	start
