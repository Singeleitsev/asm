lbl_WinMain_Loop:

lea rcx,msg ;lpMsg
xor rdx,rdx ;All window messages and thread messages are processed
xor r8,r8 ;Return all available messages (no range filtering)
xor r9,r9 ;Return all available messages (no range filtering)
mov qword ptr [rsp+20h],1 ;PM_REMOVE Messages are removed from the queue after processing
call PeekMessageA

cmp rax,0 ;Is there a Message in the Main Window Queue?
je lbl_CheckKeys ;If Not, Check Keys

cmp msg.message,12h ;Message == WM_QUIT?
je lbl_WinMain_End

mov rcx,g_hMDIClient
lea rdx,msg
call TranslateMDISysAccel
cmp rax,0
jne lbl_WinMain_Loop ;Accelerator has been Translated, Repeat the Loop

mov rcx,g_hMainWindow
mov rdx,hAccTable
lea r8,msg
call TranslateAcceleratorA
test rax,rax
jnz lbl_WinMain_Loop

lea rcx,msg
call TranslateMessage
lea rcx,msg
call DispatchMessageA

jmp lbl_WinMain_Loop

;No Messages, Check Keys
include 0_WinMain\0110_CheckKeys.asm

;ReDraw Child Windows
lbl_PollChildren:

cmp g_iNumChild,0 ;If we have some children
je lbl_WinMain_Loop

movzx rax,g_iNumChild
dec al ;i = g_iNumChild - 1
mov iLoop,al

lbl_ReDrawChildLoop:

;If the Child isn't Minimized
lblCheckMinimized:

;lpChildStruct = offset(g_child[i].hWnd)
movzx rax,iLoop
imul eax,30h ;SizeOf CHILD64
lea rsi,g_child
add rsi,rax
mov lpChildStruct,rsi
mov rcx,qword ptr[rsi]
call IsIconic
cmp rax,0
jne lbl_ReDrawNextChild ;Skip if Minimized

mov rsi,lpChildStruct
mov rcx,qword ptr[rsi+8] ;hDC
mov rdx,qword ptr[rsi+10h] ;hRC
call wglMakeCurrent
cmp rax,0
je lbl_WinMain_MakeCurrent_Err

mov rsi,lpChildStruct
mov rcx,qword ptr[rsi] ;hWnd
lea rdx,[rsi+18h] ;lpRect
call GetClientRect

mov rsi,lpChildStruct
movzx rax,byte ptr[rsi+28h] ;iType
cmp al,CHILD_TYPE_TOP ;XZ (Top) ortho view = 0
je lbl_SetTop
cmp al,CHILD_TYPE_FRONT ;XY (Front) ortho view = 1
je lbl_SetFront
cmp al,CHILD_TYPE_LEFT ;YZ (Left) ortho view = 2
je lbl_SetLeft
cmp al,CHILD_TYPE_3D ;Axonometry = 3
je lbl_Set3D
;else
jmp lbl_WinMain_Loop ;Wrong type

include 0200_SetTop.asm
include 0210_SetFront.asm
include 0220_SetLeft.asm
include 0230_Set3D.asm

lbl_WinMain_Flush:
call glFlush
mov rsi,lpChildStruct ;hWnd
mov rcx,qword ptr[rsi+8] ;hDC
call SwapBuffers

lbl_ReDrawNextChild:
cmp iLoop,0
je lbl_WinMain_Loop
dec iLoop
jmp lbl_ReDrawChildLoop

