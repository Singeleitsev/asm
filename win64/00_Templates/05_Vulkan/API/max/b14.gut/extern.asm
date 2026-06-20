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
;Strings
extern lstrlenA:proc
extern lstrcmpA:proc
;Files
extern CreateFileA:proc
extern GetFileSize:proc
extern ReadFile:proc
extern WriteFile:proc
extern CloseHandle:proc
;Debug
extern GetLastError:proc
extern MessageBoxA:proc

;Vulkan

;vkInstance
extern vkCreateInstance:proc
extern vkDestroyInstance:proc
;InstanceLayers
extern vkEnumerateInstanceLayerProperties:proc
;InstanceExtensions
extern vkEnumerateInstanceExtensionProperties:proc
;DebugMessenger
extern vkGetInstanceProcAddr:proc
;Surface
extern vkCreateWin32SurfaceKHR:proc
extern vkDestroySurfaceKHR:proc
;PhysicalDevice
extern vkEnumeratePhysicalDevices:proc
extern vkGetPhysicalDeviceProperties:proc
extern vkGetPhysicalDeviceQueueFamilyProperties:proc
extern vkGetPhysicalDeviceSurfaceSupportKHR:proc
extern vkGetPhysicalDeviceSurfaceCapabilitiesKHR:proc
extern vkGetPhysicalDeviceSurfaceFormatsKHR:proc
extern vkGetPhysicalDeviceSurfacePresentModesKHR:proc
;LogicalDevice
extern vkCreateDevice:proc
extern vkGetDeviceQueue:proc
extern vkDeviceWaitIdle:proc
;extern vkQueueWaitIdle:proc ;<---
extern vkDestroyDevice:proc
;Swapchain
extern vkCreateSwapchainKHR:proc
extern vkGetSwapchainImagesKHR:proc
extern vkAcquireNextImageKHR:proc
extern vkDestroySwapchainKHR:proc
;ImageViews
extern vkCreateImageView:proc
extern vkDestroyImageView:proc
;RenderPass
extern vkCreateRenderPass:proc
extern vkDestroyRenderPass:proc
;ShaderModule
extern vkCreateShaderModule:proc
extern vkDestroyShaderModule:proc
;PipelineLayout
extern vkCreatePipelineLayout:proc
extern vkDestroyPipelineLayout:proc
;GraphicsPipeline
extern vkCreateGraphicsPipelines:proc
extern vkDestroyPipeline:proc
;CommandPool
extern vkCreateCommandPool:proc
extern vkAllocateCommandBuffers:proc
;extern vkFreeCommandBuffers:proc ;<---
;extern vkResetCommandPool:proc ;<---
extern vkDestroyCommandPool:proc
;Semaphores
extern vkCreateSemaphore:proc
extern vkDestroySemaphore:proc
;Fence
extern vkCreateFence:proc
extern vkDestroyFence:proc
;FrameBuffer
extern vkCreateFramebuffer:proc
extern vkDestroyFramebuffer:proc
;CommandBuffer
extern vkBeginCommandBuffer:proc
extern vkCmdBeginRenderPass:proc
extern vkCmdEndRenderPass:proc
extern vkCmdSetViewport:proc
extern vkCmdSetScissor:proc
extern vkCmdBindPipeline:proc
extern vkCmdDraw:proc
extern vkEndCommandBuffer:proc
;extern vkResetCommandBuffer:proc ;<---
;ender
extern vkWaitForFences:proc
extern vkResetFences:proc
extern vkQueueSubmit:proc
extern vkQueuePresentKHR:proc
