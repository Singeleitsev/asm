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
lea rcx,szGlBindAttribLocation
call WriteLog

;3.1. Bind aPos to Attribute location 0
mov rcx,gpShaderProgram
xor rdx,rdx ;Attribute Location = 0
lea r8,szAttributePos
call qword ptr[gpGlBindAttribLocation]

;3.2. Bind aNormal to Attribute location 1
mov rcx,gpShaderProgram
mov rdx,1 ;Attribute Location
lea r8,szAttributeNormal
call qword ptr[gpGlBindAttribLocation]

;3.3. Bind aDiffuse to Attribute location 2
mov rcx,gpShaderProgram
mov rdx,2 ;Attribute Location
lea r8,szAttributeDiffuse
call qword ptr[gpGlBindAttribLocation]

;3.4. Bind aSpecular to Attribute location 3
mov rcx,gpShaderProgram
mov rdx,3 ;Attribute Location
lea r8,szAttributeSpecular
call qword ptr[gpGlBindAttribLocation]

;3.5. Bind aAmbient to Attribute location 4
mov rcx,gpShaderProgram
mov rdx,4 ;Attribute Location
lea r8,szAttributeAmbient
call qword ptr[gpGlBindAttribLocation]

;3.6. Bind aEmissive to Attribute location 5
mov rcx,gpShaderProgram
mov rdx,5 ;Attribute Location
lea r8,szAttributeEmissive
call qword ptr[gpGlBindAttribLocation]

;3.7. Bind aProps0 to Attribute location 6
mov rcx,gpShaderProgram
mov rdx,6 ;Attribute Location
lea r8,szAttributeProps0
call qword ptr[gpGlBindAttribLocation]

;3.8. Bind aProps1 to Attribute location 7
mov rcx,gpShaderProgram
mov rdx,7 ;Attribute Location
lea r8,szAttributeProps1
call qword ptr[gpGlBindAttribLocation]

;3.9. Report Success
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
je lbl_GetProgram_Error

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

;7. Uniforms
lea rcx,szGlGetUniformLocation
call WriteLog

;7.1.1. Projection
mov rcx,gpShaderProgram
lea rdx,szUniformProjection
call qword ptr[gpGlGetUniformLocation]
cmp rax,-1
je lbl_UniformLocation_Error
mov uLocationProjection,rax

;7.1.2. View
mov rcx,gpShaderProgram
lea rdx,szUniformView
call qword ptr[gpGlGetUniformLocation]
cmp rax,-1
je lbl_UniformLocation_Error
mov uLocationView,rax

;7.1.3. Model
mov rcx,gpShaderProgram
lea rdx,szUniformModel
call qword ptr[gpGlGetUniformLocation]
cmp rax,-1
je lbl_UniformLocation_Error
mov uLocationModel,rax

;7.1.4. Camera Position
mov rcx,gpShaderProgram
lea rdx,szUniformCamera
call qword ptr[gpGlGetUniformLocation]
cmp rax,-1
je lbl_UniformLocation_Error
mov uLocationCamera,rax

;7.2. Light Direction
mov rcx,gpShaderProgram
lea rdx,szUniformLightDir
call qword ptr[gpGlGetUniformLocation]
cmp rax,-1
je lbl_UniformLocation_Error
mov uLocationLightDir,rax

;7.3. Report Uniform Success
lea rcx,szOK
call WriteLog

;8. Report General Success
lea rcx,szLinkShadersSuccess
call WriteLog

jmp lbl_End

;Errors
lbl_GetProgram_Error:
mov rcx,gpShaderProgram
mov rdx,1023 ;maxLength
lea r8,shaderLogLength
lea r9,shaderLogBuffer
call qword ptr[gpGlGetProgramInfoLog]
lea rcx,shaderLogBuffer
call WriteLog
lea rcx,szCRLF
call WriteLog
jmp lbl_End

lbl_UniformLocation_Error:
LOG_TEXT szErrUniformNotFound
;jmp lbl_End

lbl_End:
EPILOG
LinkShaders endp


