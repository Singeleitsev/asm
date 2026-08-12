;--------------------------------------------------------
; parseVertices – Parse all v x y z lines from OBJ
; Input: gpObjDataStart/End, gnTotalVertices
; Output: gpDataVertices allocated and filled
;--------------------------------------------------------
parseVertices proc
LOCAL hHeap:QWORD,pCurrentSource:QWORD
LOCAL vertexIndex:DWORD
PROLOG 100h

;1. Get Process Heap
call GetProcessHeap
test rax,rax
jz lbl_WinError
mov hHeap,rax

;2. Check if vertices exist
cmp gnTotalVertices,0
jle lbl_NoVertices

;3. Allocate vertex array (3 floats per vertex = 12 bytes)
LOG_TEXT szLogMemoryAllocating
mov rcx,hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,gnTotalVertices
imul r8,r8,12 ;3 floats * 4 bytes
call HeapAlloc
test rax,rax
jz lbl_WinError
mov gpDataVertices,rax
LOG_TEXT szOK

;4. Parse vertices
mov rcx,gpObjDataStart
mov pCurrentSource,rcx
xor r11,r11
mov vertexIndex,r11d

lbl_NextLine:
mov rcx,pCurrentSource
cmp rcx,gpObjDataEnd
jge lbl_Done

;Check for 'v' token (not vn or vt)
cmp byte ptr[rcx],76h ;'v'
jne lbl_SkipLine
cmp byte ptr[rcx+1],20h ;space after 'v'
je lbl_FoundVertex
cmp byte ptr[rcx+1],9 ;tab after 'v'
je lbl_FoundVertex
jmp lbl_SkipLine

lbl_FoundVertex:
add pCurrentSource,2 ;skip "v "
mov rcx,pCurrentSource
call skipSpace
mov rcx,rax

;Parse float values
call parseFloat3 ;returns xmm0=x, xmm1=y, xmm2=z, rax=updated pointer

;Store in vertex array
mov rdx,gpDataVertices
mov r8d,vertexIndex
imul r8,r8,12
add rdx,r8

;Store X
movss dword ptr[rdx],xmm0
;Store Y
movss dword ptr[rdx+4],xmm1
;Store Z
movss dword ptr[rdx+8],xmm2

inc vertexIndex
mov pCurrentSource,rax

lbl_SkipLine:
;Skip to end of line
mov rcx,pCurrentSource
cmp rcx,gpObjDataEnd
jge lbl_Done

lbl_SkipToEOL:
mov al,byte ptr[rcx]
cmp al,0Ah ;LF
je lbl_SkipLF_ParseV
cmp al,0Dh ;CR
je lbl_SkipCR_ParseV
test al,al ;EOF
jz lbl_Done
inc rcx
jmp lbl_SkipToEOL

lbl_SkipCR_ParseV:
inc rcx
cmp byte ptr[rcx],0Ah
je lbl_SkipLF_ParseV
jmp lbl_NextLine

lbl_SkipLF_ParseV:
inc rcx
mov pCurrentSource,rcx
jmp lbl_NextLine

lbl_Done:
;Verify count
mov eax,gnTotalVertices
cmp vertexIndex,eax
je @f
LOG_TEXT szErrVertexCountMismatch
@@:

LOG_TEXT szLogVerticesParsed
mov rcx,vertexIndex
call WriteDecimalToLog
LOG_TEXT szCRLF

mov rax,1
jmp lbl_End

lbl_NoVertices:
LOG_TEXT szErrNoVertices
xor rax,rax

lbl_WinError:
call SpellWinError
xor rax,rax

lbl_End:
EPILOG
parseVertices endp