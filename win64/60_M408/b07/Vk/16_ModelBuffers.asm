;-----------------------------------------------------------------------------
; createModelBuffers - Create Vulkan vertex and index buffers from OBJ data
;-----------------------------------------------------------------------------
createModelBuffers proc
LOCAL bufferInfo:QWORD, memReq:QWORD, allocInfo:QWORD
LOCAL stagingVertexBuffer:QWORD, stagingVertexMem:QWORD
LOCAL stagingIndexBuffer:QWORD, stagingIndexMem:QWORD
LOCAL tempCmdBuf:QWORD, fence:QWORD
LOCAL vertexSize:QWORD, indexSize:QWORD
PROLOG 100h

    ; Skip if no data
    cmp dwCombinedCount, 0
    je lbl_createModelBuffers_End
    cmp dwIndexCount, 0
    je lbl_createModelBuffers_End

    ; ---- 1. Calculate sizes ----
    xor rax, rax
    mov eax, dwCombinedCount
    imul rax, 24                     ; vertex = pos(12) + normal(12) = 24 bytes
    mov vertexSize, rax

    xor rcx, rcx
    mov ecx, dwIndexCount
    shl rcx, 2                       ; indices are 32-bit, *4 bytes
    mov indexSize, rcx

    LOG_TEXT szLogCreatingVertexBuffer

    ; ============================================
    ; 2. STAGING VERTEX BUFFER (HOST VISIBLE)
    ; ============================================
    ; VkBufferCreateInfo
    mov bufferInfo, VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO
    mov qword ptr [bufferInfo+8], 0   ; pNext
    mov dword ptr [bufferInfo+16], 0  ; flags
    mov rax, vertexSize
    mov qword ptr [bufferInfo+24], rax ; size
    mov dword ptr [bufferInfo+32], VK_BUFFER_USAGE_TRANSFER_SRC_BIT
    mov dword ptr [bufferInfo+36], VK_SHARING_MODE_EXCLUSIVE
    mov dword ptr [bufferInfo+40], 0  ; queueFamilyIndexCount
    mov qword ptr [bufferInfo+48], 0  ; pQueueFamilyIndices

    mov rcx, ghVkLogicalDevice
    lea rdx, bufferInfo
    xor r8, r8                       ; pAllocator
    lea r9, stagingVertexBuffer
    call vkCreateBuffer
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; Get memory requirements
    mov rcx, ghVkLogicalDevice
    mov rdx, stagingVertexBuffer
    lea r8, memReq
    call vkGetBufferMemoryRequirements

    ; Find memory type: HOST_VISIBLE | HOST_COHERENT
    mov eax, memReq.memoryTypeBits
    call FindHostVisibleMemoryType
    cmp eax, -1
    je lbl_createModelBuffers_VkError

    ; VkMemoryAllocateInfo
    mov allocInfo, VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO
    mov qword ptr [allocInfo+8], 0
    mov rax, memReq.size
    mov qword ptr [allocInfo+16], rax
    mov dword ptr [allocInfo+24], eax

    mov rcx, ghVkLogicalDevice
    lea rdx, allocInfo
    xor r8, r8
    lea r9, stagingVertexMem
    call vkAllocateMemory
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; Bind memory
    mov rcx, ghVkLogicalDevice
    mov rdx, stagingVertexBuffer
    mov r8, stagingVertexMem
    xor r9, r9
    call vkBindBufferMemory
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; Map and copy vertex data
    mov rcx, ghVkLogicalDevice
    mov rdx, stagingVertexMem
    xor r8, r8
    mov r9, 0FFFFFFFFh
    lea rax, [rsp+40h]               ; pData (local)
    call vkMapMemory
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    mov rsi, gpCombinedVertices
    mov rdi, [rsp+40h]
    mov rcx, vertexSize
    rep movsb

    ; Unmap
    mov rcx, ghVkLogicalDevice
    mov rdx, stagingVertexMem
    call vkUnmapMemory

    ; ============================================
    ; 3. DEVICE LOCAL VERTEX BUFFER
    ; ============================================
    ; VkBufferCreateInfo for device local
    mov rax, vertexSize
    mov qword ptr [bufferInfo+24], rax
    mov dword ptr [bufferInfo+32], VK_BUFFER_USAGE_VERTEX_BUFFER_BIT or VK_BUFFER_USAGE_TRANSFER_DST_BIT

    mov rcx, ghVkLogicalDevice
    lea rdx, bufferInfo
    xor r8, r8
    lea r9, ghVkVertexBuffer
    call vkCreateBuffer
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; Get memory requirements
    mov rcx, ghVkLogicalDevice
    mov rdx, ghVkVertexBuffer
    lea r8, memReq
    call vkGetBufferMemoryRequirements

    ; Find memory type: DEVICE_LOCAL
    mov eax, memReq.memoryTypeBits
    call FindDeviceLocalMemoryType
    cmp eax, -1
    je lbl_createModelBuffers_VkError

    ; Allocate device memory
    mov allocInfo, VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO
    mov qword ptr [allocInfo+8], 0
    mov rax, memReq.size
    mov qword ptr [allocInfo+16], rax
    mov dword ptr [allocInfo+24], eax

    mov rcx, ghVkLogicalDevice
    lea rdx, allocInfo
    xor r8, r8
    lea r9, ghVkVertexBufferMem
    call vkAllocateMemory
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; Bind memory
    mov rcx, ghVkLogicalDevice
    mov rdx, ghVkVertexBuffer
    mov r8, ghVkVertexBufferMem
    xor r9, r9
    call vkBindBufferMemory
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; ============================================
    ; 4. REPEAT FOR INDEX BUFFER (staging + device)
    ; ============================================
    LOG_TEXT szLogCreatingIndexBuffer

    ; --- Staging index buffer ---
    mov bufferInfo, VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO
    mov qword ptr [bufferInfo+8], 0
    mov dword ptr [bufferInfo+16], 0
    mov rax, indexSize
    mov qword ptr [bufferInfo+24], rax
    mov dword ptr [bufferInfo+32], VK_BUFFER_USAGE_TRANSFER_SRC_BIT
    mov dword ptr [bufferInfo+36], VK_SHARING_MODE_EXCLUSIVE
    mov dword ptr [bufferInfo+40], 0
    mov qword ptr [bufferInfo+48], 0

    mov rcx, ghVkLogicalDevice
    lea rdx, bufferInfo
    xor r8, r8
    lea r9, stagingIndexBuffer
    call vkCreateBuffer
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; Get memory requirements
    mov rcx, ghVkLogicalDevice
    mov rdx, stagingIndexBuffer
    lea r8, memReq
    call vkGetBufferMemoryRequirements

    ; Find host visible memory type
    mov eax, memReq.memoryTypeBits
    call FindHostVisibleMemoryType
    cmp eax, -1
    je lbl_createModelBuffers_VkError

    ; Allocate memory
    mov allocInfo, VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO
    mov qword ptr [allocInfo+8], 0
    mov rax, memReq.size
    mov qword ptr [allocInfo+16], rax
    mov dword ptr [allocInfo+24], eax

    mov rcx, ghVkLogicalDevice
    lea rdx, allocInfo
    xor r8, r8
    lea r9, stagingIndexMem
    call vkAllocateMemory
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; Bind memory
    mov rcx, ghVkLogicalDevice
    mov rdx, stagingIndexBuffer
    mov r8, stagingIndexMem
    xor r9, r9
    call vkBindBufferMemory
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; Map and copy index data
    mov rcx, ghVkLogicalDevice
    mov rdx, stagingIndexMem
    xor r8, r8
    mov r9, 0FFFFFFFFh
    lea rax, [rsp+48h]
    call vkMapMemory
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    mov rsi, gpIndices
    mov rdi, [rsp+48h]
    mov rcx, indexSize
    rep movsb

    ; Unmap
    mov rcx, ghVkLogicalDevice
    mov rdx, stagingIndexMem
    call vkUnmapMemory

    ; --- Device local index buffer ---
    mov rax, indexSize
    mov qword ptr [bufferInfo+24], rax
    mov dword ptr [bufferInfo+32], VK_BUFFER_USAGE_INDEX_BUFFER_BIT or VK_BUFFER_USAGE_TRANSFER_DST_BIT

    mov rcx, ghVkLogicalDevice
    lea rdx, bufferInfo
    xor r8, r8
    lea r9, ghVkIndexBuffer
    call vkCreateBuffer
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; Get memory requirements
    mov rcx, ghVkLogicalDevice
    mov rdx, ghVkIndexBuffer
    lea r8, memReq
    call vkGetBufferMemoryRequirements

    ; Find device local memory type
    mov eax, memReq.memoryTypeBits
    call FindDeviceLocalMemoryType
    cmp eax, -1
    je lbl_createModelBuffers_VkError

    ; Allocate memory
    mov allocInfo, VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO
    mov qword ptr [allocInfo+8], 0
    mov rax, memReq.size
    mov qword ptr [allocInfo+16], rax
    mov dword ptr [allocInfo+24], eax

    mov rcx, ghVkLogicalDevice
    lea rdx, allocInfo
    xor r8, r8
    lea r9, ghVkIndexBufferMem
    call vkAllocateMemory
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; Bind memory
    mov rcx, ghVkLogicalDevice
    mov rdx, ghVkIndexBuffer
    mov r8, ghVkIndexBufferMem
    xor r9, r9
    call vkBindBufferMemory
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; ============================================
    ; 5. TRANSFER: STAGING -> DEVICE
    ; ============================================
    LOG_TEXT szLogAllocatingTransferCmdBuf

    ; Allocate temporary command buffer from existing pool
    sub rsp, 32
    mov dword ptr [rsp], VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO
    mov qword ptr [rsp+8], 0
    mov qword ptr [rsp+16], ghVkCommandPool
    mov dword ptr [rsp+24], VK_COMMAND_BUFFER_LEVEL_PRIMARY
    mov dword ptr [rsp+28], 1
    mov rcx, ghVkLogicalDevice
    lea rdx, [rsp]
    lea r9, tempCmdBuf
    call vkAllocateCommandBuffers
    add rsp, 32
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; Begin command buffer
    sub rsp, 32
    mov dword ptr [rsp], VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO
    mov qword ptr [rsp+8], 0
    mov dword ptr [rsp+16], VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT
    mov qword ptr [rsp+24], 0
    mov rcx, tempCmdBuf
    lea rdx, [rsp]
    call vkBeginCommandBuffer
    add rsp, 32
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; Copy vertex buffer
    sub rsp, 24
    mov qword ptr [rsp], 0           ; srcOffset
    mov qword ptr [rsp+8], 0         ; dstOffset
    mov rax, vertexSize
    mov qword ptr [rsp+16], rax      ; size
    mov rcx, tempCmdBuf
    mov rdx, stagingVertexBuffer
    mov r8, ghVkVertexBuffer
    mov r9, 1
    lea rax, [rsp]
    mov qword ptr [rsp+20h], rax
    call vkCmdCopyBuffer
    add rsp, 24

    ; Copy index buffer
    sub rsp, 24
    mov qword ptr [rsp], 0
    mov qword ptr [rsp+8], 0
    mov rax, indexSize
    mov qword ptr [rsp+16], rax
    mov rcx, tempCmdBuf
    mov rdx, stagingIndexBuffer
    mov r8, ghVkIndexBuffer
    mov r9, 1
    lea rax, [rsp]
    mov qword ptr [rsp+20h], rax
    call vkCmdCopyBuffer
    add rsp, 24

    ; End command buffer
    mov rcx, tempCmdBuf
    call vkEndCommandBuffer
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; ============================================
    ; 6. SUBMIT AND WAIT
    ; ============================================
    ; Create fence
    sub rsp, 16
    mov dword ptr [rsp], VK_STRUCTURE_TYPE_FENCE_CREATE_INFO
    mov qword ptr [rsp+8], 0
    mov dword ptr [rsp+16], 0
    mov rcx, ghVkLogicalDevice
    lea rdx, [rsp]
    xor r8, r8
    lea r9, fence
    call vkCreateFence
    add rsp, 16
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; VkSubmitInfo
    sub rsp, 56
    mov dword ptr [rsp], VK_STRUCTURE_TYPE_SUBMIT_INFO
    mov qword ptr [rsp+8], 0
    mov dword ptr [rsp+16], 0       ; waitSemaphoreCount
    mov qword ptr [rsp+24], 0
    mov qword ptr [rsp+32], 0
    mov dword ptr [rsp+40], 1       ; commandBufferCount
    lea rax, tempCmdBuf
    mov qword ptr [rsp+48], rax
    mov dword ptr [rsp+56], 0
    mov qword ptr [rsp+64], 0
    mov rcx, ghVkGraphicsQueue
    mov rdx, 1
    lea r8, [rsp]
    mov r9, fence
    call vkQueueSubmit
    add rsp, 56
    test eax, eax
    jnz lbl_createModelBuffers_VkError

    ; Wait for fence
    mov rcx, ghVkLogicalDevice
    mov rdx, 1
    lea r8, fence
    mov r9, 0FFFFFFFFh
    call vkWaitForFences

    ; ============================================
    ; 7. CLEANUP
    ; ============================================
    ; Destroy fence
    mov rcx, ghVkLogicalDevice
    mov rdx, fence
    xor r8, r8
    call vkDestroyFence

    ; Free temporary command buffer
    mov rcx, ghVkLogicalDevice
    mov rdx, ghVkCommandPool
    mov r8, 1
    lea r9, tempCmdBuf
    call vkFreeCommandBuffers

    ; Destroy staging buffers and free memory
    mov rcx, ghVkLogicalDevice
    mov rdx, stagingVertexBuffer
    xor r8, r8
    call vkDestroyBuffer

    mov rcx, ghVkLogicalDevice
    mov rdx, stagingVertexMem
    xor r8, r8
    call vkFreeMemory

    mov rcx, ghVkLogicalDevice
    mov rdx, stagingIndexBuffer
    xor r8, r8
    call vkDestroyBuffer

    mov rcx, ghVkLogicalDevice
    mov rdx, stagingIndexMem
    xor r8, r8
    call vkFreeMemory

    LOG_TEXT szLogModelBuffersOK
    jmp lbl_createModelBuffers_End

