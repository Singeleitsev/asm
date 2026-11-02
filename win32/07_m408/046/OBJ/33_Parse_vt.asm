;-------------------------------------------------
;parse_vt - parse "v <x> <y> <z>" into gpBuffer_vt
;Input: esi = cursor at "vt "
;Output: esi = cursor at the first char after z
;gpBuffer_vt[gnCurrent_vt * 12 + 0..11] = x,y,z (3 floats)
;gnCurrent_vt incremented
;------------------------

parse_vt proc

;1. Advance esi past "vt" and its delimiter (space or tab)
;call skipSpace ;Too slow
add esi,3 ;"vt" + delimiter

;2. edi = gpBuffer_vt + gnCurrent_vt * 12
mov eax,gnCurrent_vt
imul eax,eax,12
mov edi,gpBuffer_vt
add edi,eax

;3. Parse x,y,z
call parseFloat
movss [edi + 0],xmm0
call parseFloat
movss [edi + 4],xmm0
call parseFloat
movss [edi + 8],xmm0

;4. Increment the normal count
inc gnCurrent_vt

;esi is at the delimiter after z (the \n or \r)
ret
parse_vt endp


