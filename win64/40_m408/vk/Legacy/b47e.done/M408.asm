;vulkan-tutorial.com
option casemap:none
option prologue:none
option epilogue:none

;WinAPI
includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\Comctl32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\gdiplus.lib
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
include App\91_SpellRAX.asm
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
include Vk\10_Depth.asm
include Vk\11_RenderPass.asm
include Vk\12_PipelineLayout.asm
include Vk\13_ShaderModules.asm
include Vk\14_CommandPool.asm
include Vk\15_ModelBuffers.asm
include Vk\16_GraphicsPipeline.asm
include Vk\17_Semaphores.asm
include Vk\18_Fence.asm
include Vk\19_CommandBuffers.asm
include Vk\20_FrameBuffers.asm
include Vk\21_Record.asm
include Vk\22_PushData.asm
include Vk\23_DrawScene.asm
include Vk\24_SaveAsJpg.asm

include Obj\00_ParseObjFile.asm
include Obj\01_OpenObjFile.asm
include Obj\02_GetReqObjRAM.asm
include Obj\03_AllocObjRAM.asm
include Obj\10_ParseVertex.asm
include Obj\11_ParseNormal.asm
include Obj\12_ParseObject.asm
include Obj\13_ParseGroup.asm
include Obj\14_ParseFace.asm
include Obj\15_CombinedVertex.asm
include Obj\20_ParseMtlFile.asm
include Obj\21_OpenMtlFile.asm
include Obj\22_GetReqMtlRAM.asm
include Obj\23_AllocMtlRAM.asm
include Obj\30_ParseMtlName.asm
;include Obj\31_ParseMtlTexture.asm
include Obj\32_ParseUseMtl.asm
include Obj\33_GroupMaterials.asm
include Obj\80_SkipSpace.asm
include Obj\81_ParseFloat.asm
include Obj\82_ParseSignedInt.asm
include Obj\90_WriteDecimal.asm

end
