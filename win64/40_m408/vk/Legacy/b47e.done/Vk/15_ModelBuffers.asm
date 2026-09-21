;---------------------------------------------
;Create vertex and index buffers from OBJ data
;---------------------------------------------
createModelBuffers proc
PROLOG 100h

;Skip if no data
cmp gnCurrentCombinedCount,0
je lbl_createModelBuffers_End
cmp gnCurrentIndexCount,0
je lbl_createModelBuffers_End

;1. Calculate sizes

xor rax,rax
mov eax,gnCurrentCombinedCount
imul rax,18h ;vertex = pos(12) + normal(12) = 24 bytes
mov gnVertexSize,rax

xor rcx,rcx
mov ecx,gnCurrentIndexCount
shl rcx,2 ; indices are 32-bit,*4 bytes
mov gnIndexSize,rcx

;2.STAGING VERTEX BUFFER (HOST VISIBLE)

LOG_TEXT szLogStagingVertexBuffer

;2.1. Fill the rest of VkBufferCreateInfo structure
mov rsi,gnVertexSize
mov stagingVertexBufferInfo_size,rsi

;2.2. Create the Staging Vertex Buffer
LOG_TEXT szVkCreateBuffer
mov rcx,ghVkLogicalDevice
lea rdx,stagingVertexBufferInfo_sType
xor r8,r8 ;pAllocator
lea r9,gpStagingVertexBuffer
call vkCreateBuffer
test eax,eax
jnz lbl_createModelBuffers_VkError
cmp gpStagingVertexBuffer,0
je lbl_createModelBuffers_VkError
LOG_TEXT szOK

;2.3. Get memory requirements
LOG_TEXT szVkGetBufferMemoryRequirements
mov rcx,ghVkLogicalDevice
mov rdx,gpStagingVertexBuffer
lea r8,stagingVertexMemReqs_size
call vkGetBufferMemoryRequirements
cmp stagingVertexMemReqs_size,0
je lbl_createModelBuffers_VkError
cmp stagingVertexMemReqs_alignment,0
je lbl_createModelBuffers_VkError
LOG_TEXT szOK

;2.4. Find memory type: HOST_VISIBLE | HOST_COHERENT
mov ecx,stagingVertexMemReqs_memoryTypeBits
call FindHostVisibleMemoryType
cmp eax,-1
je lbl_createModelBuffers_VkError

;Verify index < memoryTypeCount
mov ecx,memProps_memoryTypeCount
cmp eax,ecx
jae lbl_createModelBuffers_VkError ;index out of bounds

;Received from FindHostVisibleMemoryType
mov stagingVertexAllocInfo_memoryTypeIndex,eax

;2.5. Fill the rest of VkMemoryAllocateInfo structure
mov rsi,stagingVertexMemReqs_size
mov stagingVertexAllocInfo_allocationSize,rsi

;2.6. Allocate Memory
LOG_TEXT szVkAllocateMemory
mov rcx,ghVkLogicalDevice
lea rdx,stagingVertexAllocInfo_sType ;address of VkMemoryAllocateInfo structure
xor r8,r8 ;pAllocator
lea r9,gpStagingVertexMem
call vkAllocateMemory
test eax,eax
jnz lbl_createModelBuffers_VkError
cmp gpStagingVertexMem,0
je lbl_createModelBuffers_VkError
LOG_TEXT szOK

;2.7. Bind Memory
LOG_TEXT szVkBindBufferMemory
mov rcx,ghVkLogicalDevice
mov rdx,gpStagingVertexBuffer
mov r8,gpStagingVertexMem
xor r9,r9
call vkBindBufferMemory
test rax,rax
jnz lbl_createModelBuffers_VkError
LOG_TEXT szOK

;2.8. Map and copy vertex data
LOG_TEXT szVkMapMemory
mov rcx,ghVkLogicalDevice
mov rdx,gpStagingVertexMem
xor r8,r8
mov r9,0FFFFFFFFh ;size = whole buffer
mov qword ptr[rsp+20h],0 ;flags
lea rax,gpVertexMap
mov qword ptr[rsp+28h],rax ;ppData
call vkMapMemory
test rax,rax
jnz lbl_createModelBuffers_VkError
LOG_TEXT szOK

