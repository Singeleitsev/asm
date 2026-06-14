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
;01_vkInstance
include Vk\000_CreateInstance.asm
include Vk\001_DestroyInstance.asm
;02_Validation
include Vk\010_CreateDebugMessenger.asm
include Vk\011_DebugCallback.asm
include Vk\012_DestroyDebugMessenger.asm
;03_Physical
include Vk\020_EnumeratePhysical.asm
;04_Surface
include Vk\030_CreateSurface.asm
include Vk\031_DestroySurface.asm
;05_Family
include Vk\040_GetQueueFamilyProps.asm
include Vk\041_SelectQueueFamily.asm
;06_Logical
include Vk\050_CreateDevice.asm
include Vk\051_DestroyDevice.asm
;07_Swapchain
include Vk\060_GetCapabilities.asm
include Vk\061_GetFormats.asm
include Vk\062_ChoosePresentMode.asm
include Vk\063_CreateSwapchain.asm
include Vk\064_DestroySwapchain.asm
;08_RenderPass
include Vk\070_CreateRenderPass.asm
include Vk\071_DestroyRenderPass.asm
;09_PipelineLayout
include Vk\080_CreatePipelineLayout.asm
include Vk\081_DestroyPipelineLayout.asm
;10_Shaders
include Vk\090_LoadShaders.asm
include Vk\091_CreateShaderModules.asm
include Vk\092_DestroyShaderModules.asm
;11_GrPipeline
include Vk\100_CreateGrPipeline.asm
include Vk\101_DestroyGrPipeline.asm
;12_AllocCmd
include Vk\110_CreateCommandPool.asm
include Vk\111_CreateSemaphores.asm
include Vk\112_CreateFence.asm
include Vk\113_AllocateCommandBuffers.asm
include Vk\114_DestroyCommandObjects.asm
;13_FrameBuffer
include Vk\120_CreateFrameBuffers.asm
include Vk\121_RecordCommandBuffers.asm
include Vk\122_DestroyFrameBuffers.asm
;14_Render
include Vk\130_DrawScene.asm

end

