;prg_12_7.asm
masm
model	small
stack	256
iotest	record	i1:1,i2:2=11,i3:1,i4:2=11,i5:2=00
.data
flag	iotest	<>
.code
main:
	mov	ax,@data
	mov	ds,ax
	mov	al,mask i2
	shr	al,i2	;���� i2 � ��砫� ax
	and	al,0fch	;���㫨�� i2
;����頥� i2 �� ����
	shl	al,i2
	mov	bl,[flag]
	xor	bl,mask i2	;��ᨫ� i2
	or	bl,al		;��������
	exit:
	mov	ax,4c00h	;�⠭����� ��室
	int	21h
end main		;����� �ணࠬ��

