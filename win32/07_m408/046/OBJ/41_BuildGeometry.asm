BuildGeometry proc uses ebx esi edi ebp

;gnTotalIndices = gnCurrent_f * 3 (triangles)
mov eax,gnCurrent_f
imul eax,eax,3
mov gnTotalIndices,eax

;allocate gpIndices: gnTotalIndices * 2 bytes
mov eax,gnTotalIndices
shl eax,1
push eax
push 8
push ghProcessHeap
call HeapAlloc
test eax,eax
jz bg_Error
mov gpIndices,eax

;allocate gpVertices: gnTotalIndices * 36 bytes (interleaved VNC)
mov eax,gnTotalIndices
imul eax,eax,36
push eax
push 8
push ghProcessHeap
call HeapAlloc
test eax,eax
jz bg_Error
mov gpVertices,eax
;gpNormals are offsets into gpVertices
mov eax,gpVertices
add eax,12
mov gpNormals,eax

;Fill the buffers
mov ebx,0 ;face index
xor ebp,ebp ;combined vertex count (= index)
mov edi,gpVertices ;VNC write pointer
mov esi,gpIndices ;index write pointer

bg_FaceLoop:
cmp ebx,gnCurrent_f
jge bg_Done

;edx = gpBuffer_f + ebx * 36
mov eax,ebx
imul eax,eax,36
mov edx,gpBuffer_f
add edx,eax

xor ecx,ecx ;group offset 0,12,24
bg_GroupLoop:
;v -> position
mov eax,[edx + ecx + 0]
imul eax,eax,12
add eax,gpBuffer_v
push edx
mov edx,[eax + 0]
mov [edi + 0],edx
mov edx,[eax + 4]
mov [edi + 4],edx
mov edx,[eax + 8]
mov [edi + 8],edx
pop edx

;vn -> normal
mov eax,[edx + ecx + 8]
imul eax,eax,12
add eax,gpBuffer_vn
push edx
mov edx,[eax + 0]
mov [edi + 12],edx
mov edx,[eax + 4]
mov [edi + 16],edx
mov edx,[eax + 8]
mov [edi + 20],edx
pop edx

;index
mov word ptr [esi],bp
add esi,2

;Advance
add edi,36
inc ebp
add ecx,12
cmp ecx,36
jl bg_GroupLoop

inc ebx
jmp bg_FaceLoop

bg_Done:
mov gnTotalIndices,ebp
mov eax,1
ret

bg_Error:
call SpellError
xor eax,eax
ret

BuildGeometry endp

