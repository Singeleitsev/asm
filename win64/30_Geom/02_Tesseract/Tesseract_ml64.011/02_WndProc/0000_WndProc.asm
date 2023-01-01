;==================================================================================
WindowProc proc uses rbx rdi rsi hwnd:QWORD, wmsg:QWORD, wparam:QWORD, lparam:QWORD
;==================================================================================
;push rbp
;mov rbp,rsp

sub rsp,8

;push rbx
;push rsi
;push rdi

mov hwnd,rcx

sub rsp,20h ;frame

cmp edx,100h
je lbl_wmkeydown
cmp edx,113h
je lbl_wmtimer
cmp edx,0Fh
je lbl_wmpaint
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
include 000F_Paint.asm
include 0100_KeyDown.asm
include 0113_Timer.asm
 
lbl_finish:
add rsp,20h
;pop rdi
;pop rsi
;pop rbx

;leave   
ret

WindowProc endp
