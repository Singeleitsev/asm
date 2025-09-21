lbl_WinMain_Loop:

lea rcx,Msg ;lpMsg
xor rdx,rdx ;All window messages and thread messages are processed
xor r8,r8 ;Return all available messages (no range filtering)
xor r9,r9 ;Return all available messages (no range filtering)
mov qword ptr [rsp+20h],1 ;PM_REMOVE Messages are removed from the queue after processing
call PeekMessageA

cmp rax,0 ;Is there a Message in the Main Window Queue?
je lbl_PollChildren ;If Not, Poll Children

cmp msg.message,12h ;Message == WM_QUIT?
je lbl_WinMain_End

mov rcx,g_hMDIClient
lea rdx,Msg
call TranslateMDISysAccel
cmp rax,0
jne lbl_WinMain_Loop ;Accelerator has been Translated, Repeat the Loop

lea rcx,Msg
call TranslateMessage
lea rcx,Msg
call DispatchMessageA

;No Messages, ReDraw Child Windows

lbl_PollChildren:
cmp g_iNumChild,0 ;If we have some children
je lbl_WinMain_Loop

mov rax,g_iNumChild
mov iLoop,rax
lbl_ChildLoop:

;If the Child isn't Minimized
lblCheckMinimized:
movsxd rax,iLoop
shl eax,5 ;Multiply Index by SizeOf CHILD64 == imul rax,rax,20h
lea rcx,g_child
add rcx,rax
mov hWnd_CurrentChild,rcx
call IsIconic
cmp eax,0
jne lbl_NextChild

;Store the Current DC and RC
mov rcx,hWnd_CurrentChild
add rcx,8 ;rcx is a First Argument = hDC
mov rdx,rcx
add rdx,8 ;rdx is a Second Argument = hRC
call wglMakeCurrent

mov rcx,hWnd_CurrentChild
lea rdx,g_rectChild
call GetClientRect

cmp byte ptr [hStruct_CurrentChild],CHILD_TYPE_TOP ;iType == XZ (Top) ortho view == 0
je lbl_DrawTop
cmp byte ptr [hStruct_CurrentChild],CHILD_TYPE_FRONT ;iType == XY (Front) ortho view == 1
je lbl_DrawFront
cmp byte ptr [hStruct_CurrentChild],CHILD TYPE_LEFT ;iType == YZ (Left) ortho view == 2
je lbl_DrawLeft
cmp byte ptr [hStruct_CurrentChild],CHILD_TYPE_3D ;iType == Axonometry == 3
je lbl_Draw3D
;else
jmp lbl_WinMain_Loop ;Wrong type

lbl_DrawTop:
mov rcx,hWnd_CurrentChild
call Draw2DSceneTop
jmp lbl_WinMain_Flush

lbl_DrawFront:
mov rcx,hWnd_CurrentChild
call Draw2DSceneFront
jmp lbl_WinMain_Flush

lbl_DrawLeft:
mov rcx,hWnd_CurrentChild
call Draw2DSceneLeft
jmp lbl_WinMain_Flush

lbl_Draw3D:
call Draw3DScene
;jmp lbl_WinMain_Flush


lbl_WinMain_Flush:
call glFlush
mov rcx,hDC_CurrentChild
call SwapBuffers


include 21_CheckKeys.asm


lbl_NextChild:
dec iLoop
cmp iLoop,0
jg lbl_ChildLoop

jmp lbl_WinMain_Loop

lbl_WinMain_Loop_End:
jmp lbl_WinMain_End
