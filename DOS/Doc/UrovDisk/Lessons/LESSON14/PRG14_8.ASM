;prg14_8.asm
;��뢠�騩 ����� - �� ��, �� � ��� �।��饣� ��ਠ��.

;��뢠��� �����
include	mac.inc
extrn	per1:byte,per2:byte
public	my_proc2
data	segment
per0	db	'0'
data	ends
code	segment
my_proc2	proc	far
assume	cs:code,ds:data
;�뢮� ᨬ����� �� �࠭
 	mov	ax,data
 	mov	ds,ax
 	mov	dl,per0
 	OutChar
 	push	ds	;��࠭��� ds
 	mov	ax,seg per1	;ᥣ����� ���� per1 � ds
 	mov	ds,ax
 	mov	dl,per1
 	OutChar		;�뢮� per1
 	mov	dl,per2
 	OutChar		;�뢮� per2
 	pop	ds	;����⠭����� ds
 	mov	dl,per0
 	OutChar		;� �� ࠧ per0
 	ret
 my_proc2 endp
 code	ends
 end

