;----------------------------------------------------------
;prg10_01.asm - ��������� �������������� ������������� XMM-������ �� ������ ������� ������������� � ������.
;----------------------------------------------------------
masm
model small
%NOINCL	;��������� ����� ������ ���������� ������
include xmm_16.inc
.stack	256
.586
prizm	struc
	union
	struc	;point_3D - ���������, ����������� ����������� �������� (1 ������)
xyzw1	dd	4 dup (0.0)
xyzw2	dd	4 dup (0.0)
xyzw3	dd	4 dup (0.0)
xyzw4	dd	4 dup (0.0)
	ends
	struc	;prism_point_3D - ���������, ����������� ����������� �������� (2 ������)
x	dd	4 dup (0.0)
y	dd	4 dup (0.0)
z	dd	4 dup (0.0)
w	dd	4 dup (0.0)
	ends
	ends	;����� �����������
	ends
.data
prizm_1	prizm	<?,>	;��������� ��������� � ������������
.code
main:
	mov	ax,@data	;����� �������� ������ � ������� ax
	mov	ds,ax	;ax � ds
;�������������� ������������� ������ �������� (�� �����)
	lea	si,prizm_1
	movlps	rxmm0,[si]	;rxmm0=? ? y0 x0
	movhps	rxmm0,[si+16]	;rxmm0= y1 x1 y0 x0
	movlps	rxmm2,[si+32]	;rxmm2= ? ? y2 x2
	movhps	rxmm2,[si+48]	;rxmm2= y3 x3 y2 x2
	movaps	rxmm1,rxmm0	;rxmm1= y1 x1 y0 x0
	shufps	rxmm0,rxmm2,88h	;rxmm0= x3 x2 x1 x0
	shufps	rxmm1,rxmm2,0ddh	;rxmm1= y3 y2 y1 y0

	movlps	rxmm2,[si+8]	;rxmm2=? ? w0 z0
	movhps	rxmm2,[si+24]	;rxmm2= w1 z1 w0 z0
	movlps	rxmm4,[si+40]	;rxmm4= ? ? w2 z2
	movhps	rxmm4,[si+56]	;rxmm4= w3 z3 w2 z2
	movaps	rxmm3,rxmm2	;rxmm3= w1 z1 w0 z0
	shufps	rxmm2,rxmm4,88h	;rxmm2= = z3 z2 z1 z0
	shufps	rxmm3,rxmm4,0ddh	;rxmm3= w3 w2 w1 w0

;�� ������ ������� ��������� ��������� XMM-���������:

;rxmm0= x3 x2 x1 x0
;rxmm1= y3 y2 y1 y0
;rxmm2= = z3 z2 z1 z0
;rxmm3= w3 w2 w1 w0
;������ �� ���������� ��������� � ������:
	movups	[si],rxmm0
	movups	[si+16],rxmm1
	movups	[si+32],rxmm2
	movups	[si+48],rxmm3

exit:	;����� �� ���������
	mov	ax,4c00h	;��������� 4c00h � ������� ax
	int	21h	;����� ���������� � ������� 21h
end	main		;����� ��������� � ������ ����� main
