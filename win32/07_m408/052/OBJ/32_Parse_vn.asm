;-------------------------------------------------
;parse_vn - parse "v <x> <y> <z>" into gpBuffer_vn
;Input: esi = cursor at "vn "
;Output: esi = cursor at the first char after z
;gpBuffer_vn[gnCurrent_vn * 12 + 0..11] = x,y,z (3 floats)
;gnCurrent_vn incremented
;------------------------

parse_vn proc

;1. Advance esi past "vn" and its delimiter (space or tab)
;call skipSpace ;Too slow
add esi,3 ;"vn" + delimiter

;2. edi = gpBuffer_vn + gnCurrent_vn * 12
mov eax,gnCurrent_vn
imul eax,eax,12
mov edi,gpBuffer_vn
add edi,eax

;3. Parse x,y,z
call parseFloat
movss [edi + 0],xmm0
call parseFloat
movss [edi + 4],xmm0
call parseFloat
movss [edi + 8],xmm0

;4. Increment the normal count
inc gnCurrent_vn

;esi is at the delimiter after z (the \n or \r)
ret
parse_vn endp


