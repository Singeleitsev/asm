;-----------------------------------------------------------------
; createDeviceVertexBuffer - Create device-local vertex buffer
;-----------------------------------------------------------------
createDeviceVertexBuffer proc
PROLOG 100h

; Fill VkBufferCreateInfo
mov rax, gnVertexSize
mov deviceVertexBufferInfo_size, rax
; VK_BUFFER_USAGE_VERTEX_BUFFER_BIT | VK_BUFFER_USAGE_TRANSFER_DST_BIT
mov deviceVertexBufferInfo_usage, 82h

; Create buffer
LOG_TEXT szVkCreateBuffer
mov rcx, ghVkLogicalDevice
lea rdx, deviceVertexBufferInfo_sType
xor r8, r8
lea r9, gpDeviceVertexBuffer
call vkCreateBuffer
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

; Get memory requirements
LOG_TEXT szVkGetBufferMemoryRequirements
mov rcx, ghVkLogicalDevice
mov rdx, gpDeviceVertexBuffer
lea r8, deviceVertexMemReqs_size
call vkGetBufferMemoryRequirements
LOG_TEXT szOK

; Find device local memory type
mov ecx, deviceVertexMemReqs_memoryTypeBits
call FindDeviceLocalMemoryType
cmp eax, -1
je lbl_VkError
mov deviceVertexAllocInfo_memoryTypeIndex, eax
mov rax, deviceVertexMemReqs_size
mov deviceVertexAllocInfo_allocationSize, rax

; Allocate memory
LOG_TEXT szVkAllocateMemory
mov rcx, ghVkLogicalDevice
lea rdx, deviceVertexAllocInfo_sType
xor r8, r8
lea r9, gpDeviceVertexBufferMem
call vkAllocateMemory
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

; Bind memory
LOG_TEXT szVkBindBufferMemory
mov rcx, ghVkLogicalDevice
mov rdx, gpDeviceVertexBuffer
mov r8, gpDeviceVertexBufferMem
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
createDeviceVertexBuffer endp