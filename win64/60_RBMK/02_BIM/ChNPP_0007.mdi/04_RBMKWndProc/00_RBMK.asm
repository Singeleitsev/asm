RBMKWndProc proc hwnd:QWORD,iMsg:QWORD,wParam:QWORD,lParam:QWORD

;Assembler will add this prologue automatically:
 ;push rbp
 ;mov rbp,rsp

LOCAL hBrush:QWORD ;<- Not Needed for OGL
LOCAL hdc:QWORD
LOCAL lpRBMKData:QWORD
LOCAL ps:PAINTSTRUCT64 ;<- Not Needed for OGL
;Added for OGL
LOCAL hrc:QWORD
LOCAL rc:RECT64
LOCAL pfd:PIXELFORMATDESCRIPTOR64

;int xLeft, xRight, yTop, yBottom ;
 LOCAL xLeft:QWORD, xRight:QWORD, yTop:QWORD, yBottom:QWORD
;short nRed, nGreen, nBlue ;
 LOCAL nRGB:QWORD

;Align the Stack by 10h
 and rsp,-16
;Store Parameters
 mov hwnd,rcx
 mov iMsg,rdx
 mov wParam,r8
 mov lParam,r9

;switch (iMsg)
cmp rdx,113h ;WM_TIMER
 je wmRBMKTimer
cmp rdx,0Fh ;WM_PAINT
 je wmRBMKPaint
cmp edx,100h ;WM_KEYDOWN
 je wmRBMKKeyDown
cmp rdx,222h ;WM_MDIACTIVATE
 je wmRBMKActivate
cmp rdx,5 ;WM_SIZE
 je wmRBMKSize
cmp rdx,1 ;WM_CREATE
 je wmRBMKCreate
cmp rdx,2 ;WM_DESTROY
 je wmRBMKDestroy
;jmp defRBMKWndProc

;Pass unprocessed message to DefMDIChildProc
defRBMKWndProc:
 Call4 DefMDIChildProcA,hwnd,iMsg,wParam,lParam
 jmp endRBMKWndProc

include 10_Create.asm
include 20_Size.asm
include 30_Timer.asm
include 40_Paint.asm
include 50_Activate.asm
include 60_KeyDown.asm
include 99_Destroy.asm

errRBMKWndProc:
 Call0 GetLastError
 Spell64rax hwnd, szRBMKTitle, szLastErr

endRBMKWndProc:
;Assembler will add this epilogue automatically:
 ;leave
 ret

RBMKWndProc endp

