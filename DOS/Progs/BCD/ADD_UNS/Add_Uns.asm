
;This program calculates
;THE DECIMAL SUM OF TWO DECIMAL NUMBERS.
;Actually, this program was developed to show
;A DIALOG BETWEEN COMPUTER AND USER,
;i.e. easily enter data from keyboard
;and immediately see results on the screen.
;assembled with masm 5.1

.model small
.stack 256
.data
len	equ	2		;length of both numbers
mes_1	db	10, 13, 'Enter the first summand: $'
mes_2	db	10, 13, 'Enter the second summand: $'
mem_1   db      2 dup ('0')
mem_2   db      2 dup ('0')
sum	db	3 dup ('0')
;important: here final message begins
message	db	10, 13, 'Your result is: '
res	db	3 dup ('0')
        db      '!$'            ;and here it ends
.code
main	proc
	mov	ax, @data
	mov	ds, ax

;USER ASKS A QUESTION:
load_res:
        mov	dx, offset mes_1          ;loading SUMMAND 1
	mov	ah, 9
	int	21h
	xor	ax, ax
	mov	ah, 1h
	int	21h
	mov	dl, al		;greater figure of first number to DL
	sub	dl, 30h		;de-ASCII
	int	21h		;less figure of first number is in AL
	sub	al, 30h		;de-ASCII
	xor	bx, bx
	mov	mem_1[bx],al	;less figure at less address
	inc	bx
	mov	mem_1[bx],dl	;greater figure at greater address
				;that means e.g. number '71'will be
				;written in memory as '01 07'

        mov	dx, offset mes_2          ;loading SUMMAND 2
	mov	ah, 9
	int	21h
	xor	ax, ax
	mov	ah, 1h
	int	21h
        mov     dl, al          ;greater figure of second number to DL
	sub	dl, 30h		;de-ASCII
        int     21h             ;less figure of second number is in AL
	sub	al, 30h		;de-ASCII
	xor	bx, bx
        mov     mem_2[bx],al	;less figure at less address
	inc	bx
        mov     mem_2[bx],dl	;greater figure at greater address

;COMPUTER THINKS:
	xor	bx, bx
	mov	cx, len		;number of cycles
m1:
        mov     al, mem_1[bx]   ;load a figure (less than greater)
                                ;of first number
        adc     al, mem_2[bx]   ;add up figures of summands
	aaa
	mov	sum[bx], al	;set figure in result
	inc	bx
	loop	m1
	adc	sum[bx], 0	;correct using carry flag
	add	sum[00], 30h
	add	sum[01], 30h
print:
        mov     al, sum[00]     ;reset the sequence of figures in
	mov	res[02], al	;number from Intel to decimal
	mov	al, sum[01]
	mov	res[01], al
	mov	al, sum[02]
	mov	res[00], al
;COMPUTER RETURNS THE ANSWER:
        mov     dx, offset message
        mov     ah, 9
        int     21h
exit:
	mov	ax, 4c00h
	int	21h
main	endp
end	main
