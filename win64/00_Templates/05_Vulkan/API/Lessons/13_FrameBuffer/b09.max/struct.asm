;00_AppFrame

;WNDCLASSEXA
align 10h
wcx_cbSize dd 50h ;sizeof(WNDCLASSEX)
wcx_style dd 3 ;CS_HREDRAW | CS_VREDRAW
wcx_lpfnWndProc dq offset WndProc
wcx_cbClsExtra dd 0
wcx_cbWndExtra dd 0
wcx_hInstance dq 0 ;hInstance
wcx_hIcon dq 0 ;LoadIcon(hInstance, MAKEINTRESOURCE(IDI_VULKAN))
wcx_hCursor dq 0 ;LoadCursor(nullptr, IDC_ARROW)
wcx_hbrBackground dq 6 ;(HBRUSH)(COLOR_WINDOW+1)
wcx_lpszMenuName dq 0 ;MAKEINTRESOURCEW(IDC_VULKAN)
wcx_lpszClassName dq offset szMainWndClass
wcx_hIconSm dq 0 ;LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL))

;MSG
align 10h
msg_hwnd dq 0
msg_message dd 0
msg_dummy0 dd 0
msg_wParam dq 0
msg_lParam dq 0
msg_time dd 0
msg_pt_x dd 0
msg_pt_y dd 0
msg_dummy1 dd 0

;ACCEL
align 10h ;Must be aligned to avoid error 0x03e6
accel \
db 9 ;fVirt = FVIRTKEY | FCONTROL (1 + 8)
db 0 ;dummy
dw 57h ;'W'
dw IDM_APP_EXIT ;command ID
db 1 ;fVirt = FVIRTKEY only
db 0 ;dummy
dw 70h ;VK_F1 = 0x70
dw IDM_HELP_ABOUT ;command ID

;INITCOMMONCONTROLSEX
align 10h
icce_dwSize dd 0
icce_dwICC dd 0

;RECT rect
align 10h
RectMain_left dd 0
RectMain_top dd 0
RectMain_right dd 0
RectMain_bottom dd 0
RectMain_width dd 0
RectMain_height dd 0

;01_vkInstance

;VkApplicationInfo appInfo
align 10h
appInfo_sType dd 0 ;VK_STRUCTURE_TYPE_APPLICATION_INFO = 0
appInfo_dummy0 dd 0
appInfo_pNext dq 0
appInfo_pApplicationName dq offset szMainWndTitle
appInfo_applicationVersion dd 400000h ;VK_API_VERSION_1_0 = 1.0.0 = 0 << 29 | 1 << 22 | 0 << 12 | 0
appInfo_dummy1 dd 0
appInfo_pEngineName dq offset szEngineName
appInfo_engineVersion dd 400000h ;VK_API_VERSION_1_0
appInfo_apiVersion dd 400000h ;VK_API_VERSION_1_0

;VkInstanceCreateInfo createInfo
align 10h
createInfo_sType dd 1 ;VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO = 1
createInfo_dummy0 dd 0
createInfo_pNext dq 0
createInfo_flags dd 0
createInfo_dummy1 dd 0
createInfo_pApplicationInfo dq offset appInfo_sType
createInfo_enabledLayerCount dd 1 ;Hardcoded Manually
createInfo_dummy2 dd 0
createInfo_ppEnabledLayerNames dq offset ppEnabledLayers
createInfo_enabledExtensionCount dd 3 ;Hardcoded Manually
createInfo_dummy3 dd 0
createInfo_ppEnabledExtensionNames dq offset ppEnabledExtensions

;02_Validation

;VkDebugUtilsMessengerCreateInfoEXT debugCreateInfo
align 10h
dbgMessenger_sType dd 3B9CBE00h ;VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT = 1000128000 ;vk.xml
dbgMessenger_dummy0 dd 0
dbgMessenger_pNext dq 0
dbgMessenger_flags dd 0
;VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT EQU 1
;VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT EQU 10h - Not used
;VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT EQU 100h
;VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT EQU 1000h
dbgMessenger_messageSeverity dd 1101h
;VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT EQU 1h
;VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT EQU 2h
;VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT EQU 4h
dbgMessenger_messageType dd 7
dbgMessenger_dummy1 dd 0
dbgMessenger_pfnUserCallback dq offset DebugCallback
dbgMessenger_pUserData dq 0

;03_Physical

