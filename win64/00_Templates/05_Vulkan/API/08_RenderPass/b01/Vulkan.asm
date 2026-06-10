;vulkan-tutorial.com
option casemap:none
option prologue:none
option epilogue:none

;Standard Libraries
includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\Comctl32.lib

;Vulkan
includelib C:\VulkanSDK\1.4.341.1\Lib\vulkan-1.lib

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

;Log
extern CreateFileA:proc
extern WriteFile:proc
extern CloseHandle:proc
extern lstrlenA:proc

;SpellError
extern GetLastError:proc
extern MessageBoxA:proc

;Vulkan Core
extern vkCreateInstance:proc
extern vkDestroyInstance:proc
extern vkEnumeratePhysicalDevices:proc
extern vkGetPhysicalDeviceProperties:proc
extern vkGetPhysicalDeviceQueueFamilyProperties:proc
extern vkGetPhysicalDeviceSurfaceSupportKHR:proc
extern vkCreateWin32SurfaceKHR:proc
extern vkDestroySurfaceKHR:proc
extern vkCreateDevice:proc
extern vkDestroyDevice:proc
extern vkGetDeviceQueue:proc
extern vkGetPhysicalDeviceSurfaceCapabilitiesKHR:proc
extern vkGetPhysicalDeviceSurfaceFormatsKHR:proc
extern vkGetPhysicalDeviceSurfacePresentModesKHR:proc
extern vkCreateSwapchainKHR:proc
extern vkDestroySwapchainKHR:proc
extern vkGetSwapchainImagesKHR:proc
extern vkCreateImageView:proc
extern vkDestroyImageView:proc
extern vkCreateRenderPass:proc
extern vkDestroyRenderPass:proc

;Macros
LOG_TEXT macro text
lea rcx,text
call WriteLog
endm

.const

;Menu IDs
IDM_APP_EXIT equ 10Fh
IDM_HELP_ABOUT equ 0F01h

;Vulkan
VK_API_VERSION_1_0 equ 400000h  ;v1.0.0 = 0 << 29 | 1 << 22 | 0 << 12 | 0

.data

;WNDCLASSEXA wcx
align 10h
wcx_cbSize dd 50h ;sizeof(WNDCLASSEX)
wcx_style dd 3 ;CS_HREDRAW | CS_VREDRAW
wcx_lpfnWndProc dq offset WndProc
wcx_cbClsExtra dd 0
wcx_cbWndExtra dd 0
wcx_hInstance dq 0 ;hInstance
wcx_hIcon dq 0 ;LoadIcon(hInstance, MAKEINTRESOURCE(IDI_VULKAN))
wcx_hCursor dq 0 ;LoadCursor(nullptr, IDC_ARROW)
wcx_hbrBackground dq 6 ;(HBRUSH)(COLOR_WINDOW+1)
wcx_lpszMenuName dq 0 ;MAKEINTRESOURCEW(IDC_VULKAN)
wcx_lpszClassName dq offset szMainWndClass
wcx_hIconSm dq 0 ;LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL))

;MSG msg
align 10h
msg_hwnd dq 0
msg_message dd 0
msg_dummy0 dd 0
msg_wParam dq 0
msg_lParam dq 0
msg_time dd 0
msg_pt_x dd 0
msg_pt_y dd 0
msg_dummy1 dd 0

;ACCEL accel
align 10h ;Must be aligned to avoid error 0x03e6
accel \
db 9 ;fVirt = FVIRTKEY | FCONTROL (1 + 8)
db 0 ;dummy
dw 57h ;'W'
dw IDM_APP_EXIT ;command ID
db 1 ;fVirt = FVIRTKEY only
db 0 ;dummy
dw 70h ;VK_F1 = 0x70
dw IDM_HELP_ABOUT ;command ID

;INITCOMMONCONTROLSEX icce
align 10h
icce_dwSize dd 0
icce_dwICC dd 0

;RECT rect
align 10h
RectMain_left dd 0
RectMain_top dd 0
RectMain_right dd 0
RectMain_bottom dd 0
RectMain_width dd 0
RectMain_height dd 0

