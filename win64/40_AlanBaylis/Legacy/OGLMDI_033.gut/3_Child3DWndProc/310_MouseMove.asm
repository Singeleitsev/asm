;case WM_MOUSEMOVE:
lbl_Child3D_MouseMove:

cmp g_bMouseDrag,0
je lbl_Child3D_Return0

;Since in this part of code we don't call other Procedures,
;we can store the Local Variables in the Registers
;without moving them to/from the Memory

;MouseX = LOWORD(lParam);
movzx r8,word ptr[rsp+18h] ;Keep MouseX in r8d, not in Memory
;MouseY = HIWORD(lParam);
movzx r9,word ptr[rsp+1Ah] ;Keep MouseY in r9d, not in Memory

;g_iMouseDeltaX = LOWORD(lParam) - g_iMouseLastX
mov eax,r8d
sub eax,g_iMouseLastX
mov g_iMouseDeltaX,eax
;g_iMouseDeltaY = HIWORD(lParam) - g_iMouseLastY
mov ebx,r9d
sub r9d,g_iMouseLastY
mov g_iMouseDeltaY,r9d
;g_iMouseLastX = LOWORD(lParam)
mov g_iMouseLastX,r8d
;g_iMouseLastY = HIWORD(lParam)
mov g_iMouseLastY,r9d

jmp lbl_Child3D_Return0