;2_0_3_dumpAvailableLayers.asm
; Dumps all available Vulkan layer properties to "AvailableLayers.txt"

dumpAvailableLayers proc
    push rbp
    mov rbp, rsp
    and rsp, -16
    sub rsp, 100h

    ; Create/overwrite output file
    lea rcx, sz_DumpFileName
    mov rdx, 40000000h          ; GENERIC_WRITE
    mov r8, 1                   ; FILE_SHARE_READ
    xor r9, r9
    mov qword ptr [rsp+20h], 2  ; CREATE_ALWAYS
    mov qword ptr [rsp+28h], 80h; FILE_ATTRIBUTE_NORMAL
    mov qword ptr [rsp+30h], 0
    call CreateFileA
    cmp rax, -1
    je dump_end
    mov hDumpFile, rax

    ; Write header
    mov rcx, hDumpFile
    lea rdx, sz_Header
    mov r8, sizeof sz_Header - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0   ; lpOverlapped = NULL
    call WriteFile

    ; Get available layer count and pointer
    mov r14d, nAvailableLayersCount
    test r14d, r14d
    jz close_file
    mov r15, ghAvailableLayers
    test r15, r15
    jz close_file

    xor r12d, r12d              ; index

next_layer:
    mov rax, r12
    imul rax, 520
    lea r13, [r15 + rax]        ; R13 = VkLayerProperties*

    ; "Layer X: "
    mov rcx, hDumpFile
    lea rdx, sz_LayerHeader
    mov r8, sizeof sz_LayerHeader - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; Convert index to decimal
    mov eax, r12d
    lea rdi, tempBuffer + 31
    mov byte ptr [rdi], 0
    mov r10d, 10
    test eax, eax
    jnz idx_conv
    mov byte ptr [rdi-1], '0'
    dec rdi
    jmp idx_write
idx_conv:
    xor edx, edx
    div r10d
    add dl, '0'
    dec rdi
    mov [rdi], dl
    test eax, eax
    jnz idx_conv
idx_write:
    mov rcx, hDumpFile
    mov rdx, rdi
    lea r8, tempBuffer + 31
    sub r8, rdi
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; ": "
    mov rcx, hDumpFile
    lea rdx, sz_ColonSpace
    mov r8, sizeof sz_ColonSpace - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; newline
    mov rcx, hDumpFile
    lea rdx, sz_NewLine
    mov r8, sizeof sz_NewLine - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; "  Name: "
    mov rcx, hDumpFile
    lea rdx, sz_IndentName
    mov r8, sizeof sz_IndentName - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; layerName (string at R13)
    mov rcx, hDumpFile
    mov rdx, r13
    mov rbx, r13
    dec rbx
@@: inc rbx
    cmp byte ptr [rbx], 0
    jne @b
    sub rbx, r13
    mov r8, rbx
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; newline
    mov rcx, hDumpFile
    lea rdx, sz_NewLine
    mov r8, sizeof sz_NewLine - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; "  Spec Version: "
    mov rcx, hDumpFile
    lea rdx, sz_IndentSpec
    mov r8, sizeof sz_IndentSpec - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; specVersion (dword at R13+256)
    mov eax, dword ptr [r13 + 256]
    lea rdi, tempBuffer + 31
    mov byte ptr [rdi], 0
    mov r10d, 10
    test eax, eax
    jnz spec_conv
    mov byte ptr [rdi-1], '0'
    dec rdi
    jmp spec_write
spec_conv:
    xor edx, edx
    div r10d
    add dl, '0'
    dec rdi
    mov [rdi], dl
    test eax, eax
    jnz spec_conv
spec_write:
    mov rcx, hDumpFile
    mov rdx, rdi
    lea r8, tempBuffer + 31
    sub r8, rdi
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; newline
    mov rcx, hDumpFile
    lea rdx, sz_NewLine
    mov r8, sizeof sz_NewLine - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; "  Implementation Version: "
    mov rcx, hDumpFile
    lea rdx, sz_IndentImpl
    mov r8, sizeof sz_IndentImpl - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; implementationVersion (dword at R13+260)
    mov eax, dword ptr [r13 + 260]
    lea rdi, tempBuffer + 31
    mov byte ptr [rdi], 0
    mov r10d, 10
    test eax, eax
    jnz impl_conv
    mov byte ptr [rdi-1], '0'
    dec rdi
    jmp impl_write
impl_conv:
    xor edx, edx
    div r10d
    add dl, '0'
    dec rdi
    mov [rdi], dl
    test eax, eax
    jnz impl_conv
impl_write:
    mov rcx, hDumpFile
    mov rdx, rdi
    lea r8, tempBuffer + 31
    sub r8, rdi
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; newline
    mov rcx, hDumpFile
    lea rdx, sz_NewLine
    mov r8, sizeof sz_NewLine - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; "  Description: "
    mov rcx, hDumpFile
    lea rdx, sz_IndentDesc
    mov r8, sizeof sz_IndentDesc - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; description (string at R13+264)
    mov rcx, hDumpFile
    lea rdx, [r13 + 264]
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

    ; newline
    mov rcx, hDumpFile
    lea rdx, sz_NewLine
    mov r8, sizeof sz_NewLine - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    ; double newline between layers
    mov rcx, hDumpFile
    lea rdx, sz_DoubleNewLine
    mov r8, sizeof sz_DoubleNewLine - 1
    lea r9, dwBytesWritten
    mov qword ptr [rsp+20h], 0
    call WriteFile

    inc r12d
    cmp r12d, r14d
    jb next_layer

close_file:
    mov rcx, hDumpFile
    call CloseHandle

dump_end:
    leave
    ret
dumpAvailableLayers endp