;2.9. Move
mov rsi,gpObjCombined ;What is it?!
mov rdi,gpVertexMap
mov rcx,gnVertexSize
rep movsb

;2.10. Unmap
LOG_TEXT szVkUnmapMemory
mov rcx,ghVkLogicalDevice
mov rdx,gpStagingVertexMem
call vkUnmapMemory
LOG_TEXT szOK

;3. DEVICE LOCAL VERTEX BUFFER

LOG_TEXT szLogDeviceVertexBuffer

;3.1. Fill the rest of VkBufferCreateInfo structure
mov rsi,gnVertexSize
mov deviceVertexBufferInfo_size,rsi

;3.2. Create the Device Local Vertex Buffer
LOG_TEXT szVkCreateBuffer
mov rcx,ghVkLogicalDevice
lea rdx,deviceVertexBufferInfo_sType
xor r8,r8
lea r9,gpDeviceVertexBuffer
call vkCreateBuffer
test rax,rax
jnz lbl_createModelBuffers_VkError
cmp gpDeviceVertexBuffer,0
je lbl_createModelBuffers_VkError
LOG_TEXT szOK

;3.3. Get memory requirements
LOG_TEXT szVkGetBufferMemoryRequirements
mov rcx,ghVkLogicalDevice
mov rdx,gpDeviceVertexBuffer
lea r8,deviceVertexMemReqs_size
call vkGetBufferMemoryRequirements
cmp deviceVertexMemReqs_size,0
je lbl_createModelBuffers_VkError
cmp deviceVertexMemReqs_alignment,0
je lbl_createModelBuffers_VkError
LOG_TEXT szOK

;3.4. Find memory type: DEVICE_LOCAL
mov ecx,deviceVertexMemReqs_memoryTypeBits
call FindDeviceLocalMemoryType
cmp eax,-1
je lbl_createModelBuffers_VkError

;Verify index < memoryTypeCount
mov ecx,memProps_memoryTypeCount
cmp eax,ecx
jae lbl_createModelBuffers_VkError ;index out of bounds

;Received from FindDeviceLocalMemoryType
mov deviceVertexAllocInfo_memoryTypeIndex,eax

;3.5. Fill the rest of VkMemoryAllocateInfo structure
mov rsi,deviceVertexMemReqs_size
mov deviceVertexAllocInfo_allocationSize,rsi

;3.6. Allocate Memory
LOG_TEXT szVkAllocateMemory
mov rcx,ghVkLogicalDevice
lea rdx,deviceVertexAllocInfo_sType
xor r8,r8
lea r9,gpDeviceVertexBufferMem
call vkAllocateMemory
test eax,eax
jnz lbl_createModelBuffers_VkError
cmp gpDeviceVertexBufferMem,0
je lbl_createModelBuffers_VkError
LOG_TEXT szOK

;3.7. Bind memory
LOG_TEXT szVkBindBufferMemory
mov rcx,ghVkLogicalDevice
mov rdx,gpDeviceVertexBuffer
mov r8,gpDeviceVertexBufferMem
xor r9,r9
call vkBindBufferMemory
test rax,rax
jnz lbl_createModelBuffers_VkError
LOG_TEXT szOK

;4. Staging INDEX BUFFER

LOG_TEXT szLogStagingIndexBuffer

;4.1. Fill the rest of VkBufferCreateInfo structure
mov rsi,gnIndexSize
mov stagingIndexBufferInfo_size,rsi

;4.2. Create the Staging Index Buffer
LOG_TEXT szVkCreateBuffer
mov rcx,ghVkLogicalDevice
lea rdx,stagingIndexBufferInfo_sType
xor r8,r8
lea r9,gpStagingIndexBuffer
call vkCreateBuffer
test rax,rax
jnz lbl_createModelBuffers_VkError
cmp gpStagingIndexBuffer,0
je lbl_createModelBuffers_VkError
LOG_TEXT szOK

