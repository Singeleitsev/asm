;case WM_SIZE:
lbl_Child3D_Size:

;if(wParam != SIZE_MINIMIZED)
mov r8,wParam
cmp r8d,1 ;SIZE_MINIMIZED
je lbl_Child3D_DefMDIChildProc ;WM_SIZE must be processed by DefMDIChildProc

;RECT WindowRect;
mov rcx,hWnd
mov rdx,lpChildStruct
add rdx,18h ;WindowRect.left
Call GetClientRect

;WM_SIZE must pass to DefMDIChildProcA, not Return 0
;Otherwise, Minimize, Restore, and Maximize buttons will not appear
jmp lbl_Child3D_DefMDIChildProc ;WM_SIZE must be processed by DefMDIChildProc

