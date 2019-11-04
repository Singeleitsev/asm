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
	mov	dx, 14h		;;Делитель времени =
	mov	ax, 4F38h	;;1331000/частота (0144F38h/freq)
	div	di		;;freq
	out	42h, al		;;Записать младший байт счетчика таймера 2
	mov	al, ah
	out	42h, al		;;Записать старший байт счетчика таймера 2
	in	al, 61h		;;Считать текущий режим порта B
	mov	ah, al		;;и сохранить его в регистре ah
	or	al, 3		;;Включить динамик (al: 0000 0011)
	out	61h, al
Delay	duration
	mov	al, ah		;;Восстановить режим порта
	out	61h, al
	pop	di		;;Restore registers
	pop	dx
	pop	cx
	pop	ax
	ENDM
;;********************************