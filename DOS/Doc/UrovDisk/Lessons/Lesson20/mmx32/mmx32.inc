
;//‡­ зҐ­Ёп ўв®а®Ј® Ў ©в  ¬ иЁ­­®Ј® д®а¬ в  MMX-Є®¬ ­¤
_opc_emms	equ	77h
_opc_movd_ld	equ	6eh
_opc_movd_st	equ	7eh
_opc_movq_ld	equ	6fh
_opc_movq_st	equ	7fh
_opc_packssdw	equ	6bh
_opc_packsswb	equ	63h
_opc_packuswb	equ	67h
_opc_paddb	equ	0fch
_opc_paddd	equ	0feh
_opc_paddsb	equ	0ech
_opc_paddsw	equ	0edh
_opc_paddusb	equ	0dch
_opc_paddusw	equ	0ddh
_opc_paddw	equ	0fdh
_opc_pand	equ	0dbh
_opc_pandn	equ	0dfh
_opc_pcmpeqb	equ	74h
_opc_pcmpeqd	equ	76h
_opc_pcmpeqw	equ	75h
_opc_pcmpgtb	equ	64h
_opc_pcmpgtd	equ	66h
_opc_pcmpgtw	equ	65h
_opc_pmaddwd	equ	0f5h
_opc_pmulhw	equ	0e5h
_opc_pmullw	equ	0d5h
_opc_por	equ	0ebh
_opc_pshimd	equ	72h
_opc_pshimq	equ	73h
_opc_pshimw	equ	71h
_opc_pslld	equ	0f2h
_opc_psllq	equ	0f3h
_opc_psllw	equ	0f1h
_opc_psrad	equ	0e2h
_opc_psraw	equ	0e1h
_opc_psrld	equ	0d2h
_opc_psrlq	equ	0d3h
_opc_psrlw	equ	0d1h
_opc_psubb	equ	0f8h
_opc_psubd	equ	0fah
_opc_psubsb	equ	0e8h
_opc_psubsw	equ	0e9h
_opc_psubusb	equ	0d8h
_opc_psubusw	equ	0d9h
_opc_psubw	equ	0f9h
_opc_punpckhbw	equ	68h
_opc_punpckhwd	equ	69h
_opc_punpckhdq	equ	6ah
_opc_punpcklbw	equ	60h
_opc_punpcklwd	equ	61h
_opc_punpckldq	equ	62h
_opc_pxor	equ	0efh
;_opc_rdpmc              equ     33h

rmmx0	equ	<eax>
rmmx1	equ	<ecx>
rmmx2	equ	<edx>
rmmx3	equ	<ebx>
rmmx4	equ	<esp>
rmmx5	equ	<ebp>
rmmx6	equ	<esi>
rmmx7	equ	<edi>

emms	macro
	db	0fh
	db	_opc_emms
	endm


movd	macro	dest:req,src:req
	local	pre,post
ideal
if (symtype dest) and 10h
pre:
	xadd	[src],dest
post:
	org	pre+1
	db	_opc_movd_ld	
	org	post
else
pre:
	xadd	[dest],src
post:
	org	pre+1
	db	_opc_movd_st	
	org	post
endif
masm
	endm

movq	macro	dest:req,src:req
	local	pre,post
ideal
if ((symtype dest) and 10h)
movq_r_mr=1
else
movq_r_mr=0
endif
masm
if movq_r_mr eq 1
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_movq_ld	
	org	post
else
display	'При использовании косвенной адресации используйте односкобочную запись, к примеру:'
display	'вместо [ebx][esi*4] используйте [ebx+esi*4]'
pre:
	xadd	dest,src
post:
	org	pre+1
	db	_opc_movq_st	
	org	post
endif
	endm

packsswb	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_packsswb
	org	post
	endm

packssdw	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_packssdw
	org	post
	endm

packuswb	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_packuswb
	org	post
	endm

paddb	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_paddb
	org	post
	endm

paddw	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_paddw
	org	post
	endm

paddd	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_paddd
	org	post
	endm

paddsb	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_paddsb
	org	post
	endm

paddsw	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_paddsw
	org	post
	endm

paddusb	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_paddusb
	org	post
	endm

