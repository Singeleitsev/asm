;prg_12_1.asm
MASM
MODEL	small
STACK	256
.data
mes	db	0ah,0dh,'���ᨢ- ','$'
mas	db	10 dup (?)	;��室�� ���ᨢ
i	db	0
.code
main:
	mov	ax,@data
	mov	ds,ax
	xor	ax,ax	;���㫥��� ax
	mov	cx,10	;���祭�� ���稪� 横�� � cx
	mov	si,0	;������ ��砫쭮�� ����� � cx
go:		;横� ���樠����樨
	mov	bh,i	;i � bh
	mov	mas[si],bh	;������ � ���ᨢ i
	inc	i	;���६��� i
	inc	si	;�த������� � ᫥���饬�
			;������ ���ᨢ�
	loop	go	;������� 横�
;�뢮� �� �࠭ ����稢襣��� ���ᨢ�
	mov	cx,10
	mov	si,0
	mov	ah,09h
	lea	dx,mes
	int	21h
show:
	mov	ah,02h	;�㭪�� �뢮�� ���祭�� �� al �� �࠭
	mov	dl,mas[si]
	add	dl,30h	;�८�ࠧ������ �᫠ � ᨬ���
	int	21h
	inc	si
	loop	show
exit:
	mov	ax,4c00h	;�⠭����� ��室
	int	21h
end	main		;����� �ணࠬ��

