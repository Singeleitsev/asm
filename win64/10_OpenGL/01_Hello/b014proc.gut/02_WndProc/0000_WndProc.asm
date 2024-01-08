;=================================================================
WindowProc proc hwnd:QWORD, wmsg:QWORD, wparam:QWORD, lparam:QWORD
;=================================================================

;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;sub rsp,8
sub rsp,20h ;frame

cmp edx,100h
je lbl_wmkeydown
cmp edx,5
je lbl_wmsize
cmp edx,2
je lbl_wmdestroy
cmp edx,1
je lbl_wmcreate

include FFFF_Default.asm
include 0001_Create.asm
include 0002_Destroy.asm
include 0005_Size.asm
include 0100_KeyDown.asm
 
lbl_finish:
add rsp,20h
;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave

ret
WindowProc endp