enumInstanceExtensionProps proc
PROLOG 100h

;1. First pass to get count
LOG_TEXT szVkEnumerateInstanceExtensionProperties
xor rcx,rcx
lea rdx,dwInstanceExtensionsCount
xor r8,r8
call vkEnumerateInstanceExtensionProperties
test eax,eax
jnz lbl_enumInstanceExtensionProps_VkError
cmp dwInstanceExtensionsCount,0
je lbl_enumInstanceExtensionProps_NoExtensions
LOG_TEXT szFirstPassOK

;2. Allocate memory for the array of VkExtensionProperties structures
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_enumInstanceExtensionProps_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
;size = dwInstanceExtensionsCount * sizeof(VkExtensionProperties)
xor r8,r8
mov r8d,dwInstanceExtensionsCount
imul r8,r8,104h ;sizeof(VkExtensionProperties) = 260 bytes
call HeapAlloc
test rax,rax
jz lbl_enumInstanceExtensionProps_WinError
mov gpExtensionProperties,rax
LOG_TEXT szOK

;3.Second pass to Fill VkExtensionProperties structures
LOG_TEXT szVkEnumerateInstanceExtensionProperties
xor rcx,rcx
lea rdx,dwInstanceExtensionsCount
mov r8,gpExtensionProperties
call vkEnumerateInstanceExtensionProperties
test eax,eax
jnz lbl_enumInstanceExtensionProps_VkError
LOG_TEXT szSecondPassOK

;4. Write the dump
call dumpInstanceExtensions

;5. Allocate memory for the array of Enabled Extension Name Pointers
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_enumInstanceExtensionProps_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
;size = dwInstanceExtensionsCount * (sizeof(pointer) + 1)
xor r8,r8
mov r8d,dwInstanceExtensionsCount
inc r8d ;Space for the Null-Terminator
shl r8,3 ;sizeof(Pointer) = 8 bytes
call HeapAlloc
test rax,rax
jz lbl_enumInstanceExtensionProps_WinError
mov createInfo_ppEnabledExtensionNames,rax
LOG_TEXT szOK

jmp lbl_enumInstanceExtensionProps_End

;Errors
lbl_enumInstanceExtensionProps_WinError:
call SpellWinError
jmp lbl_enumInstanceExtensionProps_End

lbl_enumInstanceExtensionProps_NoExtensions:
LOG_TEXT szErrNoInstanceExtensions
;jmp lbl_enumInstanceExtensionProps_VkError

lbl_enumInstanceExtensionProps_VkError:
call SpellVkError
;jmp lbl_enumInstanceExtensionProps_End

lbl_enumInstanceExtensionProps_End:
EPILOG
enumInstanceExtensionProps endp

