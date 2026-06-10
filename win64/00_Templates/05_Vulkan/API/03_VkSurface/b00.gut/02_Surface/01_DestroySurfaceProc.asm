destroySurface proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

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
;Epilogue
leave
ret
destroySurface endp

