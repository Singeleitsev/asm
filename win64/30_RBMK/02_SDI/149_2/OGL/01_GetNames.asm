GetNames proc
PROLOG 100h

;Load the Entry Points from the vendor's driver DLL

;VBO - OpenGL 1.5

lea rcx,szGlGenBuffers
call wglGetProcAddress
mov gpGlGenBuffers,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlBindBuffer
call wglGetProcAddress
mov gpGlBindBuffer,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlBufferData
call wglGetProcAddress
mov gpGlBufferData,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlDeleteBuffers
call wglGetProcAddress
mov gpGlDeleteBuffers,rax

;Attributes

lea rcx,szGlEnableVertexAttribArray
call wglGetProcAddress
mov gpGlEnableVertexAttribArray,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlDisableVertexAttribArray
call wglGetProcAddress
mov gpGlDisableVertexAttribArray,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlVertexAttribPointer
call wglGetProcAddress
mov gpGlVertexAttribPointer,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlGetAttribLocation
call wglGetProcAddress
mov gpGlGetAttribLocation,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlBindAttribLocation
call wglGetProcAddress
mov gpGlBindAttribLocation,rax
test rax,rax
jz GetNames_Error

;Shaders - OpenGL 2.0

lea rcx,szGlCreateShader
call wglGetProcAddress
mov gpGlCreateShader,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlShaderSource
call wglGetProcAddress
mov gpGlShaderSource,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlCompileShader
call wglGetProcAddress
mov gpGlCompileShader,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlGetShaderiv
call wglGetProcAddress
mov gpGlGetShaderiv,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlCreateProgram
call wglGetProcAddress
mov gpGlCreateProgram,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlAttachShader
call wglGetProcAddress
mov gpGlAttachShader,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlLinkProgram
call wglGetProcAddress
mov gpGlLinkProgram,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlGetProgramiv
call wglGetProcAddress
mov gpGlGetProgramiv,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlUseProgram
call wglGetProcAddress
mov gpGlUseProgram,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlDeleteShader
call wglGetProcAddress
mov gpGlDeleteShader,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlDeleteProgram
call wglGetProcAddress
mov gpGlDeleteProgram,rax
test rax,rax
jz GetNames_Error

;Shader uniforms

lea rcx,szGlGetUniformLocation
call wglGetProcAddress
mov gpGlGetUniformLocation,rax
test rax,rax
jz GetNames_Error

lea rcx,szGlUniform3f
call wglGetProcAddress
mov gpGlUniform3f,rax
test rax,rax
jz GetNames_Error

;OpenGL Logger

lea rcx,szGlGetShaderInfoLog
call wglGetProcAddress
mov gpGlGetShaderInfoLog,rax

lea rcx,szGlGetProgramInfoLog
call wglGetProcAddress
mov gpGlGetProgramInfoLog,rax

jmp GetNames_End

GetNames_Error:
lea rcx,szErrLoadExtension
call WriteLog

GetNames_End:
EPILOG
GetNames endp


