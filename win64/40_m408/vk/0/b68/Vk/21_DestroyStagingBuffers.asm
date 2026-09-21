;-----------------------------------------------------------------
; destroyStagingBuffers - Clean up staging resources
;-----------------------------------------------------------------
destroyStagingBuffers proc
PROLOG 100h

; Destroy staging vertex buffer
cmp gpStagingVertexBuffer, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, gpStagingVertexBuffer
xor r8, r8
call vkDestroyBuffer
mov gpStagingVertexBuffer, 0

@@:
; Free staging vertex memory
cmp gpStagingVertexMem, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, gpStagingVertexMem
xor r8, r8
call vkFreeMemory
mov gpStagingVertexMem, 0

@@:
; Destroy staging index buffer
cmp gpStagingIndexBuffer, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, gpStagingIndexBuffer
xor r8, r8
call vkDestroyBuffer
mov gpStagingIndexBuffer, 0

@@:
; Free staging index memory
cmp gpStagingIndexMem, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, gpStagingIndexMem
xor r8, r8
call vkFreeMemory
mov gpStagingIndexMem, 0

@@:
; Clean up model command buffers if any
cmp gpModelCmdBuffers, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, ghVkCommandPool
mov r8, 1
mov r9, gpModelCmdBuffers
call vkFreeCommandBuffers
mov gpModelCmdBuffers, 0

@@:
; Clean up model fence if any
cmp gpModelFence, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, gpModelFence
xor r8, r8
call vkDestroyFence
mov gpModelFence, 0

@@:
;Done
mov rax, 1

EPILOG
destroyStagingBuffers endp