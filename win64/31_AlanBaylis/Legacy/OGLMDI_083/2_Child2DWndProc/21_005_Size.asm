;case WM_SIZE:
lbl_Child2D_Size:

;if(wParam != SIZE_MINIMIZED)
mov r8,wParam
cmp r8d,1 ;SIZE_MINIMIZED
je lbl_Child2D_DefMDIChildProc ;WM_SIZE must be processed by DefMDIChildProc

;RECT WindowRect;
mov rcx,hWnd
mov rdx,lpChildStruct
add rdx,18h ;WindowRect.left
Call GetClientRect

;int iThisChild = GetDlgCtrlID(hWnd) - ID_MDI_FIRSTCHILD;
mov rsi,lpChildStruct
mov r14b,byte ptr[rsi+28h] ;Keep iType in r14b, not in Memory


;if(g_child[iThisChild].iType == CHILD_TYPE_TOP)
cmp r14b,CHILD_TYPE_TOP
je lbl_Child2D_Size_Top
;if(g_child[iThisChild].iType == CHILD_TYPE_FRONT)
cmp r14b,CHILD_TYPE_FRONT
je lbl_Child2D_Size_Front
;if(g_child[iThisChild].iType == CHILD_TYPE_LEFT)
cmp r14b,CHILD_TYPE_LEFT
je lbl_Child2D_Size_Left
;Improper Child Type
jmp lbl_Child2D_Type_Err

lbl_Child2D_Size_Top:
;FrontDepth = 0.5 * WindowRect.bottom - 10;
mov eax,dword ptr[rsi+24h] ;WindowRect.bottom
shr eax,1 ;WindowRect.bottom / 2
sub eax,10
cvtsi2ss xmm0,eax
movss FrontDepth,xmm0
;LeftDepth = -0.5 * WindowRect.right + 10;
mov eax,10
mov ebx,dword ptr[rsi+20h] ;WindowRect.right
shr ebx,1 ;WindowRect.right / 2
sub eax,ebx
cvtsi2ss xmm1,eax
movss LeftDepth,xmm1
jmp lbl_Child2D_DefMDIChildProc ;WM_SIZE must be processed by DefMDIChildProc

lbl_Child2D_Size_Front:
;TopDepth = -0.5 * WindowRect.bottom + 10;
mov eax,10
mov ebx,dword ptr[rsi+24h] ;WindowRect.bottom
shr ebx,1 ;WindowRect.bottom / 2
sub eax,ebx
cvtsi2ss xmm0,eax
movss TopDepth,xmm0
;LeftDepth = -0.5 * WindowRect.right + 10;
mov eax,10
mov ebx,dword ptr[rsi+20h] ;WindowRect.right
shr ebx,1 ;WindowRect.right / 2
sub eax,ebx
cvtsi2ss xmm1,eax
movss LeftDepth,xmm1
jmp lbl_Child2D_DefMDIChildProc ;WM_SIZE must be processed by DefMDIChildProc

lbl_Child2D_Size_Left:
;FrontDepth = -0.5 * WindowRect.right + 10;
mov eax,10
mov ebx,dword ptr[rsi+20h] ;WindowRect.right
shr ebx,1 ;WindowRect.right / 2
sub eax,ebx
cvtsi2ss xmm0,eax
movss FrontDepth,xmm0
;TopDepth = -0.5 * WindowRect.bottom + 10;
mov eax,10
mov ebx,dword ptr[rsi+24h] ;WindowRect.bottom
shr ebx,1 ;WindowRect.bottom / 2
sub eax,ebx
cvtsi2ss xmm1,eax
movss TopDepth,xmm1
;jmp lbl_Child2D_DefMDIChildProc

;WM_SIZE must pass to DefMDIChildProcA, not Return 0
;Otherwise, Minimize, Restore, and Maximize buttons will not appear
jmp lbl_Child2D_DefMDIChildProc
