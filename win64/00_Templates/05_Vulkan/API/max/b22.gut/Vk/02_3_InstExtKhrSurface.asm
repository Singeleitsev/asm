checkKhrSurfaceExt proc
PROLOG 100h

LOG_TEXT szInstExtKhrSurface

mov eax,dwInstanceExtensionsCount
test eax,eax
jz lbl_checkKhrSurfaceExt_VkError

mov rsi,gpExtensionProperties
xor r15,r15 ;index

lbl_CheckNextExtension:
mov rcx,rsi ;string1 = ExtensionName
;Compare extensionName at [rsi] with szKhrSurfaceExtName
lea rdx,szInstExtKhrSurface ;"VK_KHR_surface",0
mov rdi,rsi
call lstrcmpA
test eax,eax
je lbl_checkKhrSurfaceExt_Success

add rsi,104h ;sizeof(VkExtensionProperties) = 260 bytes
inc r15
cmp r15d,dwInstanceExtensionsCount
jb lbl_CheckNextExtension

lbl_checkKhrSurfaceExt_NotFound:
LOG_TEXT szIsNotSupported
mov rax,1 ;NO_DEBUG_UTILS_EXT
jmp lbl_checkKhrSurfaceExt_End

lbl_checkKhrSurfaceExt_Success:
;Store the Extension Name to the Array of Pointers
mov rdi,createInfo_ppEnabledExtensionNames
xor rax,rax
mov eax,createInfo_enabledExtensionCount
shl rax,3 ;* 8 bytes
add rdi,rax
mov qword ptr [rdi],rsi
;Increase the number of Enabled Extensions
inc createInfo_enabledExtensionCount
LOG_TEXT szIsFound
xor rax,rax ;rax = 0 = VK_SUCCESS
jmp lbl_checkKhrSurfaceExt_End

lbl_checkKhrSurfaceExt_VkError:
call SpellVkError
mov rax,1
;jmp lbl_checkKhrSurfaceExt_End

lbl_checkKhrSurfaceExt_End:
EPILOG
checkKhrSurfaceExt endp
