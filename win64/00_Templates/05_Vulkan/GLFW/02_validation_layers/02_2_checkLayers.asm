;02_1_checkLayers.asm
; ------------------------------------------------------------------
; Returns: RAX = 0 if all requested layers are available,
;          RAX = 1 if at least one layer missing,
;          RAX = BAD if bad data
; ------------------------------------------------------------------

;For i = 1 to nValidationLayersCount
; layerFound = 0
; For j = 1 to nAvailableLayersCount
;  If validationLayers[i] = availableLayers[j].layerName Then
;   layerFound = 1
;   break
;  End If
; Next j
; If layerFound == 0 Then Return false
;Next i
;Return true

;Source pattern:
;const std::vector<const char*> validationLayers = {"VK_LAYER_KHRONOS_validation"};
;sz_validationLayer0 db 'VK_LAYER_0',0
;sz_validationLayer1 db 'VK_LAYER_1',0
;gpValidationLayer0 dq offset sz_validationLayer0
;gpValidationLayer1 dq offset sz_validationLayer1
;dq 0 ;Array terminated by a null pointer

;Destination Pattern:
;VkLayerProperties struct
;layerName db 256 dup(0) ;char[256]
;specVersion dd 0 ;VkVersion
;implementationVersion dd 0 ;VkVersion
;description db 256 dup(0) ;char[256]
;VkLayerProperties ends

checkLayers proc

;Load Source Counter
mov r9d,nValidationLayersCount
test r9d,r9d
jz lbl_checkLayers_Success

;Load Destination Counter
mov r10d,nAvailableLayersCount
test r10d,r10d
jz lbl_checkLayers_LayerMissing

;Address to the first Pointer of validationLayers Pointer Array
lea rsi,gpValidationLayer0

lbl_checkLayers_OuterLoop:
mov r8,qword ptr[rsi] ;r8 = Address of the first Name of validationLayers Name String

;Quick first-character test (must be 'V')
;cmp byte ptr[r8], 'V'
;jne lbl_checkLayers_Err_BadData

;Inner loop: scan availableLayers
mov rdi,ghAvailableLayers ;ghAvailableLayers = availableLayers.data()
mov r11d,r10d ;inner counter = nAvailableLayersCount

lbl_checkLayers_InnerLoop:
;Compare strings: validationLayers (r8) vs availableLayers name (rdi)
mov rcx,r8 ;rcx = validationLayers string
mov rdx,rdi ;rdx = availableLayers name

lbl_checkLayers_CompareBytes:
mov al,byte ptr[rcx]
cmp al,byte ptr[rdx]
jne lbl_checkLayers_NextAvailable
test al,al
je lbl_checkLayers_FoundMatch
inc rcx
inc rdx
jmp lbl_checkLayers_CompareBytes

lbl_checkLayers_NextAvailable:
add rdi,208h ;sizeof(VkLayerProperties) = 520 bytes
dec r11d
jnz lbl_checkLayers_InnerLoop

;No match for this Validation Layer
jmp lbl_checkLayers_LayerMissing

lbl_checkLayers_FoundMatch:
add rsi,8 ;Next Validation Layer Pointer
dec r9d
jnz lbl_checkLayers_OuterLoop

;All Validation Layers found
jmp lbl_checkLayers_Success

lbl_checkLayers_LayerMissing:
mov rax,1
ret

lbl_checkLayers_Err_BadData:
mov rax,0BADh
ret

lbl_checkLayers_Success:
xor rax,rax
ret

checkLayers endp
