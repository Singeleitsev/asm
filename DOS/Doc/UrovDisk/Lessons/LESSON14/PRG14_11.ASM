;prg14_11.asm
;��뢠��� �����
include	mac.inc
extrn	per1:byte,per2:byte
public	my_proc2,per0
data	segment	para public 'data'
per0	db	'0'
data	ends
code	segment
my_proc2	proc	far
assume	cs:code,ds:data
;ds ����㦠�� �� ����, ⠪ ��� ��������騪 ��� ��ᮥ�����
;� ᥣ����� ������ ��ࢮ�� �����
;�뢮� ᨬ����� �� �࠭
	mov	dl,per0
	OutChar
	mov	dl,per1
	OutChar
	mov	dl,per2
	OutChar
	mov	dl,per0
	OutChar
	ret
my_proc2	endp
code	ends
	end

