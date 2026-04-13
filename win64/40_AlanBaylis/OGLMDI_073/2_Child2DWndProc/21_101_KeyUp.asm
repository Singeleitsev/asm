;case WM_KEYUP:
lbl_Child2D_KeyUp:

;key[wParam] = FALSE;
lea rax,key
add rax,wParam 
mov byte ptr[rax],0

jmp lbl_Child2D_Return0