lbl_createModelBuffers_VkError:
    call SpellVkError

lbl_createModelBuffers_End:
    EPILOG
    ret
createModelBuffers endp

;-----------------------------------------------------------------------------
; destroyModelBuffers - Free Vulkan vertex/index buffers and memory
;-----------------------------------------------------------------------------
destroyModelBuffers proc
PROLOG 100h
    ; Destroy vertex buffer
    cmp ghVkVertexBuffer, 0
    je @f
    mov rcx, ghVkLogicalDevice
    mov rdx, ghVkVertexBuffer
    xor r8, r8
    call vkDestroyBuffer
    mov ghVkVertexBuffer, 0
@@:
    ; Free vertex buffer memory
    cmp ghVkVertexBufferMem, 0
    je @f
    mov rcx, ghVkLogicalDevice
    mov rdx, ghVkVertexBufferMem
    xor r8, r8
    call vkFreeMemory
    mov ghVkVertexBufferMem, 0
@@:
    ; Destroy index buffer
    cmp ghVkIndexBuffer, 0
    je @f
    mov rcx, ghVkLogicalDevice
    mov rdx, ghVkIndexBuffer
    xor r8, r8
    call vkDestroyBuffer
    mov ghVkIndexBuffer, 0
@@:
    ; Free index buffer memory
    cmp ghVkIndexBufferMem, 0
    je @f
    mov rcx, ghVkLogicalDevice
    mov rdx, ghVkIndexBufferMem
    xor r8, r8
    call vkFreeMemory
    mov ghVkIndexBufferMem, 0
