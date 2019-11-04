NgonWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

LOCAL hdc:QWORD
LOCAL ps:PAINTSTRUCT64

LOCAL NBuffer:DWORD ;Number of Vertices

LOCAL lpNgonData:QWORD
LOCAL lpAlpha:QWORD ;Angle
LOCAL lpAlphaCurr:QWORD ;Current Angle
LOCAL lpCenterX:QWORD
LOCAL lpCenterY:QWORD
LOCAL lpRadius:QWORD
LOCAL lpIteration:QWORD ;Iterations Number
LOCAL lpBuffer:QWORD

LOCAL lpNgonX:QWORD ;X of Vertices
LOCAL lpNgonY:QWORD ;Y of Vertices

LOCAL lpNgonR:QWORD ;Red
LOCAL lpNgonG:QWORD ;Green
LOCAL lpNgonB:QWORD ;Blue

;Align the Stack by 10h
	and rsp,-16
;Store Parameters
	mov hwnd,rcx
	mov iMsg,rdx
	mov wParam,r8
	mov lParam,r9


;switch (iMsg)
;cmp iMsg,113h ;WM_TIMER
	;je wmNgonTimer
cmp iMsg,0Fh ;WM_PAINT
	je wmNgonPaint
cmp iMsg,222h ;WM_MDIACTIVATE
	je wmNgonActivate
cmp iMsg,5 ;WM_SIZE
	je wmNgonSize
cmp iMsg,202h ;WM_LBUTTONUP
	je wmNgonSize
cmp rdx,11h ;WM_QUERYENDSESSION
	;;In Windows NT WM_QUERYENDSESSION
	;;can be sent only to the Frame Window?
	je wmNgonEndSession
cmp rdx,10h ;WM_CLOSE
	je wmNgonClose
cmp iMsg,1 ;WM_CREATE
	je wmNgonCreate
cmp iMsg,2 ;WM_DESTROY
	je wmNgonDestroy
jmp defNgonWndProc


;WM_CREATE
	include 710_Create.asm
;WM_SIZE
	include 720_Size.asm
;WM_TIMER
	;include 730_Timer.asm
;WM_PAINT
	include 740_Paint.asm
;WM_MDIACTIVATE
	include 750_Activate.asm
;WM_LBUTTONUP
	include 760_LButtonUp.asm
;WM_QUERYENDSESSION
wmNgonEndSession:
	;jmp wmNgonClose
;WM_CLOSE
	include 770_Close.asm
;WM_DESTROY
	include 780_Destroy.asm


;Pass unprocessed message to DefMDIChildProc
defNgonWndProc:
	Call4 DefMDIChildProcA,hwnd,iMsg,wParam,lParam
	jmp endNgonWndProc

errNgonWndProc:
	Call0 GetLastError
	Spell64rax hwnd, szNgonTitle, szLastErr

;End Proc
endNgonWndProc:
;Assembler will add this epilogue automatically:
        ;leave
        ret
NgonWndProc endp
