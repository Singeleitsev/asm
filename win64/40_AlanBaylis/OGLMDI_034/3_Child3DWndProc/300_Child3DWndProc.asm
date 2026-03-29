Child3DWndProc proc hWnd:QWORD,uMessage:QWORD,wParam:QWORD,lParam:QWORD

LOCAL lpChildStruct:QWORD
LOCAL hChild3DMenu:QWORD,hChild3DMenuFile:QWORD,uEnableFlag:QWORD

;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;Stack Usage: 8(return address)+20h(parameters)+8(push)+20h(locals) = 50h

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

;Store the Parameters
mov hWnd,rcx
mov uMessage,rdx
mov wParam,r8
mov lParam,r9

;Store the Address of the Child's Structure
;int iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
;mov rcx,hWnd
Call GetDlgCtrlID
sub ax,ID_MDI_FIRSTCHILD
;g_child[iThisChild]
imul ax,30h ;SizeOf CHILD64
lea rsi,g_child
add rsi,rax
mov lpChildStruct,rsi

;switch(uMessage)
mov rdx,uMessage
;Arranged by Probability
cmp dx,200h ;WM_MOUSEMOVE
je lbl_Child3D_MouseMove
cmp dx,201h ;WM_LBUTTONDOWN
je lbl_Child3D_LButtonDown
cmp dx,202h ;WM_LBUTTONUP
je lbl_Child3D_LButtonUp
cmp dx,100h ;WM_KEYDOWN
je lbl_Child3D_KeyDown
cmp dx,101h ;WM_KEYUP
je lbl_Child3D_KeyUp
cmp dx,111h ;WM_COMMAND
je lbl_Child3D_Command
cmp dx,222h ;WM_MDIACTIVATE
je lbl_Child3D_MDIActivate
cmp dx,5 ;WM_SIZE
je lbl_Child3D_Size
cmp dx,10h ;WM_CLOSE
je lbl_Child3D_Close


;None of the Above:
lbl_Child3D_DefFrameProc: ;Keep this Label
mov rcx,hWnd
mov rdx,uMessage
mov r8,wParam
mov r9,lParam
Call DefMDIChildProcA
jmp lbl_Child3D_End ;Keep this Label

include 310_MouseMove.asm
include 311_LButtonDown.asm
include 312_LButtonUp.asm
include 320_KeyDown.asm
include 321_KeyUp.asm
include 330_Command.asm
include 340_MDIActivate.asm
include 350_Size.asm
include 380_Close.asm
include 390_Errors.asm

lbl_Child3D_Return0:
xor rax,rax

lbl_Child3D_End: ;Keep this Label
add rsp,100h
;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave
ret
Child3DWndProc endp

