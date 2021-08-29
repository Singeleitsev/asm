NgonWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

LOCAL hdc:QWORD
LOCAL ps:PAINTSTRUCT64

LOCAL NgonSides:DWORD

LOCAL MagicNumber:DWORD

LOCAL lpNgonData:QWORD
LOCAL lpNgonAlpha:QWORD ;Angle
LOCAL lpNgonAlphaCurr:QWORD ;Current Angle
LOCAL lpNgonCenterX:QWORD
LOCAL lpNgonCenterY:QWORD
LOCAL lpNgonRadius:QWORD
LOCAL lpNgonIteration:QWORD ;Iterations Number
LOCAL lpNgonBuffer:QWORD

LOCAL lpNgonX:QWORD ;X of Vertices
LOCAL lpNgonY:QWORD ;Y of Vertices

LOCAL lpNgonR:QWORD ;Red
LOCAL lpNgonG:QWORD ;Green
LOCAL lpNgonB:QWORD ;Blue

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
	;je wmNgonTimer
cmp iMsg,0Fh ;WM_PAINT
	je wmNgonPaint
cmp iMsg,222h ;WM_MDIACTIVATE
	je wmNgonActivate
cmp iMsg,5 ;WM_SIZE
	je wmNgonSize
cmp iMsg,202h ;WM_LBUTTONUP
	je wmNgonLButtonUp
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
	include 0701_Create.asm
;WM_SIZE
	include 0702_Size.asm
;WM_TIMER
	;include 0703_Timer.asm
;WM_PAINT
	include 0704_Paint.asm
;WM_MDIACTIVATE
	include 0705_Activate.asm
;WM_LBUTTONUP
	include 0706_LButtonUp.asm
;WM_QUERYENDSESSION
wmNgonEndSession:
	;jmp wmNgonClose
;WM_CLOSE
	include 0707_Close.asm
;WM_DESTROY
	include 0708_Destroy.asm

;Choose Number of Vertices
	;include 0709_InputDialog.asm
;Set NgonData Pointers
	include 0710_SetPointers.asm
;Set Step Angle
	include 0711_SetAngle.asm
;Set Ngon Colors
	include 0712_SetColors.asm
;Draw Ngon Vertices
	include 0713_DrawVertices.asm
;Draw Ngon
	include 0714_DrawNgon.asm


;Pass unprocessed message to DefMDIChildProc
defNgonWndProc:
	Call4 DefMDIChildProcA,hwnd,iMsg,wParam,lParam
	jmp endNgonWndProc

;End Proc
endNgonWndProc:
;Assembler will add this epilogue automatically:
        ;leave
        ret
NgonWndProc endp
