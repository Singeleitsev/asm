;VkPipelineShaderStageCreateInfo (vertex)
align 10h
shaderStageVert_sType dd 12h ;VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO = 18
shaderStageVert_dummy0 dd 0
shaderStageVert_pNext dq 0
shaderStageVert_flags dd 0
shaderStageVert_stage dd 1 ;VK_SHADER_STAGE_VERTEX_BIT
shaderStageVert_module dq 0 ;ghVkVertexShaderModule
shaderStageVert_pName dq offset szEntryPointShaderV
shaderStageVert_pSpecializationInfo dq 0

;VkPipelineShaderStageCreateInfo (fragment)
align 10h
shaderStageFrag_sType dd 12h ;VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO = 18
shaderStageFrag_dummy0 dd 0
shaderStageFrag_pNext dq 0
shaderStageFrag_flags dd 0
shaderStageFrag_stage dd 10h ;VK_SHADER_STAGE_FRAGMENT_BIT = 16
shaderStageFrag_module dq 0 ;ghVkFragmentShaderModule
shaderStageFrag_pName dq offset szEntryPointShaderF
shaderStageFrag_pSpecializationInfo dq 0

;VkVertexInputBindingDescription
;align 10h
;vertBinding_binding dd 0
;vertBinding_stride dd 8 ;two floats = 8 bytes
;vertBinding_inputRate dd 0 ;VK_VERTEX_INPUT_RATE_VERTEX

;VkVertexInputAttributeDescription (position)
;align 10h
;vertAttrPos_location dd 0
;vertAttrPos_binding dd 0
;vertAttrPos_format dd 67h ;VK_FORMAT_R32G32_SFLOAT = 103
;vertAttrPos_offset dd 0

;VkVertexInputAttributeDescription (color)

;VkPipelineVertexInputStateCreateInfo
align 10h
vertInputInfo_sType dd 13h ;VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO = 19
vertInputInfo_dummy0 dd 0
vertInputInfo_pNext dq 0
vertInputInfo_flags dd 0
;vertInputInfo_vertexBindingDescriptionCount dd 1
;vertInputInfo_pVertexBindingDescriptions dq offset vertBinding_binding
;vertInputInfo_vertexAttributeDescriptionCount dd 1
;vertInputInfo_dummy1 dd 0
;vertInputInfo_pVertexAttributeDescriptions dq offset vertAttrPos_location
vertInputInfo_vertexBindingDescriptionCount dd 0
vertInputInfo_pVertexBindingDescriptions dq 0
vertInputInfo_vertexAttributeDescriptionCount dd 0
vertInputInfo_dummy1 dd 0
vertInputInfo_pVertexAttributeDescriptions dq 0

;VkPipelineInputAssemblyStateCreateInfo
align 10h
inputAssembly_sType dd 14h ;VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO = 20
inputAssembly_dummy0 dd 0
inputAssembly_pNext dq 0
inputAssembly_flags dd 0
inputAssembly_topology dd 3 ;VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST
inputAssembly_primitiveRestartEnable dd 0

;VkViewport
align 10h
viewport_x real4 0.0
viewport_y real4 0.0
viewport_width real4 0.0
viewport_height real4 0.0
viewport_minDepth real4 0.0
viewport_maxDepth real4 1.0

;VkRect2D scissor
align 10h
scissor_offset_x dd 0
scissor_offset_y dd 0
scissor_extent_width dd 0
scissor_extent_height dd 0

;VkPipelineViewportStateCreateInfo
align 10h
viewportState_sType dd 16h ;VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO = 22
viewportState_dummy0 dd 0
viewportState_pNext dq 0
viewportState_flags dd 0
viewportState_viewportCount dd 1
viewportState_pViewports dq offset viewport_x
viewportState_scissorCount dd 1
viewportState_dummy1 dd 0
viewportState_pScissors dq offset scissor_offset_x

;VkPipelineRasterizationStateCreateInfo
align 10h
rasterizer_sType dd 17h ;VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO = 23
rasterizer_dummy0 dd 0
rasterizer_pNext dq 0
rasterizer_flags dd 0
rasterizer_depthClampEnable dd 0
rasterizer_rasterizerDiscardEnable dd 0
rasterizer_polygonMode dd 0 ;VK_POLYGON_MODE_FILL
rasterizer_cullMode dd 0 ;VK_CULL_MODE_NONE
rasterizer_frontFace dd 0 ;VK_FRONT_FACE_COUNTER_CLOCKWISE ; can be VK_FRONT_FACE_CLOCKWISE
rasterizer_depthBiasEnable dd 0
rasterizer_depthBiasConstantFactor dd 0
rasterizer_depthBiasClamp dd 0
rasterizer_depthBiasSlopeFactor dd 0
rasterizer_lineWidth real4 1.0

