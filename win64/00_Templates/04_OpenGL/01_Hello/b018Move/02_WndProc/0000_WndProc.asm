;==============================================================
WndProc proc hwnd:QWORD, wmsg:QWORD, wparam:QWORD, lparam:QWORD
;==============================================================

;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;sub rsp,8
sub rsp,100h ;frame

cmp edx,100h
je lbl_wmkeydown
cmp edx,101h
je lbl_wmkeyup
cmp edx,5
je lbl_wmsize
cmp edx,2
je lbl_wmdestroy
cmp edx,6
je lbl_wmactivate
cmp edx,112h
je lbl_wmsyscommand
cmp edx,1
je lbl_wmcreate

include FFFF_Default.asm
include 0001_Create.asm
include 0002_Destroy.asm
include 0005_Size.asm
include 0006_Activate.asm
include 0100_KeyDown.asm
include 0101_KeyUp.asm
include 0112_SysCommand.asm

lbl_finish:
add rsp,100h
;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave

ret
WndProc endp