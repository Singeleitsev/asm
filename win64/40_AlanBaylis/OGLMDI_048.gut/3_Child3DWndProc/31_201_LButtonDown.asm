;case WM_LBUTTONDOWN:
lbl_Child3D_LButtonDown:

;Set mouse flag
mov g_bMouseDrag,1

;Get mouse position
;g_iMouseLastX = LOWORD(lParam)
movzx r8,word ptr[rsp+18h]
mov g_iMouseLastX,r8d

;g_iMouseLastY = HIWORD(lParam)
movzx r9,word ptr[rsp+1Ah]
mov g_iMouseLastY,r9d

;Capture the mouse
mov rcx,hWnd
Call SetCapture

jmp lbl_Child3D_Return0
