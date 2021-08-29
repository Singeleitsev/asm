;prg_13_4.asm
masm
model	small
stack	256
def_tab_50	macro	len
if	len GE 50
GOTO	exit
endif
if	len LT 10
:exit
EXITM
endif
rept	len
	db	0
endm
endm
.data
def_tab_50	15
def_tab_50	5
.code
main:
 	mov	ax,@data
 	mov	ds,ax
 	exit:
 	mov	ax,4c00h
 	int	21h
end	main

