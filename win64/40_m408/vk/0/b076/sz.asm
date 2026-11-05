;WinMain
szWinMain db "WinMain", 0
szMainWndClass db "VulkanWndClass", 0
szMainWndTitle db "Vulkan Template", 0

;Menu
szMenuFile db "&File",0
szMenuFileSave db "&Save",9,"Ctrl+S",0
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
szRAX db "rax = 0000.0000.0000.0000",0

;Log
szLogFileName db "m408vk.log",0
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
szErrorZeroSize db "Allocation size is zero!",0Dh,0Ah,0

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

;Model Buffers

szLogStagingVertexBuffer db "Creating the Staging Vertex Buffer",0Dh,0Ah,0
szVkCreateBuffer db "vkCreateBuffer",0
szVkGetBufferMemoryRequirements db "vkGetBufferMemoryRequirements",0
szVkBindBufferMemory db "vkBindBufferMemory",0
szVkMapMemory db "vkMapMemory",0
szVkUnmapMemory db "vkUnmapMemory",0
szLogDeviceVertexBuffer db "Creating the Device Local Vertex Buffer",0Dh,0Ah,0
szLogStagingIndexBuffer db "Creating the Staging Index Buffer",0Dh,0Ah,0
szLogDeviceIndexBuffer db "Creating the Device Local Index Buffer",0Dh,0Ah,0
szLogAllocatingTransferCmdBuf db "Transferring Staging Buffers to Device Local Buffers",0Dh,0Ah,0
szVkCmdCopyBuffer db "vkCmdCopyBuffer",0
szLogModelBuffersOK db "Model Buffers created successfully",0Dh,0Ah,0
szLogDestroyModelBuffers db "Destroying the Model Buffers",0Dh,0Ah,0

;Graphics Pipeline

;Shader Entry Points
szEntryPointShaderV db "main",0
szEntryPointShaderF db "main",0
;Log
szVkCreateGraphicsPipeline db "vkCreateGraphicsPipelines",0
szVkDestroyGraphicsPipeline db "vkDestroyPipeline",0

;FrameBuffer

szVkCreateFrameBuffer db "vkCreateFramebuffer",0
szVkDestroyFrameBuffer db "vkDestroyFramebuffer",0

;Command Buffers

szLogRecordCommandBuffers db "Record Command Buffers",0Dh,0Ah,0
szVkBeginCommandBuffer db "vkBeginCommandBuffer",0
szVkCmdBeginRenderPass db "vkCmdBeginRenderPass",0
szVkCmdSetViewport db "vkCmdSetViewport",0
szVkCmdSetScissor db "vkCmdSetScissor",0
szVkCmdBindPipeline db "vkCmdBindPipeline",0
;szVkCmdDraw db "vkCmdDraw",0
szVkCmdBindVertexBuffers db "vkCmdBindVertexBuffers",0
szVkCmdBindIndexBuffer db "vkCmdBindIndexBuffer",0
szPushConstants db "vkCmdPushConstants",0
szVkCmdDrawIndexed db "vkCmdDrawIndexed",0
szVkCmdEndRenderPass db "vkCmdEndRenderPass",0
szVkEndCommandBuffer db "vkEndCommandBuffer",0
szErrNoMtlGroups db "No Material groups passed",0Dh,0Ah,0

;Render

szVkAcquireNextImageKHR db "vkAcquireNextImageKHR",0
szVkResetFences db "vkResetFences",0
szVkQueueSubmit db "vkQueueSubmit",0
szVkQueuePresentKHR db "vkQueuePresentKHR",0

;OBJ

szFileNameObj db "Obj\m408.obj",0
szLogObjLoad db "Loading OBJ file",0Dh,0Ah,0
szLogObjOpened  db "OBJ file opened, size: ",0
szLogObjSuccess db "OBJ loaded successfully",0Dh,0Ah,0
szErrObjOpen db "Cannot open OBJ file",0Dh,0Ah,0
szErrObjFileSize db "OBJ file size error",0Dh,0Ah,0
szErrObjMap db "Mapping OBJ failed",0Dh,0Ah,0
szErrUnexpectedEOF db "Unexpected End Of File",0Dh,0Ah,0

;Tokens
szLogFoundObjTokens db "Found OBJ tokens:",0Dh,0Ah,0
szLogCount_mtllib db "mtllib: ",0
szLogCount_o db "o: ",0
szLogCount_g db "g: ",0
szLogCount_usemtl db "usemtl: ",0
szLogCount_s db "s: ",0
szLogCount_v db "v: ",0
szLogCount_vn db "vn: ",0
szLogCount_vt db "vt: ",0
szLogCount_f db "f: ",0

;Parser
szLogParsedObjEntities db "Parsed OBJ entities:",0Dh,0Ah,0
szLogParsed_mtllib db "Parsed Material Libraries: ",0
szLogParsed_o db "Parsed Objects: ",0
szLogParsed_g db "Parsed Groups: ",0
szLogParsed_usemtl db "Used Materials: ",0
szLogParsed_s db "Parsed Smoothing Groups: ",0
szLogParsed_v db "Parsed Vertices: ",0
szLogParsed_vn db "Parsed Normals: ",0
szLogParsed_vt db "Parsed Texture Vectors: ",0
szLogParsed_f db "Parsed Faces: ",0

;MTL

szFileNameMtl db "Obj\m408.mtl",0
szLogMtlLoad db "Loading MTL file",0Dh,0Ah,0
szLogMtlOpened db "MTL file opened, size: ",0
szLogMtlSuccess db "MTL loaded successfully",0Dh,0Ah,0
szErrMtlOpen db "Cannot open MTL file",0Dh,0Ah,0
szErrMtlFileSize db "MTL file size error",0Dh,0Ah,0
szErrMtlMap db "Mapping MTL failed",0Dh,0Ah,0

;Tokens
szLogFoundMtlTokens db "Found MTL tokens:",0Dh,0Ah,0
szLogCount_newmtl db "newmtl: ",0

;Parser
szLogParsedMtlEntities db "Parsed Mtl entities:",0Dh,0Ah,0
szLogParsed_newmtl db "New Materials: ",0

;JPG

szLogSavingAsJpg db "Saving as Jpg",0Dh,0Ah,0
szVkCmdPipelineBarrier db "vkCmdPipelineBarrier",0
szVkCmdCopyImageToBuffer db "vkCmdCopyImageToBuffer",0
szFileNameJpgW dw 'M','o','s','k','v','i','c','h','4','0','8','.','j','p','g',0
szGdiplusInitOK db "GDI+ initialized",0Dh,0Ah,0
szLogSavedAsJpg db "The current view saved in the App folder",0Dh,0Ah,0


