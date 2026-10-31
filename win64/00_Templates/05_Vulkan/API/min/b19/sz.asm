;WinMain
szWinMain db "WinMain", 0
szMainWndClass db "VulkanWndClass", 0
szMainWndTitle db "Vulkan Template", 0

;Menu
szMenuFile db "&File",0
szMenuFileExit db "E&xit",9,"Ctrl+W",0
szMenuHelp db "&Help",0
szMenuHelpAbout db "&About...",9,"F1",0

;Status Bar
;https://learn.microsoft.com/en-us/windows/win32/winauto/status-bar-control
szStatusClassName db "msctls_statusbar32",0 ;"STATUSCLASSNAMEW"

;WndProc
szMsgCloseText db "Exit?",0

;Memory
szLogMemoryAllocating db "Memory Allocating",0

;AboutProc
szAboutMsgTitle db "About",0
szAboutMsgText db "Vulkan Template",0

;MessageBox
szErr db "Error",0
szErrWarning db "An Error occurred",0Dh,0Ah,"See log.txt",0

;Log
szLogFileName db "vk_log.txt",0
szLogBuffer db 256 dup (0)

;WinMain
szErrInitLogger db "InitLogger Error",0
szErrWriteLog db "WriteLog Error",0
szLogInit db "Application Started",0Dh,0Ah,0
szLogEnterWinMain db "Entering WinMain",0Dh,0Ah,0
szRegisterClass db "RegisterClass",0
szCreateMenu db "CreateMenu",0
szCreateAccel db "CreateAcceleratorTable",0
szCreateWindow db "CreateWindow",0
szCreateStatusBar db "CreateStatusBar",0
szUpdateWindow db "UpdateWindow",0
szLogEnterMessageLoop db "Entering Message Loop",0Dh,0Ah,0
szLogDrawScene db "DrawScene called",0Dh,0Ah,0
szLogWmClose db "WM_CLOSE received",0Dh,0Ah,0
szLogWmDestroy db "WM_DESTROY received",0Dh,0Ah,0
szExitProcess db "ExitProcess",0Dh,0Ah,0

;WndProc
szLogGetClientRect db "GetClientRect",0

;Results
szOK db ": OK",0Dh,0Ah,0
szFirstPassOK db " - First Pass: OK",0Dh,0Ah,0
szSecondPassOK db " - Second Pass: OK",0Dh,0Ah,0
szErrCode db " Error: 0x00000000",0Dh,0Ah,0
szCRLF db 0Dh,0Ah,0

;vkInstance

szEngineName db "No Engine",0
;Log
szVkCreateInstance db "vkCreateInstance",0
szVkDestroyInstance db "vkDestroyInstance",0

;Surface

szVkCreateWin32SurfaceKHR db "vkCreateWin32SurfaceKHR",0
szVkDestroySurface db "vkDestroySurfaceKHR",0

;Physical

szVkEnumeratePhysicalDevices db "vkEnumeratePhysicalDevices",0
szErrNoPhysicalDevices db ". No physical devices found.",0
szVkGetPhysicalDeviceProperties db "GetPhysicalDeviceProperties: ",0

;Queue Family

szVkGetPhysicalDeviceQueueFamilyProperties db "vkGetPhysicalDeviceQueueFamilyProperties",0
szErrNoQueueFamilies db ". No queue families found.",0
szVkGetPhysicalDeviceSurfaceSupportKHR db "vkGetPhysicalDeviceSurfaceSupportKHR",0
szVkQueueFamilySuccess db "Queue Family Selected Successfully",0Dh,0Ah,0
szErrNoGraphicsQueue db "No graphics Queue Families",0Dh,0Ah,0
szErrNoPresentQueue db "No Present Queue Families",0Dh,0Ah,0

;Logical Device

szVkCreateDevice db "vkCreateDevice",0
szVkGetGraphicsQueue db "vkGetDeviceQueue (Graphics Queue)",0
szVkGetPresentQueue db "vkGetDeviceQueue (Present Queue)",0
szVkDestroyDevice db "vkDestroyDevice",0

;Swapchain

szVkGetPhysicalDeviceSurfaceCapabilitiesKHR db "vkGetPhysicalDeviceSurfaceCapabilitiesKHR",0
szLogExtentChosen db "Extent Chosen Successfully",0Dh,0Ah,0
szVkGetPhysicalDeviceSurfaceFormatsKHR db "vkGetPhysicalDeviceSurfaceFormatsKHR",0
szLogFormatChosen db "Format Chosen Successfully",0Dh,0Ah,0
szErrFormat db "Format is NULL",0Dh,0Ah,0
szVkGetPhysicalDeviceSurfacePresentModesKHR db "vkGetPhysicalDeviceSurfacePresentModesKHR",0
szLogPresentModeChosen db "Present Mode Chosen Successfully",0Dh,0Ah,0
szVkCreateSwapchainKHR db "vkCreateSwapchainKHR",0
szVkDestroySwapchainKHR db "vkDestroySwapchainKHR",0
szVkGetSwapchainImagesKHR db "vkGetSwapchainImagesKHR",0
szVkCreateImageView db "vkCreateImageView",0
szVkDestroyImageView db "vkDestroyImageView",0

