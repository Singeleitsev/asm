;----------------------------------------------------------
;prg4_123 - ��������� �� ���������� ���������� k-�� �� �������� �������� ������� 
;mas ������ n. ��� ���������� ������� k=n/2.
;����: mas[n] - ��������������� ������������������ 
;�������� ��������; k - �������� ������ k-�� �� �������� 
;�������� ������� mas[n].
;�����: x - �������� k-�� �� �������� �������� 
;������������������ mas[n].
;----------------------------------------------------------
;prg4_123.asm
masm
model small
.data
;������ ������
mas	db	38h,08h,16h,06h,79h,76h,57h,24h,56h,02h,58h,48h,04h,70h,45h,47h
n=$-mas
L	dw	1
R	dw	n
k	dw	9
x	db	0
.stack	256
.486
.code
main:
;���_����
	mov	dx,@data
	mov	ds,dx
;l:=1; r:=n
;���� l<r ������
;��������, ��� k=<n-1
	mov	ax,n-1
	cmp	k,ax
	jg	exit
;���������� k=n/2
;	mov	ax,n
;	shr	ax,1
;	mov	k,ax
;��������� ��������� ������� � 0
	dec	L
	dec	R
@@m8:
;���_����_1
;����(1)������, ���� L<R
;x:=a[k]; i:=l; j:=r
	mov	ax,L
	cmp	ax,R
	jge	exit
;temp:=mas[k]
	mov	bx,k
	mov	al,mas[bx]	;al - ��� x
	mov	x,al
	mov	si,L	;I:=L	si ��� i
	mov	di,R	;J:=R 	di ��� j
@@m7:
;���� repeat ������
;���������
;���� a[i]<x ������ i:=i+1
	cmp	mas[si],al	;mas[i]<temp ???
	jae	@@m3
	inc	si
	jmp	@@m7
;���� x< a[j] ������ j:=j-1
@@m3:
	cmp	al,mas[di]	; temp<mas[j] ???
	jae	@@m5
	dec	di
	jmp	@@m3
@@m5:
;EC�� i�j ��
	cmp	si,di	;I=<J	???
	ja	@@m6
;���� I=<J, �� ����� mas[i]<->mas[j]
;���_����_2
;w:=a[i]; a[i]:=a[j]; a[j]:=w
	mov	dl,mas[si]
	xchg	mas[di],dl
	xchg	mas[si],dl
;i:=i+1; j:=j-1
	inc	si	;I:=I+1
	dec	di	;J=J+1
;���_����_2
;���� i>j
@@m6:
;����(2) �����, ���� I=<J:
	cmp	si,di
	jg	@@m1	;ja ������ !!!
	jmp	@@m7
@@m1:
;���� j<k �� l:=I
	cmp	di,k	;j<k ???
	jge	$+6
	mov	L,si	;L<-I
;���� k<i �� r:=j
	cmp	k,si	;k<i ???
	jge	$+6
	mov	R,di	;R<-J
;����(1)�����
;���_����_1
	jmp	@@m8
;�����
exit:
;���_����
	mov	ax,4c00h
	int	21h
end	main
