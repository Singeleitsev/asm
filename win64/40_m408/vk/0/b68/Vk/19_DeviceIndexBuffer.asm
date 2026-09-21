;-----------------------------------------------------------------
; createDeviceIndexBuffer - Create device-local index buffer
;-----------------------------------------------------------------
createDeviceIndexBuffer proc
PROLOG 100h

mov rax, gnIndexSize
mov deviceIndexBufferInfo_size, rax
; VK_BUFFER_USAGE_INDEX_BUFFER_BIT | VK_BUFFER_USAGE_TRANSFER_DST_BIT
mov deviceIndexBufferInfo_usage, 42h

; Create buffer
LOG_TEXT szVkCreateBuffer
mov rcx, ghVkLogicalDevice
lea rdx, deviceIndexBufferInfo_sType
xor r8, r8
lea r9, gpDeviceIndexBuffer
call vkCreateBuffer
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

; Get memory requirements
LOG_TEXT szVkGetBufferMemoryRequirements
mov rcx, ghVkLogicalDevice
mov rdx, gpDeviceIndexBuffer
lea r8, deviceIndexMemReqs_size
call vkGetBufferMemoryRequirements
LOG_TEXT szOK

; Find device local memory
mov ecx, deviceIndexMemReqs_memoryTypeBits
call FindDeviceLocalMemoryType
cmp eax, -1
je lbl_VkError
mov deviceIndexAllocInfo_memoryTypeIndex, eax
mov rax, deviceIndexMemReqs_size
mov deviceIndexAllocInfo_allocationSize, rax

; Allocate memory
LOG_TEXT szVkAllocateMemory
mov rcx, ghVkLogicalDevice
lea rdx, deviceIndexAllocInfo_sType
xor r8, r8
lea r9, gpDeviceIndexBufferMem
call vkAllocateMemory
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

; Bind memory
LOG_TEXT szVkBindBufferMemory
mov rcx, ghVkLogicalDevice
mov rdx, gpDeviceIndexBuffer
mov r8, gpDeviceIndexBufferMem
xor r9, r9
call vkBindBufferMemory
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

;Success
mov rax, 1
jmp lbl_End

lbl_VkError:
call SpellVkError
xor rax, rax

lbl_End:
EPILOG
createDeviceIndexBuffer endp