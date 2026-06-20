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
szLogFileName db "VulkanLog.txt",0
szLogBuffer db 256 dup (0)

;WinMain
szErrInitLogger db "InitLogger Error",0
szErrWriteLog db "WriteLog Error",0
szLogInit db "Application Started",0Dh,0Ah,0
szLogEnterWinMain db "Entering WinMain",0Dh,0Ah,0
szLogRegisterClass db "RegisterClass",0
szLogCreateMenu db "CreateMenu",0
szLogCreateAccel db "CreateAcceleratorTable",0
szLogCreateWindow db "CreateWindow",0
szLogCreateStatusBar db "CreateStatusBar",0
szLogUpdateWindow db "UpdateWindow",0
szLogEnterMessageLoop db "Entering Message Loop",0Dh,0Ah,0
szLogDrawScene db "DrawScene called",0Dh,0Ah,0
szLogWmClose db "WM_CLOSE received",0Dh,0Ah,0
szLogWmDestroy db "WM_DESTROY received",0Dh,0Ah,0
szLogExitProcess db "Calling ExitProcess",0Dh,0Ah,0

;WndProc
szLogGetClientRect db "GetClientRect",0

;Results
szOK db ": OK",0Dh,0Ah,0
szFirstPassOK db " - First Pass: OK",0Dh,0Ah,0
szSecondPassOK db " - Second Pass: OK",0Dh,0Ah,0
szErrCode db " Error: 0x00000000",0Dh,0Ah,0
szCRLF db 0Dh,0Ah,0

;Vulkan

;vkInstance
szEngineName db "No Engine",0

;Log
szLogVkCreateInstance db "vkCreateInstance",0
szLogVkDestroyInstance db "vkDestroyInstance",0

;Instance Layers
szLogVkEnumerateInstanceLayerProperties db "vkEnumerateInstanceLayerProperties",0
szErrNoInstanceLayers db ". No Instance Layers found.",0

;Dump
szLayerDumpFileName db "VulkanInstLayersDump.txt",0
szLayerDumpFileHeader db "Available Vulkan Instance Layers:",0
szLayerHeader db 13,10,13,10,"Layer ",0
szLayerName db 13,10,"Name: ",0
szLayerSpec db 13,10,"Spec Version: ",0
szLayerVer db 13,10,"Implementation Version: ",0
szLayerDesc db 13,10,"Description: ",0
szColonSpace db ": ",0

;Validation Layer
szValidationLayerName db "VK_LAYER_KHRONOS_validation",0
szIsFound db " is found",13,10,0
szIsNotSupported db " is not supported on this system",13,10,0

;Instance Extensions
szLogVkEnumerateInstanceExtensionProperties db "vkEnumerateInstanceExtensionProperties",0
szErrNoInstanceExtensions db ". No Instance Extensions found.",0

;Dump
szInstExtDumpFileName db "VulkanInstExtDump.txt",0
szInstExtDumpFileHeader db "Available Vulkan Instance Extensions:",0
szInstExtHeader db 13,10,13,10,"Instance Extension ",0
szInstExtName db 13,10,"Name: ",0
szInstExtSpec db 13,10,"Spec Version: ",0

;Instance Extensoin Names
szDebugUtilsExtName db "VK_EXT_debug_utils",0
szKhrSurfaceExtName db "VK_KHR_surface",0
szKhrWin32SurfaceExtName db "VK_KHR_win32_surface",0

;DebugMessenger
szVkCreateDebugUtilsMessengerEXT db "vkCreateDebugUtilsMessengerEXT",0
szVkDestroyDebugUtilsMessengerEXT db "vkDestroyDebugUtilsMessengerEXT",0
szLogVkGetInstanceProcAddr db "vkGetInstanceProcAddr",0

;Surface
szLogVkCreateWin32SurfaceKHR db "vkCreateWin32SurfaceKHR",0
szLogVkDestroySurface db "vkDestroySurfaceKHR",0

;PhysicalDevice
szLogVkEnumeratePhysicalDevices db "vkEnumeratePhysicalDevices",0
szErrNoPhysicalDevices db ". No physical devices found.",0
szLogVkGetPhysicalDeviceProperties db "GetPhysicalDeviceProperties: ",0

;Dump
szDeviceDumpFileName db "VulkanDeviceDump.txt",0
szDeviceDumpFileHeader db "Physical Device Properties:",0
szDeviceHeader db 13,10,"Device ",0
szApiVersion db "apiVersion:",0
szDriverVersion db "driverVersion:",0
szVendorID db "vendorID:",0
szDeviceID db "deviceID:",0
szDeviceType db "deviceType:",0
szDeviceName db "deviceName:",0
szPipelineCacheUUID db "pipelineCacheUUID:",0
;szVkPhysicalDeviceLimits db "limits:",0
;szSparseProperties db "sparseProperties:",0
szSpace db " ",0
szLimitsSkipped db "limits and sparseProperties: (skipped for brevity)",13,10,0

;Device type strings
szDeviceTypeDiscrete db "Discrete GPU",0
szDeviceTypeIntegrated db "Integrated GPU",0
szDeviceTypeVirtual db "Virtual GPU",0
szDeviceTypeOther db "Other",0
szDeviceTypeCPU db "CPU",0

;choosePhysicalDevice
szLogChosenDevice db "Chosen physical device: ",0

