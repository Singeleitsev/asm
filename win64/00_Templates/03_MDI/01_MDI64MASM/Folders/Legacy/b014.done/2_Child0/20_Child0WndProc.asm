Child0WndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

LOCAL hdc:QWORD
LOCAL lpChild0Data:QWORD
LOCAL ps:PAINTSTRUCT64
LOCAL rect:RECT64

;Prologue
push rbp
mov rbp,rsp

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

;Store Parameters
mov hwnd,rcx
mov iMsg,rdx
mov wParam,r8
mov lParam,r9

;switch (iMsg)
cmp rdx,0Fh ;WM_PAINT
je wmChild0Paint
cmp rdx,111h ;WM_COMMAND
je wmChild0Command
cmp rdx,1 ;WM_CREATE
je wmChild0Create
cmp rdx,202h ;WM_LBUTTONUP
je wmChild0LButtonUp
cmp rdx,222h ;WM_MDIACTIVATE
je wmChild0Activate
cmp rdx,11h ;WM_QUERYENDSESSION
;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
je wmChild0EndSession
cmp rdx,10h ;WM_CLOSE
je wmChild0Close
cmp rdx,2 ;WM_DESTROY
je wmChild0Destroy
jmp defChild0WndProc

;Pass unprocessed message to DefMDIChildProc
defChild0WndProc:
mov rcx,hwnd
mov rdx,iMsg
mov r8,wParam
mov r9,lParam
call DefMDIChildProcA
jmp endChild0WndProc

include 21_001_Create.asm
include 21_002_Destroy.asm
include 21_010_Close.asm
include 21_00F_Paint.asm
include 21_111_Command.asm
include 21_222_Activate.asm

wmChild0LButtonUp:
mov rcx,hwnd
lea rdx,szTitleChild0
lea r8,szTitleFrame
mov r9,40h
call MessageBoxA
jmp endChild0WndProc

;case WM_QUERYENDSESSION:
wmChild0EndSession:
jmp wmChild0Close

errChild0WndProc:
;call GetLastError
;Spell64rax hwnd, szChild0Title, szLastErr

endChild0WndProc:
;Epilogue
leave
ret ;10h
Child0WndProc endp


