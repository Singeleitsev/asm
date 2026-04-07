;case WM_LBUTTONUP:
lbl_Child3D_LButtonUp:

;Clear mouse flag
mov g_bMouseDrag,0

;Release the mouse capture
Call ReleaseCapture

jmp lbl_Child3D_Return0