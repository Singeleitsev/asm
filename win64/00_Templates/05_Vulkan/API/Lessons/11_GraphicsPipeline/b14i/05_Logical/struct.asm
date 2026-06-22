;VkDeviceQueueCreateInfo
align 10h
queueInfo0_sType dd 2 ;VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
queueInfo0_dummy0 dd 0
queueInfo0_pNext dq 0
queueInfo0_flags dd 0
queueInfo0_queueFamilyIndex dd 0 ;NULL for now
queueInfo0_queueCount dd 1
queueInfo0_dummy1 dd 0
queueInfo0_pQueuePriorities dq offset queuePriority
;immediately After
queueInfo1_sType dd 2 ;VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
queueInfo1_dummy0 dd 0
queueInfo1_pNext dq 0
queueInfo1_flags dd 0
queueInfo1_queueFamilyIndex dd 0 ;NULL for now
queueInfo1_queueCount dd 1
queueInfo1_dummy1 dd 0
queueInfo1_pQueuePriorities dq offset queuePriority

;VkDeviceCreateInfo
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