;VkPhysicalDeviceProperties - Array
align 10h
deviceProp0_apiVersion dd 0
deviceProp0_driverVersion dd 0
deviceProp0_vendorID dd 0
deviceProp0_deviceID dd 0
deviceProp0_deviceType dd 0
deviceProp0_deviceName db 100h dup (0) ;256 bytes
deviceProp0_pipelineCacheUUID db 10h dup (0) ;16 bytes
deviceProp0_dummy0 dd 0
deviceProp0_limits db 1F8h dup (0) ;504 bytes
deviceProp0_sparseProperties db 14h dup (0) ;20 bytes
deviceProp0_dummy1 dd 0
align 10h
deviceProp1_apiVersion dd 0
deviceProp1_driverVersion dd 0
deviceProp1_vendorID dd 0
deviceProp1_deviceID dd 0
deviceProp1_deviceType dd 0
deviceProp1_deviceName db 100h dup (0) ;256 bytes
deviceProp1_pipelineCacheUUID db 10h dup (0) ;16 bytes
deviceProp1_dummy0 dd 0
deviceProp1_limits db 1F8h dup (0) ;504 bytes
deviceProp1_sparseProperties db 14h dup (0) ;20 bytes
deviceProp1_dummy1 dd 0

;04_Surface

;VkWin32SurfaceCreateInfoKHR
align 10h
surfaceInfo_sType dd 3B9AED28h ;VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR = 1000009000
surfaceInfo_dummy0 dd 0
surfaceInfo_pNext dq 0 ;NULL
surfaceInfo_flags dd 0
surfaceInfo_dummy1 dd 0
surfaceInfo_hinstance dq 0
surfaceInfo_hwnd dq 0


;05_Family

;No Structures

;06_Logical

;VkDeviceQueueCreateInfo
align 10h
queueInfo0_sType dd 2 ;VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
queueInfo0_dummy0 dd 0
queueInfo0_pNext dq 0
queueInfo0_flags dd 0
queueInfo0_queueFamilyIndex dd 0 ;NULL for now
queueInfo0_queueCount dd 1
queueInfo0_dummy1 dd 0
queueInfo0_pQueuePriorities dq offset queuePriority
;immediately After
queueInfo1_sType dd 2 ;VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
queueInfo1_dummy0 dd 0
queueInfo1_pNext dq 0
queueInfo1_flags dd 0
queueInfo1_queueFamilyIndex dd 0 ;NULL for now
queueInfo1_queueCount dd 1
queueInfo1_dummy1 dd 0
queueInfo1_pQueuePriorities dq offset queuePriority

;VkDeviceCreateInfo
align 10h
deviceInfo_sType dd 3 ;VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO
deviceInfo_dummy0 dd 0
deviceInfo_pNext dq 0
deviceInfo_flags dd 0
deviceInfo_queueCreateInfoCount dd 0 ;NULL for now
deviceInfo_pQueueCreateInfos dq offset queueInfo0_sType
deviceInfo_enabledLayerCount dd 0 ;NULL for now
deviceInfo_dummy1 dd 0
deviceInfo_ppEnabledLayerNames dq 0 ;No Layers yet
deviceInfo_enabledExtensionCount dd 1 ;1 for now
deviceInfo_dummy2 dd 0
deviceInfo_ppEnabledExtensionNames dq offset ppDeviceExtensions
deviceInfo_pEnabledFeatures dq 0 ;NULL for now

;07_Swapchain

;VkSurfaceCapabilitiesKHR
align 10h
surfaceCapabilities_minImageCount dd 0
surfaceCapabilities_maxImageCount dd 0
surfaceCapabilities_currentExtent_width dd 0
surfaceCapabilities_currentExtent_height dd 0
surfaceCapabilities_minImageExtent_width dd 0
surfaceCapabilities_minImageExtent_height dd 0
surfaceCapabilities_maxImageExtent_width dd 0
surfaceCapabilities_maxImageExtent_height dd 0
surfaceCapabilities_maxImageArrayLayers dd 0
surfaceCapabilities_supportedTransforms dd 0
surfaceCapabilities_currentTransform dd 0
surfaceCapabilities_supportedCompositeAlpha dd 0
surfaceCapabilities_supportedUsageFlags dd 0

;VkSwapchainCreateInfoKHR
align 10h
swapchainInfo_sType dd 3B9ACDE8h ; VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR = 1000001000
swapchainInfo_dummy0 dd 0
swapchainInfo_pNext dq 0
swapchainInfo_flags dd 0
swapchainInfo_dummy1 dd 0
swapchainInfo_surface dq 0 ;ghVkSurface
swapchainInfo_minImageCount dd 2 ;Double Buffering
swapchainInfo_imageFormat dd 0 ;chosenFormat
swapchainInfo_imageColorSpace dd 0 ; VK_COLOR_SPACE_SRGB_NONLINEAR_KHR
swapchainInfo_imageExtent_width dd 0 ;chosenExtent_width
swapchainInfo_imageExtent_height dd 0 ;chosenExtent_height
swapchainInfo_imageArrayLayers dd 1
swapchainInfo_imageUsage dd 10h ;VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT
swapchainInfo_imageSharingMode dd 0 ;VK_SHARING_MODE_EXCLUSIVE
swapchainInfo_queueFamilyIndexCount dd 0
swapchainInfo_dummy2 dd 0
swapchainInfo_pQueueFamilyIndices dq 0
swapchainInfo_preTransform dd 1 ;VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR
swapchainInfo_compositeAlpha dd 1 ;VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR
swapchainInfo_presentMode dd 0 ;chosenPresentMode
swapchainInfo_clipped dd 1 ;VK_TRUE
swapchainInfo_oldSwapchain dq 0