;VkApplicationInfo appInfo
align 10h
appInfo_sType dd 0 ;VK_STRUCTURE_TYPE_APPLICATION_INFO = 0
appInfo_dummy0 dd 0
appInfo_pNext dq 0
appInfo_pApplicationName dq offset szMainWndTitle
appInfo_applicationVersion dd VK_API_VERSION_1_0
appInfo_dummy1 dd 0
appInfo_pEngineName dq offset szEngineName
appInfo_engineVersion dd VK_API_VERSION_1_0
appInfo_apiVersion dd VK_API_VERSION_1_0

;VkInstanceCreateInfo createInfo
align 10h
createInfo_sType dd 1 ;VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO = 1
createInfo_dummy0 dd 0
createInfo_pNext dq 0
createInfo_flags dd 0
createInfo_dummy1 dd 0
createInfo_pApplicationInfo dq offset appInfo_sType
createInfo_enabledLayerCount dd 0
createInfo_dummy2 dd 0
createInfo_ppEnabledLayerNames dq 0
createInfo_enabledExtensionCount dd 2
createInfo_dummy3 dd 0
createInfo_ppEnabledExtensionNames dq offset ppEnabledExtensions

;VkPhysicalDeviceProperties prop
align 10h
deviceProp0_apiVersion dd 0
deviceProp0_driverVersion dd 0
deviceProp0_vendorID dd 0
deviceProp0_deviceID dd 0
deviceProp0_deviceType dd 0
deviceProp0_deviceName db 100h dup (0) ;256 bytes
deviceProp0_pipelineCacheUUID db 10h dup (0) ;16 bytes
deviceProp0_dummy0 dd 0
deviceProp0_limits db 1F8h dup (0) ;504 bytes
deviceProp0_sparseProperties db 14h dup (0) ;20 bytes
deviceProp0_dummy1 dd 0
align 10h
deviceProp1_apiVersion dd 0
deviceProp1_driverVersion dd 0
deviceProp1_vendorID dd 0
deviceProp1_deviceID dd 0
deviceProp1_deviceType dd 0
deviceProp1_deviceName db 100h dup (0) ;256 bytes
deviceProp1_pipelineCacheUUID db 10h dup (0) ;16 bytes
deviceProp1_dummy0 dd 0
deviceProp1_limits db 1F8h dup (0) ;504 bytes
deviceProp1_sparseProperties db 14h dup (0) ;20 bytes
deviceProp1_dummy1 dd 0

;VkWin32SurfaceCreateInfoKHR surfaceInfo
align 10h
surfaceInfo_sType dd 3B9AED28h ;VK_STRUCTURE_TYPE_WIN32_SURFACE_CREATE_INFO_KHR = 1000009000
surfaceInfo_dummy0 dd 0
surfaceInfo_pNext dq 0 ;NULL
surfaceInfo_flags dd 0
surfaceInfo_dummy1 dd 0
surfaceInfo_hinstance dq 0
surfaceInfo_hwnd dq 0

;VkDeviceQueueCreateInfo deviceQueueInfo
align 10h
queueInfo0_sType dd 2 ;VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
queueInfo0_dummy0 dd 0
queueInfo0_pNext dq 0
queueInfo0_flags dd 0
queueInfo0_queueFamilyIndex dd 0 ;NULL for now
queueInfo0_queueCount dd 1
queueInfo0_dummy1 dd 0
queueInfo0_pQueuePriorities dq offset queuePriority
queueInfo1_sType dd 2 ;VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
queueInfo1_dummy0 dd 0
queueInfo1_pNext dq 0
queueInfo1_flags dd 0
queueInfo1_queueFamilyIndex dd 0 ;NULL for now
queueInfo1_queueCount dd 1
queueInfo1_dummy1 dd 0
queueInfo1_pQueuePriorities dq offset queuePriority