;4.3. Get memory requirements
LOG_TEXT szVkGetBufferMemoryRequirements
mov rcx,ghVkLogicalDevice
mov rdx,gpStagingIndexBuffer
lea r8,stagingIndexMemReqs_size
call vkGetBufferMemoryRequirements
cmp stagingIndexMemReqs_size,0
je lbl_createModelBuffers_VkError
cmp stagingIndexMemReqs_alignment,0
je lbl_createModelBuffers_VkError
LOG_TEXT szOK

;4.4. Find host visible memory type
;WHY FINDING IT AGAIN?
;WHY NOT STORING THE FOUND INDEX IN A GLOBAL VARIABLE?
mov ecx,stagingIndexMemReqs_memoryTypeBits
call FindHostVisibleMemoryType
cmp eax,-1
je lbl_createModelBuffers_VkError

;Verify index < memoryTypeCount
mov ecx,memProps_memoryTypeCount
cmp eax,ecx
jae lbl_createModelBuffers_VkError ;index out of bounds

;Received from FindHostVisibleMemoryType
mov stagingIndexAllocInfo_memoryTypeIndex,eax

;4.5. Fill the rest of VkMemoryAllocateInfo structure
mov rsi,stagingIndexMemReqs_size
mov stagingIndexAllocInfo_allocationSize,rsi

;4.6. Allocate memory
LOG_TEXT szVkAllocateMemory
mov rcx,ghVkLogicalDevice
lea rdx,stagingIndexAllocInfo_sType
xor r8,r8
lea r9,gpStagingIndexMem
call vkAllocateMemory
test eax,eax
jnz lbl_createModelBuffers_VkError
cmp gpStagingIndexMem,0
je lbl_createModelBuffers_VkError
LOG_TEXT szOK

;4.7. Bind memory
LOG_TEXT szVkBindBufferMemory
mov rcx,ghVkLogicalDevice
mov rdx,gpStagingIndexBuffer
mov r8,gpStagingIndexMem
xor r9,r9
call vkBindBufferMemory
test rax,rax
jnz lbl_createModelBuffers_VkError
LOG_TEXT szOK

;4.8. Map and copy index data
LOG_TEXT szVkMapMemory
mov rcx,ghVkLogicalDevice
mov rdx,gpStagingIndexMem
xor r8,r8
mov r9,0FFFFFFFFh
mov qword ptr[rsp+20h],0
lea rax,gpIndexMap
mov qword ptr[rsp+28h],rax
call vkMapMemory
test eax,eax
jnz lbl_createModelBuffers_VkError
LOG_TEXT szOK

;4.9. Move
mov rsi,gpObjIndices ;What is it?!
mov rdi,gpIndexMap
mov rcx,gnIndexSize
rep movsb

;4.10. Unmap
mov rcx,ghVkLogicalDevice
mov rdx,gpStagingIndexMem
call vkUnmapMemory

;5. Device local index buffer

LOG_TEXT szLogDeviceIndexBuffer

;5.1. Fill the rest of VkBufferCreateInfo structure
mov rsi,gnIndexSize
mov deviceIndexBufferInfo_size,rsi

;5.2. Create the Device Local Index Buffer
LOG_TEXT szVkCreateBuffer
mov rcx,ghVkLogicalDevice
lea rdx,deviceIndexBufferInfo_sType
xor r8,r8
lea r9,gpDeviceIndexBuffer
call vkCreateBuffer
test rax,rax
jnz lbl_createModelBuffers_VkError
cmp gpDeviceIndexBuffer,0
je lbl_createModelBuffers_VkError
LOG_TEXT szOK

;5.3. Get memory requirements
LOG_TEXT szVkGetBufferMemoryRequirements
mov rcx,ghVkLogicalDevice
mov rdx,gpDeviceIndexBuffer
lea r8,deviceIndexMemReqs_size
call vkGetBufferMemoryRequirements
cmp deviceIndexMemReqs_size,0
je lbl_createModelBuffers_VkError
cmp deviceIndexMemReqs_alignment,0
je lbl_createModelBuffers_VkError
LOG_TEXT szOK

;5.4. Find device local memory type
;WHY FINDING IT AGAIN?
;WHY NOT STORING THE FOUND INDEX IN A GLOBAL VARIABLE?
mov ecx,deviceIndexMemReqs_memoryTypeBits
call FindDeviceLocalMemoryType
cmp eax,-1
je lbl_createModelBuffers_VkError

