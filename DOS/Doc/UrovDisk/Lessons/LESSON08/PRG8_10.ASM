;prg8_10.asm
masm
model	small
stack	256
.data
b	db	6,7	;��㯠�������� �᫮ 76
c	db	4	;��㯠�������� �᫮ 4
proizv	db	4 dup (0)
.code
main:	;�窠 �室� � �ணࠬ��
	mov	ax,@data
	mov	ds,ax
	xor	ax,ax
len	equ	2	;ࠧ��୮��� ᮬ����⥫� 1
	xor	bx,bx
	xor	si,si
	xor	di,di
	mov	cx,len	;� cx ����� �������襣� ᮬ����⥫� 1
m1:
	mov	al,b[si]
	mul	c
	aam		;���४�� 㬭������
	adc	al,dl	;�竨 �।��騩 ��७��
	aaa	;᪮�४�஢��� १���� ᫮����� � ��७�ᮬ
	mov	dl,ah	; ��������� ��७��
	mov	proizv[bx],al
	inc	si
	inc	bx
	loop m1
	mov	proizv[bx],dl	;�竨 ��᫥���� ��७��
	exit:
	mov	ax,4c00h
	int	21h
end	main

