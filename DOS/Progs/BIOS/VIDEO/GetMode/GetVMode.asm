include showax.inc
include minica1.inc
include minica2.inc
include bin2bcd.inc
.model SMALL
.stack 256
.data
VMODE_MES	db	13,10,'Current Video Mode: '
VMODE_MES_LEN=$-VMODE_MES
VMODE		db	2 dup (0)
VMODE_LEN=$-VMODE
COLS_MES	db	13,10,'Number Of Columns (Characters Per Line): '
COLS_MES_LEN=$-COLS_MES
COLS		db	2 dup (0)
COLS_LEN=$-COLS
PG_NUM_MES	db	13,10,'Active Video Page No.: '
PG_NUM_MES_LEN=$-PG_NUM_MES
PG_NUM		db	2 dup (0)
PG_NUM_LEN=$-PG_NUM
BYTE_BUF	db	(0)
BYTE_LEN=$-BYTE_BUF
.code
main proc
	mov	ax, @data
	mov	ds, ax
;Get Current Video Mode
	mov	ah, 0Fh
	int	10h

putascii VMODE_MES, VMODE_MES_LEN
	mov	BYTE_BUF, al
bin2bcd BYTE_BUF, BYTE_LEN, VMODE, VMODE_LEN
putbcd	VMODE, VMODE_LEN

putascii COLS_MES, COLS_MES_LEN
	mov	BYTE_BUF, ah
bin2bcd BYTE_BUF, BYTE_LEN, COLS, COLS_LEN
putbcd	COLS, COLS_LEN

putascii PG_NUM_MES, PG_NUM_MES_LEN
	mov	BYTE_BUF, bh
bin2bcd BYTE_BUF, BYTE_LEN, PG_NUM, PG_NUM_LEN
putbcd	PG_NUM, PG_NUM_LEN

showax
	xor	ax, ax
	mov	ax, bx
showax

exit:
        mov     ax, 4c00h
        int     21h
main endp
end main