;Verify index < memoryTypeCount
mov ecx,memProps_memoryTypeCount
cmp eax,ecx
jae lbl_createModelBuffers_VkError ;index out of bounds

;Received from FindDeviceLocalMemoryType
mov deviceIndexAllocInfo_memoryTypeIndex,eax 

;5.5. Fill the rest of VkMemoryAllocateInfo structure
mov rsi,deviceIndexMemReqs_size
mov deviceIndexAllocInfo_allocationSize,rsi

;5.6. Allocate memory
LOG_TEXT szVkAllocateMemory
mov rcx,ghVkLogicalDevice
lea rdx,deviceIndexAllocInfo_sType
xor r8,r8
lea r9,gpDeviceIndexBufferMem
call vkAllocateMemory
test rax,rax
jnz lbl_createModelBuffers_VkError
cmp gpDeviceIndexBufferMem,0
je lbl_createModelBuffers_VkError
LOG_TEXT szOK

;5.7. Bind memory
LOG_TEXT szVkBindBufferMemory
mov rcx,ghVkLogicalDevice
mov rdx,gpDeviceIndexBuffer
mov r8,gpDeviceIndexBufferMem
xor r9,r9
call vkBindBufferMemory
test rax,rax
jnz lbl_createModelBuffers_VkError
LOG_TEXT szOK

;6. TRANSFER: STAGING -> DEVICE

LOG_TEXT szLogAllocatingTransferCmdBuf

;1. Allocate memory for the array of Command Buffer handles
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_createModelBuffers_WinError

mov rcx,rax
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,1 ;One buffer
shl r8,3 ;*8 bytes per handle
call HeapAlloc
test rax,rax
jz lbl_createModelBuffers_WinError
mov gpModelCmdBuffers,rax
LOG_TEXT szOK

;6.2. Fill the rest of VkCommandBufferAllocateInfo structure
mov rax,ghVkCommandPool
mov modelCmdAllocInfo_commandPool,rax

;6.3. Allocate Command Buffers
LOG_TEXT szVkAllocateCommandBuffers
mov rcx,ghVkLogicalDevice
lea rdx,modelCmdAllocInfo_sType
mov r8,gpModelCmdBuffers
call vkAllocateCommandBuffers
test rax,rax
jnz lbl_createModelBuffers_VkError
LOG_TEXT szOK

;6.6. Begin command buffer
LOG_TEXT szVkBeginCommandBuffer
mov rsi,gpModelCmdBuffers
mov rcx,qword ptr[rsi]
lea rdx,modelCmdBufferBeginInfo_sType
call vkBeginCommandBuffer
test rax,rax
jnz lbl_createModelBuffers_VkError
LOG_TEXT szOK

;6.7. Copy vertex buffer
mov rax,gnVertexSize
mov vertexCopyBuffer_size,rax

LOG_TEXT szVkCmdCopyBuffer
mov rsi,gpModelCmdBuffers
mov rcx,qword ptr[rsi]
mov rdx,gpStagingVertexBuffer
mov r8,gpDeviceVertexBuffer
mov r9,1
lea rax,vertexCopyBuffer_srcOffset
mov qword ptr [rsp+20h],rax
call vkCmdCopyBuffer
LOG_TEXT szOK

;6.8. Copy index buffer
mov rax,gnIndexSize
mov indexCopyBuffer_size,rax

LOG_TEXT szVkCmdCopyBuffer
mov rsi,gpModelCmdBuffers
mov rcx,qword ptr[rsi]
mov rdx,gpStagingIndexBuffer
mov r8,gpDeviceIndexBuffer
mov r9,1
lea rax,indexCopyBuffer_srcOffset
mov qword ptr [rsp+20h],rax
call vkCmdCopyBuffer
LOG_TEXT szOK


;6.9. End command buffer
LOG_TEXT szVkEndCommandBuffer
mov rsi,gpModelCmdBuffers
mov rcx,qword ptr[rsi]
call vkEndCommandBuffer
test rax,rax
jnz lbl_createModelBuffers_VkError
LOG_TEXT szOK

;7. SUBMIT AND WAIT

