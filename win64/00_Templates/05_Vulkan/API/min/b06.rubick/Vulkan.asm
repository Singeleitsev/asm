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

include extern.asm ;External Functions
include macro.asm ;Macros

.const

include const.asm ;Numeric Constants

.data

include struct.asm ;Structures
include var.asm ;Single Numeric Variables
include sz.asm ;Text Strings

;Vulkan Extension Names
szExtDebugUtils db "VK_EXT_debug_utils",0
szExtKhrSurface db "VK_KHR_surface",0
szExtKhrWin32Surface db "VK_KHR_win32_surface",0
ppEnabledExtensions \
dq offset szExtKhrSurface
dq offset szExtKhrWin32Surface
dq 0 ;nullptr Terminator

;Device Extension Names
szDevExtSwapchain db "VK_KHR_swapchain",0
ppDeviceExtensions \
dq offset szDevExtSwapchain
dq 0 ;nullptr Terminator

.code

include App\00_WinMain.asm
include App\10_WndProc.asm
include App\70_About.asm
include App\80_Close.asm
include App\90_Logger.asm
include App\99_SpellError.asm

include Vk\00_VkContext.asm
include Vk\01_VkInstance.asm
include Vk\02_Surface.asm
include Vk\03_PhysicalDevices.asm
include Vk\04_QueueFamily.asm
include Vk\05_GetCapabilities.asm
include Vk\06_GetFormats.asm
include Vk\07_PresentMode.asm
include Vk\08_LogicalDevice.asm
include Vk\09_Swapchain.asm
include Vk\10_RenderPass.asm
include Vk\11_PipelineLayout.asm
include Vk\12_ShaderModules.asm
include Vk\13_GraphicsPipeline.asm
include Vk\14_CommandPool.asm
include Vk\15_Semaphores.asm
include Vk\16_Fence.asm
include Vk\17_AllocateCommandBuffers.asm
include Vk\18_FrameBuffers.asm
include Vk\19_Record.asm
include Vk\20_DrawScene.asm

end

