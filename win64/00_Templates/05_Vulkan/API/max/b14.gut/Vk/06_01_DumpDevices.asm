dumpPhysicalDevices proc
LOCAL dwBytesWritten:DWORD, tempBuffer[32]:BYTE
PROLOG 100h

    ; Create/overwrite output file
    lea rcx, szDeviceDumpFileName
    mov rdx, 40000000h          ; GENERIC_WRITE
    mov r8, 1                   ; FILE_SHARE_READ
    xor r9, r9
    mov qword ptr [rsp+20h], 2  ; CREATE_ALWAYS
    mov qword ptr [rsp+28h], 80h; FILE_ATTRIBUTE_NORMAL
    mov qword ptr [rsp+30h], 0
    call CreateFileA
    cmp rax, -1
    je lbl_dumpPhysicalDevices_End
    mov ghDeviceDumpFile, rax

    ; Write header
    mov rcx, ghDeviceDumpFile
    lea rdx, szDeviceDumpFileHeader
    mov r8, sizeof szDeviceDumpFileHeader - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; Get device count and pointer
    xor r14, r14
    mov r14d, dwPhysicalDeviceCount
    test r14d, r14d
    jz lbl_dumpPhysicalDevices_CloseFile

    mov r15, gpPhysicalDeviceProps
    test r15, r15
    jz lbl_dumpPhysicalDevices_CloseFile

    xor r12d, r12d              ; index

lbl_Device_Next:
    ; ----- write "Device X:" -----
    mov rcx, ghDeviceDumpFile
    lea rdx, szDeviceHeader
    mov r8, sizeof szDeviceHeader - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; convert index to decimal
    mov eax, r12d
    lea rdi, tempBuffer + 31
    mov byte ptr [rdi], 0
    mov r10d, 10
    test eax, eax
    jnz idx_conv_dev
    mov byte ptr [rdi-1], '0'
    dec rdi
    jmp idx_write_dev
idx_conv_dev:
    xor edx, edx
    div r10d
    add dl, '0'
    dec rdi
    mov [rdi], dl
    test eax, eax
    jnz idx_conv_dev
idx_write_dev:
    mov rcx, ghDeviceDumpFile
    mov rdx, rdi
    lea r8, tempBuffer + 31
    sub r8, rdi
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; ": " + newline
    mov rcx, ghDeviceDumpFile
    lea rdx, szColonSpace
    mov r8, sizeof szColonSpace - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    mov rcx, ghDeviceDumpFile
    lea rdx, szCRLF
    mov r8, sizeof szCRLF - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; ----- apiVersion (decimal) -----
    mov rcx, ghDeviceDumpFile
    lea rdx, szApiVersion
    mov r8, sizeof szApiVersion - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    mov eax, dword ptr [r15]    ; apiVersion
    call writeDecimalToFile

    mov rcx, ghDeviceDumpFile
    lea rdx, szCRLF
    mov r8, sizeof szCRLF - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; ----- driverVersion (decimal) -----
    mov rcx, ghDeviceDumpFile
    lea rdx, szDriverVersion
    mov r8, sizeof szDriverVersion - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    mov eax, dword ptr [r15 + 4]
    call writeDecimalToFile

    mov rcx, ghDeviceDumpFile
    lea rdx, szCRLF
    mov r8, sizeof szCRLF - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; ----- vendorID (hex with 0x) -----
    mov rcx, ghDeviceDumpFile
    lea rdx, szVendorID          ; already contains "0x"
    mov r8, sizeof szVendorID - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    mov eax, dword ptr [r15 + 8]
    call writeHex32ToFile       ; writes 8 hex digits (32-bit)

    mov rcx, ghDeviceDumpFile
    lea rdx, szCRLF
    mov r8, sizeof szCRLF - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; ----- deviceID (hex with 0x) -----
    mov rcx, ghDeviceDumpFile
    lea rdx, szDeviceID
    mov r8, sizeof szDeviceID - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    mov eax, dword ptr [r15 + 12]
    call writeHex32ToFile

    mov rcx, ghDeviceDumpFile
    lea rdx, szCRLF
    mov r8, sizeof szCRLF - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; ----- deviceType (string) -----
    mov rcx, ghDeviceDumpFile
    lea rdx, szDeviceType
    mov r8, sizeof szDeviceType - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    mov eax, dword ptr [r15 + 16]
    lea rdx, szDeviceTypeOther
    cmp eax, 1
    jne @f
    lea rdx, szDeviceTypeIntegrated
    jmp type_write
@@: cmp eax, 2
    jne @f
    lea rdx, szDeviceTypeDiscrete
    jmp type_write
@@: cmp eax, 3
    jne @f
    lea rdx, szDeviceTypeVirtual
    jmp type_write
@@: cmp eax, 4
    jne @f
    lea rdx, szDeviceTypeCPU
    ; else other
