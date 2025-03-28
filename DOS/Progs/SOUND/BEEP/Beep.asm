include	delay.inc
;;********************************
;;The SOUND Macro
;;ON ENTRY: 1-Word Frequency (Hz's), 4-Byte Duration (HH, MM, ss, hh)
;;RETURNS: none
;;********************************
Sound	MACRO freq, duration
LOCAL	wait, spkr_on
	push	ax		;;store registers
	push	cx
	push	dx
	push	di
	mov	di, freq
	mov	al, 0B6h	;;Timer Mode: 1011 0110
	out	43h, al
	mov	dx, 14h		;;����⥫� �६��� =
	mov	ax, 4F38h	;;1331000/���� (0144F38h/freq)
	div	di		;;freq
	out	42h, al		;;������� ����訩 ���� ���稪� ⠩��� 2
	mov	al, ah
	out	42h, al		;;������� ���訩 ���� ���稪� ⠩��� 2
	in	al, 61h		;;����� ⥪�騩 ०�� ���� B
	mov	ah, al		;;� ��࠭��� ��� � ॣ���� ah
	or	al, 3		;;������� ������� (al: 0000 0011)
	out	61h, al
Delay	duration
	mov	al, ah		;;����⠭����� ०�� ����
	out	61h, al
	pop	di		;;Restore registers
	pop	dx
	pop	cx
	pop	ax
	ENDM
;;********************************
.model SMALL
.stack 256
.data
freq		dw	1000
duration	db	00, 00, 00, 50
.code
main PROC
	mov	ax, @data
	mov	ds, ax
Sound	freq, duration
exit:
	mov	ax, 4c00h
	int	21h
main ENDP
END main