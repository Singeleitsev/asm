;VkApplicationInfo
align 10h
appInfo_sType dd 0 ;VK_STRUCTURE_TYPE_APPLICATION_INFO = 0
appInfo_dummy0 dd 0
appInfo_pNext dq 0
appInfo_pApplicationName dq offset szMainWndTitle
appInfo_applicationVersion dd 400000h ;VK_API_VERSION_1_0 = 1.0.0 = 0 << 29 | 1 << 22 | 0 << 12 | 0
appInfo_dummy1 dd 0
appInfo_pEngineName dq offset szEngineName
appInfo_engineVersion dd 400000h ;VK_API_VERSION_1_0
appInfo_apiVersion dd 400000h ;VK_API_VERSION_1_0

;VkInstanceCreateInfo
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