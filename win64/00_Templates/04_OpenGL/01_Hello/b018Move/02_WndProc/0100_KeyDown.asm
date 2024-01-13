lbl_wmkeydown:

;keys[wParam] = TRUE
lea rax,keys
add rax,r8
mov byte ptr [rax],1

xor eax,eax
jmp lbl_finish