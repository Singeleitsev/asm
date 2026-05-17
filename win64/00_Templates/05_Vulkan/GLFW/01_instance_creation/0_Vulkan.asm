;101_instance_creation.asm
;https://vulkan-tutorial.com/code/01_instance_creation.cpp

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

.const
sz_AppName db 'Hello Triangle',0
sz_EngineName db 'No Engine',0
sz_createInstance db 'createInstance',0
sz_createInstance_Err db 'Failed to create a vk Instance!',0

.data
ghWnd dq 0
szAppTitle db "Vulkan", 0 ;Changeable
ghVkInstance dq 0

appInfo VkApplicationInfo <>
createInfo VkInstanceCreateInfo <>
glfwExtensionCount dd 0
;glfwExtensions dq 0

.code

include 1_WinMain.asm
include 2_createInstance.asm

end

