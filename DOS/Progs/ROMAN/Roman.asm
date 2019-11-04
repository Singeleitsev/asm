include bin2bcd.inc
include sound.inc
;;********************************
;;The ROMAN Program
;;ON ENTRY:	4-Byte BCD-number (<= 3999 (F9Fh)),
;;		15-Byte Result (maximum length at value 3888)
;;RETURNS:	на экране Исходное Число, записанное римскими цифрами
;;********************************
.model SMALL
.stack 256
.data

.code
main PROC
	mov	ax, @data
	mov	ds, ax

exit:
	mov	ax, 4c00h
	int	21h
main ENDP
END main