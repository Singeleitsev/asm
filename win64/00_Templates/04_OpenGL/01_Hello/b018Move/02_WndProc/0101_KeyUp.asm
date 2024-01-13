lbl_wmkeyup:

;keys[wParam] = TRUE
lea rax,keys
add rax,r8
mov byte ptr [rax],0

xor eax,eax
jmp lbl_finish

