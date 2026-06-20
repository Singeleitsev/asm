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

;00_vkInstance
extern vkCreateInstance:proc
extern vkDestroyInstance:proc
;01_Validation
extern vkGetInstanceProcAddr:proc
;02_Surface
extern vkCreateWin32SurfaceKHR:proc
extern vkDestroySurfaceKHR:proc
;03_PhysicalDevice
extern vkEnumeratePhysicalDevices:proc
extern vkGetPhysicalDeviceProperties:proc
extern vkGetPhysicalDeviceQueueFamilyProperties:proc
extern vkGetPhysicalDeviceSurfaceSupportKHR:proc
extern vkGetPhysicalDeviceSurfaceCapabilitiesKHR:proc
extern vkGetPhysicalDeviceSurfaceFormatsKHR:proc
extern vkGetPhysicalDeviceSurfacePresentModesKHR:proc
;04_LogicalDevice
extern vkCreateDevice:proc
extern vkGetDeviceQueue:proc
extern vkDeviceWaitIdle:proc
;extern vkQueueWaitIdle:proc ;<---
extern vkDestroyDevice:proc
;05_Swapchain
extern vkCreateSwapchainKHR:proc
extern vkGetSwapchainImagesKHR:proc
extern vkAcquireNextImageKHR:proc
extern vkDestroySwapchainKHR:proc
;06_ImageViews
extern vkCreateImageView:proc
extern vkDestroyImageView:proc
;07_RenderPass
extern vkCreateRenderPass:proc
extern vkDestroyRenderPass:proc
;08_ShaderModule
extern vkCreateShaderModule:proc
extern vkDestroyShaderModule:proc
;09_PipelineLayout
extern vkCreatePipelineLayout:proc
extern vkDestroyPipelineLayout:proc
;10_GraphicsPipeline
extern vkCreateGraphicsPipelines:proc
extern vkDestroyPipeline:proc
;11_CommandPool
extern vkCreateCommandPool:proc
extern vkAllocateCommandBuffers:proc
;extern vkFreeCommandBuffers:proc ;<---
;extern vkResetCommandPool:proc ;<---
extern vkDestroyCommandPool:proc
;12_Semaphore
extern vkCreateSemaphore:proc
extern vkDestroySemaphore:proc
;13_Fence
extern vkCreateFence:proc
extern vkDestroyFence:proc
;14_FrameBuffer
extern vkCreateFramebuffer:proc
extern vkDestroyFramebuffer:proc
;15_CommandBuffer
extern vkBeginCommandBuffer:proc
extern vkCmdBeginRenderPass:proc
extern vkCmdEndRenderPass:proc
extern vkCmdSetViewport:proc
extern vkCmdSetScissor:proc
extern vkCmdBindPipeline:proc
extern vkCmdDraw:proc
extern vkEndCommandBuffer:proc
;extern vkResetCommandBuffer:proc ;<---

;16_Render
extern vkWaitForFences:proc
extern vkResetFences:proc
extern vkQueueSubmit:proc
extern vkQueuePresentKHR:proc
