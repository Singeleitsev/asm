enumeratePhysicalDevices proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. First pass to get count
LOG_TEXT szLogVkEnumeratePhysicalDevices
mov rcx,ghVkInstance
lea rdx,dwPhysicalDeviceCount
xor r8,r8 ;pPhysicalDevices = NULL
call vkEnumeratePhysicalDevices
test eax,eax
jnz lbl_enumeratePhysicalDevices_VkError
cmp dwPhysicalDeviceCount,0
je lbl_enumeratePhysicalDevices_NoDevice
LOG_TEXT szFirstPassOK

;2. Allocate memory for the array of pPhysicalDevices Pointers
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_enumeratePhysicalDevices_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
;size = dwPhysicalDeviceCount * sizeof(pointer)
xor r8,r8
mov r8d,dwPhysicalDeviceCount
shl r8,3 ;*8 bytes
call HeapAlloc
test rax,rax
jz lbl_enumeratePhysicalDevices_WinError
mov ppPhysicalDevices,rax
LOG_TEXT szOK

;3. Second pass to get devices
LOG_TEXT szLogVkEnumeratePhysicalDevices
mov rcx,ghVkInstance
lea rdx,dwPhysicalDeviceCount
mov r8,ppPhysicalDevices
call vkEnumeratePhysicalDevices
test eax,eax
jnz lbl_enumeratePhysicalDevices_VkError
cmp ppPhysicalDevices,0
je lbl_enumeratePhysicalDevices_VkError
LOG_TEXT szSecondPassOK

jmp lbl_enumeratePhysicalDevices_End

;Errors
lbl_enumeratePhysicalDevices_NoDevice:
LOG_TEXT szErrNoPhysicalDevices
jmp lbl_enumeratePhysicalDevices_VkError

lbl_enumeratePhysicalDevices_WinError:
call SpellWinError
jmp lbl_enumeratePhysicalDevices_End

lbl_enumeratePhysicalDevices_VkError:
call SpellVkError
;jmp lbl_enumeratePhysicalDevices_End

lbl_enumeratePhysicalDevices_End:
;Epilogue
leave
ret
enumeratePhysicalDevices endp
