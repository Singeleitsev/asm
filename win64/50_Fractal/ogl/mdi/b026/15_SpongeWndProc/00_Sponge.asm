R3WndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

LOCAL hBrush:QWORD
LOCAL hdc:QWORD
LOCAL lpR3Data:QWORD
LOCAL ps:PAINTSTRUCT64

;int xLeft, xRight, yTop, yBottom ;
	LOCAL xLeft:QWORD, xRight:QWORD, yTop:QWORD, yBottom:QWORD
;short nRed, nGreen, nBlue ;
	LOCAL nRGB:QWORD

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
	je wmR3Create
cmp rdx,5 ;WM_SIZE
	je wmR3Size
cmp rdx,113h ;WM_TIMER
	je wmR3Timer
cmp rdx,0Fh ;WM_PAINT
	je wmR3Paint
cmp rdx,222h ;WM_MDIACTIVATE
	je wmR3Activate
cmp rdx,2 ;WM_DESTROY
	je wmR3Destroy
jmp defR3WndProc


include 10_Create.asm

include 20_Size.asm

include 30_Timer.asm

include 40_Paint.asm

include 50_Activate.asm

include 99_Destroy.asm

;Pass unprocessed message to DefMDIChildProc
defR3WndProc:
	Call4 DefMDIChildProcA,hwnd,iMsg,wParam,lParam
	jmp endR3WndProc

errR3WndProc:
	Call0 GetLastError
	Spell64rax hwnd, szR3Title, szLastErr

endR3WndProc:
;Assembler will add this epilogue automatically:
	;leave
	ret

R3WndProc endp