;7.1. Create Fence
LOG_TEXT szVkCreateFence
mov rcx,ghVkLogicalDevice
lea rdx,modelFenceInfo_sType
xor r8,r8
lea r9,gpModelFence
call vkCreateFence
test rax,rax
jnz lbl_createModelBuffers_VkError
cmp gpModelFence,0
je lbl_createModelBuffers_VkError
LOG_TEXT szOK

;7.2. Submit to graphics queue
;Fill the rest of VkSubmitInfo
mov rax,gpModelCmdBuffers
mov modelSubmitInfo_pCommandBuffers,rax

LOG_TEXT szVkQueueSubmit
mov rcx,ghVkGraphicsQueue
mov rdx,1
lea r8,modelSubmitInfo_sType
mov r9,gpModelFence
call vkQueueSubmit
test rax,rax
jnz lbl_createModelBuffers_VkError
LOG_TEXT szOK

;7.3. Wait for Fence
mov rcx,ghVkLogicalDevice
mov rdx,1 ;fenceCount = 1
lea r8,gpModelFence ;pFences = &gpModelFence
mov r9,1 ;waitAll = VK_TRUE
mov qword ptr[rsp+20h],-1 ;timeout = infinite
call vkWaitForFences
test eax,eax
jnz lbl_createModelBuffers_VkError

;8. CLEANUP

;Destroy Fence
mov rcx,ghVkLogicalDevice
mov rdx,gpModelFence
xor r8,r8
call vkDestroyFence

;Free temporary command buffer
mov rcx,ghVkLogicalDevice
mov rdx,ghVkCommandPool
mov r8,1
mov r9,gpModelCmdBuffers
call vkFreeCommandBuffers

;Destroy Staging Vertex Buffer
mov rcx,ghVkLogicalDevice
mov rdx,gpStagingVertexBuffer
xor r8,r8
call vkDestroyBuffer

;Free Staging Vertex Memory
mov rcx,ghVkLogicalDevice
mov rdx,gpStagingVertexMem
xor r8,r8
call vkFreeMemory

;Destroy Staging Index Buffer
mov rcx,ghVkLogicalDevice
mov rdx,gpStagingIndexBuffer
xor r8,r8
call vkDestroyBuffer

;Free Staging Index Memory
mov rcx,ghVkLogicalDevice
mov rdx,gpStagingIndexMem
xor r8,r8
call vkFreeMemory

LOG_TEXT szLogModelBuffersOK
jmp lbl_createModelBuffers_End

lbl_createModelBuffers_WinError:
call SpellWinError
jmp lbl_createModelBuffers_End

lbl_createModelBuffers_VkError:
call SpellVkError

lbl_createModelBuffers_End:
EPILOG
createModelBuffers endp



;--------------------
; destroyModelBuffers
;Free Vertex/Index buffers and memory
;------------------------------------

destroyModelBuffers proc
PROLOG 100h

LOG_TEXT szLogDestroyModelBuffers

;Destroy vertex buffer
cmp gpDeviceVertexBuffer,0
je @f
mov rcx,ghVkLogicalDevice
mov rdx,gpDeviceVertexBuffer
xor r8,r8
call vkDestroyBuffer
mov gpDeviceVertexBuffer,0

@@:
;Free vertex buffer memory
cmp gpDeviceVertexBufferMem,0
je @f
mov rcx,ghVkLogicalDevice
mov rdx,gpDeviceVertexBufferMem
xor r8,r8
call vkFreeMemory
mov gpDeviceVertexBufferMem,0

@@:
;Destroy index buffer
cmp gpDeviceIndexBuffer,0
je @f
mov rcx,ghVkLogicalDevice
mov rdx,gpDeviceIndexBuffer
xor r8,r8
call vkDestroyBuffer
mov gpDeviceIndexBuffer,0

@@:
;Free index buffer memory
cmp gpDeviceIndexBufferMem,0
je @f
mov rcx,ghVkLogicalDevice
mov rdx,gpDeviceIndexBufferMem
xor r8,r8
call vkFreeMemory
mov gpDeviceIndexBufferMem,0

LOG_TEXT szOK

@@:
EPILOG
destroyModelBuffers endp