;VkPipelineMultisampleStateCreateInfo
align 10h
multisample_sType dd 18h ;VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO = 24
multisample_dummy0 dd 0
multisample_pNext dq 0
multisample_flags dd 0
multisample_rasterizationSamples dd 1 ;VK_SAMPLE_COUNT_1_BIT
multisample_sampleShadingEnable dd 0
multisample_minSampleShading real4 0.0
multisample_pSampleMask dq 0
multisample_alphaToCoverageEnable dd 0
multisample_alphaToOneEnable dd 0

;VkPipelineColorBlendAttachmentState
align 10h
colorBlendAttachment_blendEnable dd 0
colorBlendAttachment_srcColorBlendFactor dd 1 ;VK_BLEND_FACTOR_ONE
colorBlendAttachment_dstColorBlendFactor dd 1 ;VK_BLEND_FACTOR_ONE
colorBlendAttachment_colorBlendOp dd 0 ;VK_BLEND_OP_ADD
colorBlendAttachment_srcAlphaBlendFactor dd 1 ;VK_BLEND_FACTOR_ONE
colorBlendAttachment_dstAlphaBlendFactor dd 1 ;VK_BLEND_FACTOR_ONE
colorBlendAttachment_alphaBlendOp dd 0 ;VK_BLEND_OP_ADD
colorBlendAttachment_colorWriteMask dd 0Fh ;VK_COLOR_COMPONENT_R_BIT | VK_COLOR_COMPONENT_G_BIT | VK_COLOR_COMPONENT_B_BIT | VK_COLOR_COMPONENT_A_BIT

; VkPipelineColorBlendStateCreateInfo
align 10h
colorBlend_sType dd 1Ah ;VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO = 26
colorBlend_dummy0 dd 0
colorBlend_pNext dq 0
colorBlend_flags dd 0
colorBlend_logicOpEnable dd 0
colorBlend_logicOp dd 0 ;VK_LOGIC_OP_CLEAR
colorBlend_attachmentCount dd 1
colorBlend_pAttachments dq offset colorBlendAttachment_blendEnable
colorBlend_blendConstants dd 0,0,0,0 ;4 floats: r,g,b,a = 0

;VkDynamicState array (viewport + scissor)
align 10h
dynamicStates dd 0,1 ;VK_DYNAMIC_STATE_VIEWPORT, VK_DYNAMIC_STATE_SCISSOR

;VkPipelineDynamicStateCreateInfo
align 10h
dynamicState_sType dd 1Bh ;VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO = 27
dynamicState_dummy0 dd 0
dynamicState_pNext dq 0
dynamicState_flags dd 0
dynamicState_dynamicStateCount dd 2
dynamicState_pDynamicStates dq offset dynamicStates

;VkGraphicsPipelineCreateInfo
align 10h
pipelineInfo_sType dd 1Ch ;VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO = 28
pipelineInfo_dummy0 dd 0
pipelineInfo_pNext dq 0
pipelineInfo_flags dd 0
pipelineInfo_stageCount dd 2
pipelineInfo_pStages dq offset shaderStageVert_sType
pipelineInfo_pVertexInputState dq offset vertInputInfo_sType
pipelineInfo_pInputAssemblyState dq offset inputAssembly_sType
pipelineInfo_pTessellationState dq 0
pipelineInfo_pViewportState dq offset viewportState_sType
pipelineInfo_pRasterizationState dq offset rasterizer_sType
pipelineInfo_pMultisampleState dq offset multisample_sType
pipelineInfo_pDepthStencilState dq 0 ;No depth testing
pipelineInfo_pColorBlendState dq offset colorBlend_sType
pipelineInfo_pDynamicState dq offset dynamicState_sType
pipelineInfo_layout dq 0 ;ghVkPipelineLayout
pipelineInfo_renderPass dq 0 ;ghVkRenderPass
pipelineInfo_subpass dd 0
pipelineInfo_dummy1 dd 0
pipelineInfo_basePipelineHandle dq 0
pipelineInfo_basePipelineIndex dd -1

