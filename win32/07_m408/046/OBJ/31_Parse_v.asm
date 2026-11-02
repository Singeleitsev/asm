;-----------------------------------------------
;parse_v - parse "v <x> <y> <z>" into gpBuffer_v
;Input: esi = cursor at "v "
;Output: esi = cursor at the first char after z
;gpBuffer_v[gnCurrent_v * 12 + 0..11] = x,y,z (3 floats)
;gnCurrent_v incremented
;This file's "v" lines have exactly 3 coordinates (no optional 4th "w").
;If a "v x y z w" line appears,the 4th float is ignored (not parsed),
;and the outer loop's line scan skips it.
;----------------------------------------

parse_v proc

;1. Advance esi past "v" and its delimiter (space or tab)
;call skipSpace ;Too slow
add esi,2 ;"v" + delimiter

;2. edi = gpBuffer_v + gnCurrent_v * 12
mov eax,gnCurrent_v
imul eax,eax,12
mov edi,gpBuffer_v
add edi,eax

;3. Parse x,y,z
call parseFloat
movss [edi + 0],xmm0
call parseFloat
movss [edi + 4],xmm0
call parseFloat
movss [edi + 8],xmm0

;4. Increment the vertex count
inc gnCurrent_v

;esi is at the delimiter after z
ret
parse_v endp


