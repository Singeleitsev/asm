createPipelineCache proc
LOCAL dwBytesRead:DWORD
PROLOG 100h

;1. Try to load existing cache from disk
lea rcx,szPipelineCacheFileName
mov rdx,80000000h ;GENERIC_READ
mov r8,1 ;FILE_SHARE_READ
xor r9,r9
mov qword ptr [rsp+20h],3 ;OPEN_EXISTING
mov qword ptr [rsp+28h],80h ;FILE_ATTRIBUTE_NORMAL
mov qword ptr [rsp+30h],0
call CreateFileA
cmp rax,-1
jne cache_file_exists

;File doesn't exist – create with zero size
mov qword ptr [rsp+20h],2 ;CREATE_ALWAYS
call CreateFileA
cmp rax,-1
jne cache_file_exists
xor rbx,rbx
jmp create_cache

cache_file_exists:
mov rbx,rax ;hFile

;Get file size
mov rcx,rbx
xor rdx,rdx
xor r8,r8
call GetFileSize
mov r12,rax ;cache size

;Allocate heap for cache data
test rax,rax
jz alloc_zero
push rbx
mov rcx,rax
call GetProcessHeap
mov rcx,rax
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,r12
call HeapAlloc
mov r13,rax ;pointer to cache data
pop rbx

;Read the file
mov rcx,rbx
mov rdx,r13
mov r8,r12
lea r9,dwBytesRead
mov qword ptr[rsp+20h],0
call ReadFile

;Close file
mov rcx,rbx
call CloseHandle
jmp create_cache

alloc_zero:
mov r13,0
mov r12,0
mov rcx,rbx
call CloseHandle

create_cache:
;Fill the VkPipelineCacheCreateInfo structure
mov pipelineCacheInfo_initialDataSize,r12
mov pipelineCacheInfo_pInitialData,r13

LOG_TEXT szVkCreatePipelineCache
mov rcx,ghVkLogicalDevice
lea rdx,pipelineCacheInfo_sType ;pCreateInfo
xor r8,r8 ;pAllocator
lea r9,ghVkPipelineCache
call vkCreatePipelineCache
test eax,eax
jnz lbl_createPipelineCache_Error
LOG_TEXT szOK


jmp lbl_createPipelineCache_End

lbl_createPipelineCache_Error:
call SpellVkError

lbl_createPipelineCache_End:
EPILOG
createPipelineCache endp



savePipelineCache proc
LOCAL dwBytesWritten:DWORD
PROLOG 100h

cmp ghVkPipelineCache,0
je lbl_savePipelineCache_End

;1. Get required size
LOG_TEXT szVkGetPipelineCacheData
mov rcx,ghVkLogicalDevice
mov rdx,ghVkPipelineCache
lea r8,dwPipelineCacheSize ;pDataSize
xor r9,r9 ; pData = NULL
call vkGetPipelineCacheData
test rax,rax
jnz lbl_savePipelineCache_VkError
cmp dwPipelineCacheSize,0
je lbl_savePipelineCache_VkError
LOG_TEXT szFirstPassOK

;2. Allocate buffer
LOG_TEXT szLogMemoryAllocating
call GetProcessHeap
test rax,rax
jz lbl_savePipelineCache_WinError

mov rcx,rax ;hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,dwPipelineCacheSize
call HeapAlloc
test rax,rax
jz lbl_savePipelineCache_WinError
mov ghVkPipelineCacheData,rax

;3. Get the actual data
LOG_TEXT szVkGetPipelineCacheData
mov rcx,ghVkLogicalDevice
mov rdx,ghVkPipelineCache
lea r8,dwPipelineCacheSize ;pDataSize
mov r9,ghVkPipelineCacheData ;pData
call vkGetPipelineCacheData
test rax,rax
jnz lbl_savePipelineCache_VkError
LOG_TEXT szSecondPassOK

;4. Write to file
lea rcx,szPipelineCacheFileName
mov rdx,40000000h ;GENERIC_WRITE
mov r8,1
xor r9,r9
mov qword ptr [rsp+20h],2 ;CREATE_ALWAYS
mov qword ptr [rsp+28h],80h
mov qword ptr [rsp+30h],0
call CreateFileA
cmp rax,-1
je lbl_savePipelineCache_WinError
mov ghPipelineCacheFile,rax

;5. Write the buffer
mov rcx,ghPipelineCacheFile
mov rdx,ghVkPipelineCacheData
mov r8,dwPipelineCacheSize
lea r9,dwBytesWritten
mov qword ptr [rsp+20h],0
call WriteFile

;6. Close file
mov rcx,ghPipelineCacheFile
call CloseHandle
mov ghPipelineCacheFile,0

jmp lbl_savePipelineCache_End

lbl_savePipelineCache_WinError:
call SpellWinError
jmp lbl_savePipelineCache_End

lbl_savePipelineCache_VkError:
call SpellVkError
;jmp lbl_savePipelineCache_End

lbl_savePipelineCache_End:
EPILOG
savePipelineCache endp



destroyPipelineCache proc
PROLOG 100h

cmp ghVkPipelineCache, 0
je lbl_createPipelineCache_End

mov rcx,ghVkLogicalDevice
mov rdx,ghVkPipelineCache
xor r8,r8
call vkDestroyPipelineCache
mov ghVkPipelineCache,0

lbl_createPipelineCache_End:
EPILOG
destroyPipelineCache endp
