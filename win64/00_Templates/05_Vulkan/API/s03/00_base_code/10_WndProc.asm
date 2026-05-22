;10_WndProc.asm
WndProc proc hWnd:QWORD, wMsg:QWORD, wParam:QWORD, lParam:QWORD
;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov hWnd,rcx
mov wMsg,rdx
mov wParam,r8
mov lParam,r9

;Messages Arranged by Probability
cmp edx,111h
je lbl_wmCommand
cmp edx,5
je lbl_wmSize
cmp edx,10h
je lbl_wmClose
cmp edx,2
je lbl_wmDestroy

;None of the Above
lbl_DefWndProc:
call DefWindowProcA
jmp lbl_WndProc_End


;WM_COMMAND = 111h
lbl_wmCommand:
cmp r8w,IDM_APP_EXIT
jne @f
jmp lbl_wmClose
@@:
cmp r8w,IDM_HELP_ABOUT
jne lbl_WndProc_Return0
Call AboutProc
;If none of the above
jmp lbl_WndProc_Return0

;WM_SIZE = 5
lbl_wmSize:
include 11_Size.asm
jmp lbl_WndProc_Return0

;WM_CLOSE = 10h
lbl_wmClose:
call CloseWndProc
jmp lbl_WndProc_Return0

;WM_DESTROY = 2
lbl_wmDestroy:
xor rcx,rcx
Call PostQuitMessage
;jmp lbl_WndProc_Return0


lbl_WndProc_Return0:
xor rax,rax
;jmp lbl_WndProc_End

lbl_WndProc_End:
;Epilogue:
leave
ret
WndProc endp

