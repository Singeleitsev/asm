;0_Vulkan.asm
;https://vulkan-tutorial.com/code/02_validation_layers.cpp

option casemap:none
option prologue:none
option epilogue:none

;Standard Libraries
includelib D:\bin\dev\asm\ml64\VS2019\lib\user32.lib
includelib D:\bin\dev\asm\ml64\VS2019\lib\kernel32.lib
;GLFW
includelib D:\bin\dev\ogl\glfw-3.4.bin.WIN64\lib-vc2022\glfw3dll.lib
;Vulkan
includelib C:\VulkanSDK\1.4.341.1\Lib\vulkan-1.lib

;WinMain
extrn glfwInit:PROC
extrn glfwWindowHint:PROC
extrn glfwCreateWindow:PROC
extrn glfwWindowShouldClose:PROC
extrn glfwPollEvents:PROC
extrn glfwDestroyWindow:PROC
extrn glfwTerminate:PROC
extrn ExitProcess:PROC
extrn MessageBoxA:PROC
;createInstance
extrn glfwGetRequiredInstanceExtensions:PROC
extrn vkCreateInstance:PROC
extrn vkDestroyInstance:PROC
;Validation
extrn vkEnumerateInstanceLayerProperties:PROC
extrn GetProcessHeap:PROC
extrn HeapAlloc:PROC
extrn vkGetInstanceProcAddr:PROC
extrn OutputDebugStringA:PROC
extrn HeapFree:PROC
;Dump
extrn CreateFileA:PROC
extrn WriteFile:PROC
extrn CloseHandle:PROC

;createInstance
VkApplicationInfo struct
sType dd 0
dummy0 dd 0
pNext dq 0
pApplicationName dq 0
applicationVersion dd 0
dummy1 dd 0
pEngineName dq 0
engineVersion dd 0
apiVersion dd 0
VkApplicationInfo ends

VkInstanceCreateInfo struct
sType dd 0
dummy0 dd 0
pNext dq 0
flags dd 0
dummy1 dd 0
pApplicationInfo dq 0
enabledLayerCount dd 0
dummy2 dd 0
ppEnabledLayerNames dq 0
enabledExtensionCount dd 0
dummy3 dd 0
ppEnabledExtensionNames dq 0
VkInstanceCreateInfo ends

;Validation
VkDebugUtilsMessengerCreateInfoEXT struct
sType dd 0
dummy0 dd 0
pNext dq 0
flags dd 0
messageSeverity dd 0
messageType dd 0
dummy1 dd 0
pfnUserCallback dq 0
pUserData dq 0
VkDebugUtilsMessengerCreateInfoEXT ends

;VkLayerProperties struct
;layerName db 256 dup(0) ;char[256]
;specVersion dd 0 ;VkVersion
;implementationVersion dd 0 ;VkVersion
;description db 256 dup(0) ;char[256]
;VkLayerProperties ends

;VkDebugUtilsMessengerCallbackDataEXT struct
;sType dd 0
;dummy0 dd 0
;pNext dq 0
;flags dd 0
;dummy1 dd 0
;pMessageIdName dq 0
;messageIdNumber dd 0
;dummy2 dd 0
;pMessage dq 0
;queueLabelCount dd 0
;dummy3 dd 0
;pQueueLabels dq 0
;cmdBufLabelCount dd 0
;dummy4 dd 0
;pCmdBufLabels dq 0
;objectCount dd 0
;dummy5 dd 0
;pObjects dq 0
;VkDebugUtilsMessengerCallbackDataEXT ends

.const

sz_AppName db 'Hello Triangle',0
sz_EngineName db 'No Engine',0

sz_createInstance db 'createInstance',0
sz_createInstance_Err db 'Failed to create a vk Instance',0

