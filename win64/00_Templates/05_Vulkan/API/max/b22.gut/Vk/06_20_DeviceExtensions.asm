enumDeviceExtensionProps proc
PROLOG 100h

;1. First pass to get count
LOG_TEXT szVkEnumerateDeviceExtensionProperties
mov rcx,ghVkPhysicalDevice ;Physical device handle
xor rdx,rdx ;pLayerName (NULL for device extensions)
lea r8,dwDeviceExtensionsCount ;pPropertyCount
xor r9,r9 ;pProperties (NULL)
call vkEnumerateDeviceExtensionProperties
test eax,eax
jnz lbl_enumDeviceExtensionProps_VkError
cmp dwDeviceExtensionsCount,0
je lbl_enumDeviceExtensionProps_NoExtensions
LOG_TEXT szFirstPassOK

;2. Allocate memory for the array of VkExtensionProperties structures
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_enumDeviceExtensionProps_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,dwDeviceExtensionsCount
imul r8,r8,104h ;sizeof(VkExtensionProperties) = 260 bytes
call HeapAlloc
test rax, rax
jz lbl_enumDeviceExtensionProps_WinError
mov gpDeviceExtensionProperties, rax
LOG_TEXT szOK

;3. Second pass to fill structures
LOG_TEXT szVkEnumerateDeviceExtensionProperties
mov rcx,ghVkPhysicalDevice
xor rdx,rdx
lea r8,dwDeviceExtensionsCount
mov r9,gpDeviceExtensionProperties
call vkEnumerateDeviceExtensionProperties
test eax,eax
jnz lbl_enumDeviceExtensionProps_VkError
LOG_TEXT szSecondPassOK

;4. Write the dump
call dumpDeviceExtensions

;5. Allocate memory for the array of Enabled Extension Name Pointers
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax, rax
jz lbl_enumDeviceExtensionProps_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,dwDeviceExtensionsCount
inc r8d ;Space for Null-Terminator
shl r8,3 ;* 8 bytes (pointer size)
call HeapAlloc
test rax, rax
jz lbl_enumDeviceExtensionProps_WinError
mov deviceInfo_ppEnabledExtensionNames,rax
LOG_TEXT szOK

jmp lbl_enumDeviceExtensionProps_End

lbl_enumDeviceExtensionProps_NoExtensions:
LOG_TEXT szErrNoDeviceExtensions
jmp lbl_enumDeviceExtensionProps_End

lbl_enumDeviceExtensionProps_WinError:
call SpellWinError
jmp lbl_enumDeviceExtensionProps_End

lbl_enumDeviceExtensionProps_VkError:
call SpellVkError
;jmp lbl_enumDeviceExtensionProps_End

lbl_enumDeviceExtensionProps_End:
EPILOG
enumDeviceExtensionProps endp
