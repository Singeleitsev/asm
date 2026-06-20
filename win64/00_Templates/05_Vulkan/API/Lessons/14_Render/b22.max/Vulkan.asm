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
szExtDebugUtils db "VK_EXT_debug_utils",0
szExtKhrSurface db "VK_KHR_surface",0
szExtKhrWin32Surface db "VK_KHR_win32_surface",0
ppEnabledExtensions \ ;Prefix pp stands for "The Pointer to the Array of the Pointers"
dq offset szExtDebugUtils
dq offset szExtKhrSurface
dq offset szExtKhrWin32Surface
dq 0 ;nullptr Terminator

;Device Extension Names
szDevExtSwapchain db "VK_KHR_swapchain",0
ppDeviceExtensions \ ;Prefix pp stands for "The Pointer to the Array of the Pointers"
dq offset szDevExtSwapchain
dq 0 ;nullptr Terminator

;Vulkan Layer Names
;szLayer00 db "VK_LAYER_NV_optimus",0
;szLayer01 db "VK_LAYER_NV_present",0
;szLayer02 db "VK_LAYER_EOS_Overlay",0
;szLayer03 db "VK_LAYER_LUNARG_api_dump",0
;szLayer04 db "VK_LAYER_LUNARG_gfxreconstruct",0
;szLayer05 db "VK_LAYER_KHRONOS_synchronization2",0
szLayerValidation db "VK_LAYER_KHRONOS_validation",0
;szLayer07 db "VK_LAYER_LUNARG_monitor",0
;szLayer08 db "VK_LAYER_LUNARG_screenshot",0
;szLayer09 db "VK_LAYER_KHRONOS_profiles",0
;szLayer10 db "VK_LAYER_KHRONOS_shader_object",0
;szLayer11 db "VK_LAYER_LUNARG_crash_diagnostic",0
ppEnabledLayers \ ;Prefix pp stands for "The Pointer to the Array of the Pointers"
dq offset szLayerValidation
dq 0 ;nullptr Terminator

.code

include App\00_WinMain.asm
include App\10_WndProc.asm
include App\70_About.asm
include App\80_Close.asm
include App\90_Logger.asm
include App\99_SpellError.asm

include Vk\00_VkInstance.asm
include Vk\01_DebugMessenger.asm
include Vk\02_Surface.asm
include Vk\03_0_EnumPhysicalDevice.asm
include Vk\03_1_SelectPhysicalDevice.asm
include Vk\03_2_GetQueueFamilyProps.asm
include Vk\03_3_SelectQueueFamily.asm
include Vk\03_4_GetCapabilities.asm
include Vk\03_5_GetFormats.asm
include Vk\03_6_ChoosePresentMode.asm
include Vk\04_LogicalDevice.asm
include Vk\05_Swapchain.asm
include Vk\06_ImageViews.asm
include Vk\07_RenderPass.asm
include Vk\08_0_ShaderModules.asm
include Vk\08_1_LoadShaders.asm
include Vk\09_PipelineLayout.asm
include Vk\10_GraphicsPipeline.asm
include Vk\11_0_CommandPool.asm
include Vk\11_1_AllocateCmdBuffers.asm
include Vk\12_Semaphores.asm
include Vk\13_Fence.asm
include Vk\14_FrameBuffers.asm
include Vk\15_RecordCmdBuffers.asm
include Vk\16_DrawScene.asm

end
