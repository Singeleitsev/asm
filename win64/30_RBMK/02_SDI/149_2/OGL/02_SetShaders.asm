SetShaders proc
LOCAL hVertexShader:QWORD, hFragmentShader:QWORD, hProgram:QWORD

PROLOG 100h

;Create shader objects
mov rcx,8B31h ;GL_VERTEX_SHADER
call qword ptr[gpGlCreateShader]
mov hVertexShader,rax

mov rcx,8B30h ;GL_FRAGMENT_SHADER
call qword ptr[gpGlCreateShader]
mov hFragmentShader,rax

;Upload vertex source
mov rcx,hVertexShader
mov rdx,1
lea r8,pszVertexShaderSrc
xor r9,r9
call qword ptr[gpGlShaderSource]

;Upload fragment source
mov rcx,hFragmentShader
mov rdx,1
lea r8,pszFragmentShaderSrc
xor r9,r9
call qword ptr[gpGlShaderSource]

;Compile the Vertex Shader
mov rcx,hVertexShader
call qword ptr[gpGlCompileShader]

;Check compile status
mov rcx,hVertexShader
mov rdx,8B81h ;GL_COMPILE_STATUS
lea r8,shaderStatus
call qword ptr[gpGlGetShaderiv]
cmp shaderStatus,0
jne @f

mov rcx,hVertexShader
mov rdx,1024 ;maxLength
lea r8,shaderLogLength
lea r9,shaderLogBuffer
call qword ptr[gpGlGetShaderInfoLog]
lea rcx,shaderLogBuffer
call WriteLog

@@:
;Compile the Fragment Shader
mov rcx,hFragmentShader
call qword ptr[gpGlCompileShader]

;Check compile status
mov rcx,hFragmentShader
mov rdx,8B81h
lea r8,shaderStatus
call qword ptr[gpGlGetShaderiv]
cmp shaderStatus,0
jne @f

mov rcx,hFragmentShader
mov rdx,1024 ;maxLength
lea r8,shaderLogLength
lea r9,shaderLogBuffer
call qword ptr[gpGlGetShaderInfoLog]
lea rcx,shaderLogBuffer
call WriteLog

@@:
;Create program, attach, link
call qword ptr[gpGlCreateProgram]
mov hProgram,rax

mov rcx,hProgram
mov rdx,hVertexShader
call qword ptr[gpGlAttachShader]

mov rcx,hProgram
mov rdx,hFragmentShader
call qword ptr[gpGlAttachShader]

;Bind aPos to attribute location 0
mov rcx,hProgram
xor rdx,rdx ;Attribute Location = 0
lea r8,szAttributePos
call qword ptr[gpGlBindAttribLocation]

;Bind aNormal to attribute location 1
mov rcx,hProgram
mov rdx,1 ;Attribute Location
lea r8,szAttributeNormal
call qword ptr[gpGlBindAttribLocation]

;Bind aColor to attribute location 2
mov rcx,hProgram
mov rdx,2 ;Attribute Location
lea r8,szAttributeColor
call qword ptr[gpGlBindAttribLocation]

;Link
mov rcx,hProgram
call qword ptr[gpGlLinkProgram]

;Check link status
mov rcx,hProgram
mov rdx,8B82h ;GL_LINK_STATUS
lea r8,programStatus
call qword ptr[gpGlGetProgramiv]
cmp programStatus,0
je SetShaders_Error

;Shaders can be deleted once linked
mov rcx,hVertexShader
call qword ptr[gpGlDeleteShader]
mov rcx,hFragmentShader
call qword ptr[gpGlDeleteShader]

mov rax,hProgram
mov ShaderProgram,rax

mov rcx,rax
lea rdx,szUniformLightDir
call qword ptr[gpGlGetUniformLocation]
mov lightDirLocation,eax

lea rcx,szDbgLightDirLoc
call WriteLog
xor rcx,rcx
mov ecx,lightDirLocation
call WriteDecimalToLog
lea rcx,szCRLF
call WriteLog

jmp SetShaders_End

SetShaders_Error:
lea rcx,szErrSetShaders
call WriteLog

SetShaders_End:
EPILOG
SetShaders endp


