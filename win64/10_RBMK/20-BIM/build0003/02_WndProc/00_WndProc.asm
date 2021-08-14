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
;mov wmsg,rdx
;mov wparam,r8
;mov lparam,r9

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


include 10_Default.asm
include 20_Create.asm
include 30_Size.asm
include 40_Paint.asm
include 50_KeyDown.asm
include 60_Destroy.asm
 
lbl_finish:
 add rsp,20h
 ;pop rdi
 ;pop rsi
 ;pop rbx

;leave   
ret

WindowProc endp
