;case WM_MOUSEMOVE:
lbl_Child2D_MouseMove:

;Since in this part of code we don't call other Procedures,
;we can store the Local Variables in the Registers
;without moving them to/from the Memory

;MouseX = LOWORD(lParam);
;MouseY = HIWORD(lParam);
mov r8d,dword ptr lParam ; X in low word, Y in high word
mov r9d,r8d
shr r9d,16 ;Y = HIWORD
and r8d,0FFFFh ;X = LOWORD

mov rsi,lpChildStruct
mov r10d,dword ptr[rsi+18h]
mov r11d,dword ptr[rsi+1Ch]
mov r12d,dword ptr[rsi+20h]
mov r13d,dword ptr[rsi+24h]
mov r14b,byte ptr[rsi+28h]

cmp g_bMouseDrag2,0
je lbl_Child2D_MouseFlag0

lbl_Child2D_MouseFlag1:

;lbl_Child2D_MouseCheckX:
cmp r8d,r10d ;MouseX < WindowRect.left
jl lbl_Child2D_MouseRestoreX
cmp r8d,r12d ;MouseX > WindowRect.right
jle lbl_Child2D_MouseCheckY ;Skip if OK

lbl_Child2D_MouseRestoreX:
;MouseX = g_iMouseLastX2
mov r8d,g_iMouseLastX2

lbl_Child2D_MouseCheckY:
cmp r9d,r11d ;MouseY < WindowRect.top
jl lbl_Child2D_MouseRestoreY
cmp r9d,r13d ;MouseY > WindowRect.bottom
jle lbl_Child2D_MouseRefresh ;Skip if OK

lbl_Child2D_MouseRestoreY:
mov r9d,g_iMouseLastY2 ;MouseY = g_iMouseLastY2

lbl_Child2D_MouseRefresh:
;g_iMouseDeltaX2 = MouseX - g_iMouseLastX2
mov eax,r8d
sub eax,g_iMouseLastX2
mov g_iMouseDeltaX2,eax
;g_iMouseDeltaY2 = MouseY - g_iMouseLastY2
mov ebx,r9d
sub ebx,g_iMouseLastY2
mov g_iMouseDeltaY2,ebx
;g_iMouseLastX2 = MouseX
mov g_iMouseLastX2,r8d
;g_iMouseLastY2 = MouseY
mov g_iMouseLastY2,r9d

;Load vertex[VertexNumber] Address
xor r15,r15
mov r15b,VertexNumber
shl r15d,4 ;mul r15d,10h ;SizeOf POINT4D
lea rdi,vtx
add rdi,r15

;Load Values
cvtsi2ss xmm0,r8d ;g_iMouseDeltaX2
cvtsi2ss xmm1,r9d ;g_iMouseDeltaY2

;Apply Mouse Deltas Depending on iType
cmp r14b,CHILD_TYPE_TOP
je lbl_Child2D_DragVertexXZ
cmp r14b,CHILD_TYPE_FRONT
je lbl_Child2D_DragVertexXY
cmp r14b,CHILD_TYPE_LEFT
je lbl_Child2D_DragVertexYZ

jmp lbl_Child2D_Type_Err ;Wrong Type

lbl_Child2D_DragVertexXZ:
;vertex[VertexNumber].x += (float)g_iMouseDeltaX2 * 1.0
addss xmm0,dword ptr[rdi]
movss dword ptr[rdi],xmm0
;vertex[VertexNumber].z += (float)g_iMouseDeltaY2 * 1.0
addss xmm1,dword ptr[rdi+8]
movss dword ptr[rdi+8],xmm1
jmp lbl_Child2D_SetPolygons

lbl_Child2D_DragVertexXY:
;vertex[VertexNumber].x += (float)g_iMouseDeltaX2 * 1.0
addss xmm0,dword ptr[rdi]
movss dword ptr[rdi],xmm0
;vertex[VertexNumber].y -= (float)g_iMouseDeltaY2 * 1.0
movss xmm2,dword ptr[rdi+4]
subss xmm2,xmm1
movss dword ptr[rdi+4],xmm2
jmp lbl_Child2D_SetPolygons

lbl_Child2D_DragVertexYZ:
;vertex[VertexNumber].z += (float)g_iMouseDeltaX2 * 1.0
addss xmm0,dword ptr[rdi+8]
movss dword ptr[rdi+8],xmm0
;vertex[VertexNumber].y -= (float)g_iMouseDeltaY2 * 1.0
movss xmm2,dword ptr[rdi+4]
subss xmm2,xmm1
movss dword ptr[rdi+4],xmm2
;jmp lbl_Child2D_SetPolygons

lbl_Child2D_SetPolygons:
Call SetPolygons

