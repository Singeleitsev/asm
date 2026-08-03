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
szLogDestroyModelBuffers db "Destroying the Model Buffers",0

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
szErrNoMtlGroups db "No Material groups passed",0Dh,0Ah,0
szVkCmdEndRenderPass db "vkCmdEndRenderPass",0
szVkEndCommandBuffer db "vkEndCommandBuffer",0

;Render

szVkAcquireNextImageKHR db "vkAcquireNextImageKHR",0
szVkResetFences db "vkResetFences",0
szVkQueueSubmit db "vkQueueSubmit",0
szVkQueuePresentKHR db "vkQueuePresentKHR",0

;OBJ

szFileNameObj db "Obj\m408.obj",0
szLogObjLoad db "Loading OBJ file",0Dh,0Ah,0
szLogObjOpened  db "OBJ file opened, size: ",0
szLogObjectsCount db "Objects: ",0
szLogGroupsCount db "Groups: ",0
szLogSubGroupsCount db "SubGroups: ",0
szLogMtlLibsCount db "Material Libraries Used: ",0
szLogVerticesCount db "Vertices: ",0
szLogNormalsCount db "Normals: ",0
szLogTextureCoordsCount db "Texture coordinates: ",0
szLogFacesCount db "Faces: ",0
szLogObjSuccess db "OBJ loaded successfully",0Dh,0Ah,0
szErrLoadObjOpen db "Cannot open OBJ file",0
szErrLoadObjFileSize db "OBJ file size error",0
szErrLoadObjMap db "Mapping OBJ failed",0
szErrNoObjects db "No Objects Found. Using Default Object Index",0
szErrNoGroups db "No Groups Found. Using Default Group Index",0
szErrNoSubGroups db "NoSubGroups Found. Using Default SubGroup Index",0
szErrNoMtlLibs db "No Materials Libraries Links. Using Default Material",0
szErrNoVertices db "Error. No Vertices Found",0
szErrNoNormals db "Error. No Normals Found",0
szErrNoTextureCoords db "No TextureCoordinates Found",0
szErrNoFaces db "Error. No Faces Found",0
szErrNoIndices db "Error. No Objects Computed",0
szErrObjEncounter db "OBJ Encounter Error",0
szErrObjAllocator db "OBJ Allocator Error",0
szErrObjFiller db "OBJ Filler Error",0
szErrOBJCapacity db "FindOrAddCombinedVertex: capacity exceeded",0Dh,0Ah,0
szErrParseFace db "ParseFace: invalid face format",0Dh,0Ah,0

;MTL

szFileNameMtl db "Obj\m408.mtl",0
;szFileNameChrome db "Obj\Chrome.tga",0
szLogMtlLoad db "Loading MTL file",0Dh,0Ah,0
szLogMtlOpened db "MTL file opened, size: ",0
szLogTextureNamesCount db "Texture Names: ",0
szLogMtlSuccess db "MTL loaded successfully",0Dh,0Ah,0
szErrLoadMtlOpen db "Cannot open MTL file",0
szErrLoadMtlFileSize db "MTL file size error",0
szErrLoadMtlMap db "Mapping MTL failed",0
szErrNoTextureNames db "No Texture Names Found",0

;JPG

szLogSavingAsJpg db "Saving as Jpg",0Dh,0Ah,0
szVkCmdPipelineBarrier db "vkCmdPipelineBarrier",0
szVkCmdCopyImageToBuffer db "vkCmdCopyImageToBuffer",0
szFileNameJpgW dw 'M','o','s','k','v','i','c','h','4','0','8','.','j','p','g',0
szGdiplusInitOK db "GDI+ initialized",0Dh,0Ah,0
szLogSavedAsJpg db "The current view saved in the App folder",0Dh,0Ah,0


