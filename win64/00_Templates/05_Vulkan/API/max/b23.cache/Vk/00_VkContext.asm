createVkContext proc
PROLOG 100h

;First Pass to check if there is a Discrete Video Card
LOG_TEXT szCRLF
call enumInstanceLayerProps
call enumInstanceExtensionProps
call checkKhrSurfaceExt
call checkKhrWin32SurfaceExt
call createVkInstance ;VkInstanceCreateInfo is partially filled
call enumPhysicalDevices
call selectPhysicalDevice

call destroyVkInstance

;Second Pass to Work
LOG_TEXT szCRLF
call checkValidationLayer
call checkDebugUtilsExt
call createVkInstance ;VkInstanceCreateInfo is filled
call createDebugMessenger
call createSurface
call enumPhysicalDevices ;Reset ghVkPhysicalDevice
call selectPhysicalDevice
call enumDeviceExtensionProps
call checkDevExtSwapchain
call getQueueFamilyProperties
call selectQueueFamily
call getCapabilities
call getFormats
call choosePresentMode
call createDevice
call createSwapchain
call createImageViews
call createRenderPass
call createShaderModules
call createPipelineCache
call createPipelineLayout
call createGraphicsPipeline
call createCommandPool
call allocateCommandBuffers
call createSemaphores
call createFence
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
call savePipelineCache
call destroyCommandPool
call destroyGraphicsPipeline
call destroyPipelineLayout
call destroyPipelineCache
call destroyShaderModules
call destroyRenderPass
call destroyImageViews
call destroySwapchain
call destroyDevice
call destroySurface
call destroyDebugMessenger
call destroyVkInstance

EPILOG
destroyVkContext endp
