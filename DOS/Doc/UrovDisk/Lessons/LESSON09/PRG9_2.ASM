;prg_9_2.asm
masm
model	small
stack	256
.data
len=4		;����� ��㯠��������� BCD-�᫠
unpck_BCD	label	dword
dig_BCD	db	2,4,3,6	;��㯠�������� BCD-�᫮ 6342
pck_BCD	dd	0	; pck_BCD=00006342
.code
main:	;�窠 �室� � �ணࠬ��
	mov	ax,@data
	mov	ds,ax
	xor	ax,ax
	mov	cx,len
.386			;�� ��易⥫쭮
	mov	eax,unpck_BCD
m1:
	shl	eax,4	;㡨ࠥ� �㫥��� ��ࠤ�
	shld	pck_BCD,eax,4	;��ࠤ� � ��ன � ���� pck_BCD
	shl	eax,4	;㡨ࠥ� ��ࠤ� � ��ன �� eax
	loop	m1	;�� 横�
	exit:		;pck_BCD=00006342
	mov	ax,4c00h
	int	21h
end	main

