checkDevExtSwapchain proc
PROLOG 100h

mov eax,dwDeviceExtensionsCount
test eax,eax
jz lbl_checkDevExtSwapchain_End

LOG_TEXT szDevExtSwapchain

mov rsi,gpDeviceExtensionProperties
mov rdi,deviceInfo_ppEnabledExtensionNames
xor r15,r15 ;index

lbl_CheckNextDevExt:
mov rcx,rsi ;string1 = DeviceExtensionName
;Compare layerName at [rsi] with szDevExtSwapchain
lea rdx,szDevExtSwapchain ;"VK_KHR_swapchain",0
mov rdi,rsi
call lstrcmpA
test eax,eax
je lbl_checkDevExtSwapchain_Success

add rsi,104h ;sizeof(VkExtensionProperties) = 260 bytes
inc r15
cmp r15d,dwDeviceExtensionsCount
jb lbl_CheckNextDevExt

lbl_checkDevExtSwapchain_NotFound:
LOG_TEXT szIsNotSupported
jmp lbl_checkDevExtSwapchain_End

lbl_checkDevExtSwapchain_Success:
;Store the Device Extension Name to the Array of Pointers
mov rdi,deviceInfo_ppEnabledExtensionNames
mov qword ptr[rdi],rsi ;First Item in the List, no Address computing
;Increase the number of Enabled Device Extensions
inc deviceInfo_enabledExtensionCount
LOG_TEXT szIsFound
jmp lbl_checkDevExtSwapchain_End

;Errors
lbl_checkDevExtSwapchain_WinError:
call SpellWinError
jmp lbl_checkDevExtSwapchain_End

lbl_checkDevExtSwapchain_VkError:
call SpellVkError
;jmp lbl_checkDevExtSwapchain_End

lbl_checkDevExtSwapchain_End:
EPILOG
checkDevExtSwapchain endp
