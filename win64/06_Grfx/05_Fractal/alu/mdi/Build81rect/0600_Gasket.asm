GasketWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

LOCAL hdc:QWORD
LOCAL ps:PAINTSTRUCT64

LOCAL lpGasketData:QWORD
LOCAL lpGasketX:QWORD
LOCAL lpGasketY:QWORD
LOCAL lpGasketR:QWORD ;Red
LOCAL lpGasketG:QWORD ;Green
LOCAL lpGasketB:QWORD ;Blue

;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

;Align the Stack by 10h
	and rsp,-16
;Store Parameters
	mov hwnd,rcx
	mov iMsg,rdx
	mov wParam,r8
	mov lParam,r9


;switch (iMsg)
;cmp iMsg,113h ;WM_TIMER
	;je wmGasketTimer
cmp iMsg,0Fh ;WM_PAINT
	je wmGasketPaint
cmp iMsg,222h ;WM_MDIACTIVATE
	je wmGasketActivate
cmp iMsg,5 ;WM_SIZE
	je wmGasketSize
cmp iMsg,202h ;WM_LBUTTONUP
	je wmGasketLButtonUp
cmp rdx,11h ;WM_QUERYENDSESSION
	;In Windows NT WM_QUERYENDSESSION
	;;can be sent only to the Frame Window?
	je wmGasketEndSession
cmp rdx,10h ;WM_CLOSE
	je wmGasketClose
cmp iMsg,1 ;WM_CREATE
	je wmGasketCreate
cmp iMsg,2 ;WM_DESTROY
	je wmGasketDestroy
jmp defGasketWndProc


;WM_CREATE
	include 0601_Create.asm
;WM_SIZE
	include 0602_Size.asm
;WM_TIMER
	;include 0603_Timer.asm
;WM_PAINT
	include 0604_Paint.asm
;WM_MDIACTIVATE
	include 0605_Activate.asm
;WM_LBUTTONUP
	include 0606_LButtonUp.asm
;WM_QUERYENDSESSION
wmGasketEndSession:
	;jmp wmGasketClose
;WM_CLOSE
	include 0607_Close.asm
;WM_DESTROY
	include 0608_Destroy.asm

;Set GasketData Pointers
	include 0609_SetPointers.asm
;Draw Gasket
	include 0610_DrawGasket.asm


;Pass unprocessed message to DefMDIChildProc
defGasketWndProc:
	Call4 DefMDIChildProcA,hwnd,iMsg,wParam,lParam
	jmp endGasketWndProc

;End Proc
endGasketWndProc:
;Assembler will add this epilogue automatically:
        ;leave
        ret
GasketWndProc endp
