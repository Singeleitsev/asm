;--------------------------------------------------------------------------------;
;fact.asm - ��������� ���������� ���������� � �������������� ����������� ���������
;--------------------------------------------------------------------------------;
masm
model small
.stack	256
.486
.data
r_fact	dw	0
.code
fact	proc
push	bp
	mov	bp,sp
	mov	cx,[bp+4]
	mov	ax,cx
	mul	r_fact
	mov	r_fact,ax
	dec	cx
	jcxz	end_p
push	cx
	call	fact
end_p:
	mov	sp,bp
	pop	bp
	ret
fact	endp
main:
	mov	ax,@data	;����� �������� ������ � ������� ax
	mov	ds,ax	;ax � ds
	mov	r_fact,1
push	5
	call	fact
exit:	;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
