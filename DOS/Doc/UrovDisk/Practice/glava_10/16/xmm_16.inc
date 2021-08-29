;--------------------xmm_16.inc(12:16 30.06.01)-----------------
;Файл xmm_16.inc создан на основе файла iaxmm.inc (для MASM фирмы Microsoft)
;и предназначен для поддержки использования отдельных команд XMM-расширения 
;микропроцессоров фирмы Intel в среде TASM фирмы Borland/Inprise.
;-----------------------------------------------------------------

_opc_Addps           = 058H
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

rxmm0	equ	<ax>
rxmm1	equ	<cx>
rxmm2	equ	<dx>
rxmm3	equ	<bx>
rxmm4	equ	<sp>
rxmm5	equ	<bp>
rxmm6	equ	<si>
rxmm7	equ	<di>

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
if (.type(dest)) and 10h	; register
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
if (.type(dest)) and 10h	; register
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
if (.type(dest)) and 10h	; register
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
if (.type(dest)) and 10h	; register
pre:
        lock cmpxchg   src, dest
post:
        org     x
        db    0F3H,0Fh, _opc_Movups_ld
        org     y
ELSE
pre:
        lock cmpxchg   dest, src
post:
        org     x
        db    0F3H,0Fh, _opc_Movups_st
        org     y
ENDIF
        endm

;0F 10 /r  movups xmm1, xmm2/m128
;0F 11 /r  movups xmm2/m128, xmm1
movups  macro   dest:req, src:req
        local   pre,post
if (.type(dest)) and 10h	; register
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