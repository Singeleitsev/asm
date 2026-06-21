;WinMain
ghInstance dq 0
ghPrevInstance dq 0
gpCmdLine dq 0
gnCmdShow dq 0
gnWndClass dq 0
ghWndMain dq 0
ghWndCurrent dq 0
isActive db 1
isRefreshed db 0

;Menu
ghMenuMain dq 0
ghMenuFile dq 0
ghMenuHelp dq 0
ghAccTable dq 0

;StatusBar
ghWndStatusBar dq 0
idStatusBar dq 0
N_STATUSBAR_PARTS equ 0Ch ;12 Parts
xStatusParts dd N_STATUSBAR_PARTS-1 dup (0),-1 ;12 Variables
;Proportions Empirically Counted for Width = 1024
xStatusProportions dd 80,160,240,320,400,480,560,640,720,820,920 ;11 Separators for 12 Fields

;Log
ghLogFile dq 0
gnLastError dd 0

;vkInstance
ghVkInstance dq 0

;Dump
ghLayerDumpFile dq 0
ghInstExtDumpFile dq 0

;InstanceLayers
dwInstanceLayersCount dd 0
gpLayerProperties dq 0
gfValidationLayerSupport db 0

;InstanceExtensions
dwInstanceExtensionsCount dd 0
gpExtensionProperties dq 0
gfDebugUtilsSupport db 0

;DebugMessenger
pfnCreateDebugUtilsMessenger dq 0 ;Function Pointer
pfnDestroyDebugUtilsMessenger dq 0
ghVkDebugMessenger dq 0

;Surface
ghVkSurface dq 0

;PhysicalDevice
dwPhysicalDeviceCount dd 0
ppPhysicalDevices dq 0
gpPhysicalDeviceProps dq 0
ghVkPhysicalDevice dq 0
gnDeviceType dd 0 ;For VK_LAYER_KHRONOS_validation

;Dump
ghDeviceDumpFile dq 0

;Family
dwQueueFamilyCount dd 0
gpQueueFamilyProperties dq 0
gpPresentSupport dq 0
graphicsFamilyIndex dd -1
presentFamilyIndex  dd -1

;Formats
surfaceFormatsCount dd 0
gpSurfaceFormats dq 0

;Present Modes
presentModesCount dd 0
gpPresentModes dq 0

;Chosen settings
chosenExtent_width dd 0
chosenExtent_height dd 0
chosenFormat dd 0
chosenPresentMode dd 0

;LogicalDevice
ghVkLogicalDevice dq 0
ghVkGraphicsQueue dq 0
ghVkPresentQueue dq 0
queuePriority dd 3f800000h ;1.0f

;Swapchain
ghVkSwapchain dq 0

;ImageViews
dwSwapchainImageCount dd 0
gpSwapchainImages dq 0 ;Pointer to array of VkImage handles
gpSwapchainImageViews dq 0 ;Pointer to array of VkImageView handles

;RenderPass
ghVkRenderPass dq 0

;Shaders
ghFileShaderV dq 0
dwSizeShaderV dq 0
gpCodeShaderV dq 0
ghFileShaderF dq 0
dwSizeShaderF dq 0
gpCodeShaderF dq 0
ghVkVertexShaderModule dq 0
ghVkFragmentShaderModule dq 0

;PipelineLayout
ghVkPipelineLayout dq 0

;GraphicsPipeline
ghVkGraphicsPipeline dq 0

;CommandPool
ghVkCommandPool dq 0

;Semaphores
ghVkSemaphoreImageAvailable dq 0
ghVkSemaphoreRenderFinished dq 0

;Fence
ghVkFence dq 0

;FrameBuffer
gpFramebuffers dq 0 ;Pointer to the Array of Framebuffer handles

;recordCmmBuffers
gpCommandBuffers dq 0

;Render
dwImageIndex dd 0
dwStageMask dd 400h ;VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT = 1024

