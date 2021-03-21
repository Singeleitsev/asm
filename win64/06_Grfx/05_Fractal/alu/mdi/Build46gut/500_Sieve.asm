SieveWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

LOCAL hdc:QWORD
LOCAL lpSieveData:QWORD
LOCAL lpSieveX:QWORD
LOCAL lpSieveY:QWORD
LOCAL lpSieveR:QWORD ;Red
LOCAL lpSieveG:QWORD ;Green
LOCAL lpSieveB:QWORD ;Blue
LOCAL ps:PAINTSTRUCT64

;Align the Stack by 10h
	and rsp,-16
;Store Parameters
	mov hwnd,rcx
	mov iMsg,rdx
	mov wParam,r8
	mov lParam,r9


;switch (iMsg)
;cmp iMsg,113h ;WM_TIMER
	;je wmSieveTimer
cmp iMsg,0Fh ;WM_PAINT
	je wmSievePaint
cmp iMsg,222h ;WM_MDIACTIVATE
	je wmSieveActivate
cmp iMsg,5 ;WM_SIZE
	je wmSieveSize
cmp iMsg,202h ;WM_LBUTTONUP
	je wmSieveLButtonUp
cmp rdx,11h ;WM_QUERYENDSESSION
	;In Windows NT WM_QUERYENDSESSION
	;can be sent only to the Frame Window?
	je wmSieveEndSession
cmp rdx,10h ;WM_CLOSE
	je wmSieveClose
cmp iMsg,1 ;WM_CREATE
	je wmSieveCreate
cmp iMsg,2 ;WM_DESTROY
	je wmSieveDestroy
jmp defSieveWndProc


;WM_CREATE
	include 510_Create.asm
;WM_SIZE
	include 520_Size.asm
;WM_TIMER
	;include 530_Timer.asm
;WM_PAINT
	include 540_Paint.asm
;WM_MDIACTIVATE
	include 550_Activate.asm
;WM_LBUTTONUP
	include 560_LButtonUp.asm
;WM_QUERYENDSESSION
wmSieveEndSession:
	;jmp wmHelloClose
;WM_CLOSE
	include 570_Close.asm
;WM_DESTROY
	include 580_Destroy.asm


;Pass unprocessed message to DefMDIChildProc
defSieveWndProc:
	Call4 DefMDIChildProcA,hwnd,iMsg,wParam,lParam
	jmp endSieveWndProc

errSieveWndProc:
	Call0 GetLastError
	Spell64rax hwnd, szSieveTitle, szLastErr
	;jmp endSieveWndProc

;End Proc
endSieveWndProc:
;Assembler will add this epilogue automatically:
	;leave
	ret
SieveWndProc endp
