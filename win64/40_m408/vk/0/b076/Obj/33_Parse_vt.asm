;-------------------------------------------------
;parse_vt - parse "v <x> <y> <z>" into gpBuffer_vt
;Input: rsi = cursor at "vt "
;Output: rsi = cursor at the first char after z
;gpBuffer_vt[gnCurrent_vt * 12 + 0..11] = x,y,z (3 floats)
;gnCurrent_vt incremented
;------------------------

parse_vt proc
PROLOG 100h

;1. Advance rsi past "vt" and its delimiter (space or tab)
;call skipSpace ;Too slow
add rsi,3 ;"vt" + delimiter

;2. rdi = gpBuffer_vt + gnCurrent_vt * 12
xor rax,rax
mov eax,gnCurrent_vt
imul eax,eax,12
mov rdi,gpBuffer_vt
add rdi,rax

;3. Parse x,y,z
call parseFloat
movss dword ptr[rdi+0],xmm0
call parseFloat
movss dword ptr[rdi+4],xmm0
call parseFloat
movss dword ptr[rdi+8],xmm0

;4. Increment the normal count
inc gnCurrent_vt

;rsi is at the delimiter after z (the \n or \r)
EPILOG
parse_vt endp