;Depth Buffer

szVkCreateImage db "vkCreateImage",0
szVkDestroyImage db "vkDestroyImage",0
szVkGetImageMemoryRequirements db "vkGetImageMemoryRequirements",0
szNoImgMemReqs db 0Dh,0Ah,"Error: No Image Memory Requirements Received",0Dh,0Ah,0
szVkGetPhysicalDeviceMemoryProperties db "vkGetPhysicalDeviceMemoryProperties",0
szDeviceMemoryFound db "Device Memory Type Chosen Successfully",0Dh,0Ah,0
szNoDeviceMemory db 0Dh,0Ah,"Error: No proper Device Memory Types Found",0Dh,0Ah,0
szVkAllocateMemory db "vkAllocateMemory",0
szVkFreeMemory db "vkFreeMemory",0
szVkBindImageMemory db "vkBindImageMemory",0
szErrorZeroSize db "Allocation size is zero!", 0Dh, 0Ah, 0

;Render Pass

szVkCreateRenderPass db "vkCreateRenderPass",0
szVkDestroyRenderPass db "vkDestroyRenderPass",0

;Pipeline Layout

szVkCreatePipelineLayout db "vkCreatePipelineLayout",0
szVkDestroyPipelineLayout db "vkDestroyPipelineLayout",0

;Shader Modules

;File Names
szFileNameShaderV db "SPIR-V\vertex.spv",0
szFileNameShaderF db "SPIR-V\fragment.spv",0
;Log
szLogLoadShaderV db "Loading Vertex Shader",0
szLogLoadShaderF db "Loading Fragment Shader",0
szVkCreateVertexShader db "vkCreateShaderModule (Vertex)",0
szVkDestroyVertexShader db "vkDestroyShaderModule (Vertex)",0
szVkCreateFragmentShader db "vkCreateShaderModule (Fragment)",0
szVkDestroyFragmentShader db "vkDestroyShaderModule (Fragment)",0

;Graphics Pipeline

;Shader Entry Points
szEntryPointShaderV db "main",0
szEntryPointShaderF db "main",0
;Log
szVkCreateGraphicsPipeline db "vkCreateGraphicsPipelines",0
szVkDestroyGraphicsPipeline db "vkDestroyPipeline",0

;Command Pool

szVkCreateCommandPool db "vkCreateCommandPool",0
szVkDestroyCommandPool db "vkDestroyCommandPool",0
szVkCreateSemaphoreImageAvailable db "vkCreateSemaphoreImageAvailable",0
szVkDestroySemaphoreImageAvailable db "vkDestroySemaphoreImageAvailable",0
szVkCreateSemaphoreRenderFinished db "vkCreateSemaphoreRenderFinished",0
szVkDestroySemaphoreRenderFinished db "vkDestroySemaphoreRenderFinished",0
szVkCreateFence db "vkCreateFence",0
szVkDestroyFence db "vkDestroyFence",0
szVkAllocateCommandBuffers db "vkAllocateCommandBuffers",0

;FrameBuffer

szVkCreateFrameBuffer db 'vkCreateFramebuffer',0
szVkDestroyFrameBuffer db 'vkDestroyFramebuffer',0

;recordCommandBuffers

szLogRecordCommandBuffers db 'Record Command Buffers',0
szVkBeginCommandBuffer db 'vkBeginCommandBuffer',0
szVkCmdBeginRenderPass db 'vkCmdBeginRenderPass',0
szVkCmdSetViewport db 'vkCmdSetViewport',0
szVkCmdSetScissor db 'vkCmdSetScissor',0
szVkCmdBindPipeline db 'vkCmdBindPipeline',0
szVkCmdDraw db 'vkCmdDraw',0
szVkCmdEndRenderPass db 'vkCmdEndRenderPass',0
szVkEndCommandBuffer db 'vkEndCommandBuffer',0

;Render
szVkAcquireNextImageKHR db 'vkAcquireNextImageKHR',0
szVkResetFences db 'vkResetFences',0
szVkQueueSubmit db 'vkQueueSubmit',0
szVkQueuePresentKHR db 'vkQueuePresentKHR',0
