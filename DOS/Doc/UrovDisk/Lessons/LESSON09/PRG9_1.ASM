;prg_9_1.asm
masm
model	small
stack	256
.data	;ᥣ���� ������
.code	;ᥣ���� ����
main:	;�窠 �室� � �ணࠬ��
	mov	ax,@data	;��뢠�� ॣ���� dx � ᥣ���⮬
	mov	ds,ax	;������ �१ ॣ���� ax
 	xor	ax,ax	;��頥� ax
;...
.486		;�� ��易⥫쭮
	xor	ax,ax
	mov	al,02h
	bsf	bx,ax	;bx=1
	jz	m1	;���室, �᫨ al=00h
	bsr	bx,ax
m1:
;...
	mov	ax,4c00h	;�⠭����� ��室
	int	21h
end	main

