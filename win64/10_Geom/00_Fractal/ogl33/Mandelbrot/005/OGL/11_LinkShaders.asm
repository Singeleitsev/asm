LinkShaders proc

PROLOG 100h

;1. Create program, attach, link
lea rcx,szGlCreateProgram
call WriteLog

call qword ptr[gpGlCreateProgram]
mov gpShaderProgram,rax

lea rcx,szOK
call WriteLog

;2. Attach the Shaders

;2.1. Attach Vertex Shader
lea rcx,szGlAttachShader
call WriteLog

mov rcx,gpShaderProgram
mov rdx,ghShaderV
call qword ptr[gpGlAttachShader]

lea rcx,szOK
call WriteLog

;2.2. Attach Fragment Shader
lea rcx,szGlAttachShader
call WriteLog

mov rcx,gpShaderProgram
mov rdx,ghShaderF
call qword ptr[gpGlAttachShader]

lea rcx,szOK
call WriteLog

;3. Bind Attributes

;3.1. Bind aPos to attribute location 0
lea rcx,szGlBindAttribLocation
call WriteLog

mov rcx,gpShaderProgram
xor rdx,rdx ;Attribute Location = 0
lea r8,szAttributePos
call qword ptr[gpGlBindAttribLocation]

lea rcx,szOK
call WriteLog

;3.2. Bind aNormal to attribute location 1
lea rcx,szGlBindAttribLocation
call WriteLog

mov rcx,gpShaderProgram
mov rdx,1 ;Attribute Location
lea r8,szAttributeNormal
call qword ptr[gpGlBindAttribLocation]

lea rcx,szOK
call WriteLog

;3.3. Bind aColor to attribute location 2
lea rcx,szGlBindAttribLocation
call WriteLog

mov rcx,gpShaderProgram
mov rdx,2 ;Attribute Location
lea r8,szAttributeColor
call qword ptr[gpGlBindAttribLocation]

lea rcx,szOK
call WriteLog

;4. Link
lea rcx,szGlLinkProgram
call WriteLog

mov rcx,gpShaderProgram
call qword ptr[gpGlLinkProgram]

lea rcx,szOK
call WriteLog

;5. Check link status
lea rcx,szGlGetProgramiv
call WriteLog

mov rcx,gpShaderProgram
mov rdx,8B82h ;GL_LINK_STATUS
lea r8,gnProgramStatus
call qword ptr[gpGlGetProgramiv]
cmp gnProgramStatus,0
je LinkShaders_Error

lea rcx,szOK
call WriteLog

;6.Shaders can be deleted once linked

;6.1. Delete Vertex Shader
lea rcx,szGlDeleteShader
call WriteLog

mov rcx,ghShaderV
call qword ptr[gpGlDeleteShader]

lea rcx,szOK
call WriteLog

;6.2. Delete Fragment Shader
lea rcx,szGlDeleteShader
call WriteLog

mov rcx,ghShaderF
call qword ptr[gpGlDeleteShader]

lea rcx,szOK
call WriteLog

;7. Scene Uniforms

;7.1.  Projection
lea rcx,szGlGetUniformLocation
call WriteLog

mov rcx,gpShaderProgram
lea rdx,szUniformProjection
call qword ptr[gpGlGetUniformLocation]
mov uProjectionLocation,rax

lea rcx,szOK
call WriteLog

;7.2. View
lea rcx,szGlGetUniformLocation
call WriteLog

mov rcx,gpShaderProgram
lea rdx,szUniformView
call qword ptr[gpGlGetUniformLocation]
mov uViewLocation,rax

lea rcx,szOK
call WriteLog

;7.3. Model
lea rcx,szGlGetUniformLocation
call WriteLog

mov rcx,gpShaderProgram
lea rdx,szUniformModel
call qword ptr[gpGlGetUniformLocation]
mov uModelLocation,rax

lea rcx,szOK
call WriteLog

;8. Fractal Uniforms

;8.1. Aspect
lea rcx,szGlGetUniformLocation
call WriteLog

mov rcx,gpShaderProgram
lea rdx,szUniformAspect
call qword ptr[gpGlGetUniformLocation]
mov uAspectLocation,rax

lea rcx,szOK
call WriteLog

;8.2. Center
lea rcx,szGlGetUniformLocation
call WriteLog

mov rcx,gpShaderProgram
lea rdx,szUniformCenter
call qword ptr[gpGlGetUniformLocation]
mov uCenterLocation,rax

lea rcx,szOK
call WriteLog

;8.3. Zoom
lea rcx,szGlGetUniformLocation
call WriteLog

mov rcx,gpShaderProgram
lea rdx,szUniformZoom
call qword ptr[gpGlGetUniformLocation]
mov uZoomLocation,rax

lea rcx,szOK
call WriteLog

;9. Report Success
lea rcx,szLinkShadersSuccess
call WriteLog

jmp LinkShaders_End

LinkShaders_Error:
mov rcx,gpShaderProgram
mov rdx,1023 ;maxLength
lea r8,shaderLogLength
lea r9,shaderLogBuffer
call qword ptr[gpGlGetProgramInfoLog]
lea rcx,shaderLogBuffer
call WriteLog
lea rcx,szCRLF
call WriteLog

LinkShaders_End:
EPILOG
LinkShaders endp


