selectPhysicalDevice proc
PROLOG 100h

;Check if we actually have devices
cmp dwPhysicalDeviceCount,0
je lbl_selectPhysicalDevice_NoDevice

mov rsi,ppPhysicalDevices
test rsi,rsi
jz lbl_selectPhysicalDevice_NoDevice

    xor r12, r12                ; best index (start with 0)
    mov r13d, -1                ; best score (lower than any possible)
    xor r14, r14                ; loop index
    mov r15, gpPhysicalDeviceProps

next_device:
    ; 1. Compute base score from device type (offset 16)
    mov eax, dword ptr [r15 + 16]
    xor ebx, ebx                ; score
    cmp eax, 2                  ; VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU
    je discrete
    cmp eax, 1                  ; INTEGRATED
    je integrated
    cmp eax, 3                  ; VIRTUAL
    je virtual
    cmp eax, 4                  ; CPU
    je cpu
    ; else OTHER
    jmp score_done
discrete:
    mov ebx, 1000
    jmp score_done
integrated:
    mov ebx, 500
    jmp score_done
virtual:
    mov ebx, 200
    jmp score_done
cpu:
    mov ebx, 100
score_done:

    ; 2. Add API version (offset 0) – higher is better
    add ebx, dword ptr [r15]    ; apiVersion

    ; 3. (Optional) Vendor bonus – e.g., NVIDIA = 0x10DE
    cmp dword ptr [r15 + 8], 10DEh
    jne no_bonus
    add ebx, 50
no_bonus:

    ; 4. Compare with current best
    cmp ebx, r13d
    jle not_better
    ; New best
    mov r13d, ebx
    mov r12, r14

not_better:
    inc r14
    add r15, 338h               ; next VkPhysicalDeviceProperties
    cmp r14d, dwPhysicalDeviceCount
    jl next_device

    ; 5. Store the chosen handle
    mov rsi, ppPhysicalDevices
    mov rcx, qword ptr [rsi + r12 * 8]
    mov ghVkPhysicalDevice, rcx

    ; 6. Log the chosen device
    LOG_TEXT szLogChosenDevice
    mov rdi, gpPhysicalDeviceProps
    imul r12, 338h
    add rdi, r12
    add rdi, 20                 ; deviceName offset
    mov rcx, rdi
    call WriteLog
LOG_TEXT szCRLF

jmp lbl_selectPhysicalDevice_End

;Errors
lbl_selectPhysicalDevice_NoDevice:
LOG_TEXT szErrNoPhysicalDevices
;jmp lbl_selectPhysicalDevice_VkError

lbl_selectPhysicalDevice_VkError:
call SpellVkError
;jmp lbl_selectPhysicalDevice_End

lbl_selectPhysicalDevice_End:
;Epilogue
leave
ret
selectPhysicalDevice endp
