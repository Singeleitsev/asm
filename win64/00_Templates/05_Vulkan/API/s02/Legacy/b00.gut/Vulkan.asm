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
extern ShowWindow:proc
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
extern DestroyAcceleratorTable:proc
extern DestroyWindow:proc
;SpellError
extern GetLastError:proc
extern MessageBoxA:proc
;Vulkan Core
extern vkCreateInstance:proc
extern vkDestroyInstance:proc
extern vkEnumeratePhysicalDevices:proc
extern vkGetPhysicalDeviceProperties:proc
;Debug Messenger
extern vkGetInstanceProcAddr:proc

.const

;Menu IDs
IDM_APP_EXIT equ 10Fh
IDM_HELP_ABOUT equ 0F01h

;Vulkan Numeric Constants
VK_SUCCESS equ 0
;VK_API_VERSION_1_0 = 0 << 29 | 1 << 22 | 0 << 12 | 0
VK_API_VERSION_1_0 equ 400000h  ;Version 1.0.0
VK_NULL_HANDLE equ 0

.data

;Structures

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
;Additional Parameters
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
createInfo_enabledLayerCount dd 1 ;Hardcoded Manually
createInfo_dummy2 dd 0
createInfo_ppEnabledLayerNames dq offset ppEnabledLayers
createInfo_enabledExtensionCount dd 3 ;Hardcoded Manually
createInfo_dummy3 dd 0
createInfo_ppEnabledExtensionNames dq offset ppEnabledExtensions

; VkDebugUtilsMessengerCreateInfoEXT
align 10h
dbgMessenger_sType dd 3B9CBE00h ;VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT = 1000128000 ;vk.xml
dbgMessenger_dummy0 dd 0
dbgMessenger_pNext dq 0
dbgMessenger_flags dd 0
;VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT EQU 1
;VK_DEBUG_UTILS_MESSAGE_SEVERITY_INFO_BIT_EXT EQU 10h - Not used
;VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT EQU 100h
;VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT EQU 1000h
dbgMessenger_messageSeverity dd 1101h
;VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT EQU 1h
;VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT EQU 2h
;VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT EQU 4h
dbgMessenger_messageType dd 7
dbgMessenger_dummy1 dd 0
dbgMessenger_pfnUserCallback dq offset DebugCallback
dbgMessenger_pUserData dq 0

;Single Numeric Variables

;WinMain
ghInstance dq 0
ghPrevInstance dq 0
gpCmdLine dq 0
gnCmdShow dq 0
gnWndClass dq 0
ghWndMain dq 0
isActive db 0
isRefreshed db 0

;Menu
ghMenuMain dq 0
ghMenuFile dq 0
ghMenuHelp dq 0
ghAccTable dq 0

;StatusBar
ghwndStatusBar dq 0
idStatusBar dq 0
;Divide Status Bar by 9 parts
xStatusParts dd 8 dup (0),-1 ;9 Variables
;Proportions Empirically Counted for Width = 1024
xStatusProportions dd 102,204,307,430,552,675,788,901 ;8 Constants

;Vulkan
vkInstance dq 0
pfnCreateDebugUtilsMessenger dq 0 ;Function Pointer
vkDebugMessenger dq 0 ;Messenger Handle

;Strings

;WinMain
szWinMain db "WinMain",0
szMainWndClass db "VulkanWndClass",0
szMainWndTitle db "Vulkan Template",0

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
szEngineName db "Generic Engine",0

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
ppEnabledLayers \
dq offset szLayerValidation ;Prefix pp stands for "The Pointer to the Array of the Pointers"
dq 0 ;nullptr Terminator

;SpellError
gnLastError dd 0
szErr db "Error",0
szErrGetModuleHandle db "GetModuleHandle Error: 0x" ;No Zero Terminator
szErrGetModuleHandleCode db 5 dup (0) ;"0000",0
szErrRegisterClass db "RegisterClass Error: 0x"
szErrRegisterClassCode db 5 dup (0)
szErrCreateWindow db "CreateWindow Error: 0x"
szErrCreateWindowCode db 5 dup (0)
szErrCreateMenu db "CreateMenu Error: 0x"
szErrCreateMenuCode db 5 dup (0)
;CreateStatusBar
szErrCreateStatusBar db "CreateStatusBar Error: 0x"
szErrCreateStatusBarCode db 5 dup (0)
;WndProc
szErrGetClientRect db "GetClientRect Error: 0x"
szErrGetClientRectCode db 5 dup (0)
;Vulkan
szErrVkCreateInstance db "Failed to create a Vulkan Instance"
szErrVkCreateInstanceCode db 5 dup (0)
szErrNoDebugUtilsFunction db "vkCreateDebugUtilsMessengerEXT not found",0
szErrNoDebugUtilsCode db 5 dup (0)
szErrCreateDebugMessenger db "CreateDebugMessenger error: 0x",0
szErrCreateDebugMessengerCode db 5 dup (0)

.code

include 00_base_code\00_WinMain.asm
include 00_base_code\10_WndProc.asm
include 00_base_code\19_CloseProc.asm
include 00_base_code\20_AboutProc.asm
include 00_base_code\90_SpellErrorProc.asm

include 01_instance_creation\00_CreateInstanceProc.asm

include 02_validation_layers\01_CreateDebugMessenger.asm
include 02_validation_layers\02_DebugCallback.asm

end