;VkImageViewCreateInfo
align 10h
viewInfo_sType dd 0Fh ;VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO = 15
viewInfo_dummy0 dd 0
viewInfo_pNext dq 0
viewInfo_flags dd 0
viewInfo_dummy1 dd 0
viewInfo_image dq 0
viewInfo_viewType dd 1 ;VK_IMAGE_VIEW_TYPE_2D
viewInfo_format dd 0 ;chosenFormat
viewInfo_components_r dd 0 ;VK_COMPONENT_SWIZZLE_IDENTITY
viewInfo_components_g dd 0
viewInfo_components_b dd 0
viewInfo_components_a dd 0
viewInfo_subresourceRange_aspectMask dd 1 ;VK_IMAGE_ASPECT_COLOR_BIT
viewInfo_subresourceRange_baseMipLevel dd 0
viewInfo_subresourceRange_levelCount dd 1
viewInfo_subresourceRange_baseArrayLayer dd 0
viewInfo_subresourceRange_layerCount dd 1

;08_RenderPass

;VkRenderPassCreateInfo
align 10h
renderPassInfo_sType dd 26h ;VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO = 38
renderPassInfo_dummy0 dd 0
renderPassInfo_pNext dq 0
renderPassInfo_flags dd 0
renderPassInfo_attachmentCount dd 1
renderPassInfo_pAttachments dq offset colorAttachment_flags
renderPassInfo_subpassCount dd 1
renderPassInfo_dummy1 dd 0
renderPassInfo_pSubpasses dq offset subpass_flags
renderPassInfo_dependencyCount dd 1
renderPassInfo_dummy2 dd 0
renderPassInfo_pDependencies dq offset dependency_srcSubpass

;VkAttachmentDescription colorAttachment
align 10h
colorAttachment_flags dd 0
colorAttachment_format dd 0 ;chosenFormat
colorAttachment_samples dd 1 ;VK_SAMPLE_COUNT_1_BIT
colorAttachment_loadOp dd 1 ;VK_ATTACHMENT_LOAD_OP_CLEAR
colorAttachment_storeOp dd 0 ;VK_ATTACHMENT_STORE_OP_STORE
colorAttachment_stencilLoadOp dd 2; VK_ATTACHMENT_LOAD_OP_DONT_CARE ;can be VK_ATTACHMENT_LOAD_OP_CLEAR
colorAttachment_stencilStoreOp dd 1 ;VK_ATTACHMENT_STORE_OP_DONT_CARE ;can be VK_ATTACHMENT_STORE_OP_STORE
colorAttachment_initialLayout dd 0 ;VK_IMAGE_LAYOUT_UNDEFINED
colorAttachment_finalLayout dd 3B9ACDEAh ;VK_IMAGE_LAYOUT_PRESENT_SRC_KHR = 1000001002

;VkAttachmentReference colorAttachmentRef
align 10h
colorAttachmentRef_attachment dd 0
colorAttachmentRef_layout dd 2 ;VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL

;VkAttachmentDescription depthAttachment
;VkAttachmentReference depthAttachmentRef

;VkSubpassDescription
align 10h
subpass_flags dd 0
subpass_pipelineBindPoint dd 0  ;VK_PIPELINE_BIND_POINT_GRAPHICS
subpass_inputAttachmentCount dd 0
subpass_dummy0 dd 0
subpass_pInputAttachments dq 0
subpass_colorAttachmentCount dd 1
subpass_dummy1 dd 0
subpass_pColorAttachments dq offset colorAttachmentRef_attachment
subpass_pResolveAttachments dq 0
subpass_pDepthStencilAttachment dq 0 ;&depthAttachmentRef
subpass_preserveAttachmentCount dd 0
subpass_dummy2 dd 0
subpass_pPreserveAttachments dq 0

