;prg_9_3.asm
masm
model	small
stack	256
.data
bit_str	dd	11010111h	;��ப� ��� ��⠢��
p_str	dd	0ffff0000h	;��⠢�塞�� �����ப� 0ffffh
.code
main:	;�窠 �室� � �ணࠬ��
	mov	ax,@data
	mov	ds,ax
	xor	ax,ax
.386			;�� ��易⥫쭮
	mov	eax,p_str
;�ࠢ� �ࠩ ���� ��⠢�� 横���᪨ ��६����� � ���
;��ப� bit_str (��࠭���� �ࠢ��� ���⥪��):
	ror	bit_str,8
	shr	bit_str,16	;ᤢ����� ��ப� ��ࠢ� �� ����� �����ப� (16 ���)
	shld	bit_str,eax,16	;ᤢ����� 16 ���
	rol	bit_str,8	;����⠭����� ����訥 8 ���
;...
	exit:		;bit_str=11ffff11
	mov	ax,4c00h
	int	21h
end	main