;VkDeviceCreateInfo deviceInfo
align 10h
deviceInfo_sType dd 3 ;VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO
deviceInfo_dummy0 dd 0
deviceInfo_pNext dq 0
deviceInfo_flags dd 0
deviceInfo_queueCreateInfoCount dd 0 ;NULL for now
deviceInfo_pQueueCreateInfos dq offset queueInfo0_sType
deviceInfo_enabledLayerCount dd 0 ;NULL for now
deviceInfo_dummy1 dd 0
deviceInfo_ppEnabledLayerNames dq 0 ;No Layers yet
deviceInfo_enabledExtensionCount dd 1 ;1 for now
deviceInfo_dummy2 dd 0
deviceInfo_ppEnabledExtensionNames dq offset ppDeviceExtensions
deviceInfo_pEnabledFeatures dq 0 ;NULL for now

;VkSurfaceCapabilitiesKHR capabilities
align 10h
surfaceCapabilities_minImageCount dd 0
surfaceCapabilities_maxImageCount dd 0
surfaceCapabilities_currentExtent_width dd 0
surfaceCapabilities_currentExtent_height dd 0
surfaceCapabilities_minImageExtent_width dd 0
surfaceCapabilities_minImageExtent_height dd 0
surfaceCapabilities_maxImageExtent_width dd 0
surfaceCapabilities_maxImageExtent_height dd 0
surfaceCapabilities_maxImageArrayLayers dd 0
surfaceCapabilities_supportedTransforms dd 0
surfaceCapabilities_currentTransform dd 0
surfaceCapabilities_supportedCompositeAlpha dd 0
surfaceCapabilities_supportedUsageFlags dd 0

;VkSwapchainCreateInfoKHR swapChainInfo
align 10h
swapchainInfo_sType dd 3B9ACDE8h ; VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR = 1000001000
swapchainInfo_dummy0 dd 0
swapchainInfo_pNext dq 0
swapchainInfo_flags dd 0
swapchainInfo_dummy1 dd 0
swapchainInfo_surface dq 0 ;ghVkSurface
swapchainInfo_minImageCount dd 2 ;Double Buffering
swapchainInfo_imageFormat dd 0 ;chosenFormat
swapchainInfo_imageColorSpace dd 0 ; VK_COLOR_SPACE_SRGB_NONLINEAR_KHR
swapchainInfo_imageExtent_width dd 0 ;chosenExtent_width
swapchainInfo_imageExtent_height dd 0 ;chosenExtent_height
swapchainInfo_imageArrayLayers dd 1
swapchainInfo_imageUsage dd 10h ;VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT
swapchainInfo_imageSharingMode dd 0 ;VK_SHARING_MODE_EXCLUSIVE
swapchainInfo_queueFamilyIndexCount dd 0
swapchainInfo_dummy2 dd 0
swapchainInfo_pQueueFamilyIndices dq 0
swapchainInfo_preTransform dd 1 ;VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR
swapchainInfo_compositeAlpha dd 1 ;VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR
swapchainInfo_presentMode dd 0 ;chosenPresentMode
swapchainInfo_clipped dd 1 ;VK_TRUE
swapchainInfo_oldSwapchain dq 0

;VkImageViewCreateInfo imageViewInfo
align 10h
viewInfo_sType dd 0Fh ;VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO = 15
viewInfo_dummy0 dd 0
viewInfo_pNext dq 0
viewInfo_flags dd 0
viewInfo_dummy1 dd 0
viewInfo_image dq 0
viewInfo_viewType dd 1 ;VK_IMAGE_VIEW_TYPE_2D
viewInfo_format dd 0 ;chosenFormat
viewInfo_components_r dd 0 ;VK_COMPONENT_SWIZZLE_IDENTITY
viewInfo_components_g dd 0
viewInfo_components_b dd 0
viewInfo_components_a dd 0
viewInfo_subresourceRange_aspectMask dd 1 ;VK_IMAGE_ASPECT_COLOR_BIT
viewInfo_subresourceRange_baseMipLevel dd 0
viewInfo_subresourceRange_levelCount dd 1
viewInfo_subresourceRange_baseArrayLayer dd 0
viewInfo_subresourceRange_layerCount dd 1

