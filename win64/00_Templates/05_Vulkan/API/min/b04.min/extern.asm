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

;vkInstance
extern vkCreateInstance:proc
extern vkDestroyInstance:proc
;Surface
extern vkCreateWin32SurfaceKHR:proc
extern vkDestroySurfaceKHR:proc
;Physical Devices
extern vkEnumeratePhysicalDevices:proc
extern vkGetPhysicalDeviceProperties:proc
;Queue Family
extern vkGetPhysicalDeviceQueueFamilyProperties:proc
extern vkGetPhysicalDeviceSurfaceSupportKHR:proc
;Logical Device
extern vkCreateDevice:proc
extern vkDestroyDevice:proc
extern vkDeviceWaitIdle:proc
extern vkGetDeviceQueue:proc
;Swapchain
extern vkGetPhysicalDeviceSurfaceCapabilitiesKHR:proc
extern vkGetPhysicalDeviceSurfaceFormatsKHR:proc
extern vkGetPhysicalDeviceSurfacePresentModesKHR:proc
extern vkCreateSwapchainKHR:proc
extern vkDestroySwapchainKHR:proc
extern vkGetSwapchainImagesKHR:proc
extern vkCreateImageView:proc
extern vkDestroyImageView:proc
;RenderPass
extern vkCreateRenderPass:proc
extern vkDestroyRenderPass:proc
;Pipeline Layout
extern vkCreatePipelineLayout:proc
extern vkDestroyPipelineLayout:proc
;Shader Modules
extern vkCreateShaderModule:proc
extern vkDestroyShaderModule:proc
;Graphics Pipeline
extern vkCreateGraphicsPipelines:proc
extern vkDestroyPipeline:proc
;Command Pool
extern vkCreateCommandPool:proc
extern vkDestroyCommandPool:proc
extern vkCreateSemaphore:proc
extern vkDestroySemaphore:proc
extern vkCreateFence:proc
extern vkDestroyFence:proc
extern vkAllocateCommandBuffers:proc
;FrameBuffer
extern vkCreateFramebuffer:proc
extern vkDestroyFramebuffer:proc
;recordCommandBuffers
extern vkBeginCommandBuffer:proc
extern vkCmdBeginRenderPass:proc
extern vkCmdSetViewport:proc
extern vkCmdSetScissor:proc
extern vkCmdBindPipeline:proc
extern vkCmdDraw:proc
extern vkCmdEndRenderPass:proc
extern vkEndCommandBuffer:proc
;Render
extern vkAcquireNextImageKHR:proc
extern vkWaitForFences:proc
extern vkResetFences:proc
extern vkQueueSubmit:proc
extern vkQueuePresentKHR:proc
