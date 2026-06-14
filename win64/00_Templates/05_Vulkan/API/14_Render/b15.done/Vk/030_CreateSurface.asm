;030_CreateSurfaceProc.asm
createSurface proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

LOG_TEXT szLogVkCreateWin32SurfaceKHR

;Fill the VkWin32SurfaceCreateInfoKHR Structure
mov rax,ghInstance
mov surfaceInfo_hinstance,rax
mov rax,ghWndMain
mov surfaceInfo_hwnd,rax

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
;Epilogue
leave
ret
createSurface endp