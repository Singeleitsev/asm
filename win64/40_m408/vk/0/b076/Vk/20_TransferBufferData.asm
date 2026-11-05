;-----------------------------------------------------------------
; transferBufferData - Copy staging buffers to device-local buffers
;-----------------------------------------------------------------
transferBufferData proc
PROLOG 100h

; Allocate command buffer for transfer
call GetProcessHeap
test rax, rax
jz lbl_WinError

; Allocate command buffer handle
mov rcx,rax
mov rdx, 8
xor r8, r8
mov r8d, 1
shl r8, 3
call HeapAlloc
test rax, rax
jz lbl_WinError
mov gpModelCmdBuffers, rax

mov rax, ghVkCommandPool
mov modelCmdAllocInfo_commandPool, rax

LOG_TEXT szVkAllocateCommandBuffers
mov rcx, ghVkLogicalDevice
lea rdx, modelCmdAllocInfo_sType
mov r8, gpModelCmdBuffers
call vkAllocateCommandBuffers
test eax, eax
jnz lbl_VkError
LOG_TEXT szOK

; Begin command buffer
mov rsi, gpModelCmdBuffers
mov rcx, qword ptr [rsi]
lea rdx, modelCmdBufferBeginInfo_sType
call vkBeginCommandBuffer
test eax, eax
jnz lbl_VkError

; Copy vertex buffer
mov rax, gnVertexSize
mov vertexCopyBuffer_size, rax
mov rsi, gpModelCmdBuffers
mov rcx, qword ptr [rsi]
mov rdx, gpStagingVertexBuffer
mov r8, gpDeviceVertexBuffer
mov r9, 1
lea rax, vertexCopyBuffer_srcOffset
mov qword ptr [rsp+20h], rax
call vkCmdCopyBuffer

; Copy index buffer
mov rax, gnIndexSize
mov indexCopyBuffer_size, rax
mov rsi, gpModelCmdBuffers
mov rcx, qword ptr [rsi]
mov rdx, gpStagingIndexBuffer
mov r8, gpDeviceIndexBuffer
mov r9, 1
lea rax, indexCopyBuffer_srcOffset
mov qword ptr [rsp+20h], rax
call vkCmdCopyBuffer

; End command buffer
mov rsi, gpModelCmdBuffers
mov rcx, qword ptr [rsi]
call vkEndCommandBuffer
test eax, eax
jnz lbl_VkError

; Create fence
LOG_TEXT szVkCreateFence
mov rcx, ghVkLogicalDevice
lea rdx, modelFenceInfo_sType
xor r8, r8
lea r9, gpModelFence
call vkCreateFence
test eax, eax
jnz lbl_VkError

; Submit transfer command
mov rax, gpModelCmdBuffers
mov modelSubmitInfo_pCommandBuffers, rax

LOG_TEXT szVkQueueSubmit
mov rcx, ghVkGraphicsQueue
mov rdx, 1
lea r8, modelSubmitInfo_sType
mov r9, gpModelFence
call vkQueueSubmit
test eax, eax
jnz lbl_VkError

; Wait for transfer to complete
mov rcx, ghVkLogicalDevice
mov rdx, 1
lea r8, gpModelFence
mov r9, 1
mov qword ptr [rsp+20h], -1
call vkWaitForFences
test eax, eax
jnz lbl_VkError

; Cleanup transfer resources
mov rcx, ghVkLogicalDevice
mov rdx, gpModelFence
xor r8, r8
call vkDestroyFence
mov gpModelFence, 0

mov rcx, ghVkLogicalDevice
mov rdx, ghVkCommandPool
mov r8, 1
mov r9, gpModelCmdBuffers
call vkFreeCommandBuffers
mov gpModelCmdBuffers, 0

;Success
mov rax, 1
jmp lbl_End

lbl_VkError:
call SpellVkError
jmp lbl_End

lbl_WinError:
call SpellWinError
;jmp lbl_End

lbl_End:
EPILOG
transferBufferData endp