;VkAttachmentDescription colorAttachment
align 10h
colorAttachment_flags dd 0
colorAttachment_format dd 0 ;chosenFormat
colorAttachment_samples dd 1 ;VK_SAMPLE_COUNT_1_BIT
colorAttachment_loadOp dd 1 ;VK_ATTACHMENT_LOAD_OP_CLEAR
colorAttachment_storeOp dd 0 ;VK_ATTACHMENT_STORE_OP_STORE
colorAttachment_stencilLoadOp dd 2; VK_ATTACHMENT_LOAD_OP_DONT_CARE ;can be VK_ATTACHMENT_LOAD_OP_CLEAR
colorAttachment_stencilStoreOp dd 1 ;VK_ATTACHMENT_STORE_OP_DONT_CARE ;can be VK_ATTACHMENT_STORE_OP_STORE
colorAttachment_initialLayout dd 0 ;VK_IMAGE_LAYOUT_UNDEFINED
colorAttachment_finalLayout dd 3B9ACDEAh ;VK_IMAGE_LAYOUT_PRESENT_SRC_KHR = 1000001002

;VkAttachmentReference colorAttachmentRef
align 10h
colorAttachmentRef_attachment dd 0
colorAttachmentRef_layout dd 2 ;VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL

;VkAttachmentDescription depthAttachment
;VkAttachmentReference depthAttachmentRef

;VkSubpassDescription subPassDesc
align 10h
subpass_flags dd 0
subpass_pipelineBindPoint dd 0  ;VK_PIPELINE_BIND_POINT_GRAPHICS
subpass_inputAttachmentCount dd 0
subpass_dummy0 dd 0
subpass_pInputAttachments dq 0
subpass_colorAttachmentCount dd 1
subpass_dummy1 dd 0
subpass_pColorAttachments dq offset colorAttachmentRef_attachment
subpass_pResolveAttachments dq 0
subpass_pDepthStencilAttachment dq 0 ;&depthAttachmentRef
subpass_preserveAttachmentCount dd 0
subpass_dummy2 dd 0
subpass_pPreserveAttachments dq 0

;VkSubpassDependency dependency
align 10h
dependency_srcSubpass dd 0FFFFFFFFh ;VK_SUBPASS_EXTERNAL
dependency_dstSubpass dd 0
dependency_srcStageMask dd 400h ;VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT = 1024
dependency_dstStageMask dd 400h ;VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT
dependency_srcAccessMask dd 0
dependency_dstAccessMask dd 100h ;VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT = 256
dependency_dependencyFlags dd 1 ;VK_DEPENDENCY_BY_REGION_BIT

;VkRenderPassCreateInfo
align 10h
renderPassInfo_sType dd 26h ;VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO = 38
renderPassInfo_dummy0 dd 0
renderPassInfo_pNext dq 0
renderPassInfo_flags dd 0
renderPassInfo_attachmentCount dd 1
renderPassInfo_pAttachments dq offset colorAttachment_flags
renderPassInfo_subpassCount dd 1
renderPassInfo_dummy1 dd 0
renderPassInfo_pSubpasses dq offset subpass_flags
renderPassInfo_dependencyCount dd 1
renderPassInfo_dummy2 dd 0
renderPassInfo_pDependencies dq offset dependency_srcSubpass

;Single Numeric Variables

;WinMain
ghInstance dq 0
ghPrevInstance dq 0
gpCmdLine dq 0
gnCmdShow dq 0
gnWndClass dq 0
ghWndMain dq 0
ghWndCurrent dq 0
isActive db 1
isRefreshed db 0

;Menu
ghMenuMain dq 0
ghMenuFile dq 0
ghMenuHelp dq 0
ghAccTable dq 0

;StatusBar
ghWndStatusBar dq 0
idStatusBar dq 0
N_STATUSBAR_PARTS equ 0Ch ;12 Parts
xStatusParts dd N_STATUSBAR_PARTS-1 dup (0),-1 ;12 Variables
;Proportions Empirically Counted for Width = 1024
xStatusProportions dd 80,160,240,320,400,480,560,640,720,820,920 ;11 Separators for 12 Fields

