checkDebugUtilsExt proc

PROLOG 100h

LOG_TEXT szDebugUtilsExtName

mov eax,dwInstanceExtensionsCount
test eax,eax
jz lbl_checkDebugUtilsExt_VkError

mov rsi,gpExtensionProperties
xor r15,r15 ;index

lbl_CheckNextExtension:
mov rcx,rsi ;string1 = ExtensionName
;Compare extensionName at [rsi] with szDebugUtilsExtName
lea rdx,szDebugUtilsExtName ;"VK_EXT_debug_utils",0
mov rdi,rsi
call lstrcmpA
test eax,eax
je lbl_checkDebugUtilsExt_Success

add rsi,104h ;sizeof(VkExtensionProperties) = 260 bytes
inc r15
cmp r15d,dwInstanceExtensionsCount
jb lbl_CheckNextExtension

lbl_checkDebugUtilsExt_NotFound:
LOG_TEXT szIsNotSupported
mov rax,1 ;NO_DEBUG_UTILS_EXT
jmp lbl_checkDebugUtilsExt_End

lbl_checkDebugUtilsExt_Success:
;Store the Extension Name to the Array of Pointers
mov rdi,createInfo_ppEnabledExtensionNames
mov qword ptr[rdi],rsi ;First Item in the List, no Address computing
;Increase the number of Enabled Extensions
inc createInfo_enabledExtensionCount
LOG_TEXT szIsFound
xor rax,rax ;rax = 0 = VK_SUCCESS
jmp lbl_checkDebugUtilsExt_End

lbl_checkDebugUtilsExt_VkError:
call SpellVkError
mov rax,1
;jmp lbl_checkDebugUtilsExt_End

lbl_checkDebugUtilsExt_End:
leave
ret
checkDebugUtilsExt endp
