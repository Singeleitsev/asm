
Child2DWndProc proc hWnd:QWORD,uMessage:QWORD,wParam:QWORD,lParam:QWORD

LOCAL lpChildStruct:QWORD

;Prologue
push rbp
mov rbp,rsp

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
mov rcx,hWnd
Call GetDlgCtrlID
mov rbx,rax
sub rbx,ID_MDI_FIRSTCHILD
;g_child[iThisChild]
imul bx,30h ;SizeOf CHILD64
lea rdi,g_child
add rdi,rbx
mov lpChildStruct,rdi
mov byte ptr[rdi+29h],al ;iThisChild

;message dispatch table
mov rdx,uMessage
;Arranged by Probability
cmp dx,200h ;WM_MOUSEMOVE
je lbl_Child2D_MouseMove
cmp dx,201h ;WM_LBUTTONDOWN
je lbl_Child2D_LButtonDown
cmp dx,202h ;WM_LBUTTONUP
je lbl_Child2D_LButtonUp
cmp dx,100h ;WM_KEYDOWN
je lbl_Child2D_KeyDown
cmp dx,101h ;WM_KEYUP
je lbl_Child2D_KeyUp
;cmp dx,111h ;WM_COMMAND
;je lbl_Child2D_Command
cmp dx,5 ;WM_SIZE
je lbl_Child2D_Size
cmp dx,222h ;WM_MDIACTIVATE
je lbl_Child2D_MDIActivate
cmp dx,10h ;WM_CLOSE
je lbl_Child2D_Close
;cmp dx,2 ;WM_DESTROY
;je lbl_Child2D_Destroy
cmp dx,1 ;WM_CREATE
je lbl_Child2D_Create

;None of the Above:
lbl_Child2D_DefMDIChildProc: ;Keep this Label
mov rcx,hWnd
mov rdx,uMessage
mov r8,wParam
mov r9,lParam
Call DefMDIChildProcA
jmp lbl_Child2D_End ;Keep this Label

include 21_001_Create.asm
include 21_005_Size.asm
include 21_010_Close.asm
include 21_100_KeyDown.asm
include 21_101_KeyUp.asm
include 21_111_Command.asm
include 21_200_MouseMove.asm
include 21_201_LButtonDown.asm
include 21_202_LButtonUp.asm
include 21_222_MDIActivate.asm
include 29_Errors.asm

;lbl_Child2D_Destroy:
;If sometime there is a specific menu for Child2D
;Then don't forget this:
;mov rcx,hMenuChild2D
;call DestroyMenu
;jmp lbl_Child2D_Return0

lbl_Child2D_Return0:
xor rax,rax

lbl_Child2D_End:
;Epilogue
leave
ret
Child2DWndProc endp

