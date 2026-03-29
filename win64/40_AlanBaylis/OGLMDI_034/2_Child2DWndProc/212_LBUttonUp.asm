;case WM_LBUTTONUP:
lbl_Child2D_LButtonUp:

;Clear mouse flag
mov g_bMouseDrag2, 0

;Release the mouse capture
Call ReleaseCapture

jmp lbl_Child2D_Return0