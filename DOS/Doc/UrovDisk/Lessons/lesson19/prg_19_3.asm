;���⨭� 20.3. ��᫥������� 楫��᫥���� ��䬥��᪨� ������
.586p
masm
model	use16 small
.stack	100h
.data	;ᥣ���� ������
;��室�� ���ᨢ
a	dw	0
x	dw	8
y	dw	4
u	dt	0
.code
main	proc
	mov	ax, @data
	mov	ds, ax
	finit	;�ਢ������ ᮯ����� � ��砫쭮� ���ﭨ�
	fild	a	;����㧪� ���祭�� a � st(0)
	fxam	;��।��塞 ⨯ �
	fstsw	ax	;��࠭���� swr � ॣ���� ax
	sahf	;������ swr->ax-> ॣ���� 䫠���
	jc	no_null
	jp	no_null
	jnz	no_null
;���᫥��� ���� u=x+y:
	fild	x
	fiadd	y
	fbstp	u
	jmp	exit
no_null:
;���᫥��� ���� u=x-y/a:
	fild	x
	fisub	y
	fidiv	a
	fbstp	u
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main

