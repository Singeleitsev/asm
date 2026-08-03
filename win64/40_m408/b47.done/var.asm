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

;vkInstance
ghVkInstance dq 0

;Surface
ghVkSurface dq 0

;Physical Devices
ghVkPhysicalDevice dq 0
dwPhysicalDeviceCount dd 0
;Static Array for Maximum of 4 Physical Device Handles
gpPhysicalDevice0 dq 0
gpPhysicalDevice1 dq 0
gpPhysicalDevice2 dq 0
gpPhysicalDevice3 dq 0

;Queue Family
dwQueueFamilyCount dd 0
gpQueueFamilyProperties dq 0
gpPresentSupport dq 0
graphicsFamilyIndex dd -1
presentFamilyIndex  dd -1

;Logical Device
ghVkLogicalDevice dq 0
ghVkGraphicsQueue dq 0
ghVkPresentQueue dq 0
queuePriority dd 3f800000h ;1.0f

;Swapchain
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

;Swapchain Images
dwSwapchainImageCount dd 0
gpSwapchainImages dq 0 ;Pointer to array of VkImage handles
gpSwapchainImageViews dq 0 ;Pointer to array of VkImageView handles

;Depth Buffer
ghVkDepthImage dq 0
ghVkDepthImageView dq 0
ghVkDepthDeviceMemory dq 0

;Render Pass
ghVkRenderPass dq 0

;Pipeline Layout
ghVkPipelineLayout dq 0

;Vertex Shaders
ghFileShaderV dq 0
dwSizeShaderV dq 0
gpCodeShaderV dq 0

;Fragment Shaders
ghFileShaderF dq 0
dwSizeShaderF dq 0
gpCodeShaderF dq 0

;Handles
ghVkVertexShaderModule dq 0
ghVkFragmentShaderModule dq 0

;Command Pool
ghVkCommandPool dq 0
ghVkSemaphoreImageAvailable dq 0
ghVkSemaphoreRenderFinished dq 0
ghVkFence dq 0
;ghVkCommandBuffer dq 0 ;Use for a single buffer, not for an array
gpCommandBuffers dq 0 ;Pointer to the Array of Command buffer handles

;Model Buffers
gnVertexSize dq 0
gnIndexSize dq 0
gpStagingVertexBuffer dq 0
gpStagingVertexMem dq 0
gpVertexMap dq 0
gpDeviceVertexBuffer dq 0
gpDeviceVertexBufferMem dq 0
gpStagingIndexBuffer dq 0
gpStagingIndexMem dq 0
gpIndexMap dq 0
gpDeviceIndexBuffer dq 0
gpDeviceIndexBufferMem dq 0
gpModelCmdBuffers dq 0
gpModelFence dq 0

;Graphics Pipeline
ghVkGraphicsPipeline dq 0

;Framebuffer
gpFramebuffers dq 0 ;Pointer to the Array of Framebuffer handles
attachmentColor dq 0
attachmentDepth dq 0

;Record
;gnVertexCount dq 36
gpVertexZeroOffset dq 0

;Render
dwImageIndex dd 0
dwStageMask dd 400h ;VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT = 1024

;OBJ
ghObjFile dq 0
gnObjFileSize dq 0
ghObjMapping dq 0
gpObjDataStart dq 0
gpObjDataCurrent dq 0
gpObjDataEnd dq 0
gnObjVertexArraySize dq 0
gnObjNormalArraySize dq 0
gnObjCombinedArraySize dq 0
gnObjIndexArraySize dq 0
gpObjVertices dq 0
gpObjNormals dq 0
gpObjectNames dq 0
gpGroupNames dq 0
gpObjCombined dq 0
gpObjIndices dq 0
gnCurrentVertexCount dd 0
gnCurrentNormalCount dd 0
gnCurrentCombinedCount dd 0
gnCurrentIndexCount dd 0

;MTL
ghMtlFile dq 0
gnMtlFileSize dq 0
ghMtlMapping dq 0
gpMtlDataStart dq 0
gpMtlDataCurrent dq 0
gpMtlDataEnd dq 0
gnMtlCount dd 0
gnMtlCapacity dd 8 ;Max Number of Materials
gnMtlArraySize dq 0
gpMaterials dq 0
gpMtlFace dq 0 ;Material index per face (1 DWORD per triangle)
gnCurrentMaterialIndex dd -1
gpCurrentMtl dq 0 ;Currently active material
gnMtlGroupCount dd 0
gpMtlGroups dq 0 ;array of MaterialGroup

;JPG
gpJpgStagingBuffer dq 0
gpJpgStagingMemory dq 0
gpJpgMap dq 0
gpJpgCmdBuffer dq 0
gpJpgMemBarriers dq 0
gpJpgFence dq 0
gpBitmap dq 0
tokenGdiPlus dq 0 ;GDI+ startup token
guidJpg db 01h,0F4h,7Ch,55h,04h,1Ah,0D3h,11h,9Ah,73h,00h,00h,0F8h,1Eh,0F3h,2Eh

;MVP matrix (column-major)
wFrameCounter dd 0
mvpMatrix \
dd 3f800000h,0,0,0
dd 0,3f800000h,0,0
dd 0,0,3f800000h,0
dd 0,0,0,3f800000h


