;--------------------------------------------------------------------------------;
;prg4_83_BP.asm - ��������� �� ���������� ������ ������ P � ������ S �� ��������� ��-������. ����� S �����������.
;����: S � P - ������� �������� �������� N � M ���� (M=<N).
;�����: ��������� � ���������� ��������� ������ P � ������ S.
;--------------------------------------------------------------------------------;
masm
model small
.data
mes	db	0dh,0ah,"��������� ������ - "
;������ ������ P - �������� ������
p	db	"ab"
Len_P=$-p	;M=Len_P
	db	" - � ������ - "
;������ ������ S
s	db	"fgcabceabcaab"
Len_S=$-s	;N=Len_S
	db	" - "
Count	db	0	;������� ��������� P � S
	Db	" ���(�)$"
d	db	255 dup (0)	;��������������� ������
k	db	0
.stack	256
.486
.code
main:
	mov	dx,@data
	mov	ds,dx
push	ds
pop	es
;���� 1 - ���������� ������� D
;��������� �������� ������� d ��������� M - �������� ������� ��� ������
;��� j=0 �� 255 ������
;���_����_1
;d[j]:=M
;���_����_1
	mov	cx,255	;������ ������� ������� ASCII
	mov	al,len_p
	lea	di,d
rep	stosb
;���� ��������� ������� � ��������� ��������� ��������� d ���������� �������� 
;(��. ��������� �� ������� ���������)
;��� j=0 �� M-2 ������
;���_����_1
;d[p[j]]:=M-j-1
;���_����_1
	xor	si,si	;j:=0
cycl1:
	cmp	si,len_p-1
	jge	e_cycl1
	mov	al,p[si]
	mov	di,ax
	mov	bl,len_p
	dec	bl
	sub	bx,si
	mov	d[di],bl
	inc	si
	jmp	cycl1
e_cycl1:
;//���� 2: �����
;i:=M
	mov	di,len_p	;I:=M
;���������
;j:=M; k:=i
;���� ���� (j>=0)���(I<n)
cycl2:
	mov	si,len_p	;j:=M
	mov	bx,di	;k:=I
;���������
;K:=k-1;j:=j-1
;���� (j>=0)���(p[j]==s[k])
;���� ���� (j>=0)���(p[j]==p[k])
cycl3:
	dec	bx	;k:=k-1
	dec	si	;j:=j-1
;���� ���� (j>=0)���(p[j]==p[k])
	cmp	si,0
	jl	m2
	mov	al,p[si]
	cmp	s[bx],al
	jne	m2
	jmp	cycl3
m2:
;i:=i+d[s[i-1]]
push	di
	dec	di
	mov	al,s[di]
	mov	di,ax
	mov	al,d[di]
pop	di
	add	di,ax	;I:=I+d[s[I-1]]
;���� (j>=0)���(i<N)
;���� ���� (j>=0)���(I<n)
	cmp	si,0
	jl	m1
	cmp	di,len_s
	jg	exit_f
	jmp	cycl2
;���� j<0 �� ����� ��������� �� ����� ������
;����� ����� ��������� � ������� ������
m1:
;����� ��������� � ����������� ������
	inc	count
	jmp	cycl2
exit_f:
	add	count,30h
	lea	dx,mes
	mov	ah,09h
	int	21h
exit:
;���_����
;�����
	mov	ax,4c00h
	int	21h
end	main
