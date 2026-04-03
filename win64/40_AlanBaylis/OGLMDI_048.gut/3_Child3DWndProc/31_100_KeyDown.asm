;case WM_KEYDOWN:
lbl_Child3D_KeyDown:

;key[wParam] = TRUE;
lea rax,key
add rax,wParam
mov byte ptr[rax],1

jmp lbl_Child3D_Return0