;prg_12_3.asm
MASM
MODEL	small	;������ �����
STACK	256	;ࠧ��� �⥪�
.data		;��砫� ᥣ���� ������
N=5		;������⢮ ����⮢ ���ᨢ�
mas	db	5 dup (3 dup (0))
.code		;ᥣ���� ����
main:		;�窠 �室� � �ணࠬ��
	mov	ax,@data
	mov	ds,ax
	xor	ax,ax	;���㫥��� ax
	mov	si,0	;0 � si
	mov	cx,N	;N � cx
go:
	mov	dl,mas[si]	;���� ���� ���� � dl
	inc	dl	;㢥��祭�� dl �� 1 (�� �᫮���)
	mov	mas[si],dl	;��᫠�� ���⭮ � ���ᨢ
	add	si,3	;ᤢ�� �� ᫥���騩 ����� ���ᨢ�
	loop	go	;����� 横��
	mov	si,0	;�����⮢�� � �뢮�� �� �࠭
	mov	cx,N
show:			;�뢮� �� �࠭ ᮤ�ন����
			;����� ���� �����
	mov	dl,mas[si]
	add	dl,30h
	mov	ah,02h
	int	21h
	loop	show
exit:
	mov	ax,4c00h	;�⠭����� ��室
	int	21h
end	main	;����� �ணࠬ��

