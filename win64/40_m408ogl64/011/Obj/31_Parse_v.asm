;-----------------------------------------------
;parse_v - parse "v <x> <y> <z>" into gpBuffer_v
;Input: rsi = cursor at "v "
;Output: rsi = cursor at the first char after z
;gpBuffer_v[gnCurrent_v * 12 + 0..11] = x,y,z (3 floats)
;gnCurrent_v incremented
;This file's "v" lines have exactly 3 coordinates (no optional 4th "w").
;If a "v x y z w" line appears,the 4th float is ignored (not parsed),
;and the outer loop's line scan skips it.
;----------------------------------------

parse_v proc
PROLOG 100h

;1. Advance rsi past "v" and its delimiter (space or tab)
;call skipSpace ;Too slow
add rsi,2 ;"v" + delimiter

;2. rdi = gpBuffer_v + gnCurrent_v * 12
xor rax,rax
mov eax,gnCurrent_v
imul eax,eax,12
mov rdi,gpBuffer_v
add rdi,rax

;3. Parse x,y,z
call parseFloat
movss dword ptr[rdi+0],xmm0
call parseFloat
movss dword ptr[rdi+4],xmm0
call parseFloat
movss dword ptr[rdi+8],xmm0

;4. Increment the vertex count
inc gnCurrent_v

;rsi is at the delimiter after z
EPILOG
parse_v endp