jmp lbl_Child2D_Return0

lbl_Child2D_MouseFlag0:

;MouseX = (int)(LOWORD(lParam) + (-0.5 * WindowRect.right))
shr r12d,1 ;WindowRect.right/2
sub r8d,r12d ;MouseX = MouseX - WindowRect.right/2

;if(g_child[iThisChild].iType == CHILD_TYPE_TOP)
cmp r14b,CHILD_TYPE_TOP
jne lbl_Child2D_MouseY_Neg

;MouseY = (int)(HIWORD(lParam) + (-0.5 * WindowRect.bottom));
shr r13d,1 ;WindowRect.bottom/2
sub r9d,r13d ;MouseX = MouseX - WindowRect.bottom/2
jmp lbl_Child2D_Mouse_CalcDistance

lbl_Child2D_MouseY_Neg:
;MouseY = (int)(-1 * (HIWORD(lParam) + (-0.5 * WindowRect.bottom)))
shr r13d,1 ;WindowRect.bottom/2
add r9d,r13d ;MouseY = MouseY + WindowRect.bottom/2
neg r9d ;Try to get negative this way

lbl_Child2D_Mouse_CalcDistance:

;Load Values
mov ShortestDistance,461c4000h ;10000.0f
cvtsi2ss xmm0,r8d ;MouseX
cvtsi2ss xmm1,r9d ;MouseY

;for(Loop = 0;Loop < 8;Loop++)
xor rcx,rcx
lbl_Child2D_Mouse_CalcDistance_Loop:

;Load vertex[Loop] Address
mov r15,rcx
shl r15d,4 ;mul r15d,10h ;SizeOf POINT4D
lea rdi,vtx
add rdi,r15

cmp r14b,CHILD_TYPE_TOP
je lbl_Child2D_Mouse_PassTop
cmp r14b,CHILD_TYPE_FRONT
je lbl_Child2D_Mouse_PassFront
cmp r14b,CHILD_TYPE_LEFT
je lbl_Child2D_Mouse_PassLeft

;if(g_child[iThisChild].iType == CHILD_TYPE_TOP)
lbl_Child2D_Mouse_PassTop:
;TempX = (int)(MouseX - vertex[Loop].x);
vsubss xmm2,xmm0,dword ptr[rdi]
;TempY = (int)(MouseY - vertex[Loop].z);
vsubss xmm3,xmm1,dword ptr[rdi+8]
jmp lbl_Child2D_CheckDistance

;if(g_child[iThisChild].iType == CHILD_TYPE_FRONT)
lbl_Child2D_Mouse_PassFront:
;TempX = (int)(MouseX - vertex[Loop].x);
vsubss xmm2,xmm0,dword ptr[rdi]
;TempY = (int)(MouseY - vertex[Loop].y);
vsubss xmm3,xmm1,dword ptr[rdi+4]
jmp lbl_Child2D_CheckDistance

;if(g_child[iThisChild].iType == CHILD TYPE_LEFT)
lbl_Child2D_Mouse_PassLeft:
;TempX = (int)(MouseX - vertex[Loop].z);
vsubss xmm2,xmm0,dword ptr[rdi+8]
;TempY = (int)(MouseY - vertex[Loop].y);
vsubss xmm3,xmm1,dword ptr[rdi+4]
jmp lbl_Child2D_CheckDistance

lbl_Child2D_CheckDistance:
;if(sqrt((TempX * TempX) + (TempY * TempY)) < ShortestDistance)
mulss xmm2,xmm2
mulss xmm3,xmm3
addss xmm2,xmm3
comiss xmm2,ShortestDistance
jnl lbl_Child2D_Mouse_CalcDistance_NextPoint

;ShortestDistance = (int)(sqrt((TempX * TempX) + (TempY * TempY)))
movss ShortestDistance,xmm2

;VertexNumber = Loop
mov VertexNumber,cl

lbl_Child2D_Mouse_CalcDistance_NextPoint:
inc cl
cmp cl,8
jl lbl_Child2D_Mouse_CalcDistance_Loop

;lbl_Child2D_DrawText:
;//int iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
;mov rsi,lpChildStruct
;//DrawWin32Text(g_child[iThisChild].hDC, WindowRect.right, WindowRect.bottom, 1, 1);
;mov rcx,rsi
;xor rdx,rdx
;mov edx,r10d ;dword ptr[rsi]
;xor r8,r8
;mov r8d,r12d ;WindowRect.right
;xor r9,r9
;mov r9d,r13d ;WindowRect.bottom
;mov qword ptr[rsp+20h],1
;mov qword ptr[rsp+28h],1
;Call DrawWin32Text

jmp lbl_Child2D_Return0

