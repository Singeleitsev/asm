;-------------------------------------------------
;parse_vn - parse "v <x> <y> <z>" into gpBuffer_vn
;Input: rsi = cursor at "vn "
;Output: rsi = cursor at the first char after z
;gpBuffer_vn[gnCurrent_vn * 12 + 0..11] = x,y,z (3 floats)
;gnCurrent_vn incremented
;------------------------

parse_vn proc
PROLOG 100h

;1. Advance rsi past "vn" and its delimiter (space or tab)
;call skipSpace ;Too slow
add rsi,3 ;"vn" + delimiter

;2. rdi = gpBuffer_vn + gnCurrent_vn * 12
xor rax,rax
mov eax,gnCurrent_vn
imul eax,eax,12
mov rdi,gpBuffer_vn
add rdi,rax

;3. Parse x,y,z
call parseFloat
movss dword ptr[rdi+0],xmm0
call parseFloat
movss dword ptr[rdi+4],xmm0
call parseFloat
movss dword ptr[rdi+8],xmm0

;4. Increment the normal count
inc gnCurrent_vn

;rsi is at the delimiter after z (the \n or \r)
EPILOG
parse_vn endp


