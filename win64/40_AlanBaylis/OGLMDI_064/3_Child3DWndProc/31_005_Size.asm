;case WM_SIZE:
lbl_Child3D_Size:

;if(wParam != SIZE_MINIMIZED)
mov r8,wParam
cmp r8d,1 ;SIZE_MINIMIZED
je lbl_Child3D_DefMDIChildProc

;RECT WindowRect;
mov rcx,hWnd
mov rdx,lpChildStruct
add rdx,18h ;WindowRect.left
Call GetClientRect

jmp lbl_Child3D_DefMDIChildProc