sz_checkValidationLayerSupport db 'checkValidationLayerSupport',0
sz_checkValidationLayerSupport_Err db 'Validation Layers requested, but not available',0
sz_checkValidationLayerSupport_Err_LayerCount db 'Failed to Get Validation Layer Count',0
sz_checkValidationLayerSupport_Err_GetHeap db 'Failed to Get or Allocate Heap',0
sz_checkValidationLayerSupport_Err_Enumerate db 'Failed to Enumerate Available Layers',0
sz_checkValidationLayerSupport_Err_LayerMissing db 'One or more Validation Layers Missing',0
sz_checkValidationLayerSupport_Err_BadData db 'Wrong Source',0

sz_LayerName db "Available Layer",0

sz_setupDebugMessenger db 'setupDebugMessenger',0
sz_setupDebugMessenger_Err db 'Failed to create a vk Debug Messenger',0

sz_DebugCallback db 'DebugCallback',0
sz_vkCreateDebugUtilsMessengerEXT db 'vkCreateDebugUtilsMessengerEXT',0
sz_vkDestroyDebugUtilsMessengerEXT db 'vkDestroyDebugUtilsMessengerEXT',0

;Constant Vectors of Strings

;const std::vector<const char*> validationLayers = {"VK_LAYER_KHRONOS_validation"};
sz_validationLayer0 db 'VK_LAYER_KHRONOS_validation',0
;sz_validationLayer1 db 'Validation_Layer_1',0
gpValidationLayer0 dq offset sz_validationLayer0
;gpValidationLayer1 dq offset sz_validationLayer1
dq 0 ;Array terminated by a null pointer

;std::vector<const char*> extensions(glfwExtensions, glfwExtensions + glfwExtensionCount);
sz_debugUtilsExt db 'VK_EXT_debug_utils',0
;sz_Extension1 db 'Extension1',0
gpExtension0 dq offset sz_debugUtilsExt
;gpExtension1 dq offset sz_Extension1
dq 0 ;Array terminated by a null pointer

;Dump
sz_DumpFileName db 'AvailableLayers.txt',0
sz_NewLine db 13,10
sz_IndentName db '  Name: ',0
sz_IndentSpec db '  Spec Version: ',0
sz_IndentImpl db '  Implementation Version: ',0
sz_IndentDesc db '  Description: ',0
sz_Header db 'Available Vulkan Layers:',13,10,13,10,0
sz_LayerHeader db 'Layer ',0
sz_ColonSpace db ': ',0
sz_DoubleNewLine db 13,10,13,10,0

.data

ghWnd dq 0
ghVkInstance dq 0
szAppTitle db "Vulkan",0 ;Changeable

;Structures
appInfo VkApplicationInfo <>
createInfo VkInstanceCreateInfo <>
DebugCreateInfo VkDebugUtilsMessengerCreateInfoEXT <>
;CallbackData VkDebugUtilsMessengerCallbackDataEXT <>

;Validation Layers and Debug Messenger
nValidationLayersCount dd 1 ;Set manually because there is "VK_LAYER_KHRONOS_validation"
nAvailableLayersCount dd 0 ;Originally, layerCount
pfnCreateDebugMessenger dq 0 ;Pointer to the Debug Messenger Creation Function
ghDebugMessenger dq 0 ;Handle to the Debug Messenger itself

;Variable Vectors of Strings

;std::vector<VkLayerProperties> availableLayers(layerCount);
ghAvailableLayers dq 0

;std::vector<const char*> extensions(glfwExtensions, glfwExtensions + glfwExtensionCount);
glfwExtensionCount dd 0
glfwExtensions dq 0
combinedExtCount dd 0
combinedExtensions dq 32 dup(0) ;Enough space for GLFW extensions + Custom

;Dump
hDumpFile dq 0
dwBytesWritten dq 0
tempBuffer db 32 dup(0) ;for decimal conversion

.code

include 1_WinMain.asm
include 2_0_0_createInstance.asm
include 2_0_1_checkValidationLayerSupport.asm
include 2_0_2_checkLayers.asm
include 2_0_3_dumpAvailableLayers.asm
include 2_1_0_setupDebugMessenger.asm
include 2_1_1_DebugCallback.asm
include 4_1_DestroyMessenger.asm

end
