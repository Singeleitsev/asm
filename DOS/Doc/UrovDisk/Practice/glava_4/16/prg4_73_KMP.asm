;--------------------------------------------------------------------------------;
;prg4_73_KMP.asm - ��������� �� ���������� ������ ������ P � ������ S �� ��������� ���-������. ����� S �����������.
;����: S � P - ������� �������� �������� N � M ���� (M=<N).
;�����: ��������� � ���������� ��������� ������ P � ������ S.
;--------------------------------------------------------------------------------;
masm
model small
.data
;������ ������ S
s	db	"fgcabefabcaabcdabc!bdededegjfkababcdabcecabeabcdabcej;koiabcabe"
Len_S=$-s	;N=Len_S
	Db	"$"
mes	db	0dh,0ah,"��������� ������ - "
;������ ������ P - �������� ������
p	db	"abcdabce"
Len_P=$-p	;M=Len_P
	db	" - "
Count	db	0,"$"	;������� ��������� P � S
d	db	Len_p dup (0)	;������ ��������
k	db	0
.stack	256
.486
.code
main:
;���_����
	mov	dx,@data
	mov	ds,dx
push	ds
pop	es
;���� 1 - ���������� ������� ��������
;j:=0; k:=-1; d[0]:=-1
	xor	si,si	;si - ��� j
	mov	k,-1
	mov	d,-1
;���� j<M-1 ������
;���_����_1
cycl1:
	cmp	si,len_p-1	; j<M-1
	jge	exit_d
;���� ((k>=0)�(p[j]<>p[k])) k:=d[k]
	cmp	k,0
	jl	falsee
	mov	bl,k
	mov	al,p[si]
	cmp	al,p[bx]
	je	falsee
	mov	bl,d[bx]
	mov	k,bl	;k:=d[k]
	jmp	cycl1
falsee:
;j:=j+1; k:=k+1
	inc	si	;j:=j+1
	inc	k
	mov	bl,k
;���� p[j]==p[k] �� d[j]:=d[k]
	mov	al,p[si]
	cmp	al,p[bx]
	jne	elsee
	mov	al,d[bx]
	mov	d[si],al
	jmp	cycl1	;$+6
elsee:
;����� d[j]:=k
	mov	d[si],bl
	jmp	cycl1
;���_����_1
exit_d:
;���� 2: �����
;i:=0; j:=0; k:=0
	xor	di,di	;i:=0
	xor	si,si	;j:=0
;���� ((j<M)�(i<N)) ������
m3:	cmp	si,Len_p
	jge	m1
m34:	cmp	di,Len_s
	jge	m1
;���_����_1
;���� ((j>=0)�(s[i]<>p[j])) j:=d[j]
	cmp	si,0
	jl	m4
	mov	al,s[di]
	cmp	al,p[si]
	je	m4
	mov	al,d[si]
	cbw
	mov	si,ax
;j:=j+1; i:=i+1
m4:
	inc	si
	inc	di
	jmp	m3
;���_����_1
;���� j=M �� ����� ��������� �� ����� ������
;����� ����� ��������� � ������� ������
m1:
;����� ��������� � ����������� ������
	cmp	si,len_p
	jne	exit_f	;�� �����
	inc	count
	cmp	di,len_s
	jge	exit_f
	xor	si,si
	jmp	m34
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
