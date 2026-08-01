; FindOrAddCombinedVertex - Search for existing vertex or add new one
; Input: ECX = position index (0-based), EDX = normal index (0-based)
; Output: EAX = combined vertex index

FindOrAddCombinedVertex proc
LOCAL posPtr:QWORD, normPtr:QWORD, combPtr:QWORD, count:DWORD
PROLOG 100h

;Calculate position pointer
xor rax,rax
mov eax,ecx ;position index
imul rax,0Ch ;3 coordinates * 4 bytes = 12 bytes
add rax,gpObjVertices
mov posPtr,rax

;Calculate normal pointer
xor rax,rax
mov eax,edx ;normal index
imul rax,0Ch ;3 coordinates * 4 bytes = 12 bytes
add rax,gpObjNormals
mov normPtr,rax

;Search existing combined vertices
mov r10,gpObjCombined ;pointer to current combined vertex
xor r11d,r11d ;current index
mov r8d,gnCurrentCombinedCount ;total count
test r8d,r8d
jz lbl_AddNew

lbl_SearchLoop:
;compare position (3 floats)
mov rdi,posPtr
mov rdx,r10 ;pointer to combined vertex's position
mov rcx,3 ;3 floats

lbl_CompPos:
movss xmm0,dword ptr[rdi]
movss xmm1,dword ptr[rdx]
comiss xmm0,xmm1
jne lbl_Next
add rdi,4
add rdx,4
dec rcx
jnz lbl_CompPos

;compare normal (3 floats at offset 12)
mov rdi,normPtr
mov rdx,r10
add rdx,0Ch ;12
mov rcx,3

lbl_CompNorm:
movss xmm0,dword ptr[rdi]
movss xmm1,dword ptr[rdx]
comiss xmm0,xmm1
jne lbl_Next
add rdi,4
add rdx,4
dec rcx
jnz lbl_CompNorm

;found
mov eax, r11d
jmp lbl_Found

lbl_Next:
add r10,18h ;24
inc r11d
cmp r11d,r8d
jl lbl_SearchLoop

;not found, add new
lbl_AddNew:
mov eax,gnCurrentCombinedCount
cmp eax,20000 ;capacity check
jge lbl_AddNew_Error

;destination pointer: gpCombinedVertices + count * 24
mov rdi,gpObjCombined
imul eax,18h ;24
add rdi,rax

;save non-volatile registers used by rep movsd
push rsi
push rdi

;copy position (3 dwords)
mov rsi,posPtr
mov rcx,3
rep movsd

; copy normal (3 dwords)
mov rsi,normPtr
mov rcx,3
rep movsd

pop rdi
pop rsi

mov eax,gnCurrentCombinedCount
inc gnCurrentCombinedCount
jmp lbl_Found

lbl_AddNew_Error:
LOG_TEXT szErrOBJCapacity
xor eax,eax

lbl_Found:
EPILOG
FindOrAddCombinedVertex endp