;Vulkan Handles
ghVkInstance dq 0
ghVkPhysicalDevice dq 0
ghVkSurface dq 0
ghVkLogicalDevice dq 0
ghVkGraphicsQueue dq 0
ghVkPresentQueue dq 0
ghVkSwapchain dq 0
ghVkRenderPass dq 0

;Physical Devices
dwPhysicalDeviceCount dd 0
;Static Array for Maximum of 4 Physical Device Handles
gpPhysicalDevice0 dq 0
gpPhysicalDevice1 dq 0
gpPhysicalDevice2 dq 0
gpPhysicalDevice3 dq 0

;Queue Family Properties
dwQueueFamilyCount dd 0
gpQueueFamilyProperties dq 0
gpPresentSupport dq 0
graphicsFamilyIndex dd -1
presentFamilyIndex  dd -1

;Logical Device
queuePriority dd 3f800000h ;1.0f

;Capabilities


;Formats
surfaceFormatsCount dd 0
gpSurfaceFormats dq 0

;Present Modes
presentModesCount dd 0
gpPresentModes dq 0

;Chosen settings
chosenExtent_width dd 0
chosenExtent_height dd 0
chosenFormat dd 0
chosenPresentMode dd 0

;Swapchain
dwSwapchainImageCount dd 0
gpSwapchainImages dq 0 ;Pointer to array of VkImage handles
gpSwapchainImageViews dq 0 ;Pointer to array of VkImageView handles

;Log
ghLogFile dq 0
dwBytesWritten dq 0
gnLastError dd 0

;Strings

;WinMain
szWinMain db "WinMain", 0
szMainWndClass db "VulkanWndClass", 0
szMainWndTitle db "Vulkan Template", 0

;Menu
szMenuFile db "&File",0
szMenuFileExit db "E&xit",9,"Ctrl+W",0
szMenuHelp db "&Help",0
szMenuHelpAbout db "&About...",9,"F1",0

;Status Bar
;https://learn.microsoft.com/en-us/windows/win32/winauto/status-bar-control
szStatusClassName db "msctls_statusbar32",0 ;"STATUSCLASSNAMEW"

;WndProc
szMsgCloseText db "Exit?",0

;AboutProc
szAboutMsgTitle db "About",0
szAboutMsgText db "Vulkan Template",0

;Vulkan
szEngineName db "No Engine",0

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

;MessageBox
szErr db "Error",0
szErrWarning db "An Error occurred",0Dh,0Ah,"See log.txt",0

;Log
szLogFileName db "log.txt",0
szLogBuffer db 256 dup (0)

;WinMain
szErrInitLogger db "InitLogger Error",0
szErrWriteLog db "WriteLog Error",0
szLogInit db "Application Started",0Dh,0Ah,0
szLogEnterWinMain db "Entering WinMain",0Dh,0Ah,0
szLogRegisterClass db "RegisterClass",0
szLogCreateMenu db "CreateMenu",0
szLogCreateAccel db "CreateAcceleratorTable",0
szLogCreateWindow db "CreateWindow",0
szLogCreateStatusBar db "CreateStatusBar",0
szLogUpdateWindow db "UpdateWindow",0
szLogEnterMessageLoop db "Entering Message Loop",0Dh,0Ah,0
szLogDrawScene db "DrawScene called",0Dh,0Ah,0
szLogWmClose db "WM_CLOSE received",0Dh,0Ah,0
szLogWmDestroy db "WM_DESTROY received",0Dh,0Ah,0
szLogExitProcess db "Calling ExitProcess",0Dh,0Ah,0

;WndProc
szLogGetClientRect db "GetClientRect",0

