;prg12_6.asm
masm
model	small
stack	256
.586P
pnt struc	;������� pnt, ᮤ�ঠ�� ��������� ��ꥤ������
	union		;���ᠭ�� ���������� � �������� ��ꥤ������
offs_16	dw	?
offs_32	dd	?
	ends		;����� ���ᠭ�� ��ꥤ������
segm	dw	?
	ends		;����� ���ᠭ�� ��������
.data
point	union	;��।������ ��ꥤ������,
;ᮤ�ঠ饣� ��������� ��������
off_16	dw	?
off_32	dd	?
point_16	pnt	<>
point_32	pnt	<>
point	ends
tst	db	"��ப� ��� ���஢����"
adr_data	point	<>	;��।������ ������� ��ꥤ������
.code	
main:	
	mov	ax,@data
	mov	ds,ax
	mov	ax,seg tst
;������� ���� ᥣ���� ��ப� tst � ���� �������� adr_data
	mov	adr_data.point_16.segm,ax
;����� ����������� ����� ������� ���祭�� �� �⮣� ���� ���⭮, � �ਬ���, � ॣ���� bx:
	mov	bx,adr_data.point_16.segm 
;�ନ�㥬 ᬥ饭�� � ���� �������� adr_data
	mov	ax,offset tst	;ᬥ饭�� ��ப� � ax
	mov	adr_data.point_16.offs_16,ax
;�������筮, ����� �����������, ����� ������� ���祭�� �� �⮣� ����:
	mov	bx,adr_data.point_16.offs_16
	exit:
	mov	ax,4c00h
	int	21h
end	main

