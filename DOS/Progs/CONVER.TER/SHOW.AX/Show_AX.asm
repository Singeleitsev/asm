;********************************
;����� ����⭮�� �뢮�� �� ���᮫� ᮤ�ন���� ॣ���� al
;********************************
;����: ��祣�
;�����: ���祭�� ॣ���� al �� ��࠭�
;********************************
ShowAX MACRO
LOCAL PutBit, Put0, Next
	push	bx
	push	cx
	push	dx
	push	ax ;�㥬 ��᫥����, �⮡� ��� ���祭�� �뫮 � ���設� �⥪�
;��ॢ���� �� ����� ��ப� � �����頥� �����
	mov	ax, 0200h
	mov	dx, 0Ah
	int	21h
	mov	dx, 0Dh
	int	21h
;���堫�
	mov	cx, 16
	mov	bx, 1000000000000000b
PutBit:
	pop	ax	;�騬 �� �⥪� ��室��� ���祭�� ax
	push	ax	;� �����頥� ��� � �⥪
	and	ax, bx		;ax:1000 0000 0000 0000

	cmp	ax, 0
	je	Put0
	mov	ax, 0200h
	mov	dx, 0031h
	int	21h
	jmp	Next
Put0:
	mov	ax, 0200h
	mov	dx, 0030h
	int	21h
Next:
	shr	bx, 1		;dx:0100 0000 0000 0000
	loop	PutBit
	pop	ax
	pop	dx
	pop	cx	
	pop	bx
	ENDM
;********************************
.model SMALL
.stack 256
.data
.code
main proc
	mov	ax, @data
	mov	ds, ax
	mov	ax, 1110111011101110b
ShowAX
exit:
	mov	ax, 4c00h
	int	21h
main endp
end main