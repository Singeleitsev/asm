;00_AppFrame

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
dwBytesWritten dq 0
gnLastError dd 0

;01_vkInstance

ghVkInstance dq 0

;02_Validation

pfnCreateDebugUtilsMessenger dq 0 ;Function Pointer
pfnDestroyDebugUtilsMessenger dq 0
ghVkDebugMessenger dq 0 ;Messenger Handle

;03_Physical

ghVkPhysicalDevice dq 0

;Physical Devices
dwPhysicalDeviceCount dd 0
;Static Array for Maximum of 4 Physical Device Handles
gpPhysicalDevice0 dq 0
gpPhysicalDevice1 dq 0
gpPhysicalDevice2 dq 0
gpPhysicalDevice3 dq 0

;04_Surface

ghVkSurface dq 0

;05_Family

dwQueueFamilyCount dd 0
gpQueueFamilyProperties dq 0
gpPresentSupport dq 0
graphicsFamilyIndex dd -1
presentFamilyIndex  dd -1

;06_Logical

ghVkLogicalDevice dq 0
ghVkGraphicsQueue dq 0
ghVkPresentQueue dq 0

queuePriority dd 3f800000h ;1.0f

;07_Swapchain

ghVkSwapchain dq 0

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

;Swapchain
dwSwapchainImageCount dd 0
gpSwapchainImages dq 0 ;Pointer to array of VkImage handles
gpSwapchainImageViews dq 0 ;Pointer to array of VkImageView handles

;08_RenderPass

ghVkRenderPass dq 0

;09_PipelineLayout

ghVkPipelineLayout dq 0

;10_Shaders

ghFileShaderV dq 0
dwSizeShaderV dq 0
gpCodeShaderV dq 0

ghFileShaderF dq 0
dwSizeShaderF dq 0
gpCodeShaderF dq 0

;Handles
ghVkVertexShaderModule dq 0
ghVkFragmentShaderModule dq 0

;11_GrPipeline

ghVkGraphicsPipeline dq 0

;12_AllocCmd

ghVkCommandPool dq 0
ghVkSemaphoreImageAvailable dq 0
ghVkSemaphoreRenderFinished dq 0
ghVkFence dq 0
;ghVkCommandBuffer dq 0 ;Use for a single buffer, not for an array
gpCommandBuffers dq 0 ;Pointer to the Array of Command buffer handles

;13_FrameBuffer

gpFramebuffers dq 0 ;Pointer to the Array of Framebuffer handles

;14_recordCommandBuffers
;No vars

;15_Render

dwImageIndex dd 0
dwStageMask dd 400h ;VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT = 1024

