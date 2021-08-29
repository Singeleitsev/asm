;prg_12_5.asm
MASM
MODEL	small
STACK	256
.data
mes1	db	0ah,0dh,'��室�� ���ᨢ - $',0ah,0dh
;������� ᮮ�饭��
mes2	db	0ah,0dh,'�����஢���� ���ᨢ - $',0ah,0dh
n	equ	9	;������⢮ ����⮢ � ���ᨢ�, ���� � 0
mas	dw	2,7,4,0,1,9,3,6,5,8	;��室�� ���ᨢ
tmp	dw	0	;��६���� ��� ࠡ��� � ���ᨢ��
i	dw	0
j	dw	0
.code
main:
	mov	ax,@data
	mov	ds,ax
	xor	ax,ax
;�뢮� �� �࠭ ��室���� ���ᨢ�
	mov	ah,09h
	lea	dx,mes1
	int	21h	;�뢮� ᮮ�饭�� mes1
	mov	cx,10
	mov	si,0
show_primary:	;�뢮� ���祭�� ����⮢
		;��室���� ���ᨢ� �� �࠭
	mov	dx,mas[si]
	add	dl,30h
	mov	ah,02h
	int	21h
	add	si,2
	loop	show_primary

;��ப� 40-85 �ணࠬ�� ��������� ᫥���饬� ���� �� �몥 �:
;for (i=0;i<9;i++)
;	for (j=9;j>i;j--)
;		if (mas[i]>mas[j])
;		{tmp=mas[i];
;		mas[i]=mas[j];
;		mas[j]=tmp;}
	mov	i,0	;���樠������ i
;����७��� 横� �� j
internal:
	mov	j,9	;���樠������ j
	jmp	cycl_j	;���室 �� ⥫� 横��
exchange:		
	mov	bx,i	;bx=i
	shl	bx,1
	mov	ax,mas[bx]	;ax=mas[i]
	mov	bx,j	;bx=j
	shl	bx,1
	cmp	ax,mas[bx]	;mas[i] ? mas[j] - �ࠢ����� ����⮢
	jle	lesser	;�᫨ mas[i] �����, � ����� �� �㦥� � ;���室 �� �த������� ����� �� ���ᨢ�
;���� tmp=mas[i], mas[i]=mas[j], mas[j]=tmp:
;tmp=mas[i]
	mov	bx,i	;bx=i
	shl	bx,1	;㬭����� �� 2, ⠪ ��� ������ - ᫮��
	mov	tmp,ax	;tmp=mas[i]

;mas[i]=mas[j]
	mov	bx,j	;bx=j
	shl	bx,1	;㬭����� �� 2, ⠪ ��� ������ - ᫮��
	mov	ax,mas[bx]	;ax=mas[j]
	mov	bx,i		;bx=i
	shl	bx,1	;㬭����� �� 2, ⠪ ��� ������ - ᫮��
	mov	mas[bx],ax	;mas[i]=mas[j]

;mas[j]=tmp
	mov	bx,j		;bx=j
	shl	bx,1	;㬭����� �� 2, ⠪ ��� ������ - ᫮��
	mov	ax,tmp		;ax=tmp
	mov	mas[bx],ax	;mas[j]=tmp
lesser:	;�த������� ����� �� ���ᨢ� �� ����७��� 横��
	dec	j	;j--
;⥫� 横�� �� j
cycl_j:
	mov	ax,j	;ax=j
	cmp	ax,i	; �ࠢ���� j ? i
	jg	exchange	;�᫨ j>i, � ���室 �� �����
;���� �� ���譨� 横� �� i
	inc	i	;i++
	cmp	i,n		;�ࠢ���� i ? n - ��諨 �� ���� ���ᨢ�
	jl	internal	;�᫨ i<n �த������� ��ࠡ�⪨

;�뢮� �����஢������ ���ᨢ�
	mov	ah,09h
	lea	dx,mes2
	int	21h
prepare:
	mov	cx,10
	mov	si,0
show:		;�뢮� ���祭�� ����� �� �࠭
	mov	dx,mas[si]
	add	dl,30h
	mov	ah,02h
	int	21h
	add	si,2
	loop	show
exit:
	mov	ax,4c00h	;�⠭����� ��室
	int	21h
end	main		;����� �ணࠬ��

