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
include 00_AppFrame\extern.asm
include 01_vkInstance\extern.asm
include 02_Physical\extern.asm
include 03_Surface\extern.asm
include 04_Family\extern.asm
include 05_Logical\extern.asm
include 06_Swapchain\extern.asm
include 07_RenderPass\extern.asm
include 08_PipelineLayout\extern.asm
include 09_Shaders\extern.asm
include 10_GrPipeline\extern.asm

;Macros
include 00_AppFrame\macro.asm

.const

include 00_AppFrame\const.asm

;Vulkan
VERTEX_SPV_SIZE equ 200h ;Vertex Shader Size = 512 bytes
FRAGMENT_SPV_SIZE equ 168h ;Fragment Shader Size = 360 bytes

.data

;Structures
include 00_AppFrame\struct.asm
include 01_vkInstance\struct.asm
include 02_Physical\struct.asm
include 03_Surface\struct.asm
;include 04_Family\struct.asm
include 05_Logical\struct.asm
include 06_Swapchain\struct.asm
include 07_RenderPass\struct.asm
include 08_PipelineLayout\struct.asm
include 09_Shaders\struct.asm
include 10_GrPipeline\struct.asm

;Single Numeric Variables
include 00_AppFrame\var.asm
include 01_vkInstance\var.asm
include 02_Physical\var.asm
include 03_Surface\var.asm
include 04_Family\var.asm
include 05_Logical\var.asm
include 06_Swapchain\var.asm
include 07_RenderPass\var.asm
include 08_PipelineLayout\var.asm
include 09_Shaders\var.asm
include 10_GrPipeline\var.asm

;Strings
include 00_AppFrame\sz.asm
include 01_vkInstance\sz.asm
include 02_Physical\sz.asm
include 03_Surface\sz.asm
include 04_Family\sz.asm
include 05_Logical\sz.asm
include 06_Swapchain\sz.asm
include 07_RenderPass\sz.asm
include 08_PipelineLayout\sz.asm
include 09_Shaders\sz.asm
include 10_GrPipeline\sz.asm

;Vulkan Function Names
;Temporarily Empty

;Vulkan Extension Names
szExtKhrSurface db "VK_KHR_surface",0
szExtKhrWin32Surface db "VK_KHR_win32_surface",0
ppEnabledExtensions \ ;Prefix pp stands for "The Pointer to the Array of the Pointers"
dq offset szExtKhrSurface
dq offset szExtKhrWin32Surface
dq 0 ;nullptr Terminator

;Device Extension Names
szDevExtSwapchain db "VK_KHR_swapchain",0
ppDeviceExtensions \ ;Prefix pp stands for "The Pointer to the Array of the Pointers"
dq offset szDevExtSwapchain
dq 0 ;nullptr Terminator

;Vulkan Layer Names
;Temporarily Empty

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
include 02_Physical\00_EnumeratePhysical.asm
include 03_Surface\00_CreateSurface.asm
include 03_Surface\01_DestroySurface.asm
include 04_Family\00_GetQueueFamilyProps.asm
include 04_Family\01_SelectQueueFamily.asm
include 05_Logical\00_CreateDevice.asm
include 05_Logical\01_DestroyDevice.asm
include 06_Swapchain\00_GetCapabilities.asm
include 06_Swapchain\01_GetFormats.asm
include 06_Swapchain\02_ChoosePresentMode.asm
include 06_Swapchain\03_CreateSwapchain.asm
include 06_Swapchain\04_DestroySwapchain.asm
include 07_RenderPass\00_CreateRenderPass.asm
include 07_RenderPass\01_DestroyRenderPass.asm
include 08_PipelineLayout\00_CreatePipelineLayout.asm
include 08_PipelineLayout\01_DestroyPipelineLayout.asm
include 09_Shaders\00_LoadShaders.asm
include 09_Shaders\01_CreateShaderModules.asm
include 09_Shaders\02_DestroyShaderModules.asm
include 10_GrPipeline\00_CreateGrPipeline.asm
include 10_GrPipeline\01_DestroyGrPipeline.asm

end
