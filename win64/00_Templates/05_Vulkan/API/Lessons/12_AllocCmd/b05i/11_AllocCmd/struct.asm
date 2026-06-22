;VkCommandPoolCreateInfo
align 10h
cmdPoolInfo_sType dd 27h ;VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO = 39
cmdPoolInfo_dummy0 dd 0
cmdPoolInfo_pNext  dq 0
cmdPoolInfo_flags dd 2 ;VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT
cmdPoolInfo_queueFamilyIndex dd 0

;VkSemaphoreCreateInfo
align 10h
semaphoreInfo_sType dd 9 ;VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO
semaphoreInfo_dummy0 dd 0
semaphoreInfo_pNext dq 0
semaphoreInfo_flags dd 0

;VkFenceCreateInfo
align 10h
fenceInfo_sType dd 8 ;VK_STRUCTURE_TYPE_FENCE_CREATE_INFO
fenceInfo_dummy0 dd 0
fenceInfo_pNext dq 0
fenceInfo_flags dd 1 ;VK_FENCE_CREATE_SIGNALED_BIT (start signaled)

;VkCommandBufferAllocateInfo
align 10h
allocInfo_sType dd 28h ;VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO = 40
allocInfo_dummy0 dd 0
allocInfo_pNext dq 0
allocInfo_commandPool dq 0
allocInfo_level dd 0 ;VK_COMMAND_BUFFER_LEVEL_PRIMARY
allocInfo_commandBufferCount dd 0

