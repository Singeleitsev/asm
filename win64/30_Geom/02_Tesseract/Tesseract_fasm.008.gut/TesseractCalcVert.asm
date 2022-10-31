
;push rax
;push rcx
;push rsi
;push rdi

lea rsi,[v2]
lea rdi,[v1]

mov cx,64 ;16 Vertices * 4 Coordinates
.StoreBuffer:
mov eax, dword [rsi]
mov dword [rdi],eax
add rsi,4
add rdi,4
dec rcx
cmp cx,0
jg .StoreBuffer

;;Projection of the OW-Axis to the Screen
;lea rsi,[v1] ;v1[0].x
;lea rdi,[v2] ;v2[0].x
;;Skip 8 Vertices * 4 Coordinates
;add rsi,32 ;v1[8].x
;add rdi,32 ;v2[8].x

;mov cx,8 ;8 Vertices
;finit
;.Projection:
;fld dword [rsi] ;v1[i].x
;fadd dword [half] ;v1[i].x+0.25
;fstp dword[rdi] ;v2[i].x
;add rsi,4 ;v1[i].y
;add rdi,4 ;v2[i].y
;fld dword [rsi] ;v1[i].y
;fadd dword [half] ;v1[i].y+0.25
;fstp dword [rdi] ;v2[i].x
;add rsi,4 ;v1[i].z
;add rdi,4 ;v2[i].z
;fld dword[rsi] ;v1[i].z
;fadd dword [half] ;v1[i].z+0.25
;fstp dword [rdi] ;v2[i].z
;add rsi,8 ;Next Vertex
;add rdi,8 ;Next Vertex
;dec cx
;cmp cx,0
;jg .Projection


;pop rdi
;pop rsi
;pop rcx
;pop rax