type_write:
    mov rcx, ghDeviceDumpFile
    mov rbx, rdx
    dec rbx
    @@: inc rbx
    cmp byte ptr [rbx], 0
    jne @b
    sub rbx, rdx
    mov r8, rbx
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    mov rcx, ghDeviceDumpFile
    lea rdx, szCRLF
    mov r8, sizeof szCRLF - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; ----- deviceName (string) -----
    mov rcx, ghDeviceDumpFile
    lea rdx, szDeviceName
    mov r8, sizeof szDeviceName - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    lea rcx, [r15 + 20]         ; deviceName
    call lstrlenA

    mov r8, rax                 ; length
    mov rcx, ghDeviceDumpFile   ; ? restore file handle
    lea rdx, [r15 + 20]         ; pointer to string
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    mov rcx, ghDeviceDumpFile
    lea rdx, szCRLF
    mov r8, sizeof szCRLF - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; ----- pipelineCacheUUID (hex bytes) -----
    mov rcx, ghDeviceDumpFile
    lea rdx, szPipelineCacheUUID
    mov r8, sizeof szPipelineCacheUUID - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    push r13                     ; preserve r13 (caller may rely on it)
    lea rsi, [r15 + 276]         ; pipelineCacheUUID
    mov r13d, 16                 ; VK_UUID_SIZE

uuid_loop:
    movzx eax, byte ptr [rsi]

    ; first nibble
    mov bl, al
    shr bl, 4
    cmp bl, 10
    jl uuid_digit1
    add bl, 'A' - 10
    jmp uuid_write1
uuid_digit1:
    add bl, '0'
uuid_write1:
    mov rcx, ghDeviceDumpFile
    lea rdx, tempBuffer
    mov byte ptr [rdx], bl
    mov byte ptr [rdx+1], 0
    mov r8, 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; second nibble
    mov bl, al
    and bl, 0Fh
    cmp bl, 10
    jl uuid_digit2
    add bl, 'A' - 10
    jmp uuid_write2
uuid_digit2:
    add bl, '0'
uuid_write2:
    mov rcx, ghDeviceDumpFile
    lea rdx, tempBuffer
    mov byte ptr [rdx], bl
    mov byte ptr [rdx+1], 0
    mov r8, 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; space between bytes (except last)
    cmp r13d, 1
    je uuid_no_space
    mov rcx, ghDeviceDumpFile
    lea rdx, szSpace
    mov r8, sizeof szSpace - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile
uuid_no_space:

    inc rsi
    dec r13d
    jnz uuid_loop

    pop r13                      ; restore

    mov rcx, ghDeviceDumpFile
    lea rdx, szCRLF
    mov r8, sizeof szCRLF - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; ----- note about skipped fields -----
    mov rcx, ghDeviceDumpFile
    lea rdx, szLimitsSkipped
    mov r8, sizeof szLimitsSkipped - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    inc r12d
    add r15, 338h               ; sizeof(VkPhysicalDeviceProperties)
    cmp r12d, r14d
    jb lbl_Device_Next

lbl_dumpPhysicalDevices_CloseFile:
    mov rcx, ghDeviceDumpFile
    call CloseHandle

lbl_dumpPhysicalDevices_End:
leave
ret
dumpPhysicalDevices endp



; Helper: write a 32-bit decimal number (in EAX) to the dump file
; Uses tempBuffer and dwBytesWritten (local)
writeDecimalToFile proc
LOCAL dwBytesWritten:DWORD, tempBuffer[32]:BYTE
PROLOG 100h
    lea rdi, tempBuffer + 31
    mov byte ptr [rdi], 0
    mov r10d, 10
    test eax, eax
    jnz dec_conv
    mov byte ptr [rdi-1], '0'
    dec rdi
    jmp dec_write
dec_conv:
    xor edx, edx
    div r10d
    add dl, '0'
    dec rdi
    mov [rdi], dl
    test eax, eax
    jnz dec_conv
dec_write:
    mov rcx, ghDeviceDumpFile
    mov rdx, rdi
    lea r8, tempBuffer + 31
    sub r8, rdi
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile
leave
ret
writeDecimalToFile endp



; Helper: write a 32-bit hex number (in EAX) to the dump file (without prefix)
writeHex32ToFile proc
LOCAL dwBytesWritten:DWORD, tempBuffer[32]:BYTE
PROLOG 100h
    lea rdi, tempBuffer + 31
    mov byte ptr [rdi], 0
    mov ecx, 8                  ; 8 hex digits for 32 bits
    mov ebx, eax
hex_loop:
    dec rdi
    mov eax, ebx
    and eax, 0Fh
    cmp al, 10
    jl hex_digit
    add al, 'A' - 10
    jmp hex_store
hex_digit:
    add al, '0'
hex_store:
    mov byte ptr [rdi], al
    shr ebx, 4
    dec ecx
    jnz hex_loop
    ; write the hex string
    mov rcx, ghDeviceDumpFile
    mov rdx, rdi
    lea r8, tempBuffer + 31
    sub r8, rdi
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile
leave
ret
writeHex32ToFile endp
