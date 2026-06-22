;00_AppFrame

;WinMain
extern LoadIconA:proc
extern LoadCursorA:proc
extern RegisterClassExA:proc
extern CreateWindowExA:proc
extern UpdateWindow:proc
extern PeekMessageA:proc
extern TranslateAcceleratorA:proc
extern TranslateMessage:proc
extern DispatchMessageA:proc
extern ExitProcess:proc
;Menu
extern CreateMenu:proc
extern CreatePopupMenu:proc
extern AppendMenuA:proc
extern CreateAcceleratorTableA:proc
;StatusBar
extern InitCommonControlsEx:proc
extern SendMessageA:proc
;WndProc
extern GetClientRect:proc
extern DefWindowProcA:proc
extern PostQuitMessage:proc
extern DestroyWindow:proc
;Memory
extern GetProcessHeap:proc
extern HeapAlloc:proc
extern HeapFree:proc
;Files
extern CreateFileA:proc
extern GetFileSize:proc
extern lstrlenA:proc
extern ReadFile:proc
extern WriteFile:proc
extern CloseHandle:proc
;Debug
extern GetLastError:proc
extern MessageBoxA:proc

;01_vkInstance

extern vkCreateInstance:proc
extern vkDestroyInstance:proc

;02_Validation

;extern vkGetInstanceProcAddr:proc

;03_Physical

extern vkEnumeratePhysicalDevices:proc
extern vkGetPhysicalDeviceProperties:proc

;04_Surface

extern vkCreateWin32SurfaceKHR:proc
extern vkDestroySurfaceKHR:proc

;05_Family

extern vkGetPhysicalDeviceQueueFamilyProperties:proc
extern vkGetPhysicalDeviceSurfaceSupportKHR:proc

;06_Logical

extern vkCreateDevice:proc
extern vkDestroyDevice:proc
extern vkGetDeviceQueue:proc

;07_Swapchain

extern vkGetPhysicalDeviceSurfaceCapabilitiesKHR:proc
extern vkGetPhysicalDeviceSurfaceFormatsKHR:proc
extern vkGetPhysicalDeviceSurfacePresentModesKHR:proc

extern vkCreateSwapchainKHR:proc
extern vkDestroySwapchainKHR:proc

extern vkGetSwapchainImagesKHR:proc
extern vkCreateImageView:proc
extern vkDestroyImageView:proc

;08_RenderPass

extern vkCreateRenderPass:proc
extern vkDestroyRenderPass:proc

;09_PipelineLayout

extern vkCreatePipelineLayout:proc
extern vkDestroyPipelineLayout:proc

;10_Shaders

extern vkCreateShaderModule:proc
extern vkDestroyShaderModule:proc

;11_GrPipeline

extern vkCreateGraphicsPipelines:proc
extern vkDestroyPipeline:proc

;12_AllocCmd

extern vkCreateCommandPool:proc
extern vkDestroyCommandPool:proc
extern vkCreateSemaphore:proc
extern vkDestroySemaphore:proc
extern vkCreateFence:proc
extern vkDestroyFence:proc
extern vkAllocateCommandBuffers:proc

;13_FrameBuffer

;createFrameBuffer
extern vkCreateFramebuffer:proc
extern vkDestroyFramebuffer:proc
;recordCommandBuffer
extern vkBeginCommandBuffer:proc
extern vkCmdBeginRenderPass:proc
extern vkCmdBindPipeline:proc
extern vkCmdSetViewport:proc
extern vkCmdSetScissor:proc
extern vkCmdDraw:proc
extern vkCmdEndRenderPass:proc
extern vkEndCommandBuffer:proc

