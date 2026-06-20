;060_CapabilitiesProc.asm
getCapabilities proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;1. Get surface capabilities
LOG_TEXT szLogVkGetPhysicalDeviceSurfaceCapabilitiesKHR
mov rcx,ghVkPhysicalDevice
mov rdx,ghVkSurface
lea r8,surfaceCapabilities_minImageCount
call vkGetPhysicalDeviceSurfaceCapabilitiesKHR
test eax,eax
jnz lbl_getCapabilities_VkError
LOG_TEXT szOK

;2. Extract min/max extent from capabilities (simplified)
;Use currentExtent if available, else min extent
cmp surfaceCapabilities_currentExtent_width,0
je lbl_useMinImageExtent
cmp surfaceCapabilities_currentExtent_width,-1
je lbl_useMinImageExtent
cmp surfaceCapabilities_currentExtent_height,0
je lbl_useMinImageExtent
cmp surfaceCapabilities_currentExtent_height,-1
je lbl_useMinImageExtent

;lbl_useCurrentExtent:
mov eax,surfaceCapabilities_currentExtent_width
mov chosenExtent_width,eax
mov ebx,surfaceCapabilities_currentExtent_height
mov chosenExtent_height,ebx
LOG_TEXT szLogExtentChosen
jmp lbl_getCapabilities_End

lbl_useMinImageExtent:
mov eax,surfaceCapabilities_minImageExtent_width
mov chosenExtent_width,eax
mov ebx,surfaceCapabilities_minImageExtent_height
mov chosenExtent_height,ebx
LOG_TEXT szLogExtentChosen

jmp lbl_getCapabilities_End

lbl_getCapabilities_VkError:
call SpellVkError

lbl_getCapabilities_End:
;Epilogue
leave
ret
getCapabilities endp

