;040_GetQueueFamilyPropertiesProc.asm
getQueueFamilyProperties proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. First call to get count
LOG_TEXT szLogVkGetPhysicalDeviceQueueFamilyProperties
mov rcx,ghVkPhysicalDevice
lea rdx,dwQueueFamilyCount
xor r8,r8 ;pQueueFamilyProperties = NULL
call vkGetPhysicalDeviceQueueFamilyProperties
cmp dwQueueFamilyCount,0
je lbl_getQueueFamilyProperties_NoFamilies
LOG_TEXT szFirstPassOK

;2. Allocate memory for queueFamilyProperties
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_getQueueFamilyProperties_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,dwQueueFamilyCount
imul r8,r8,18h ;sizeof VkQueueFamilyProperties = 24 bytes
call HeapAlloc
test rax,rax
jz lbl_getQueueFamilyProperties_WinError
mov gpQueueFamilyProperties,rax
LOG_TEXT szOK

;3. Second pass to get properties
LOG_TEXT szLogVkGetPhysicalDeviceQueueFamilyProperties
mov rcx,ghVkPhysicalDevice
lea rdx,dwQueueFamilyCount
mov r8,gpQueueFamilyProperties
call vkGetPhysicalDeviceQueueFamilyProperties
cmp gpQueueFamilyProperties,0
je lbl_getQueueFamilyProperties_VkError
LOG_TEXT szSecondPassOK

;4. Allocate memory for pSupport
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_getQueueFamilyProperties_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,dwQueueFamilyCount
shl r8,2 ;sizeof VkBool32 = 4 bytes
call HeapAlloc
test rax,rax
jz lbl_getQueueFamilyProperties_WinError
mov gpPresentSupport,rax
LOG_TEXT szOK

jmp lbl_getQueueFamilyProperties_End

;Errors
lbl_getQueueFamilyProperties_WinError:
call SpellWinError
jmp lbl_getQueueFamilyProperties_End

lbl_getQueueFamilyProperties_NoFamilies:
LOG_TEXT szErrNoQueueFamilies
;jmp lbl_getQueueFamilyProperties_VkError

lbl_getQueueFamilyProperties_VkError:
call SpellVkError
;jmp lbl_getQueueFamilyProperties_End

lbl_getQueueFamilyProperties_End:
;Epilogue:
leave
ret
getQueueFamilyProperties endp
