;051_DestroyDeviceProc.asm
destroyDevice proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

cmp ghVkLogicalDevice,0
je lbl_destroyDevice_End

LOG_TEXT szLogVkDestroyDevice
mov rcx,ghVkLogicalDevice
xor rdx,rdx
call vkDestroyDevice
mov ghVkLogicalDevice,0
LOG_TEXT szOK

lbl_destroyDevice_End:
;Epilogue
leave
ret
destroyDevice endp

