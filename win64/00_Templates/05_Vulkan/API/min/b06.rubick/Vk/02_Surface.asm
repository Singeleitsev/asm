createSurface proc
PROLOG 100h

;Fill the VkWin32SurfaceCreateInfoKHR Structure
mov rax,ghInstance
mov surfaceInfo_hinstance,rax
mov rax,ghWndMain
mov surfaceInfo_hwnd,rax

LOG_TEXT szLogVkCreateWin32SurfaceKHR
mov rcx,ghVkInstance
lea rdx,surfaceInfo_sType
xor r8,r8 ;pAllocator = NULL
lea r9,ghVkSurface ;pSurface
call vkCreateWin32SurfaceKHR
test eax,eax
jnz lbl_createSurface_VkError
cmp ghVkSurface,0
je lbl_createSurface_VkError
LOG_TEXT szOK

jmp lbl_createSurface_End

;Errors
lbl_createSurface_VkError:
call SpellVkError

lbl_createSurface_End:
EPILOG
createSurface endp



destroySurface proc
PROLOG 100h

;Skip if No vkSurface
cmp ghVkSurface,0
je lbl_destroySurface_End

;Destroy the vkSurface
LOG_TEXT szLogVkDestroySurface
mov rcx,ghVkInstance
mov rdx,ghVkSurface
xor r8,r8
call vkDestroySurfaceKHR
mov ghVkSurface,0
LOG_TEXT szOK
;jmp lbl_destroySurface_End

lbl_destroySurface_End:
EPILOG
destroySurface endp
