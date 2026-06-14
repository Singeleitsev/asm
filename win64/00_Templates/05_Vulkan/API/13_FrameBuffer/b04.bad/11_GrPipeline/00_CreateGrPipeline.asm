;00_CreateGraphicsPipelineProc.asm
createGraphicsPipeline proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Fill the VkPipelineShaderStageCreateInfo (Vertex) structure
mov rax,ghVkVertexShaderModule
mov shaderStageVert_module,rax

;Fill the VkPipelineShaderStageCreateInfo (Fragment) structure
mov rax,ghVkFragmentShaderModule
mov shaderStageFrag_module,rax

;Fill the VkGraphicsPipelineCreateInfo structure
mov rax,ghVkPipelineLayout
mov pipelineInfo_layout,rax
mov rax,ghVkRenderPass
mov pipelineInfo_renderPass,rax

;Set viewport to actual window size (float)
mov eax,chosenExtent_width
cvtsi2ss xmm0,eax
movss viewport_width,xmm0
mov eax,chosenExtent_height
cvtsi2ss xmm0,eax
movss viewport_height,xmm0

;Set scissor rectangle to the same size
mov eax,chosenExtent_width
mov scissor_extent_width,eax
mov eax,chosenExtent_height
mov scissor_extent_height,eax

LOG_TEXT szLogVkCreateGraphicsPipeline
mov rcx,ghVkLogicalDevice
xor rdx,rdx ;pipelineCache = 0
mov r8,1 ;createInfoCount = 1
lea r9,pipelineInfo_sType ;pCreateInfos
mov qword ptr [rsp+20h],0 ;pAllocator = NULL
lea rax, ghVkGraphicsPipeline
mov qword ptr [rsp+28h],rax ;pPipelines
call vkCreateGraphicsPipelines
test rax,rax
jnz lbl_createGraphicsPipeline_VkError
cmp ghVkGraphicsPipeline,0
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

