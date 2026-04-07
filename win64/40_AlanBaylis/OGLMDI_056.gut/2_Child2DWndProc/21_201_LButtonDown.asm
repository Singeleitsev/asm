;case WM_LBUTTONDOWN:
lbl_Child2D_LButtonDown:

;Set mouse flag
mov g_bMouseDrag2,1

;Get mouse position
;g_iMouseLastX2 = LOWORD(lParam)
mov r8,lParam ;X = LOWORD, Y = HIWORD
and r8,0FFFFh ;X = LOWORD
mov g_iMouseLastX2,r8d

;g_iMouseLastY2 = HIWORD(lParam)
mov r9,lParam ;X = LOWORD, Y = HIWORD
shr r9d,16 ;HIWORD to LOWORD
and r9,0FFFFh ;Y = LOWORD
mov g_iMouseLastY2,r9d

;Capture the mouse
mov rcx,hWnd
Call SetCapture

jmp lbl_Child2D_Return0

