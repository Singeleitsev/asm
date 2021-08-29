;--------------------------------------------------------------------------------;
;prg4_67_f.asm - ����� ������ P � ������ S. ����� S �����������.
;����: S � P - ������� �������� �������� N � M ���� (M=<N).
;�����: ��������� � ���������� ��������� ������ P � ������ S.
;--------------------------------------------------------------------------------;
masm
model small
.data
;������ ������ S
s	db	"Ax, ����� ��� ����� ����! �����, ������, ����� � ����, � ����� ����� ������."
Len_S=$-s
	Db	"$"
mes	db	"��������� ������ - "
;������ ������ P - �������� ������
p	db	"���"
Len_P=$-p
	db	" - "
Count	db	0,"$"	;������� ��������� P � S
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
push	ds
pop	es
	cld
	mov	cx,len_s
	lea	di,s
	mov	al,p	;P[0]->al
next_search:
	lea	si,p
	inc	si	;�� ��������� ������
repne	scasb
	jcxz	exit
push	cx
	mov	cx,len_p-1
repe	cmpsb
	jz	eq_substr
;������ p <> ��������� � s
	mov	bx,len_p-1
	sub	bx,cx
pop	cx
	sub	cx,bx	;���� ���������� ��� ��������� cmpsb
	jmp	next_search
eq_substr:
;����� ����� �����, ���� ����� �����������, �� �� �������, ������� ����������
pop	cx
	sub	cx,len_p-1	;���� ���������� ��� ��������� cmpsb
	inc	count
	jmp	next_search
exit:
	add	count,30h
	lea	dx,mes
	mov	ah,9
	int	21h
;�����
	mov	ax,4c00h
	int	21h
end	main
