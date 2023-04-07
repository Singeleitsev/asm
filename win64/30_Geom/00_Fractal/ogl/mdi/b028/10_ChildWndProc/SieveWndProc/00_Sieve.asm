SieveWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

LOCAL hdc:QWORD
LOCAL hMenu:QWORD
LOCAL lpSieveData:QWORD
LOCAL ps:PAINTSTRUCT64
LOCAL rc:RECT64

LOCAL hrc:QWORD
LOCAL pfd: PIXELFORMATDESCRIPTOR64 
LOCAL clock:DWORD

;Align the Stack by 10h
	and rsp,-16
	sub rsp,100h

;Store Parameters
	mov hwnd,rcx
        mov iMsg,rdx
        mov wParam,r8
	mov lParam,r9

;switch (iMsg)
cmp rdx,113h ;WM_TIMER
	je wmSieveTimer
cmp rdx,0Fh ;WM_PAINT
	je wmSievePaint
cmp rdx,111h ;WM_COMMAND
	je wmSieveCommand
cmp rdx,1 ;WM_CREATE
	je wmSieveCreate
cmp rdx,5 ;WM_SIZE
	je wmSieveSize
cmp rdx,202h ;WM_LBUTTONUP
	je wmSieveLButtonUp
cmp rdx,222h ;WM_MDIACTIVATE
	je wmSieveActivate
cmp rdx,11h ;WM_QUERYENDSESSION
;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
	je wmSieveEndSession
cmp rdx,10h ;WM_CLOSE
	je wmSieveClose
cmp rdx,2 ;WM_DESTROY
	je wmSieveDestroy
jmp defSieveWndProc

include 10_Create.asm

include 20_Command.asm

include 30_Activate.asm

include 40_Paint.asm

include 50_Timer.asm

include 60_Size.asm

wmSieveLButtonUp:
	Call4 MessageBoxA, hwnd, offset szTitleChild01, offset szTitleFrame, 40h
        jmp endSieveWndProc

;case WM_QUERYENDSESSION :
wmSieveEndSession:
	;jmp wmSieveClose

include 90_Close.asm

include 99_Destroy.asm

;Pass unprocessed message to DefMDIChildProc
defSieveWndProc:
	Call4 DefMDIChildProcA,hwnd,iMsg,wParam,lParam
	jmp endSieveWndProc

errSieveWndProc:
	Call0 GetLastError
	Spell64rax hwnd, szTitleChild01, szLastErr

endSieveWndProc:
;Assembler will add this epilogue automatically:
	;leave
	ret

SieveWndProc endp

