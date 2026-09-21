;-----------------------------------------------------------------
; createStagingVertexBuffer - Create host-visible staging buffer
;-----------------------------------------------------------------
createStagingVertexBuffer proc
PROLOG 100h

; Fill VkBufferCreateInfo
mov rax, gnVertexSize
mov stagingVertexBufferInfo_size, rax
mov stagingVertexBufferInfo_usage, 1  ; VK_BUFFER_USAGE_TRANSFER_SRC_BIT

; Create buffer
LOG_TEXT szVkCreateBuffer
mov rcx, ghVkLogicalDevice
lea rdx, stagingVertexBufferInfo_sType
xor r8, r8
lea r9, gpStagingVertexBuffer
call vkCreateBuffer
test eax, eax
jnz lbl_VkError
cmp gpStagingVertexBuffer, 0
je lbl_VkError
LOG_TEXT szOK

; Get memory requirements
LOG_TEXT szVkGetBufferMemoryRequirements
mov rcx, ghVkLogicalDevice
mov rdx, gpStagingVertexBuffer
lea r8, stagingVertexMemReqs_size
call vkGetBufferMemoryRequirements
LOG_TEXT szOK

; Find host visible memory type
mov ecx, stagingVertexMemReqs_memoryTypeBits
call FindHostVisibleMemoryType
cmp eax, -1
je lbl_VkError
mov stagingVertexAllocInfo_memoryTypeIndex, eax
mov rax, stagingVertexMemReqs_size
mov stagingVertexAllocInfo_allocationSize, rax

; Allocate memory
LOG_TEXT szVkAllocateMemory
mov rcx, ghVkLogicalDevice
lea rdx, stagingVertexAllocInfo_sType
xor r8, r8
lea r9, gpStagingVertexMem
call vkAllocateMemory
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

; Bind memory
LOG_TEXT szVkBindBufferMemory
mov rcx, ghVkLogicalDevice
mov rdx, gpStagingVertexBuffer
mov r8, gpStagingVertexMem
xor r9, r9
call vkBindBufferMemory
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

; Map and copy vertex data
LOG_TEXT szVkMapMemory
mov rcx, ghVkLogicalDevice
mov rdx, gpStagingVertexMem
xor r8, r8
mov r9, 0FFFFFFFFh
mov qword ptr [rsp+20h], 0
lea rax, gpVertexMap
mov qword ptr [rsp+28h], rax
call vkMapMemory
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

; Copy combined vertices to staging buffer
mov rsi, gpObjCombined
mov rdi, gpVertexMap
mov rcx, gnVertexSize
rep movsb

; Unmap
LOG_TEXT szVkUnmapMemory
mov rcx, ghVkLogicalDevice
mov rdx, gpStagingVertexMem
call vkUnmapMemory
LOG_TEXT szOK

;Success
mov rax, 1
jmp lbl_End

lbl_VkError:
call SpellVkError
xor rax, rax

lbl_End:
EPILOG
createStagingVertexBuffer endp