;case WM_KEYDOWN:
lbl_Child2D_KeyDown:

;key[wParam] = TRUE;
lea rax,key
add rax,wParam
mov byte ptr[rax],1

jmp lbl_Child2D_Return0