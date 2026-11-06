createVkContext proc
PROLOG 100h

call createInstance
call createSurface
call enumeratePhysicalDevices
call getQueueFamilyProperties
call selectQueueFamily
call getCapabilities
call getFormats
call choosePresentMode
call createDevice
call createSwapchain
call createDepthImage
call createRenderPass
call createUBO
call createPipelineLayout
call createShaderModules
call createCommandPool
;call createModelBuffers
call createVBO
call createGraphicsPipeline
call createSemaphores
call createFence
call allocateCommandBuffers
call createFrameBuffers
call recordCommandBuffers

EPILOG
createVkContext endp



destroyVkContext proc
PROLOG 100h

mov rcx,ghVkLogicalDevice
call vkDeviceWaitIdle

call destroyFrameBuffers
call destroyFence
call destroySemaphores
call destroyGraphicsPipeline
;call destroyModelBuffers
call destroyPipelineLayout ; <- Pipeline layout before descriptor layout
call destroyUBO ;<- UBO and descriptors together
call destroyVBO ;<- Model buffers last
call destroyCommandPool
call destroyShaderModules
call destroyRenderPass
call destroyDepthImage
call destroySwapchain
call destroyDevice
call destroySurface
call destroyInstance

EPILOG
destroyVkContext endp


