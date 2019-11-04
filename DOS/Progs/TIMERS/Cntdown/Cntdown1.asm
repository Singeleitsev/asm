;;*******************************
;;The COUNTDOWN Macro
;;On Entry: Name Of Variable Containing
;;	Delay_Time (Byte Variable (HH, MM, ss, hh))
;;Returns: Time_Remaining On Screen
;;*******************************
countdown	MACRO	var
LOCAL 	WaitForZero, SubHths, SubSecs, SubMins, SubHrs, Over
LOCAL	hths1, secs0, secs1, mins0, mins1, hrs0, hrs1, retire
LOCAL	ChkHrs, ChkMins, ChkSecs, ChkHths, ChkRet
	push	ax
	push	bx
	push	cx
	push	dx
	push	di
	push	si
;;GO!!!
	call	CrctAdd		;;Correct Values As After Addition
	call	VarStore	;;Store Delay_Time in Stack
;;Get Current_Time
	mov	ah, 2Ch		;;2Ch int 21h - Get Current_Time
	int	21h		;;ch=HH, cl=MM, dh=ss, dl=hh
;;'var' + Current_Time = End_Time
	add	var[3], dl
	add	var[2], dh
	add	var[1], cl
	add	var[0], ch
	call	CrctAdd		;;Correct values after addition
;;Now 'var' contains End_Time
;;********LOOP********
WaitForZero:
	call	VarStore	;;Store End_Time in Stack
;;Get Current_Time
	mov	ah, 2Ch
	int	21h		;;ch=HH, cl=MM, dh=ss, dl=hh
;;'var' - Current_Time = Time_Remaining
	cmp	var[3], dl
	jge	SubHths
	call	CrctSub		;;Xchg 0 <-> max
	add	var[3], 100
	dec	var[2]
SubHths:
	sub	var[3], dl

	cmp	var[2], dh
	jge	SubSecs
	call	CrctSub
	add	var[2], 60
	dec	var[1]
SubSecs:
	sub	var[2],dh

	cmp	var[1], cl
	jge	SubMins
	call	CrctSub
	add	var[1], 60
	dec	var[0]
SubMins:
	sub	var[1], cl

	cmp	var[0], ch
	jge	SubHrs
	call	CrctSub
	add	var[0], 24
SubHrs:
	sub	var[0], ch	
;;Correct values
	call	CrctAdd
;;Now 'var' contains Time_Remaining
;;Print Time_Remaining
	call	VarReStore	;;Restore End_Time in 'var'
;;Now 'var' contains End_Time
;;Get Current_Time
	mov	ah, 2Ch
	int	21h
;;Compare End_Time & Current_Time
	cmp	var[0], ch
	jl	Over
	jg	WaitForZero
	cmp	var[1], cl
	jl	Over
	jg	WaitForZero
	cmp	var[2], dh
	jl	Over
	jg	WaitForZero
	cmp	var[3], dl
	jg	WaitForZero
	call	VarRestore	;;Else restore Delay_Time
        jmp     Over
;;*******************************
VarStore	PROC	far
	xor	ax, ax
	mov	al, var[3]
	push	ax
	mov	al, var[2]
	push	ax
	mov	al, var[1]
	push	ax
	mov	al, var[0]
	push	ax
	ret
VarStore	ENDP
VarReStore	PROC	far
        pop	ax
        mov	var[0], al
        pop	ax
	mov	var[1], al
        pop	ax
	mov	var[2], al
        pop	ax
        mov     var[3],al
	ret
VarReStore	ENDP
CrctAdd PROC	far
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
CrctAdd ENDP
CrctSub	PROC	far
ChkHrs:
	cmp	var[0], 0
	jg	ChkMins
	add	var[0], 24
ChkMins:
	cmp	var[1], 0
	jg	ChkSecs
	add	var[1],	60
	dec	var[0]
	jmp	ChkHrs
ChkSecs:
	cmp	var[2], 0
	jg	ChkHths
	add	var[2], 60
	dec	var[1]
	jmp	ChkHrs
ChkHths:
	cmp	var[3], 0
	jg	ChkRet
	add	var[3], 100
	dec	var[2]
	jmp	ChkHrs
ChkRet:
	ret
CrctSub	ENDP
Over:
	pop	si
	pop	di
	pop	dx
	pop	cx
	pop	bx
	pop	ax
        ENDM
;;*******************************
.model small
.stack 256
.data
time_rem	db	00, 00, 10, 00
EXTRN	VarStore, VarReStore, CrctAdd, CrctSub
.code
main	proc
	mov	ax, @data
	mov	ds, ax
countdown	time_rem
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main