@@:
    EPILOG
    ret
destroyModelBuffers endp

;-----------------------------------------------------------------------------
; FindHostVisibleMemoryType - Find memory type with HOST_VISIBLE | HOST_COHERENT
; Input:  EAX = memoryTypeBits (from VkMemoryRequirements)
; Output: EAX = memory type index, or -1 on failure
;-----------------------------------------------------------------------------
FindHostVisibleMemoryType proc
    LOCAL memProps:QWORD
    PROLOG 100h
    sub rsp, 200h                     ; space for VkPhysicalDeviceMemoryProperties
    mov rcx, ghVkPhysicalDevice
    lea rdx, [rsp]
    call vkGetPhysicalDeviceMemoryProperties

    mov ebx, eax                      ; memoryTypeBits
    mov ecx, 0                        ; index
lbl_Loop:
    ; Check if this type is allowed
    mov eax, 1
    shl eax, cl
    test eax, ebx
    jz lbl_Next

    ; Check property flags: HOST_VISIBLE | HOST_COHERENT
    ; memoryTypes array is at offset 4? Actually after memoryTypeCount (4 bytes), there is memoryTypes[VK_MAX_MEMORY_TYPES] (32 * 4 bytes? but each is VkMemoryType (flags, heapIndex) = 8 bytes). We'll just compute offset.
    ; memoryTypes start at offset 4.
    lea rdx, [rsp + 4 + rcx*8]        ; rdx points to VkMemoryType for this index
    mov eax, dword ptr [rdx]          ; propertyFlags
    and eax, VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT or VK_MEMORY_PROPERTY_HOST_COHERENT_BIT
    cmp eax, VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT or VK_MEMORY_PROPERTY_HOST_COHERENT_BIT
    je lbl_Found
