;prg_13_5.asm
masm
model	small
stack	256
def_tab_50	macro	len
ifndef	len
	display	'size_m не определено, задайте значение 10<size_m<50'
 	exitm
else
 	if	len GE 50
 		GOTO exit
 	endif
 	if	len LT 10
 	:exit
 	EXITM
 	endif
 	rept	len
 		db	0
 	endm
endif
endm
;size_m=15
.data
def_tab_50	size_m
 
.code
main:
	mov	ax,@data
 	mov	ds,ax
 	exit:
 	mov	ax,4c00h
 	int	21h
 end main
