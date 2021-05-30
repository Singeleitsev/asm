R2WndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

LOCAL hdc:QWORD
LOCAL hMenu:QWORD
LOCAL lpR2Data:QWORD
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
	je wmR2Timer
cmp rdx,0Fh ;WM_PAINT
	je wmR2Paint
cmp rdx,111h ;WM_COMMAND
	je wmR2Command
cmp rdx,1 ;WM_CREATE
	je wmR2Create
cmp rdx,5 ;WM_SIZE
	je wmR2Size
cmp rdx,202h ;WM_LBUTTONUP
	je wmR2LButtonUp
cmp rdx,222h ;WM_MDIACTIVATE
	je wmR2Activate
cmp rdx,11h ;WM_QUERYENDSESSION
;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window?
	je wmR2EndSession
cmp rdx,10h ;WM_CLOSE
	je wmR2Close
cmp rdx,2 ;WM_DESTROY
	je wmR2Destroy
jmp defR2WndProc

include 10_Create.asm

include 20_Command.asm

include 30_Activate.asm

include 40_Paint.asm

include 50_Timer.asm

include 60_Size.asm

wmR2LButtonUp:
	Call4 MessageBoxA, hwnd, offset szR2Title, offset szFrameTitle, 40h
        jmp endR2WndProc

;case WM_QUERYENDSESSION :
wmR2EndSession:
	;jmp wmR2Close

include 90_Close.asm

include 99_Destroy.asm

;Pass unprocessed message to DefMDIChildProc
defR2WndProc:
	Call4 DefMDIChildProcA,hwnd,iMsg,wParam,lParam
	jmp endR2WndProc

errR2WndProc:
	Call0 GetLastError
	Spell64rax hwnd, szR2Title, szLastErr

endR2WndProc:
;Assembler will add this epilogue automatically:
	;leave
	ret

R2WndProc endp

