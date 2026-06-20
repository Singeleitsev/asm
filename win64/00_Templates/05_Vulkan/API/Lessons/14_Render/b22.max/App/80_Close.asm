;80_CloseProc.asm
CloseWndProc proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

LOG_TEXT szLogWmClose

mov rcx,ghWndMain
lea rdx,szMsgCloseText ;"Exit?"
lea r8,szMainWndTitle ;"Vulkan Template"
mov r9,24h ;MB_YESNO Or MB_ICONQUESTION
Call MessageBoxA
cmp rax,6 ;IDYES
jne lbl_CloseWndProc_End

mov rcx,ghVkLogicalDevice
call vkDeviceWaitIdle

call destroyFrameBuffers
call destroyFence
call destroySemaphores
call destroyFrameBuffers
call destroyCommandPool
call destroyGraphicsPipeline
call destroyPipelineLayout
call destroyShaderModules
call destroyRenderPass
call destroyImageViews
call destroySwapchain
call destroyDevice
call destroySurface
call destroyDebugMessenger
call destroyInstance

mov rcx,ghWndMain
call DestroyWindow

lbl_CloseWndProc_End:
;Epilogue:
leave
ret
CloseWndProc endp

