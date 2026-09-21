;-----------------------------------------------------------------
; createVBO - Create Vertex Buffer Object with full materials
; Input: gpObjCombined (vertices), gpObjIndices (indices)
;        gpDataMaterials (material properties)
;        gnMtlGroupCount (number of material groups)
; Output: gpDeviceVertexBuffer, gpDeviceIndexBuffer
;         gpMaterialUBO (material uniform buffer)
;-----------------------------------------------------------------
createVBO proc
PROLOG 100h

;1. Calculate buffer sizes
xor rax, rax
mov eax, gnCurrentCombinedCount
imul rax, VERTEX_STRIDE
mov gnVertexSize, rax

xor rcx, rcx
mov ecx, gnCurrentIndexCount
shl rcx, 2                  ; *4 bytes for UINT32
mov gnIndexSize, rcx

;2. Create staging vertex buffer
call createStagingVertexBuffer
cmp rax, 1
jne lbl_Error

;3. Create device vertex buffer
call createDeviceVertexBuffer
cmp rax, 1
jne lbl_Error

;4. Create staging index buffer
call createStagingIndexBuffer
cmp rax, 1
jne lbl_Error

;5. Create device index buffer
call createDeviceIndexBuffer
cmp rax, 1
jne lbl_Error

;6. Transfer data
call transferBufferData
cmp rax, 1
jne lbl_Error


lbl_Success:
LOG_TEXT szLogModelBuffersOK
mov rax, 1
jmp lbl_End

lbl_Error:
xor rax, rax

lbl_End:
EPILOG
createVBO endp


;-----------------------------------------------------------------
; destroyVBO - Clean up VBO resources
;-----------------------------------------------------------------
destroyVBO proc
PROLOG 100h

; Destroy staging buffers
call destroyStagingBuffers

; Destroy device vertex buffer
cmp gpDeviceVertexBuffer, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, gpDeviceVertexBuffer
xor r8, r8
call vkDestroyBuffer
mov gpDeviceVertexBuffer, 0
@@:

; Free device vertex memory
cmp gpDeviceVertexBufferMem, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, gpDeviceVertexBufferMem
xor r8, r8
call vkFreeMemory
mov gpDeviceVertexBufferMem, 0
@@:

; Destroy device index buffer
cmp gpDeviceIndexBuffer, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, gpDeviceIndexBuffer
xor r8, r8
call vkDestroyBuffer
mov gpDeviceIndexBuffer, 0
@@:

; Free device index memory
cmp gpDeviceIndexBufferMem, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, gpDeviceIndexBufferMem
xor r8, r8
call vkFreeMemory
mov gpDeviceIndexBufferMem, 0
@@:

; Destroy material UBO
cmp gpMaterialUBO, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, gpMaterialUBO
xor r8, r8
call vkDestroyBuffer
mov gpMaterialUBO, 0
@@:

; Free material UBO memory
cmp gpMaterialUBOMem, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, gpMaterialUBOMem
xor r8, r8
call vkFreeMemory
mov gpMaterialUBOMem, 0

; Unmap material UBO if mapped
cmp gpMaterialUBOMap, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, gpMaterialUBOMem
call vkUnmapMemory
mov gpMaterialUBOMap, 0
@@:

; Destroy descriptor pool
cmp ghVkDescriptorPool, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, ghVkDescriptorPool
xor r8, r8
call vkDestroyDescriptorPool
mov ghVkDescriptorPool, 0
@@:

; Destroy descriptor set layout
cmp ghVkDescriptorSetLayout, 0
je @f
mov rcx, ghVkLogicalDevice
mov rdx, ghVkDescriptorSetLayout
xor r8, r8
call vkDestroyDescriptorSetLayout
mov ghVkDescriptorSetLayout, 0
@@:

; Free CPU combined data if still allocated
cmp gpObjCombined, 0
je @f
call GetProcessHeap
test rax, rax
jz @f
mov rcx, rax
xor rdx, rdx
mov r8, gpObjCombined
call HeapFree
mov gpObjCombined, 0

@@:
cmp gpObjIndices, 0
je @f
call GetProcessHeap
test rax, rax
jz @f
mov rcx, rax
xor rdx, rdx
mov r8, gpObjIndices
call HeapFree
mov gpObjIndices, 0
@@:

LOG_TEXT szLogModelBuffersOK

lbl_End:
EPILOG
destroyVBO endp


