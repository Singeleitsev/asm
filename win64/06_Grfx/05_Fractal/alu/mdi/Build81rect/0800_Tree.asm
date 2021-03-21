TreeWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

LOCAL hdc:QWORD
LOCAL ps:PAINTSTRUCT64

LOCAL lpTreeData:QWORD
LOCAL lpTreeCX:QWORD ;CenterX
LOCAL lpTreeCY:QWORD ;CenterY
LOCAL lpTreeML:QWORD ;Margin Left
LOCAL lpTreeMR:QWORD ;Margin Right
LOCAL lpTreeMT:QWORD ;Margin Top
LOCAL lpTreeMB:QWORD ;Margin Bottom
LOCAL lpTreeMW:QWORD ;Margin Width
LOCAL lpTreeMH:QWORD ;Margin Height
LOCAL lpTreeX1:QWORD
LOCAL lpTreeX2:QWORD
LOCAL lpTreeX3:QWORD
LOCAL lpTreeY1:QWORD
LOCAL lpTreeY2:QWORD
LOCAL lpTreeY3:QWORD
LOCAL lpTreeR:QWORD ;Red
LOCAL lpTreeG:QWORD ;Green
LOCAL lpTreeB:QWORD ;Blue
LOCAL lpTreeCell:QWORD

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
	;je wmTreeTimer
cmp iMsg,0Fh ;WM_PAINT
	je wmTreePaint
cmp iMsg,222h ;WM_MDIACTIVATE
	je wmTreeActivate
cmp iMsg,5 ;WM_SIZE
	je wmTreeSize
cmp iMsg,202h ;WM_LBUTTONUP
	je wmTreeLButtonUp
cmp rdx,11h ;WM_QUERYENDSESSION
	;In Windows NT WM_QUERYENDSESSION
	;can be sent only to the Frame Window?
	je wmTreeEndSession
cmp rdx,10h ;WM_CLOSE
	je wmTreeClose
cmp iMsg,1 ;WM_CREATE
	je wmTreeCreate
cmp iMsg,2 ;WM_DESTROY
	je wmTreeDestroy
jmp defTreeWndProc


;WM_CREATE
	include 0801_Create.asm
;WM_SIZE
	include 0802_Size.asm
;WM_TIMER
	;include 0803_Timer.asm
;WM_PAINT
	include 0804_Paint.asm
;WM_MDIACTIVATE
	include 0805_Activate.asm
;WM_LBUTTONUP
	include 0806_LButtonUp.asm
;WM_QUERYENDSESSION
wmTreeEndSession:
	;jmp wmHelloClose
;WM_CLOSE
	include 0807_Close.asm
;WM_DESTROY
	include 0808_Destroy.asm

;Set TreeData Pointers
	include 0809_SetPointers.asm
;Draw Tree
	include 0810_DrawTree.asm


;Pass unprocessed message to DefMDIChildProc
defTreeWndProc:
	Call4 DefMDIChildProcA,hwnd,iMsg,wParam,lParam
	jmp endTreeWndProc

;End Proc
endTreeWndProc:
;Assembler will add this epilogue automatically:
	;leave
	ret
TreeWndProc endp