;VkSubpassDependency
align 10h
dependency_srcSubpass dd 0FFFFFFFFh ;VK_SUBPASS_EXTERNAL
dependency_dstSubpass dd 0
dependency_srcStageMask dd 400h ;VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT = 1024
dependency_dstStageMask dd 400h ;VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT
dependency_srcAccessMask dd 0
dependency_dstAccessMask dd 100h ;VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT = 256
dependency_dependencyFlags dd 1 ;VK_DEPENDENCY_BY_REGION_BIT

;09_PipelineLayout

;VkPipelineLayoutCreateInfo
align 10h
pipelineLayoutInfo_sType dd 1Eh ; VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO = 30
pipelineLayoutInfo_dummy0 dd 0
pipelineLayoutInfo_pNext dq 0
pipelineLayoutInfo_flags dd 0
pipelineLayoutInfo_setLayoutCount dd 0 ;No descriptor sets
pipelineLayoutInfo_pSetLayouts dq 0
pipelineLayoutInfo_pushConstantRangeCount dd 0
pipelineLayoutInfo_dummy1 dd 0
pipelineLayoutInfo_pPushConstantRanges dq 0

;10_Shaders

;VkShaderModuleCreateInfo
align 10h
shaderModuleInfo_sType dd 10h  ;VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO = 16
shaderModuleInfo_dummy0 dd 0
shaderModuleInfo_pNext dq 0
shaderModuleInfo_flags dd 0
shaderModuleInfo_dummy1 dd 0
shaderModuleInfo_codeSize dq 0
shaderModuleInfo_pCode dq 0


;11_GrPipeline

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

;12_AllocCmd

;VkCommandPoolCreateInfo
align 10h
cmdPoolInfo_sType dd 27h ;VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO = 39
cmdPoolInfo_dummy0 dd 0
cmdPoolInfo_pNext  dq 0
cmdPoolInfo_flags dd 2 ;VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT
cmdPoolInfo_queueFamilyIndex dd 0

;VkSemaphoreCreateInfo
align 10h
semaphoreInfo_sType dd 9 ;VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO
semaphoreInfo_dummy0 dd 0
semaphoreInfo_pNext dq 0
semaphoreInfo_flags dd 0

;VkFenceCreateInfo
align 10h
fenceInfo_sType dd 8 ;VK_STRUCTURE_TYPE_FENCE_CREATE_INFO
fenceInfo_dummy0 dd 0
fenceInfo_pNext dq 0
fenceInfo_flags dd 1 ;VK_FENCE_CREATE_SIGNALED_BIT (start signaled)

;VkCommandBufferAllocateInfo
align 10h
allocInfo_sType dd 28h ;VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO = 40
allocInfo_dummy0 dd 0
allocInfo_pNext dq 0
allocInfo_commandPool dq 0
allocInfo_level dd 0 ;VK_COMMAND_BUFFER_LEVEL_PRIMARY
allocInfo_commandBufferCount dd 1

;13_FrameBuffer

;VkFramebufferCreateInfo
align 10h
frameBufferInfo_sType dd 25h ;VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO = 37
frameBufferInfo_dummy0 dd 0
frameBufferInfo_pNext dq 0
frameBufferInfo_flags dd 0
frameBufferInfo_dummy1 dd 0
frameBufferInfo_renderPass dq 0
frameBufferInfo_attachmentCount dd 0
frameBufferInfo_dummy2 dd 0
frameBufferInfo_pAttachments dq 0
frameBufferInfo_width dd 0
frameBufferInfo_height dd 0
frameBufferInfo_layers dd 1

;VkCommandBufferBeginInfo
align 10h
cmdBufferBeginInfo_sType dd 2Ah ;VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO = 42
cmdBufferBeginInfo_dummy0 dd 0
cmdBufferBeginInfo_pNext dq 0
cmdBufferBeginInfo_flags dd 1 ;VK_COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT
cmdBufferBeginInfo_dummy1 dd 0
cmdBufferBeginInfo_pInheritanceInfo dq 0

;VkClearValue (color)
align 10h
clearValue_red dd 3f800000h
clearValue_green dd 0
clearValue_blue dd 0
clearValue_a dd 3f800000h

;VkRenderPassBeginInfo
align 10h
renderPassBeginInfo_sType dd 2Bh ;VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO = 43
renderPassBeginInfo_dummy0 dd 0
renderPassBeginInfo_pNext dq 0
renderPassBeginInfo_renderPass dq 0
renderPassBeginInfo_framebuffer dq 0
renderPassBeginInfo_renderArea_offset_x dd 0
renderPassBeginInfo_renderArea_offset_y dd 0
renderPassBeginInfo_renderArea_extent_width dd 0
renderPassBeginInfo_renderArea_extent_height dd 0
renderPassBeginInfo_clearValueCount dd 1
renderPassBeginInfo_dummy1 dd 0
renderPassBeginInfo_pClearValues dq offset clearValue_red

