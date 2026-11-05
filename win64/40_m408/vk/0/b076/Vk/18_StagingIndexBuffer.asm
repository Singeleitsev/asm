;-----------------------------------------------------------------
; createStagingIndexBuffer - Create host-visible staging index buffer
;-----------------------------------------------------------------
createStagingIndexBuffer proc
PROLOG 100h

mov rax, gnIndexSize
mov stagingIndexBufferInfo_size, rax
mov stagingIndexBufferInfo_usage, 1  ; VK_BUFFER_USAGE_TRANSFER_SRC_BIT

; Create buffer
LOG_TEXT szVkCreateBuffer
mov rcx, ghVkLogicalDevice
lea rdx, stagingIndexBufferInfo_sType
xor r8, r8
lea r9, gpStagingIndexBuffer
call vkCreateBuffer
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

; Get memory requirements
LOG_TEXT szVkGetBufferMemoryRequirements
mov rcx, ghVkLogicalDevice
mov rdx, gpStagingIndexBuffer
lea r8, stagingIndexMemReqs_size
call vkGetBufferMemoryRequirements
LOG_TEXT szOK

; Find host visible memory
mov ecx, stagingIndexMemReqs_memoryTypeBits
call FindHostVisibleMemoryType
cmp eax, -1
je lbl_VkError
mov stagingIndexAllocInfo_memoryTypeIndex, eax
mov rax, stagingIndexMemReqs_size
mov stagingIndexAllocInfo_allocationSize, rax

; Allocate memory
LOG_TEXT szVkAllocateMemory
mov rcx, ghVkLogicalDevice
lea rdx, stagingIndexAllocInfo_sType
xor r8, r8
lea r9, gpStagingIndexMem
call vkAllocateMemory
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

; Bind memory
LOG_TEXT szVkBindBufferMemory
mov rcx, ghVkLogicalDevice
mov rdx, gpStagingIndexBuffer
mov r8, gpStagingIndexMem
xor r9, r9
call vkBindBufferMemory
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

; Map and copy index data
LOG_TEXT szVkMapMemory
mov rcx, ghVkLogicalDevice
mov rdx, gpStagingIndexMem
xor r8, r8
mov r9, 0FFFFFFFFh
mov qword ptr [rsp+20h], 0
lea rax, gpIndexMap
mov qword ptr [rsp+28h], rax
call vkMapMemory
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

mov rsi, gpObjIndices
mov rdi, gpIndexMap
mov rcx, gnIndexSize
rep movsb

mov rcx, ghVkLogicalDevice
mov rdx, gpStagingIndexMem
call vkUnmapMemory

;Success
mov rax, 1
jmp lbl_End

lbl_VkError:
call SpellVkError
xor rax, rax

lbl_End:
EPILOG
createStagingIndexBuffer endp