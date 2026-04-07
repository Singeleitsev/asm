;case WM_LBUTTONDOWN:
lbl_Child3D_LButtonDown:

;Set mouse flag
mov g_bMouseDrag,1

;Get mouse position
;g_iMouseLastX = LOWORD(lParam)
mov r8,lParam ;X = LOWORD, Y = HIWORD
and r8,0FFFFh ;X = LOWORD
mov g_iMouseLastX,r8d

;g_iMouseLastY = HIWORD(lParam)
mov r9,lParam ;X = LOWORD, Y = HIWORD
shr r9,16 ;HIWORD to LOWORD
and r9,0FFFFh ;Y = LOWORD
mov g_iMouseLastY,r9d

;Capture the mouse
mov rcx,hWnd
Call SetCapture

jmp lbl_Child3D_Return0
