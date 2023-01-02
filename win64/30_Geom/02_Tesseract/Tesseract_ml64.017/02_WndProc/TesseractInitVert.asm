
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

;Scale
;lea rdi,[v2] ;v2[0].x
;mov cx,64 ;64 Coordinates
;finit
;.Scale:
;fld dword[rdi] ;Get Coordinate
;fmul dword [Scale] ;Scale 1:2
;fstp dword[rdi] ;Set Coordinate
;add rdi,4 ;Next Coordinate
;dec cx
;cmp cx,0
;jg .Scale

;pop rdi
;pop rsi
;pop rcx
;pop rax