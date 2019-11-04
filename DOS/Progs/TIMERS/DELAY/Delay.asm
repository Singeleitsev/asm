;;********************************
;;The DELAY Macro
;;ON ENTRY: 4-byte var: HH, MM, ss, hh
;;RETURNS: none
;;********************************
Delay MACRO var
LOCAL	Correct, hths1, secs0, secs1, mins0, mins1, hrs0, hrs1, Retire, Check, Over
	push	ax		;;store registers
	push	cx
	push	dx
	call	Correct		;;correct input values
;;get BEGIN_TIME
	mov	ax, 2c00h	;;2Ch int 21h - get current time
	int	21h
;;'var' + BEGIN_TIME = END_TIME
	add	var[3], dl	;;hths
	add	var[2], dh	;;secs
	add	var[1], cl	;;mins
	add	var[0], ch	;;hrs
	call	Correct		;;correct gotten values
Check:
;;get CURRENT_TIME
	mov	ax, 2c00h	;;2Ch int 21h - get current time
	int	21h
;;cmp CURRENT_TIME, 'var'
	cmp	var[0], ch	;;hrs
	jg	Check
	jl	Over
	cmp	var[1], cl	;;mins
	jg	Check
	jl	Over
	cmp	var[2], dh	;;secs
	jg	Check
	jl	Over
	cmp	var[3], dl	;;hths
	jg	Check
	jmp	Over
Correct	PROC
	cmp	var[3], 100
	jl	secs0
hths1:
	sub	var[3], 100
	inc	var[2]
	cmp	var[3], 100
	jg	hths1
secs0:
	cmp	var[2], 60
	jl	mins0
secs1:
	sub	var[2], 60
	inc	var[1]
	cmp	var[2], 60
	jg	secs1
mins0:
	cmp	var[1], 60
	jl	hrs0
mins1:
	sub	var[1], 60
	inc	var[0]
	cmp	var[1], 60
	jg	mins1
hrs0:
	cmp	var[0], 24
	jl	Retire
hrs1:
	sub	var[0], 24
	cmp	var[0], 24
	jg	hrs1
Retire:
	ret
Correct	ENDP
Over:
	pop	dx
	pop	cx
	pop	ax
	ENDM
;***************************************
.model SMALL
.stack 256
.data
var	db	00, 00, 05, 00	;;delay 5.0 secs
.code
main proc
	mov	ax, @data
	mov	ds, ax
Delay	var
exit:
	mov	ax, 4c00h
	int	21h
main endp
end main