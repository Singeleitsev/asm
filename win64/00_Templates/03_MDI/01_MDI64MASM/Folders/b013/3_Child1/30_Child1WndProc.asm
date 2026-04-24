Child1WndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

LOCAL hBrush:QWORD
LOCAL hdc:QWORD
LOCAL lpChild1Data:QWORD
LOCAL ps:PAINTSTRUCT64

;int xLeft, xRight, yTop, yBottom ;
LOCAL xLeft:QWORD, xRight:QWORD, yTop:QWORD, yBottom:QWORD
;short nRed, nGreen, nBlue ;
LOCAL nRGB:QWORD

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
cmp rdx,1 ;WM_CREATE
je wmChild1Create
cmp rdx,5 ;WM_SIZE
je wmChild1Size
cmp rdx,113h ;WM_TIMER
je wmChild1Timer
cmp rdx,0Fh ;WM_PAINT
je wmChild1Paint
cmp rdx,222h ;WM_MDIACTIVATE
je wmChild1Activate
cmp rdx,2 ;WM_DESTROY
je wmChild1Destroy
;jmp defChild1WndProc

;Pass unprocessed message to DefMDIChildProc
defChild1WndProc:
mov rcx,hwnd
mov rdx,iMsg
mov r8,wParam
mov r9,lParam
call DefMDIChildProcA
jmp endChild1WndProc

include 31_001_Create.asm
include 31_002_Destroy.asm
include 31_005_Size.asm
include 31_00F_Paint.asm
include 31_113_Timer.asm
include 31_222_Activate.asm

errChild1WndProc:
;call GetLastError
;Spell64rax hwnd, szChild1Title, szLastErr

endChild1WndProc:
;Epilogue
leave
ret
Child1WndProc endp


