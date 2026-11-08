createGraphicsPipeline proc
PROLOG 100h

;1.1. Fill the VkPipelineShaderStageCreateInfo (Vertex) structure
mov rax,ghVkVertexShaderModule
mov shaderStageVert_module,rax

;1.2. Fill the VkPipelineShaderStageCreateInfo (Fragment) structure
mov rax,ghVkFragmentShaderModule
mov shaderStageFrag_module,rax

;1.3. Set viewport to actual window size (float)
mov eax,chosenExtent_width
cvtsi2ss xmm0,eax
movss viewport_width,xmm0
mov eax,chosenExtent_height
cvtsi2ss xmm0,eax
movss viewport_height,xmm0

;1.4. Set scissor rectangle to the same size
mov eax,chosenExtent_width
mov scissor_extent_width,eax
mov eax,chosenExtent_height
mov scissor_extent_height,eax

;2. Opaque Pipeline

;2.1. Fill the VkGraphicsPipelineCreateInfo structure
mov rax,ghVkPipelineLayout
mov pipelineInfoOpaque_layout,rax
mov rax,ghVkRenderPass
mov pipelineInfoOpaque_renderPass,rax

;2.2. Create Opaque Pipeline
LOG_TEXT szVkCreateGraphicsPipeline
mov rcx,ghVkLogicalDevice
xor rdx,rdx ;pipelineCache = 0
mov r8,1 ;createInfoCount = 1
lea r9,pipelineInfoOpaque_sType ;pCreateInfos
mov qword ptr [rsp+20h],0 ;pAllocator = NULL
lea rax, ghVkGraphicsPipelineOpaque
mov qword ptr [rsp+28h],rax ;pPipelines
call vkCreateGraphicsPipelines
test rax,rax
jnz lbl_createGraphicsPipeline_VkError
cmp ghVkGraphicsPipelineOpaque,0
jz lbl_createGraphicsPipeline_VkError
LOG_TEXT szOK

;3. Transparent Pipeline

;3.1. Fill the VkGraphicsPipelineCreateInfo structure
mov rax,ghVkPipelineLayout
mov pipelineInfoTransparent_layout,rax
mov rax,ghVkRenderPass
mov pipelineInfoTransparent_renderPass,rax

;3.2. Create Transparent Pipeline
LOG_TEXT szVkCreateGraphicsPipeline
mov rcx,ghVkLogicalDevice
xor rdx,rdx
mov r8,1
lea r9,pipelineInfoTransparent_sType
mov qword ptr [rsp+20h],0
lea rax, ghVkGraphicsPipelineTransparent
mov qword ptr [rsp+28h],rax
call vkCreateGraphicsPipelines
test rax,rax
jnz lbl_createGraphicsPipeline_VkError
cmp ghVkGraphicsPipelineTransparent,0
jz lbl_createGraphicsPipeline_VkError
LOG_TEXT szOK

jmp lbl_createGraphicsPipeline_End

lbl_createGraphicsPipeline_VkError:
call SpellVkError

lbl_createGraphicsPipeline_End:
;Epilogue
leave
ret
createGraphicsPipeline endp



destroyGraphicsPipeline proc
PROLOG 100h

cmp ghVkGraphicsPipelineTransparent,0
je @f

LOG_TEXT szVkDestroyGraphicsPipeline
mov rcx,ghVkLogicalDevice
mov rdx,ghVkGraphicsPipelineTransparent
xor r8,r8
call vkDestroyPipeline
mov ghVkGraphicsPipelineTransparent,0
LOG_TEXT szOK

@@:
cmp ghVkGraphicsPipelineOpaque,0
je @f

LOG_TEXT szVkDestroyGraphicsPipeline
mov rcx,ghVkLogicalDevice
mov rdx,ghVkGraphicsPipelineOpaque
xor r8,r8
call vkDestroyPipeline
mov ghVkGraphicsPipelineOpaque,0
LOG_TEXT szOK

@@:
EPILOG
destroyGraphicsPipeline endp


