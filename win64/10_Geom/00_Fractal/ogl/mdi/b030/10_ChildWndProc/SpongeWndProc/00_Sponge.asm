SpongeWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

LOCAL hBrush:QWORD
LOCAL hdc:QWORD
LOCAL lpSpongeData:QWORD
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
	je wmSpongeCreate
cmp rdx,5 ;WM_SIZE
	je wmSpongeSize
cmp rdx,113h ;WM_TIMER
	je wmSpongeTimer
cmp rdx,0Fh ;WM_PAINT
	je wmSpongePaint
cmp rdx,222h ;WM_MDIACTIVATE
	je wmSpongeActivate
cmp rdx,2 ;WM_DESTROY
	je wmSpongeDestroy
jmp defSpongeWndProc


include 10_Create.asm

include 20_Size.asm

include 30_Timer.asm

include 40_Paint.asm

include 50_Activate.asm

include 99_Destroy.asm

;Pass unprocessed message to DefMDIChildProc
defSpongeWndProc:
	Call4 DefMDIChildProcA,hwnd,iMsg,wParam,lParam
	jmp endSpongeWndProc

errSpongeWndProc:
	Call0 GetLastError
	Spell64rax hwnd, szTitleChild06, szLastErr

endSpongeWndProc:
;Assembler will add this epilogue automatically:
	;leave
	ret

SpongeWndProc endp


