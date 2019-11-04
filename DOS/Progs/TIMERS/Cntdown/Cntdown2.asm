INCLUDE Bin2BCD.inc
;;*******************************
;;The COUNTDOWN Macro
;;On Entry:	Name Of Variable Containing
;;		Delay_Time (Byte Variable (HH, MM, ss, hh))
;;Returns:	Time_Remaining On Screen
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
;;Get Start_Time
	mov	ah, 2Ch		;;2Ch int 21h - Get Current_Time
	int	21h		;;ch=HH, cl=MM, dh=ss, dl=hh
	push	cx
	push	dx
;;Convert To Centiseconds
	call	Numerize
;;GO!!!
	call	GetEndTime	;;Add Start_Time To Delay_Time
	call	CrctAdd		;;Correct Values After Addition
	call	VarStore	;;Store End_Time in Stack





Over:
	pop	si
	pop	di
	pop	dx
	pop	cx
	pop	bx
	pop	ax
        ENDM
;;*******************************
.386
.model small
.stack 256
.data
time_rem	db	3000	;;Time in Centiseconds

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
