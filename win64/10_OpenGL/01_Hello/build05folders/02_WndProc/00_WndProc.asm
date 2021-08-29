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

cmp edx,1
je lbl_wmcreate
cmp edx,5
je lbl_wmsize
cmp edx,0Fh
je lbl_wmpaint
cmp edx,100h
je lbl_wmkeydown
cmp edx,2
je lbl_wmdestroy


include 01_Default.asm
include 02_Create.asm
include 03_Size.asm
include 04_Paint.asm
include 05_KeyDown.asm
include 06_Destroy.asm
 
lbl_finish:
 add rsp,20h
 ;pop rdi
 ;pop rsi
 ;pop rbx

;leave   
ret

WindowProc endp
