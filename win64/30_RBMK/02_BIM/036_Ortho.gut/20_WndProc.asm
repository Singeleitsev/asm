WndProc proc hWnd:QWORD, wMsg:QWORD, wParam:QWORD, lParam:QWORD
;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov hWnd,rcx
mov wMsg,rdx
mov wParam,r8
mov lParam,r9

;Messages Arranged by Probability
cmp edx,100h
je lbl_wmKeyDown
cmp edx,101h
je lbl_wmKeyUp
cmp edx,201h
je lbl_wmLButtonDown
cmp edx,111h
je lbl_wmCommand
cmp edx,5
je lbl_wmSize
cmp edx,6
je lbl_wmActivate
;cmp edx,112h
;je lbl_wmSysCommand
cmp edx,10h
je lbl_wmClose
cmp edx,2
je lbl_wmDestroy
cmp edx,1
je lbl_wmCreate

;None of the Above
lbl_DefWndProc:
call DefWindowProcA
jmp lbl_WndProc_End


;WM_CREATE = 1
lbl_wmCreate:
lea rcx,icce
Call InitCommonControlsEx
include 21_CreateMenu.asm
include 22_CreateStatusBar.asm
jmp lbl_WndProc_Return0


;WM_SIZE = 5
lbl_wmSize:
include 23_GLResize.asm
jmp lbl_WndProc_Return0


;WM_ACTIVATE = 6
lbl_wmActivate:
;LoWord Can Be WA_INACTIVE, WA_ACTIVE, WA_CLICKACTIVE
cmp r8w,0 ;LOWORD(wParam) != WA_INACTIVE
je lblDeActivate
;The High-Order Word Specifies The Minimized State Of The Window Being Activated Or Deactivated
mov rax,r8
shr rax,10h ;Shift Right 16 bits
cmp ax,0 ;Not Minimized when HIWORD(wParam) = 0
jne lblDeActivate

lblSetActive:
mov fWinMainActive,1
jmp lbl_WndProc_Return0
lblDeActivate:
mov fWinMainActive,0
jmp lbl_WndProc_Return0


;WM_KEYDOWN = 100h
lbl_wmKeyDown:
xor rax,rax
mov eax,r8d
mov nKeyCode,r8d ;LOWORD(wParam)
;Set 1 in the Array
lea rbx,key
add rax,rbx
mov dword ptr [rax],1

cmp nKeyCode,9 ;Tab
jne @f
;Object Turn Counter-Clockwise 30 degrees
movss xmm0,aXY_Model
addss xmm0,dTab ;30.0_f32 = 41F00000h
movss aXY_Model,xmm0
jmp lbl_WndProc_Return0

@@:
cmp nKeyCode,0Dh ;Enter
jne @f
;mov rcx,hWnd
call AboutProc
jmp lbl_WndProc_Return0

@@:
cmp nKeyCode,1Bh ;Esc
jne @f
call ResetScene
jmp lbl_WndProc_Return0

@@:
cmp nKeyCode,20h ;SpaceBar
jne @f
call ResetScene
jmp lbl_WndProc_Return0

@@:
cmp nKeyCode,70h ;F1
jne @f
call AboutProc
jmp lbl_WndProc_Return0


;WM_KEYUP = 101h
lbl_wmKeyUp:
xor rax,rax
mov eax,r8d
mov nKeyCode,r8d ;LOWORD(wParam)
lea rbx,key
add rax,rbx
mov byte ptr [rax],0
jmp lbl_WndProc_Return0


;WM_COMMAND = 111h
lbl_wmCommand:
cmp r8d,IDM_APP_EXIT
jne @f
mov rcx,hWnd
Call CloseWndProc
@@:
cmp r8d,IDM_HELP_ABOUT
jne lbl_WndProc_Return0
mov rcx,hWnd
Call AboutProc
jmp lbl_WndProc_Return0


;WM_SYSCOMMAND = 112h
;lbl_wmSysCommand:
;jmp lbl_WndProc_Return0


;WM_LBUTTONDOWN = 201h
lbl_wmLButtonDown:
mov rcx,hWnd
Call AboutProc
jmp lbl_WndProc_Return0


;WM_CLOSE = 10h
lbl_wmClose:
mov rcx,hWnd
call CloseWndProc
jmp lbl_WndProc_Return0



;WM_DESTROY = 2
lbl_wmDestroy:
xor rcx,rcx
Call PostQuitMessage
;jmp lbl_WndProc_Return0


lbl_WndProc_Return0:
xor rax,rax
;jmp lbl_WndProc_End

lbl_WndProc_End:
add rsp,100h
;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave
ret
WndProc endp
