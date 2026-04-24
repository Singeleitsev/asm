;case WM_CLOSE:
lbl_Child2D_Close:

;Decrement the number of child windows
dec g_iNumChild

mov rsi,lpChildStruct
mov rcx,qword ptr[rsi] ;hWnd
mov rdx,qword ptr[rsi+8] ;hDC
Call ReleaseDC

mov rsi,lpChildStruct
mov rcx,qword ptr[rsi+10h] ;hRC
Call wglDeleteContext


;If this is the last child window then just free the DC and RC
cmp g_iNumChild,0
je lbl_Child2D_CloseLastChild
jmp lbl_Child2D_DefFrameProc

;else
;int iLoop;
;int iThisChild;
;char szWindowTitle[20];
;if(iThisChild != g_iNumChild) // If this child isn't the last in the array of children
;;for (iLoop = iThisChild;iLoop < (g_iNumChild);iLoop++) // Loop from this child to the end of the array
;;;g_child[iLoop] = g_child[iLoop + 1];// Shift the children forward in the array
;;;sprintf(szWindowTitle, "%d", iLoop);
;;;SetWindowText(g_child[iLoop].hWnd, szWindowTitle);// Renumber the children

lbl_Child2D_CloseLastChild:
xor rcx,rcx
xor rdx,rdx
Call wglMakeCurrent

jmp lbl_Child2D_DefFrameProc

