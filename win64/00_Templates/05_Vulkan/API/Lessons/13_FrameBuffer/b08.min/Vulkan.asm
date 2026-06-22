;vulkan-tutorial.com
option casemap:none
option prologue:none
option epilogue:none

;WinAPI
includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\Comctl32.lib

;Vulkan API
includelib C:\VulkanSDK\1.4.341.1\Lib\vulkan-1.lib

;External Functions
include extern.asm

;Macros
include macro.asm

.const

include const.asm

.data

;Structures
include struct.asm

;Single Numeric Variables
include var.asm

;Strings
include sz.asm

;Vulkan Function Names
sz_vkCreateDebugUtilsMessengerEXT db "vkCreateDebugUtilsMessengerEXT",0
sz_vkDestroyDebugUtilsMessengerEXT db "vkDestroyDebugUtilsMessengerEXT",0

;Vulkan Extension Names
szExtKhrSurface db "VK_KHR_surface",0
szExtKhrWin32Surface db "VK_KHR_win32_surface",0
;szExtDebugUtils db "VK_EXT_debug_utils",0
ppEnabledExtensions \ ;Prefix pp stands for "The Pointer to the Array of the Pointers"
dq offset szExtKhrSurface
dq offset szExtKhrWin32Surface
;dq offset szExtDebugUtils
dq 0 ;nullptr Terminator

;Device Extension Names
szDevExtSwapchain db "VK_KHR_swapchain",0
ppDeviceExtensions \ ;Prefix pp stands for "The Pointer to the Array of the Pointers"
dq offset szDevExtSwapchain
dq 0 ;nullptr Terminator

;Vulkan Layer Names
;szLayerValidation db "VK_LAYER_KHRONOS_validation",0
;ppEnabledLayers \ ;Prefix pp stands for "The Pointer to the Array of the Pointers"
;dq offset szLayerValidation
;dq 0 ;nullptr Terminator

.code

include 00_AppFrame\00_WinMain.asm
include 00_AppFrame\10_WndProc.asm
include 00_AppFrame\20_DrawScene.asm
include 00_AppFrame\70_About.asm
include 00_AppFrame\80_Close.asm
include 00_AppFrame\90_Logger.asm
include 00_AppFrame\99_SpellError.asm
include 01_vkInstance\00_CreateInstance.asm
include 01_vkInstance\01_DestroyInstance.asm
;include 02_Validation\00_CreateDebugMessenger.asm
;include 02_Validation\01_DebugCallback.asm
;include 02_Validation\02_DestroyDebugMessenger.asm
include 03_Physical\00_EnumeratePhysical.asm
include 04_Surface\00_CreateSurface.asm
include 04_Surface\01_DestroySurface.asm
include 05_Family\00_GetQueueFamilyProps.asm
include 05_Family\01_SelectQueueFamily.asm
include 06_Logical\00_CreateDevice.asm
include 06_Logical\01_DestroyDevice.asm
include 07_Swapchain\00_GetCapabilities.asm
include 07_Swapchain\01_GetFormats.asm
include 07_Swapchain\02_ChoosePresentMode.asm
include 07_Swapchain\03_CreateSwapchain.asm
include 07_Swapchain\04_DestroySwapchain.asm
include 08_RenderPass\00_CreateRenderPass.asm
include 08_RenderPass\01_DestroyRenderPass.asm
include 09_PipelineLayout\00_CreatePipelineLayout.asm
include 09_PipelineLayout\01_DestroyPipelineLayout.asm
include 10_Shaders\00_LoadShaders.asm
include 10_Shaders\01_CreateShaderModules.asm
include 10_Shaders\02_DestroyShaderModules.asm
include 11_GrPipeline\00_CreateGrPipeline.asm
include 11_GrPipeline\01_DestroyGrPipeline.asm
include 12_AllocCmd\00_CreateCommandPool.asm
include 12_AllocCmd\01_CreateSemaphores.asm
include 12_AllocCmd\02_CreateFence.asm
include 12_AllocCmd\03_AllocateCommandBuffers.asm
include 12_AllocCmd\04_DestroyCommandObjects.asm
include 13_FrameBuffer\00_CreateFrameBuffers.asm
include 13_FrameBuffer\01_RecordCommandBuffers.asm
include 13_FrameBuffer\02_DestroyFrameBuffers.asm

end
