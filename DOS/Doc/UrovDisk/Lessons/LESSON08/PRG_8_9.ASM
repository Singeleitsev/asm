;prg_8_9.asm
masm
model	small
stack	256
.data		;ᥣ���� ������
b	db	1,7	;��㯠�������� �᫮ 71
c	db	4,5	;��㯠�������� �᫮ 54
subs	db	2 dup (0)
.code
main:		;�窠 �室� � �ணࠬ��
	mov	ax,@data	;��뢠�� ॣ���� dx � ᥣ���⮬
	mov	ds,ax	;������ �१ ॣ���� ax
 	xor	ax,ax	;��頥� ax
len	equ	2	;ࠧ�來���� �ᥫ
	xor	bx,bx
	mov	cx,len	;����㧪� � cx ���稪� 横��
m1:
	mov	al,b[bx]
	sbb	al,c[bx]
	aas
	mov	subs[bx],al
	inc	bx
	loop	m1
	jc	m2	;������ 䫠�� �����
	jmp	exit
m2:	;...
exit:
	mov	ax,4c00h	;�⠭����� ��室
	int	21h
end	main	;����� �ணࠬ��

