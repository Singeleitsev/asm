INCLUDE bin2bcd.inc
INCLUDE minica1.inc
INCLUDE minica2.inc
.model SMALL
.stack 256
.data
TODAY_MSG	db	10,13, 'Today is '
TODAY_MSG_LEN=$-TODAY_MSG
DAY		db	2 dup (0)	;00 00
DAY_LEN=$-DAY
MONTH		db	2 dup (0)	;00 00
MONTH_LEN=$-MONTH
WEEK		db	0		;00
WEEK_LEN=$-WEEK
YEAR		db	4 dup (0)	;00 00 00 00
YEAR_LEN=$-YEAR
POINT		db	'.'		;.
POINT_LEN=$-POINT
SPACE           db      ' '             ;20
SPACE_LEN=$-SPACE
BYTE_NUM	db      0                   ;00
BYTE_NUM_LEN=$-BYTE_NUM
WORD_NUM	db	2 dup (0)	;00 00
WORD_NUM_LEN=$-WORD_NUM

.code
main proc
	mov	ax, @data
	mov	ds, ax
;Display message 'Today is '
PutASCII TODAY_MSG, TODAY_MSG_LEN
;Get Info
	mov	ax, 2a00h
	int	21h
;Display DAY
	mov	BYTE_NUM, dl
Bin2BCD BYTE_NUM, BYTE_NUM_LEN, DAY, DAY_LEN
PutBCD DAY, DAY_LEN
PutASCII POINT, POINT_LEN
;Display MONTH
        mov     BYTE_NUM, dh
Bin2BCD BYTE_NUM, BYTE_NUM_LEN, MONTH, MONTH_LEN
PutBCD MONTH, MONTH_LEN
PutASCII POINT, POINT_LEN
;Display YEAR
        mov     WORD_NUM[0], ch
        mov     WORD_NUM[1], cl
Bin2BCD WORD_NUM, WORD_NUM_LEN, YEAR, YEAR_LEN
PutBCD YEAR, YEAR_LEN
PutASCII SPACE, SPACE_LEN
;Display WEEK
        mov     BYTE_NUM, al
Bin2BCD BYTE_NUM, BYTE_NUM_LEN, WEEK, WEEK_LEN
PutBCD WEEK, WEEK_LEN
exit:
        mov     ax, 4c00h
        int     21h
main endp
end main

