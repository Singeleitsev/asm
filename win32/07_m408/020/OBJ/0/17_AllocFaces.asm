allocFaces proc
LOCAL hHeap:QWORD
PROLOG 100h

;1. Sanity Check
cmp gnTotalFaces,0
je lbl_End

;2. Get Process Heap since it's unconditional
call GetProcessHeap
test rax,rax
jz lbl_WinError
mov hHeap,rax

;3. Allocate memory
LOG_TEXT szLogMemoryAllocating
mov rcx,hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,gnTotalFaces
imul r8,r8,24h ;9 indices * 4 bytes = 36 bytes
call HeapAlloc
test rax,rax
jz lbl_WinError
mov gpDataFaces,rax
LOG_TEXT szOK

;Success
mov rax,1
jmp lbl_End

lbl_WinError:
call SpellWinError
;jmp lbl_End

lbl_End:
EPILOG
allocFaces endp