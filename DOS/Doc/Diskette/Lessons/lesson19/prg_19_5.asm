;���⨭� 20.5. ��᫥������� ࠡ��� ������� fxtract
.586p
masm
model	use16 small
.stack	100h
.data	;ᥣ���� ������
m_dt	dt	0
ch_dt	dt	0
y_real	dt	45.56	;y_real=4004 b63d 70a3 d70a 3d71
.code	
main	proc	;��砫� ��楤��� main
	mov	ax, @data
	mov	ds, ax
	fld	y_real	;st(0)=4004 b63d 70a3 d70a 3d71 (45.56)
	fxtract		;st(1)=4001 a000 ... 0000 (5), 
;st(0)=3fff b63d 70a3 d70a 3d71 (1.42375)
	fstp	m_dt	;st(0)=4001 a000 ... 0000
;m_dt=3fff b63d 70a3 d70a 3d71 (1.42375)
	fstp	ch_dt	;m_dt=3fff b63d 70a3 d70a 3d71 (1.42375)
;ch_dt=4001 a000 ... 0000 (5)
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main

