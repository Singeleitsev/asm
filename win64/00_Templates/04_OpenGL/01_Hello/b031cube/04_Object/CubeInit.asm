
;Get the Initial Coordinates (v0)
;from the Read-Only Memory
;to the Changeable Buffer (v3D)
;and simultaneously re-arrange them.

;Initial Structure is Convenient for
;describing the Geometry by a Human:
;x0,y0,z0, ..., x5,y5,z5
;Operational Structure is Arranged for
;proceeding with the AVX-Extention:
;x0, ..., x5, ..., z0, ..., z5

lea rsi,v0 ;Source
lea rdi,v3D ;Destination

mov rcx,8 ;8 Vertices
lbl_LoadBuffer:
mov eax, dword ptr [rsi] ;x
mov dword ptr [rdi],eax
mov eax, dword ptr [rsi+4] ;y
mov dword ptr [rdi+20h],eax
mov eax, dword ptr [rsi+8] ;z
mov dword ptr [rdi+40h],eax
;mov eax, dword ptr [rsi+0Ch] ;w
;mov dword ptr [rdi+60h],eax
add rsi,10h ;Source - Next Point
add rdi,4 ;Destination - Next Coordinate
dec cx
cmp cx,0
jg lbl_LoadBuffer