paddusw	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_paddusw
	org	post
	endm

pand	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_pand
	org	post
	endm

pandn	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_pandn
	org	post
	endm

pcmpeqb	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_pcmpeqb
	org	post
	endm

pcmpeqw	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_pcmpeqw
	org	post
	endm

pcmpeqd	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_pcmpeqd
	org	post
	endm 

pcmpgtb		macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_pcmpgtb	
	org	post
	endm 

pcmpgtw		macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_pcmpgtw
	org	post
	endm 

pcmpgtd		macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_pcmpgtd	
	org	post
	endm 

pmaddwd	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_pmaddwd
	org	post
	endm 

pmulhw	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_pmulhw	
	org	post
	endm 

pmullw	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_pmullw
	org	post
	endm 

por	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_por
	org	post
	endm 

psllw	macro	dest:req,src:req
	local	pre,post
ideal
if (symtype src) and 04h
;if (.type(src)) and 04h
pre:
	btr	dest,src
post:
	org	pre+1
	db	_opc_pshimw	
	org	post
else
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_psllw	
	org	post
endif
masm
	endm

pslld	macro	dest:req,src:req
	local	pre,post
ideal
if (symtype src) and 04h
;if (.type(src)) and 04h
pre:
	btr	dest,src
post:
	org	pre+1
	db	_opc_pshimd
	org	post
else
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_pslld
	org	post
endif
masm
	endm

psllq	macro	dest:req,src:req
	local	pre,post
ideal
if (symtype src) and 04h
;if (.type(src)) and 04h
pre:
	btr	dest,src
post:
	org	pre+1
	db	_opc_pshimq
	org	post
else
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_psllq
	org	post
endif
masm
	endm

psraw	macro	dest:req,src:req
	local	pre,post
ideal
if (symtype src) and 04h
;if (.type(src)) and 04h
pre:
	bt	dest,src
post:
	org	pre+1
	db	_opc_pshimw
	org	post
else
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_psraw	
	org	post
endif
masm
	endm

psrad	macro	dest:req,src:req
	local	pre,post
ideal
if (symtype src) and 04h
;if (.type(src)) and 04h
pre:
	bt	dest,src
post:
	org	pre+1
	db	_opc_pshimd
	org	post
else
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_psrad	
	org	post
endif
masm
	endm

psrlw	macro	dest:req,src:req
	local	pre,post
ideal
if (symtype src) and 04h
;if (.type(src)) and 04h
pre:
	xadd	dest,rmmx2
	db	src
post:
	org	pre+1
	db	_opc_pshimw
	org	post
else
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_psrlw	
	org	post
endif
masm
	endm

psrld	macro	dest:req,src:req
	local	pre,post
ideal
if (symtype src) and 04h
;if (.type(src)) and 04h
pre:
	xadd	dest,rmmx2
	db	src
post:
	org	pre+1
	db	_opc_pshimd
	org	post
else
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_psrld
	org	post
endif
masm
	endm

psrlq	macro	dest:req,src:req
	local	pre,post
ideal
if (symtype src) and 04h
;if (.type(src)) and 04h
pre:
	xadd	dest,rmmx2
	db	src
post:
	org	pre+1
	db	_opc_pshimq
	org	post
else
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_psrlq
	org	post
endif
masm
	endm

psubb	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_psubb	
	org	post
	endm

psubw	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_psubw
	org	post
	endm

psubd	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_psubd
	org	post
	endm

psubsb	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_psubsb
	org	post
	endm

psubsw	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_psubsw
	org	post
	endm

psubusb	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_psubusb
	org	post
	endm

psubusw	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_psubusw
	org	post
	endm

punpckhbw	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_punpckhbw	
	org	post
	endm

punpckhwd	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_punpckhwd	
	org	post
	endm

punpckhdq	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_punpckhdq	
	org	post
	endm

punpcklbw	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_punpcklbw
	org	post
	endm

punpcklwd	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_punpcklwd
	org	post
	endm

punpckldq	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_punpckldq
	org	post
	endm
	
pxor	macro	dest:req,src:req
	local	pre,post
pre:
	xadd	src,dest
post:
	org	pre+1
	db	_opc_pxor
	org	post
	endm