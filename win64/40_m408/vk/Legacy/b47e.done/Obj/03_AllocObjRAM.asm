allocObjRAM proc
LOCAL hHeap:QWORD
PROLOG 100h

LOG_TEXT szLogMemoryAllocating

call GetProcessHeap
test rax,rax
jz lbl_AllocObjRAM_WinError
mov hHeap,rax

;1. Allocate Vertices
mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,gnObjVertexArraySize
call HeapAlloc
test rax,rax
jz lbl_AllocObjRAM_WinError
mov gpObjVertices,rax

;2. Allocate normals
mov rcx,hHeap
mov rdx,8
mov r8,gnObjNormalArraySize
call HeapAlloc
test rax,rax
jz lbl_AllocObjRAM_WinError
mov gpObjNormals,rax

;3. Allocate combined vertices
mov rcx,hHeap
mov rdx,8
mov r8,gnObjCombinedArraySize
call HeapAlloc
test rax,rax
jz lbl_AllocObjRAM_WinError
mov gpObjCombined,rax

;4. Allocate indices
mov rcx,hHeap
mov rdx,8
mov r8,gnObjIndexArraySize
call HeapAlloc
test rax,rax
jz lbl_AllocObjRAM_WinError
mov gpObjIndices,rax

;5. Allocate face materials array
mov rcx,hHeap
mov rdx,8
mov r8,gnMtlArraySize
call HeapAlloc
test rax,rax
jz lbl_AllocObjRAM_WinError
mov gpMtlFace,rax

;Success
LOG_TEXT szOK
mov rax,1
jmp lbl_AllocObjRAM_End

lbl_AllocObjRAM_WinError:
call SpellWinError
xor rax,rax
;jmp lbl_AllocObjRAM_End

lbl_AllocObjRAM_End:
EPILOG
allocObjRAM endp

