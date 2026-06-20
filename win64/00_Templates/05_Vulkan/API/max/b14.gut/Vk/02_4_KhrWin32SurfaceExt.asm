checkKhrWin32SurfaceExt proc

PROLOG 100h

LOG_TEXT szKhrWin32SurfaceExtName

mov eax,dwInstanceExtensionsCount
test eax,eax
jz lbl_checkKhrWin32SurfaceExt_VkError

mov rsi,gpExtensionProperties
xor r15,r15 ;index

lbl_CheckNextExtension:
mov rcx,rsi ;string1 = ExtensionName
;Compare extensionName at [rsi] with szKhrWin32SurfaceExtName
lea rdx,szKhrWin32SurfaceExtName ;"VK_KHR_win32_surface",0
mov rdi,rsi
call lstrcmpA
test eax,eax
je lbl_checkKhrWin32SurfaceExt_Success

add rsi,104h ;sizeof(VkExtensionProperties) = 260 bytes
inc r15
cmp r15d,dwInstanceExtensionsCount
jb lbl_CheckNextExtension

lbl_checkKhrWin32SurfaceExt_NotFound:
LOG_TEXT szIsNotSupported
mov rax,1 ;NO_DEBUG_UTILS_EXT
jmp lbl_checkKhrWin32SurfaceExt_End

lbl_checkKhrWin32SurfaceExt_Success:
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
jmp lbl_checkKhrWin32SurfaceExt_End

lbl_checkKhrWin32SurfaceExt_VkError:
call SpellVkError
mov rax,1
;jmp lbl_checkKhrWin32SurfaceExt_End

lbl_checkKhrWin32SurfaceExt_End:
leave
ret
checkKhrWin32SurfaceExt endp
