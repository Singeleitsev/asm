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



cmp edx,100h
je lbl_wmKeyDown
cmp edx,101h
je lbl_wmKeyUp
;cmp edx,111h
;je lbl_wmCommand
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
;cmp edx,1
;je lbl_wmCreate

;None of the Above
lbl_DefWndProc:
call DefWindowProcA
jmp lbl_WndProc_End



lbl_wmKeyDown: ;100h
xor rax,rax
mov eax,r8d
mov nKeyCode,r8d ;LOWORD(wParam)
lea rbx,key
add rax,rbx
mov dword ptr [rax],1
;
cmp nKeyCode,20h ;SpaceBar
jne @f
call ResetScene
@@:
cmp nKeyCode,1Bh ;Esc
je lbl_wmClose
jmp lbl_WndProc_Return0



lbl_wmKeyUp: ;101h
xor rax,rax
mov eax,r8d
mov nKeyCode,r8d ;LOWORD(wParam)
lea rbx,key
add rax,rbx
mov byte ptr [rax],0
jmp lbl_WndProc_Return0



lbl_wmSize: ;5
mov rcx,hWnd
lea rdx,RectMain
Call GetClientRect
cmp eax,0
je lbl_ErrGetClientRect

mov eax,RectMain.right
sub eax,RectMain.left
mov RectWidth,eax
cmp eax,0
je lbl_ErrGetClientRect

mov eax,RectMain.bottom
sub eax,RectMain.top
mov RectHeight,eax
cmp eax,0
je lbl_ErrGetClientRect

lea r10,RectWidth
fild dword ptr [r10] ;st0 = RectWidth
lea r11,RectHeight
fild dword ptr [r11] ;st0 = RectHeight, st1 = RectWidth
fdivp ;st0 = RectAspect
lea r12,RectAspect
fstp qword ptr [r12]

call GLResize
jmp lbl_WndProc_Return0



lbl_wmActivate:
include 22_Activate.asm
jmp lbl_WndProc_Return0



lbl_wmClose: ;10h
mov rcx,hWnd
call CloseWndProc
jmp lbl_WndProc_Return0

lbl_wmDestroy: ;2
xor rcx,rcx
Call PostQuitMessage
jmp lbl_WndProc_Return0

lbl_wmCreate: ;1
include 21_Create.asm
;jmp lbl_WndProc_Return0



lbl_WndProc_Return0:
xor rax,rax
jmp lbl_WndProc_End

lbl_ErrGetClientRect:
lea rcx,szErrGetClientRect
mov rdx,25 ;String Length
call SpellError
jmp lbl_WndProc_End

lbl_WndProc_End:
add rsp,100h
;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave
ret
WndProc endp
