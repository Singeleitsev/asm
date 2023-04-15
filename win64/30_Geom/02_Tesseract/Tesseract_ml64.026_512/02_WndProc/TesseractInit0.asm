
;push rax
;push rcx
;push rsi
;push rdi

lea rsi,v0
lea rdi,v2
mov cx,64 ;16 Vertices * 4 Coordinates
lbl_LoadBuffer:
mov eax, dword ptr [rsi]
mov dword ptr [rdi],eax
add rsi,4
add rdi,4
dec rcx
cmp cx,0
jg lbl_LoadBuffer

;pop rdi
;pop rsi
;pop rcx
;pop rax