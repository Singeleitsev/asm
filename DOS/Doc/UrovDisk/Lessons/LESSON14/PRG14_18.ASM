;prg14_18.asm
MASM
MODEL	small
data	segment	word	public	;ᥣ���� ������
	;������� ���譨� ��६�����
	extrn	value1:WORD
	extrn	value2:WORD
data	ends	;����� ᥣ���� ������
.code
	assume	ds:data	;�ਢ離� ds � ᥣ�����
			;������ �ணࠬ�� �� Pascal
main:
AddAsm	proc	near
PUBLIC	AddAsm	;������
	mov	cx,ds:value1	;value1� cx
	mov	dx,ds:value2	; value2� dx
	add	cx,dx	;᫮�����
	mov	ax,cx	;१���� � ax, ⠪ ��� - ᫮��
	ret	;������ �� �㭪樨
AddAsm	endp	;����� �㭪樨
end	main	;����� �ணࠬ��

