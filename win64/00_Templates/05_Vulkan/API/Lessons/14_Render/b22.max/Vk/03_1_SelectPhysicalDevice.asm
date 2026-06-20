selectPhysicalDevice proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. Pick the first found Device (simple selection)
mov rsi,ppPhysicalDevices ;rsi = base of the heap array
mov rdi,qword ptr[rsi] ;rdi = first VkPhysicalDevice handle
mov ghVkPhysicalDevice,rdi

;2. Allocate memory for the array of VkPhysicalDeviceProperties structures
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_selectPhysicalDevice_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
;size = dwPhysicalDeviceCount * sizeof(VkPhysicalDeviceProperties)
xor r8,r8
mov r8d,dwPhysicalDeviceCount
imul r8,r8,338h ;sizeof(VkPhysicalDeviceProperties) = 824 bytes
call HeapAlloc
test rax,rax
jz lbl_selectPhysicalDevice_WinError
mov gpPhysicalDeviceProps,rax
LOG_TEXT szOK

;Get the Device0 Name
LOG_TEXT szLogVkGetPhysicalDeviceProperties
mov rsi,ppPhysicalDevices
mov rcx,qword ptr[rsi]
mov rdx,gpPhysicalDeviceProps
call vkGetPhysicalDeviceProperties
test rax,rax
jnz lbl_selectPhysicalDevice_VkError

;Write the Device0 Name
mov rcx,gpPhysicalDeviceProps
add rcx,14h ;deviceName
call WriteLog
LOG_TEXT szCRLF

cmp dwPhysicalDeviceCount,1
je lbl_selectPhysicalDevice_End

mov rsi,ppPhysicalDevices
mov rcx,qword ptr[rsi + 8]
test rcx,rcx
jz lbl_selectPhysicalDevice_End

;Get the Device1 Name
LOG_TEXT szLogVkGetPhysicalDeviceProperties
mov rsi,ppPhysicalDevices
mov rcx,qword ptr[rsi + 8] ;Device1
mov rdx,gpPhysicalDeviceProps
add rdx,338h ;sizeof(VkPhysicalDeviceProperties) = 824 bytes
call vkGetPhysicalDeviceProperties
test rax,rax
jnz lbl_selectPhysicalDevice_VkError

;Write the Device1 Name
mov rcx,gpPhysicalDeviceProps
add rcx,338h ;Device1
add rcx,14h ;deviceName
call WriteLog
LOG_TEXT szCRLF

jmp lbl_selectPhysicalDevice_End

;Errors
lbl_selectPhysicalDevice_NoDevice:
LOG_TEXT szErrNoPhysicalDevices
jmp lbl_selectPhysicalDevice_VkError

lbl_selectPhysicalDevice_WinError:
call SpellWinError
jmp lbl_selectPhysicalDevice_End

lbl_selectPhysicalDevice_VkError:
call SpellVkError
;jmp lbl_selectPhysicalDevice_End

lbl_selectPhysicalDevice_End:
;Epilogue
leave
ret
selectPhysicalDevice endp
