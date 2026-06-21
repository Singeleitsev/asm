enumInstanceLayerProps proc
PROLOG 100h

;1. First pass to get count
LOG_TEXT szLogVkEnumerateInstanceLayerProperties
lea rcx,dwInstanceLayersCount
xor rdx,rdx
call vkEnumerateInstanceLayerProperties
test eax,eax
jnz lbl_enumInstanceLayerProps_VkError
cmp dwInstanceLayersCount,0
je lbl_enumInstanceLayerProps_NoLayers
LOG_TEXT szFirstPassOK

;2. Allocate memory for the array of VkLayerProperties structures
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_enumInstanceLayerProps_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
;size = dwInstanceLayersCount * sizeof(VkLayerProperties)
xor r8,r8
mov r8d,dwInstanceLayersCount
imul r8,r8,208h ;sizeof(VkLayerProperties) = 520 bytes
call HeapAlloc
test rax,rax
jz lbl_enumInstanceLayerProps_WinError
mov gpLayerProperties,rax
LOG_TEXT szOK

;3.Second pass to Fill VkLayerProperties structures
LOG_TEXT szLogVkEnumerateInstanceLayerProperties
lea rcx,dwInstanceLayersCount
mov rdx,gpLayerProperties
call vkEnumerateInstanceLayerProperties
test eax,eax
jnz lbl_enumInstanceLayerProps_VkError
LOG_TEXT szSecondPassOK

;4. Write the dump
call dumpLayers

;5. Allocate memory for the array of Enabled Layer Name Pointers
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_enumInstanceLayerProps_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
;size = dwInstanceLayersCount * (sizeof(pointer) + 1)
xor r8,r8
mov r8d,dwInstanceLayersCount
inc r8d ;Space for the Null-Terminator
shl r8,3 ;sizeof(Pointer) = 8 bytes
call HeapAlloc
test rax,rax
jz lbl_enumInstanceLayerProps_WinError
mov createInfo_ppEnabledLayerNames,rax
LOG_TEXT szOK

jmp lbl_enumInstanceLayerProps_End

;Errors
lbl_enumInstanceLayerProps_WinError:
call SpellWinError
jmp lbl_enumInstanceLayerProps_End

lbl_enumInstanceLayerProps_NoLayers:
LOG_TEXT szErrNoInstanceLayers
;jmp lbl_enumInstanceLayerProps_VkError

lbl_enumInstanceLayerProps_VkError:
call SpellVkError
;jmp lbl_enumInstanceLayerProps_End

lbl_enumInstanceLayerProps_End:
EPILOG
enumInstanceLayerProps endp
