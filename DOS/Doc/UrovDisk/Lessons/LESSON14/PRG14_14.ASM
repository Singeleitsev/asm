;prg14_14.asm
MASM
MODEL	small
STACK	256
.code
main:
asmproc	proc	near
;������� ��㬥�⮢:
arg	kol:WORD,y:WORD,x:WORD,chr:BYTE=a_size
PUBLIC	asmproc
	push	bp	;��࠭���� 㪠��⥫� ����
	mov	bp,sp	;����ன�� bp �� �⥪ �१ sp
	mov	dh,byte ptr y	; y � dh
	mov	dl,byte ptr x	; x � dl
	mov	ah,02h	;����� �㦡� BIOS
	int	10h	;�맮� ���뢠��� BIOS
	mov	ah,09h	;����� �㦡� BIOS
	mov	al,chr	;ᨬ��� - � al
	mov	bl,07h	;��᪠ �뢮�� ᨬ����
	xor	bh,bh
	mov	cx,kol	;kol � cx
	int	10h	;�맮� ���뢠��� BIOS
	pop	bp	;����
	ret	a_size	;�㤥� ret 8 � ��室 �� ��楤���
asmproc	endp	;����� ��楤���
end	main	;����� �ணࠬ��

