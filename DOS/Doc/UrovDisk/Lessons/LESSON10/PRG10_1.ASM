;prg_10_1.asm
model	small
.stack	100h
.data
n	equ	10
stroka	db	'acvfgrndup'
.code
start:
	mov	ax,@data
	mov	ds,ax
	xor	ax,ax
	mov	cx,n
	lea	bx,stroka	;���� stroka � bx
m1:	mov	al,[bx]	;��।��� ᨬ��� �� stroka � al
	cmp	al,61h	;�஢����, �� ��� ᨬ���� �� ����� 61h
	jb	next	;�᫨ �����, � �� ��ࠡ��뢠�� � �� ᫥���騩 ᨬ���
	cmp	al,7ah	;�஢����, �� ��� ᨬ���� �� ����� 7�h
	ja	next	;�᫨ �����, � �� ��ࠡ��뢠�� � �� ᫥���騩 ᨬ���
	and	al,11011111b	;������஢��� 5-� ���
	mov	[bx],al	;ᨬ��� �� ���� � stroka
next:
	inc	bx	;���ᮢ��� ᫥���騩 ᨬ���
	dec	cx	;㬥����� ���祭�� ���稪� � cx
	jnz	m1	;�᫨ cx �� 0, � ���室 �� m1
exit:
	mov	ax,4c00h
	int	21h	;������ �ࠢ����� ����樮���� ��⥬�
end	start

