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
VK_SUCCESS equ 0
;VK_API_VERSION_1_0 = 0 << 29 | 1 << 22 | 0 << 12 | 0
VK_API_VERSION_1_0 equ 400000h  ;Version 1.0.0
VK_NULL_HANDLE equ 0

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
createInfo_enabledExtensionCount dd 0
createInfo_dummy3 dd 0
createInfo_ppEnabledExtensionNames dq 0

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
ghwndStatusBar dq 0
idStatusBar dq 0
;Divide Status Bar by 9 parts
xStatusParts dd 8 dup (0),-1 ;9 Variables
;Proportions Empirically Counted for Width = 1024
xStatusProportions dd 102,204,307,430,552,675,788,901 ;8 Constants

;Vulkan
vkInstance dq 0

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

;Results
szOK db ": OK",0Dh,0Ah,0
szErrCode db " Error: 0x0000",0Dh,0Ah,0

.code

;Procedures
include 00_base_code\00_WinMain.asm
include 00_base_code\10_WndProc.asm
include 00_base_code\18_AboutProc.asm
include 00_base_code\19_CloseProc.asm
include 00_base_code\20_DrawSceneProc.asm
include 00_base_code\90_LoggerProc.asm
include 00_base_code\99_SpellErrorProc.asm

include 01_instance_creation\00_CreateInstanceProc.asm
include 01_instance_creation\01_DestroyInstanceProc.asm

end
