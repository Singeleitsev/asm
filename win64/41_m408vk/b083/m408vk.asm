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
include App\91_WriteDecimal.asm
include App\98_SpellRAX.asm
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
include Vk\12_UBO.asm
include Vk\13_Repack.asm
include Vk\14_PipelineLayout.asm
include Vk\15_ShaderModules.asm
include Vk\16_CommandPool.asm
include Vk\17_VBO.asm
include Vk\18_StagingVertexBuffer.asm
include Vk\19_DeviceVertexBuffer.asm
include Vk\20_StagingIndexBuffer.asm
include Vk\21_DeviceIndexBuffer.asm
include Vk\22_TransferBufferData.asm
include Vk\23_DestroyStagingBuffers.asm
include Vk\24_GraphicsPipeline.asm
include Vk\25_Semaphores.asm
include Vk\26_Fence.asm
include Vk\27_CommandBuffers.asm
include Vk\28_FrameBuffers.asm
include Vk\29_Record.asm
include Vk\30_PushData.asm
include Vk\31_DrawScene.asm
include Vk\32_SaveAsJpg.asm

include Obj\00_ReadObjFile.asm
include Obj\01_CountObjEntities.asm
include Obj\02_AllocObjBuffers.asm
include Obj\10_ReadMtlFile.asm
include Obj\11_CountMtlEntities.asm
include Obj\12_AllocMtlBuffers.asm
include Obj\20_ParseMtlData.asm
include Obj\21_Parse_newmtl.asm
include Obj\22_Properties.asm
include Obj\30_ParseObjData.asm
include Obj\31_Parse_v.asm
include Obj\32_Parse_vn.asm
include Obj\33_Parse_vt.asm
include Obj\34_Parse_f.asm
include Obj\35_Parse_o.asm
include Obj\36_Parse_g.asm
include Obj\37_Parse_usemtl.asm
include Obj\38_Parse_s.asm
include Obj\39_Parse_mtllib.asm
include Obj\40_BuildGeometry.asm
include Obj\41_Combined.asm
include Obj\42_DrawList.asm
include Obj\43_MaterialMap.asm
include Obj\80_TextHelpers.asm
include Obj\81_ParseString.asm
include Obj\82_ParseFloat.asm
include Obj\83_ParseSignedInt.asm

end
