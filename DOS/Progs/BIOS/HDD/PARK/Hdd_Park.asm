INCLUDE minica2.inc		;PutASCII
.model small
.stack 256
.data
mes1	db      10, 13, 'Execute HDD Head Parking Program [Y,N]?'
mes1_len=$-mes1
mes2	db	10, 13, 'Yes or No? '
mes2_len=$-mes2
reply	db	0
reply_len=$-reply
alright	db	10, 13, 'Proceeded successfully. Goodbye!'
alright_len=$-alright
warning	db	10, 13, 'Sorry, but some error occured during process'
warning_len=$-warning
.code
main	proc
	mov	ax, @data
	mov	ds, ax

PutASCII mes1, mes1_len
GetChk:
GetASCII reply, reply_len
	cmp	reply, 'y'
	je	OhYes
	cmp	reply, 'Y'
	je	OhYes
	cmp	reply, 'n'
	je	exit
	cmp	reply, 'N'
	je	exit
PutASCII mes2, mes2_len	
	jmp	GetChk
OhYes:
	mov	ah, 19h		;19h int 13h
	mov	dl, 3h		;drive letter C: => number 3
	int	13h
	jnc	OK
PutASCII warning, warning_len
	jmp	exit
OK:
PutASCII alright, alright_len
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main