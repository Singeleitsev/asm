;prg_9_4.asm
masm
model	small
stack	256
.data
bit_str	dd	11ffff11h	;��ப� ��� �����祭��
.code
main:	;�窠 �室� � �ணࠬ��
	mov	ax,@data
	mov	ds,ax
	xor	ax,ax
.386			;�� ��易⥫쭮
;���� �ࠩ ���� �����祭�� 横���᪨ ��६����� � ������ ���
;��ப� bit_str (��࠭���� ������ ���⥪��)
	rol	bit_str,8
	mov	ebx,bit_str	;�����⮢������ ��ப� � ebx
	shld	eax,ebx,16	;��⠢��� ���������� 16 ���
	;� ॣ���� eax
	ror	bit_str,8	;����⠭����� ���訥 8 ���
;...
	exit:		;eax=0000ffff
	mov	ax,4c00h
	int	21h
end	main

