;case WM_MOUSEMOVE:
lbl_Child2D_MouseMove:

;Since in this part of code we don't call other Procedures,
;we can store the Local Variables in the Registers
;without moving them to/from the Memory

;Load Values
mov rsi,lpChildStruct
mov r10d,dword ptr[rsi+18h] ;WindowRect.left
mov r11d,dword ptr[rsi+1Ch] ;WindowRect.top
mov r12d,dword ptr[rsi+20h] ;WindowRect.right
mov r13d,dword ptr[rsi+24h] ;WindowRect.bottom
movzx r14,byte ptr[rsi+28h] ;iType

mov r8,lParam ;X = LOWORD, Y = HIWORD
mov r9,r8 ;X = LOWORD, Y = HIWORD

;MouseX = LOWORD(lParam);
and r8,0FFFFh ;X = LOWORD
;MouseY = HIWORD(lParam);
shr r9d,16 ;HIWORD to LOWORD
and r9,0FFFFh

cmp g_bMouseDrag2,0
je lbl_Child2D_MouseDrag0

;lbl_Child2D_MouseDrag1:

;lbl_Child2D_MouseCheckX:
cmp r8d,r10d ;MouseX < WindowRect.left
jl lbl_Child2D_MouseRestoreX
cmp r8d,r12d ;MouseX > WindowRect.right
jle lbl_Child2D_MouseCheckY ;Skip if OK

lbl_Child2D_MouseRestoreX:
mov r8d,g_iMouseLastX2 ;MouseX = g_iMouseLastX2

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

;Load Values
cvtsi2ss xmm0,r8d ;g_iMouseDeltaX2
cvtsi2ss xmm1,r9d ;g_iMouseDeltaY2

;Load vertex[VertexNumber] Address
movzx r15,VertexNumber
shl r15,4 ;mul r15d,10h ;SizeOf POINT4D
lea rdi,vtx
add rdi,r15
vmovss xmm2,dword ptr[rdi] ;vertex[VertexNumber].x
vmovss xmm3,dword ptr[rdi+4] ;vertex[VertexNumber].y
vmovss xmm4,dword ptr[rdi+8] ;vertex[VertexNumber].z

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
vaddss xmm5,xmm2,xmm0
vmovss dword ptr[rdi],xmm5
;vertex[VertexNumber].z += (float)g_iMouseDeltaY2 * 1.0
vaddss xmm7,xmm4,xmm1
vmovss dword ptr[rdi+8],xmm7
jmp lbl_Child2D_SetPolygons

lbl_Child2D_DragVertexXY:
;vertex[VertexNumber].x += (float)g_iMouseDeltaX2 * 1.0
vaddss xmm5,xmm2,xmm0
movss dword ptr[rdi],xmm5
;vertex[VertexNumber].y -= (float)g_iMouseDeltaY2 * 1.0
vsubss xmm7,xmm3,xmm1
vmovss dword ptr[rdi+4],xmm7
jmp lbl_Child2D_SetPolygons

lbl_Child2D_DragVertexYZ:
;vertex[VertexNumber].z += (float)g_iMouseDeltaX2 * 1.0
vaddss xmm7,xmm4,xmm0
vmovss dword ptr[rdi+8],xmm7
;vertex[VertexNumber].y -= (float)g_iMouseDeltaY2 * 1.0
vsubss xmm6,xmm3,xmm1
vmovss dword ptr[rdi+4],xmm6
;jmp lbl_Child2D_SetPolygons

lbl_Child2D_SetPolygons:
Call SetPolygons

jmp lbl_Child2D_Return0

lbl_Child2D_MouseDrag0:

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
sub r13d,r9d ;MouseY = MouseY + WindowRect.bottom/2
mov r9d,r13d

lbl_Child2D_Mouse_CalcDistance:

;Load Values
mov ShortestDistance,2710h ;10000
cvtsi2ss xmm0,r8d ;MouseX
cvtsi2ss xmm1,r9d ;MouseY

;for(Loop = 0;Loop < 8;Loop++)
xor rcx,rcx
lbl_Child2D_Mouse_CalcDistance_Loop:

;Load vertex[Loop] Address
mov r15,rcx
shl r15,4 ;mul r15d,10h ;SizeOf POINT4D
lea rdi,vtx
add rdi,r15

mov rsi,lpChildStruct
mov r14b,byte ptr[rsi+28h] ;Keep iType in r14b, not in Memory
cmp r14b,CHILD_TYPE_TOP
je lbl_Child2D_Mouse_PassTop
cmp r14b,CHILD_TYPE_FRONT
je lbl_Child2D_Mouse_PassFront
cmp r14b,CHILD_TYPE_LEFT
je lbl_Child2D_Mouse_PassLeft
jmp lbl_Child2D_Type_Err

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
sqrtss xmm2,xmm2
cvtss2si eax,xmm2
cmp eax,ShortestDistance
jnl lbl_Child2D_Mouse_CalcDistance_NextPoint

;ShortestDistance = (int)(sqrt((TempX * TempX) + (TempY * TempY)))
mov ShortestDistance,eax

;VertexNumber = Loop
mov VertexNumber,cl

lbl_Child2D_Mouse_CalcDistance_NextPoint:
inc cl
cmp cl,8
jl lbl_Child2D_Mouse_CalcDistance_Loop

jmp lbl_Child2D_Return0

