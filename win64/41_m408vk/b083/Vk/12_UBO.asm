createUBO proc
PROLOG 100h

;1. Size = gnCount_newmtl * SIZE_NEWMTL_METADATA
mov eax,gnCount_newmtl
shl rax,7 ;* 128 (repacked std140 layout)
test rax,rax
jz lbl_Error
mov gnMaterialUBOSize,rax
mov materialUBOBufferInfo_size,rax

;2. Create buffer
mov rcx,ghVkLogicalDevice
lea rdx,materialUBOBufferInfo_sType
xor r8,r8
lea r9,gpMaterialUBO
call vkCreateBuffer
test eax,eax
jnz lbl_VkError

;3. Memory requirements
mov rcx,ghVkLogicalDevice
mov rdx,gpMaterialUBO
lea r8,materialUBOMemReqs_size
call vkGetBufferMemoryRequirements

;4. Host-visible memory
mov ecx,materialUBOMemReqs_memoryTypeBits
call FindHostVisibleMemoryType
cmp eax,-1
je lbl_Error
mov materialUBOAllocInfo_memoryTypeIndex,eax
mov rax,materialUBOMemReqs_size
mov materialUBOAllocInfo_allocationSize,rax

;5. Allocate + bind
mov rcx,ghVkLogicalDevice
lea rdx,materialUBOAllocInfo_sType
xor r8,r8
lea r9,gpMaterialUBOMem
call vkAllocateMemory
test eax,eax
jnz lbl_VkError

mov rcx,ghVkLogicalDevice
mov rdx,gpMaterialUBO
mov r8,gpMaterialUBOMem
xor r9,r9
call vkBindBufferMemory
test eax,eax
jnz lbl_VkError

;6. Map and copy gpBuffer_newmtl
mov rcx,ghVkLogicalDevice
mov rdx,gpMaterialUBOMem
xor r8,r8
mov r9,0FFFFFFFFh
mov qword ptr [rsp+20h],0
lea rax,gpMaterialUBOMap
mov qword ptr [rsp+28h],rax
call vkMapMemory
test eax,eax
jnz lbl_VkError

call repackMaterials

;7. Descriptor set layout
mov rcx,ghVkLogicalDevice
lea rdx,descSetLayoutInfo_sType
xor r8,r8
lea r9,ghVkDescriptorSetLayout
call vkCreateDescriptorSetLayout
test eax,eax
jnz lbl_VkError

;8. Descriptor pool
mov rcx,ghVkLogicalDevice
lea rdx,descPoolInfo_sType
xor r8,r8
lea r9,ghVkDescriptorPool
call vkCreateDescriptorPool
test eax,eax
jnz lbl_VkError

;9. Allocate descriptor set
mov rax,ghVkDescriptorPool
mov descSetAllocInfo_descriptorPool,rax
lea rax,ghVkDescriptorSetLayout
mov descSetAllocInfo_pSetLayouts,rax
mov rcx,ghVkLogicalDevice
lea rdx,descSetAllocInfo_sType
lea r8,ghVkDescriptorSet
call vkAllocateDescriptorSets
test eax,eax
jnz lbl_VkError

;10. Write descriptor (point it at the UBO)
mov rax,ghVkDescriptorSet
mov writeDescSet_dstSet,rax
mov rax,gpMaterialUBO
mov descBufferInfo_buffer,rax
mov descBufferInfo_offset,0
;mov rax,128 ;gnMaterialUBOSize = 128 ;repacked std140 layout
;mov descBufferInfo_range,rax
mov rcx,ghVkLogicalDevice
mov rdx,1
lea r8,writeDescSet_sType
xor r9,r9
call vkUpdateDescriptorSets

mov rax,1
jmp lbl_End

lbl_VkError:
call SpellVkError
xor rax,rax
jmp lbl_End

lbl_Error:
xor rax,rax

lbl_End:
EPILOG
createUBO endp



destroyUBO proc
PROLOG 100h

;1. Unmap the material UBO (before freeing the memory)
cmp gpMaterialUBOMap,0
je @f
mov rcx,ghVkLogicalDevice
mov rdx,gpMaterialUBOMem
call vkUnmapMemory
mov gpMaterialUBOMap,0

@@:
;2. Destroy the descriptor pool (frees the descriptor set)
cmp ghVkDescriptorPool,0
je @f
mov rcx,ghVkLogicalDevice
mov rdx,ghVkDescriptorPool
xor r8,r8
call vkDestroyDescriptorPool
mov ghVkDescriptorPool,0

@@:
;3. Destroy the descriptor set layout
cmp ghVkDescriptorSetLayout,0
je @f
mov rcx,ghVkLogicalDevice
mov rdx,ghVkDescriptorSetLayout
xor r8,r8
call vkDestroyDescriptorSetLayout
mov ghVkDescriptorSetLayout,0

@@:
;4. Destroy the material UBO buffer
cmp gpMaterialUBO,0
je @f
mov rcx,ghVkLogicalDevice
mov rdx,gpMaterialUBO
xor r8,r8
call vkDestroyBuffer
mov gpMaterialUBO,0

@@:
;5. Free the material UBO memory
cmp gpMaterialUBOMem,0
je @f
mov rcx,ghVkLogicalDevice
mov rdx,gpMaterialUBOMem
xor r8,r8
call vkFreeMemory
mov gpMaterialUBOMem,0

@@:
;Clear the descriptor set handle too (owned by the pool)
mov ghVkDescriptorSet,0

EPILOG
destroyUBO endp


