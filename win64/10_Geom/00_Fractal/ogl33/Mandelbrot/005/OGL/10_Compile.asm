CompileShader proc ShaderIndex:QWORD
;Common Locals
LOCAL hFile:QWORD,nFileSize:DWORD
LOCAL hBuffer:QWORD,dwRead:DWORD
;Specific Locals
LOCAL pszLogLoadShader:QWORD
LOCAL pszFileNameShader:QWORD
LOCAL shaderType:QWORD
LOCAL hShader:QWORD

PROLOG 100h

mov ShaderIndex,rcx

;Specify the Variables
cmp rcx,SHADER_INDEX_VERTEX
je SetVarsShaderV
cmp rcx,SHADER_INDEX_FRAGMENT
je SetVarsShaderF
jmp CompileShader_Error

;For the Vertex Shader
SetVarsShaderV:
lea rax,szLogLoadShaderV
mov pszLogLoadShader,rax
lea rax,szFileNameShaderV
mov pszFileNameShader,rax
mov shaderType,8B31h ;GL_VERTEX_SHADER
mov rax,ghShaderV
mov hShader,rax
jmp CompileShader_Start

;For the Fragment Shader
SetVarsShaderF:
lea rax,szLogLoadShaderF
mov pszLogLoadShader,rax
lea rax,szFileNameShaderF
mov pszFileNameShader,rax
mov shaderType,8B30h ;GL_FRAGMENT_SHADER
mov rax,ghShaderF
mov hShader,rax
;jmp CompileShader_Start

CompileShader_Start:

;1. Report the Start
mov rcx,pszLogLoadShader
call WriteLog

;2. Open the GLSL Source File
lea rcx,szCreateFileA
call WriteLog

mov rcx,pszFileNameShader
mov rdx,80000000h ;GENERIC_READ
mov r8,1 ;FILE_SHARE_READ
xor r9,r9 ;lpSecurityAttributes
mov qword ptr[rsp+20h],3 ;OPEN_EXISTING
mov qword ptr[rsp+28h],80h ;FILE_ATTRIBUTE_NORMAL
mov qword ptr[rsp+30h],0 ;hTemplateFile
call CreateFileA

cmp rax,-1
je CompileShader_Error
mov hFile,rax
lea rcx,szOK
call WriteLog

;3. Get the GLSL Source File Size
lea rcx,szLogFileSize
call WriteLog

mov rcx,hFile
xor rdx,rdx
call GetFileSize

test eax,eax
jz CompileShader_Close
mov nFileSize,eax
mov rcx,rax
call WriteDecimalToLog
lea rcx,szCRLF
call WriteLog

;4. Allocate dwSize
lea rcx,szHeapAlloc
call WriteLog

mov rcx,ghProcessHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,nFileSize
call HeapAlloc

test rax,rax
jz CompileShader_Close
mov hBuffer,rax
lea rcx,szOK
call WriteLog

;5. Read the Data
lea rcx,szLogReadFile
call WriteLog

mov rcx,hFile
mov rdx,hBuffer
xor r8,r8
mov r8d,nFileSize
lea r9,dwRead
mov qword ptr[rsp+20h],0 ;lpOverlapped
call ReadFile

test rax,rax
jz CompileShader_Free
lea rcx,szBytesRead
call WriteLog
xor rcx,rcx
mov ecx,dwRead
call WriteDecimalToLog
lea rcx,szCRLF
call WriteLog

;6. Check the Size
mov eax,nFileSize
cmp dwRead,eax
jne CompileShader_Free

;7. Report Success
lea rcx,szLogSourceLoadSuccess
call WriteLog

;8. Create shader objects
lea rcx,szGlCreateShader
call WriteLog

mov rcx,shaderType
call qword ptr[gpGlCreateShader]

test rax,rax
jz CompileShader_Free
mov hShader,rax

cmp ShaderIndex,SHADER_INDEX_VERTEX
je SaveShaderV
cmp ShaderIndex,SHADER_INDEX_FRAGMENT
je SaveShaderF
jmp CompileShader_Free

SaveShaderV:
mov ghShaderV,rax
jmp CreateShaderOK

SaveShaderF:
mov ghShaderF,rax
;jmp CreateShaderOK

CreateShaderOK:
lea rcx,szOK
call WriteLog

;9. Upload Shader source
lea rcx,szGlShaderSource
call WriteLog

mov rcx,hShader
mov rdx,1
lea r8,hBuffer
lea r9,nFileSize
call qword ptr[gpGlShaderSource]

;Check
lea rcx,szOK
call WriteLog

;10. Compile the Vertex Shader
lea rcx,szGlCompileShader
call WriteLog

mov rcx,hShader
call qword ptr[gpGlCompileShader]

;Check
lea rcx,szOK
call WriteLog

;11. Check compile status
lea rcx,szGlGetShaderiv
call WriteLog

mov rcx,hShader
mov rdx,8B81h ;GL_COMPILE_STATUS
lea r8,gnShaderStatus
call qword ptr[gpGlGetShaderiv]

cmp gnShaderStatus,0
je LogGL
lea rcx,szOK
call WriteLog
jmp CompileSuccess

;12.1. Write the OpenGL Log
LogGL:
mov rcx,hShader
mov rdx,1023 ;maxLength
lea r8,shaderLogLength
lea r9,shaderLogBuffer
call qword ptr[gpGlGetShaderInfoLog]

;12.2. Copy to the Application Log
lea rcx,shaderLogBuffer
call WriteLog
lea rcx,szCRLF
call WriteLog
jmp CompileShader_Free

;13. Report Success
CompileSuccess:
lea rcx,szLogCompileSuccess
call WriteLog

;14. Free the Buffer Normally
mov rcx,ghProcessHeap
xor rdx,rdx ;dwFlags
mov r8,hBuffer
call HeapFree
mov hBuffer,0

;15. Close the File Normally
mov rcx,hFile
call CloseHandle
mov hFile,0

jmp CompileShader_End

;16. Free the Buffer on Error
CompileShader_Free:
cmp hBuffer,0
je CompileShader_Close
mov rcx,ghProcessHeap
xor rdx,rdx ;dwFlags
mov r8,hBuffer
call HeapFree
mov hBuffer,0

;17. Close the File on Error
CompileShader_Close:
cmp hFile,0
je CompileShader_Error
mov rcx,hFile
call CloseHandle
mov hFile,0

CompileShader_Error:
call SpellError

CompileShader_End:
EPILOG
CompileShader endp


