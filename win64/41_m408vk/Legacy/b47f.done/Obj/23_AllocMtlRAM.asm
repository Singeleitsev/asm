allocMtlRAM proc
LOCAL hHeap:QWORD
PROLOG 100h

LOG_TEXT szLogMemoryAllocating

call GetProcessHeap
test rax,rax
jz lbl_AllocMtlRAM_WinError
mov hHeap,rax

;1. Allocate material properties
mov rcx,hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,gnMtlCapacity
imul r8,r8,MTL_STRUCT_SIZE
call HeapAlloc
test rax,rax
jz lbl_AllocMtlRAM_WinError
mov gpMaterials,rax

;call SpellRAX

;Success
LOG_TEXT szOK
mov rax,1
jmp lbl_AllocMtlRAM_End

lbl_AllocMtlRAM_WinError:
call SpellWinError
xor rax,rax
;jmp lbl_AllocMtlRAM_End

lbl_AllocMtlRAM_End:
EPILOG
allocMtlRAM endp