;QueueFamily
szLogVkGetPhysicalDeviceQueueFamilyProperties db "vkGetPhysicalDeviceQueueFamilyProperties",0
szErrNoQueueFamilies db ". No queue families found.",0
szLogVkGetPhysicalDeviceSurfaceSupportKHR db "vkGetPhysicalDeviceSurfaceSupportKHR",0
szLogVkQueueFamilySuccess db "Queue Family Selected Successfully",0Dh,0Ah,0
szErrNoGraphicsQueue db "No graphics Queue Families",0Dh,0Ah,0
szErrNoPresentQueue db "No Present Queue Families",0Dh,0Ah,0

;LogicalDevice
szLogVkCreateDevice db "vkCreateDevice",0
szLogVkGetGraphicsQueue db "vkGetDeviceQueue (Graphics Queue)",0
szLogVkGetPresentQueue db "vkGetDeviceQueue (Present Queue)",0
szLogVkDestroyDevice db "vkDestroyDevice",0

;Swapchain
szLogVkGetPhysicalDeviceSurfaceCapabilitiesKHR db "vkGetPhysicalDeviceSurfaceCapabilitiesKHR",0
szLogExtentChosen db "Extent Chosen Successfully",0Dh,0Ah,0
szLogVkGetPhysicalDeviceSurfaceFormatsKHR db "vkGetPhysicalDeviceSurfaceFormatsKHR",0
szLogFormatChosen db "Format Chosen Successfully",0Dh,0Ah,0
szErrFormat db ". Format is NULL",0
szLogVkGetPhysicalDeviceSurfacePresentModesKHR db "vkGetPhysicalDeviceSurfacePresentModesKHR",0
szLogPresentModeChosen db "Present Mode Chosen Successfully",0Dh,0Ah,0
szLogVkCreateSwapchainKHR db "vkCreateSwapchainKHR",0
szLogVkGetSwapchainImagesKHR db "vkGetSwapchainImagesKHR",0
szLogVkCreateImageView db "vkCreateImageView",0
szLogVkDestroySwapchainKHR db "vkDestroySwapchainKHR",0


;ImageViews
;No indicated text

;RenderPass
szLogVkCreateRenderPass db "vkCreateRenderPass",0
szLogVkDestroyRenderPass db "vkDestroyRenderPass",0

;Shaders

;File Names
szFileNameShaderV db "SPIR-V\vertex.spv",0
szFileNameShaderF db "SPIR-V\fragment.spv",0

;Log
szLogLoadShaderV db "Loading Vertex Shader",0
szLogLoadShaderF db "Loading Fragment Shader",0
szLogVkCreateVertexShader db "vkCreateShaderModule (Vertex)",0
szLogVkDestroyVertexShader db "vkDestroyShaderModule (Vertex)",0
szLogVkCreateFragmentShader db "vkCreateShaderModule (Fragment)",0
szLogVkDestroyFragmentShader db "vkDestroyShaderModule (Fragment)",0

;PipelineLayout
szLogVkCreatePipelineLayout db "vkCreatePipelineLayout",0
szLogVkDestroyPipelineLayout db "vkDestroyPipelineLayout",0

;GraphicsPipeline

;Shader Entry Points
szEntryPointShaderV db "main",0
szEntryPointShaderF db "main",0

;Log
szLogVkCreateGraphicsPipeline db "vkCreateGraphicsPipelines",0
szLogVkDestroyGraphicsPipeline db "vkDestroyPipeline",0

;CommandPool
szLogVkCreateCommandPool db "vkCreateCommandPool",0
szLogVkDestroyCommandPool db "vkDestroyCommandPool",0

;Semaphores
szLogVkCreateImageAvailable db "vkCreateSemaphoreImageAvailable",0
szLogVkCreateSemaphoreImageAvailable db "vkCreateSemaphoreImageAvailable",0
szLogVkDestroySemaphoreImageAvailable db "vkDestroySemaphoreImageAvailable",0
szLogVkCreateSemaphoreRenderFinished db "vkCreateSemaphoreRenderFinished",0
szLogVkDestroySemaphoreRenderFinished db "vkDestroySemaphoreRenderFinished",0

;Fence
szLogVkCreateFence db "vkCreateFence",0
szLogVkDestroyFence db "vkDestroyFence",0
szLogVkAllocateCommandBuffers db "vkAllocateCommandBuffers",0

;FrameBuffer
szLogVkCreateFrameBuffer db "vkCreateFramebuffer",0
szLogVkDestroyFrameBuffer db "vkDestroyFramebuffer",0

;recordCommandBuffers
szLogRecordCommandBuffers db "Record Command Buffers",0Dh,0Ah,0
szLogVkBeginCommandBuffer db "vkBeginCommandBuffer",0
szLogVkCmdBeginRenderPass db "vkCmdBeginRenderPass",0
szLogVkCmdSetViewport db "vkCmdSetViewport",0
szLogVkCmdSetScissor db "vkCmdSetScissor",0
szLogVkCmdBindPipeline db "vkCmdBindPipeline",0
szLogVkCmdDraw db "vkCmdDraw",0
szLogVkCmdEndRenderPass db "vkCmdEndRenderPass",0
szLogVkEndCommandBuffer db "vkEndCommandBuffer",0

;Render
szLogVkAcquireNextImageKHR db "vkAcquireNextImageKHR",0
szLogVkResetFences db "vkResetFences",0
szLogVkQueueSubmit db "vkQueueSubmit",0
szLogVkQueuePresentKHR db "vkQueuePresentKHR",0
