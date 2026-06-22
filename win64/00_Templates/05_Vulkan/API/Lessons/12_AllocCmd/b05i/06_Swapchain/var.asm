;Handles
ghVkSwapchain dq 0

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

