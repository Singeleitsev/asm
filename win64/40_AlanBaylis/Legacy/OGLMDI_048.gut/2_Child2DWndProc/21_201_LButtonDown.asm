;case WM_LBUTTONDOWN:
lbl_Child2D_LButtonDown:

;Set mouse flag
mov g_bMouseDrag2, 1

;Get mouse position
;g_iMouseLastX2 = LOWORD(lParam)
movzx r8,word ptr[rsp+18h]
mov g_iMouseLastX2,r8d

;g_iMouseLastY2 = HIWORD(lParam)
movzx r9,word ptr[rsp+1Ah]
mov g_iMouseLastY2,r9d

;Capture the mouse
mov rcx,hWnd
Call SetCapture

jmp lbl_Child2D_Return0

