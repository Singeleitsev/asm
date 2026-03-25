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

lea rcx,msg
call TranslateMessage
lea rcx,msg
call DispatchMessageA

jmp lbl_WinMain_Loop

;No Messages, Check Keys
lbl_WinMain_CheckKeys:
include 0_WinMain\031_CheckKeys.asm

;ReDraw Child Windows
lbl_PollChildren:
cmp g_iNumChild,0 ;If we have some children
je lbl_WinMain_Loop

mov al,g_iNumChild
mov iLoop,al
lbl_ReDrawChildLoop:

;If the Child isn't Minimized
lblCheckMinimized:
;lpChildStruct = offset(g_child[i].hWnd)
mov rax,30h ;SizeOf CHILD64
movzx rbx,iLoop
imul ax,bx
lea rcx,g_child
add rcx,rax
mov lpChildStruct,rcx
call IsIconic
cmp rax,0
jne lbl_ReDrawNextChild

;Store the Current DC and RC
mov rcx,lpChildStruct
add rcx,8 ;rcx = hDC
mov rdx,rcx
add rdx,8 ;rdx = hRC
call wglMakeCurrent

;mov rcx,lpChildStruct
;lea rdx,lpChildStruct
;add rdx,18h
;call GetClientRect

mov rcx,lpChildStruct
movzx rax,byte ptr[rcx+28h] ;iType
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

include 4_SetScene\410_SetTop.asm
include 4_SetScene\411_SetFront.asm
include 4_SetScene\412_SetLeft.asm
include 4_SetScene\413_Set3D.asm

lbl_WinMain_Flush:
call glFlush
mov rcx,lpChildStruct ;hWnd
call SwapBuffers

lbl_ReDrawNextChild:
dec iLoop
cmp iLoop,0
jg lbl_ReDrawChildLoop

jmp lbl_WinMain_Loop

