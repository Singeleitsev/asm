;==============================================================
WndProc proc hwnd:QWORD, wmsg:QWORD, wparam:QWORD, lparam:QWORD
;==============================================================

;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov hwnd,rcx
mov wmsg,rdx
mov wparam,r8
mov lparam,r9

cmp edx,112h
je lbl_wmsyscommand
cmp edx,202h
je lbl_wmlbuttonup
cmp edx,101h
je lbl_wmkeyup
cmp edx,100h
je lbl_wmkeydown
cmp edx,10h
je lbl_wmclose
cmp edx,5
je lbl_wmsize
cmp edx,6
je lbl_wmactivate

;jmp lbl_defwndproc

include 9999_Default.asm
include 0005_Size.asm
include 0006_Activate.asm
include 0010_Close.asm
include 0100_KeyDown.asm
include 0101_KeyUp.asm
include 0112_SysCommand.asm
include 0202_LButtonUp.asm

;Normal Exit
lbl_finwndproc:
add rsp,100h

;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave

ret
WndProc endp
