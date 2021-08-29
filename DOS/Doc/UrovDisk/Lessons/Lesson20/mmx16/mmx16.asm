;---------mmx16.asm----------------------------------
.586p
model	use16 small
%NOINCL	;��������� ����� ������ ���������� ������
include mmx16.inc
.stack	100h
.data	;������� ������
mmx_mes	db	"�������������� ������������ MMX-����������","$"
no_mmx_mes	db	"�������������� �� ������������ MMX-����������","$"
.code	
main	proc	;������ ��������� main
	mov	ax,@data	
	mov	ds,ax
	xor	edx,edx
	mov	eax,1
	cpuid
	bt	edx,23
	jnc	no_mmx
	mov	ah,9
	mov	dx,offset	mmx_mes
	int	21h
	jmp	exit
no_mmx:	mov	ah,9
	mov	dx,offset	no_mmx_mes
	int	21h
exit:
 	mov	ax,4c00h	;��������� 4c00h � ������� ax
 	int	21h	;����� ���������� � ������� 21h
main	endp		;����� ��������� main
end	main		;����� ��������� � ������ ����� main