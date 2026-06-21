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

;Device Extension Names - Hardcoded
szDevExtSwapchain db "VK_KHR_swapchain",0
ppDeviceExtensions \ ;Prefix pp stands for "The Pointer to the Array of the Pointers"
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
include Vk\01_0_InstanceLayers.asm
include Vk\01_1_DumpLayers.asm
include Vk\01_2_ValidationLayer.asm
include Vk\02_0_InstanceExtensions.asm
include Vk\02_1_DumpInstExt.asm
include Vk\02_2_DebugUtilsExt.asm
include Vk\02_3_KhrSurfaceExt.asm
include Vk\02_4_KhrWin32SurfaceExt.asm
include Vk\03_VkInstance.asm
include Vk\04_DebugMessenger.asm
include Vk\05_Surface.asm
include Vk\06_00_PhysicalDevices.asm
include Vk\06_01_DumpDevices.asm
include Vk\06_02_SelectPhysicalDevice.asm
include Vk\06_10_GetQueueFamilyProps.asm
include Vk\06_11_SelectQueueFamily.asm
include Vk\06_20_GetCapabilities.asm
include Vk\06_30_GetFormats.asm
include Vk\06_40_ChoosePresentMode.asm
include Vk\07_LogicalDevice.asm
include Vk\08_Swapchain.asm
include Vk\09_ImageViews.asm
include Vk\10_RenderPass.asm
include Vk\11_0_ShaderModules.asm
include Vk\11_1_LoadShaders.asm
include Vk\12_PipelineLayout.asm
include Vk\13_GraphicsPipeline.asm
include Vk\14_0_CommandPool.asm
include Vk\14_1_AllocateCmdBuffers.asm
include Vk\15_Semaphores.asm
include Vk\16_Fence.asm
include Vk\17_FrameBuffers.asm
include Vk\18_RecordCmdBuffers.asm
include Vk\19_DrawScene.asm

end
