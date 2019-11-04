;--------------------xmm_32.inc(12:16 30.06.01)-----------------
;Файл xmm_32.inc создан на основе файла iaxmm.inc (для MASM фирмы Microsoft)
;и предназначен для поддержки использования отдельных команд XMM-расширения 
;микропроцессоров фирмы Intel в среде TASM32 фирмы Borland/Inprise.
;-----------------------------------------------------------------

_opc_Addps           = 058H
_opc_Addss           = 058H
_opc_Divps           = 05eH
_opc_Mulps           = 059H
_opc_Movaps_ld       = 028H
_opc_Movaps_st       = 029H
_opc_Movlps_ld       = 012H
_opc_Movlps_st       = 013H
_opc_Movhps_ld       = 016H
_opc_Movhps_st       = 017H
_opc_Movss_ld        = 010H
_opc_Movss_st        = 011H
_opc_Movups_ld       = 010H
_opc_Movups_st       = 011H
_opc_Shufps          = 0c6H
_opc_Subss           = 05cH

rxmm0	equ	<eax>
rxmm1	equ	<ecx>
rxmm2	equ	<edx>
rxmm3	equ	<ebx>
rxmm4	equ	<esp>
rxmm5	equ	<ebp>
rxmm6	equ	<esi>
rxmm7	equ	<edi>

;0F 58 /r  addps xmm1, xmm2/m128
addps  macro   dest:req, src:req
        local   pre,post
pre:
        xadd   src,dest 
post:
        org     pre+1
        db    _opc_Addps  
        org     post
endm

;F3 0F 58 /r  addss xmm1, xmm2/m32
addss  macro   dest:req, src:req
        local   pre,post
pre:
        lock xadd   src,dest 
post:
        org     pre
        db    0f3h ,0fh, _opc_Addss
        org     post
endm

;0F 5E /r  divps xmm1, xmm2/m128
divps  macro   dest:req, src:req
        local   pre,post
pre:
        xadd   src,dest 
post:
        org     pre+1
        db    _opc_Divps
        org     post
endm

;0F 59 /r  mulps xmm1, xmm2/m128
mulps  macro   dest:req, src:req
        local   pre,post
pre:
        xadd   src,dest 
post:
        org     pre+1
        db    _opc_Mulps  
        org     post
endm

;0F 28 /r  movaps xmm1, xmm2/m128
;0F 29 /r  movaps xmm2/m128, xmm1 
movaps  macro   dest:req, src:req
        local   pre,post
ideal
if (symtype dest) and 10h	; register
movq_r_mr=1
else
movq_r_mr=0
endif
masm
if movq_r_mr eq 1
pre:
        xadd   src,dest
post:
        org     pre+1
        db    _opc_Movaps_ld
        org     post
ELSE
pre:
        xadd   dest, src
post:
        org     pre+1
        db    _opc_Movaps_st
        org     post
ENDIF
	endm

;0F 12 /r  movlps xmm, m64
;0F 13 /r  movlps m64, xmm
movlps  macro   dest:req,src:req
        local   pre,post
ideal
if (symtype dest) and 10h	; register
movq_r_mr=1
else
movq_r_mr=0
endif
masm
if movq_r_mr eq 1
pre:
        xadd   src,dest
post:
        org     pre+1
        db    _opc_Movlps_ld
        org     post
ELSE
pre:
           xadd   dest, src
post:
        org     pre+1
        db    _opc_Movlps_st 
        org     post
ENDIF
	endm

;0F 16 /r  movhps xmm, m64
;0F 17 /r  movhps m64, xmm
movhps  macro   dest:req, src:req
        local   pre,post
ideal
if (symtype dest) and 10h	; register
movq_r_mr=1
else
movq_r_mr=0
endif
masm
if movq_r_mr eq 1
pre:
        xadd   src,dest
post:
        org     pre+1
        db    _opc_Movhps_ld
        org     post
ELSE
pre:
           xadd   dest, src
post:
        org     pre+1
        db    _opc_Movhps_st 
        org     post
ENDIF
	endm

;F3 0F 10 /r  movss xmm1, xmm2/m32
;F3 0F 11 /r  movss xmm2/m32, xmm1
movss  macro   dest:req, src:req
        local   pre,post
ideal
if (symtype dest) and 10h	; register
movq_r_mr=1
else
movq_r_mr=0
endif
masm
if movq_r_mr eq 1
pre:
        lock xadd   src, dest
post:
        org     pre
        db    0F3H,0Fh, _opc_Movups_ld
        org     post
ELSE
pre:
        lock xadd   dest, src
post:
        org     pre
        db    0F3H,0Fh, _opc_Movups_st
        org     post
ENDIF
        endm

;0F 10 /r  movups xmm1, xmm2/m128
;0F 11 /r  movups xmm2/m128, xmm1
movups  macro   dest:req, src:req
        local   pre,post
ideal
if (symtype dest) and 10h	; register
movq_r_mr=1
else
movq_r_mr=0
endif
masm
if movq_r_mr eq 1
pre:
        xadd   src,dest
post:
        org     pre+1
        db    _opc_Movups_ld
        org     post
ELSE
pre:
        xadd   dest, src
post:
        org     pre+1
        db    _opc_Movups_st
        org     post
ENDIF
endm

;0F C6 /r  shufps xmm1, xmm2/m128, imm8
shufps  macro   dest:req, src:req, imm:req
        local   pre,post
pre:
        xadd   src,dest
        db	imm 
post:
        org     pre+1
	db    _opc_Shufps
        org     post
endm

;F3 0F 5C /r  subss xmm1, xmm2/m128
subss  macro   dest:req, src:req
        local   pre,post
pre:
        lock xadd   src,dest 
post:
        org     pre
        byte    0f3h ,0fh, _opc_Subss
        org     post
endm