;Vulkan
szLogVkCreateInstance db "vkCreateInstance",0
szLogVkDestroyInstance db "vkDestroyInstance",0
szLogVkEnumeratePhysicalDevices db "vkEnumeratePhysicalDevices",0
szErrNoPhysicalDevices db ". No physical devices found.",0
szLogVkGetPhysicalDeviceProperties db "GetPhysicalDeviceProperties: ",0
szLogVkCreateWin32SurfaceKHR db "vkCreateWin32SurfaceKHR",0
szLogVkDestroySurface db "vkDestroySurfaceKHR",0
szLogVkGetPhysicalDeviceQueueFamilyProperties db "vkGetPhysicalDeviceQueueFamilyProperties",0
szErrNoQueueFamilies db ". No queue families found.",0
szLogMemoryAllocating db "Memory Allocating",0
szLogVkGetPhysicalDeviceSurfaceSupportKHR db "vkGetPhysicalDeviceSurfaceSupportKHR",0
szErrNoGraphicsQueue db "No graphics queue family",0Dh,0Ah,0
szErrNoPresentQueue db "No present queue family",0Dh,0Ah,0
szLogVkQueueFamilySuccess db "Queue Family Selected Successfully",0Dh,0Ah,0
szLogVkCreateDevice db "vkCreateDevice",0
szLogVkGetGraphicsQueue db "vkGetDeviceQueue (Graphics Queue)",0
szLogVkGetPresentQueue db "vkGetDeviceQueue (Present Queue)",0
szLogVkDestroyDevice db "vkDestroyDevice",0
szLogVkGetPhysicalDeviceSurfaceCapabilitiesKHR db "vkGetPhysicalDeviceSurfaceCapabilitiesKHR",0
szLogExtentChosen db "Extent Chosen Successfully",0Dh,0Ah,0
szLogVkGetPhysicalDeviceSurfaceFormatsKHR db "vkGetPhysicalDeviceSurfaceFormatsKHR",0
szLogFormatChosen db "Format Chosen Successfully",0Dh,0Ah,0
szErrFormat db "Format is NULL",0Dh,0Ah,0
szLogVkGetPhysicalDeviceSurfacePresentModesKHR db "vkGetPhysicalDeviceSurfacePresentModesKHR",0
szLogPresentModeChosen db "Present Mode Chosen Successfully",0Dh,0Ah,0
szLogVkCreateSwapchainKHR db "vkCreateSwapchainKHR",0
szLogVkGetSwapchainImagesKHR db "vkGetSwapchainImagesKHR",0
szLogVkCreateImageView db "vkCreateImageView",0
szLogVkDestroySwapchainKHR db "vkDestroySwapchainKHR",0
szLogCreateRenderPass db "vkCreateRenderPass",0
szLogDestroyRenderPass db "vkDestroyRenderPass",0

;Results
szOK db ": OK",0Dh,0Ah,0
szFirstPassOK db " - First Pass: OK",0Dh,0Ah,0
szSecondPassOK db " - Second Pass: OK",0Dh,0Ah,0
szErrCode db " Error: 0x00000000",0Dh,0Ah,0
szCRLF db 0Dh,0Ah,0

.code

;Procedures
include 00_AppFrame\00_WinMain.asm
include 00_AppFrame\10_WndProc.asm
include 00_AppFrame\18_AboutProc.asm
include 00_AppFrame\19_CloseProc.asm
include 00_AppFrame\20_DrawSceneProc.asm
include 00_AppFrame\90_LoggerProc.asm
include 00_AppFrame\99_SpellErrorProc.asm

include 01_vkInstance\00_CreateInstanceProc.asm
include 01_vkInstance\01_DestroyInstanceProc.asm

include 02_Physical\00_EnumeratePhysicalProc.asm

include 03_Surface\00_CreateSurfaceProc.asm
include 03_Surface\01_DestroySurfaceProc.asm

include 04_Family\00_SelectQueueFamilyProc.asm

include 05_Logical\00_CreateDeviceProc.asm
include 05_Logical\01_DestroyDeviceProc.asm

include 06_Swapchain\00_GetCapabilitiesProc.asm
include 06_Swapchain\01_GetFormatsProc.asm
include 06_Swapchain\02_ChoosePresentModeProc.asm
include 06_Swapchain\03_CreateSwapchainProc.asm
include 06_Swapchain\04_DestroySwapchainProc.asm

include 07_RenderPass\00_CreateRenderPassProc.asm
include 07_RenderPass\01_DestroyRenderPassProc.asm

end