lbl_Next:
    inc ecx
    cmp ecx, [rsp]                    ; memoryTypeCount
    jl lbl_Loop
    ; Not found
    mov eax, -1
    jmp lbl_Done
lbl_Found:
    mov eax, ecx
lbl_Done:
    add rsp, 200h
    EPILOG
    ret
FindHostVisibleMemoryType endp

;-----------------------------------------------------------------------------
; FindDeviceLocalMemoryType - Find memory type with DEVICE_LOCAL_BIT
; Input:  EAX = memoryTypeBits (from VkMemoryRequirements)
; Output: EAX = memory type index, or -1 on failure
;-----------------------------------------------------------------------------
FindDeviceLocalMemoryType proc
    LOCAL memProps:QWORD
    PROLOG 100h
    sub rsp, 200h
    mov rcx, ghVkPhysicalDevice
    lea rdx, [rsp]
    call vkGetPhysicalDeviceMemoryProperties

    mov ebx, eax
    mov ecx, 0
lbl_Loop:
    mov eax, 1
    shl eax, cl
    test eax, ebx
    jz lbl_Next
    lea rdx, [rsp + 4 + rcx*8]
    mov eax, dword ptr [rdx]
    and eax, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT
    jnz lbl_Found
lbl_Next:
    inc ecx
    cmp ecx, [rsp]
    jl lbl_Loop
    mov eax, -1
    jmp lbl_Done
lbl_Found:
    mov eax, ecx
lbl_Done:
    add rsp, 200h
    EPILOG
    ret
FindDeviceLocalMemoryType endp
