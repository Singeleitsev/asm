
;push rax
;push rcx
;push rsi
;push rdi

;;Projection of the OW-Axis to the Screen
;lea rsi,v1 ;v1[0].x
;lea rdi,v2 ;v2[0].x
;;Skip 8 Vertices * 4 Coordinates
;add rsi,32 ;v1[8].x
;add rdi,32 ;v2[8].x


;It's better to use AVX instead
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