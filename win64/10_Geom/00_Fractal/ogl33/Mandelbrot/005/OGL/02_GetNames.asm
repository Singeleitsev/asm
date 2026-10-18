GetNames proc
PROLOG 100h

;Load the Entry Points from the vendor's driver DLL

;ARB Functions

lea rcx,szWglCreateContextAttribsARB
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpWglCreateContextAttribsARB,rax

lea rcx,szWglChoosePixelFormatARB
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpWglChoosePixelFormatARB,rax

;VBO - OpenGL 1.5

lea rcx,szGlGenBuffers
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlGenBuffers,rax

lea rcx,szGlBindBuffer
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlBindBuffer,rax

lea rcx,szGlBufferData
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlBufferData,rax

lea rcx,szGlDeleteBuffers
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlDeleteBuffers,rax

;VAO

lea rcx,szGlEnableVertexAttribArray
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlEnableVertexAttribArray,rax

lea rcx,szGlDisableVertexAttribArray
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlDisableVertexAttribArray,rax

lea rcx,szGlVertexAttribPointer
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlVertexAttribPointer,rax

lea rcx,szGlGetAttribLocation
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlGetAttribLocation,rax

lea rcx,szGlBindAttribLocation
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlBindAttribLocation,rax

lea rcx,szGlGenVertexArrays
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlGenVertexArrays,rax

lea rcx,szGlBindVertexArray
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlBindVertexArray,rax

lea rcx,szGlDeleteVertexArrays
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlDeleteVertexArrays,rax

;Shaders - OpenGL 2.0

lea rcx,szGlCreateShader
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlCreateShader,rax

lea rcx,szGlShaderSource
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlShaderSource,rax

lea rcx,szGlCompileShader
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlCompileShader,rax

lea rcx,szGlGetShaderiv
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlGetShaderiv,rax

lea rcx,szGlCreateProgram
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlCreateProgram,rax

lea rcx,szGlAttachShader
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlAttachShader,rax

lea rcx,szGlLinkProgram
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlLinkProgram,rax

lea rcx,szGlGetProgramiv
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlGetProgramiv,rax

lea rcx,szGlUseProgram
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlUseProgram,rax

lea rcx,szGlDeleteShader
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlDeleteShader,rax

lea rcx,szGlDeleteProgram
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlDeleteProgram,rax

;Uniforms

lea rcx,szGlGetUniformLocation
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlGetUniformLocation,rax

lea rcx,szGlUniformMatrix4fv
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlUniformMatrix4fv,rax

lea rcx,szGlUniform3f
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlUniform3f,rax

lea rcx,szGlUniform2f
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlUniform2f,rax

lea rcx,szGlUniform1f
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlUniform1f,rax

;OpenGL Logger

lea rcx,szGlGetShaderInfoLog
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlGetShaderInfoLog,rax

lea rcx,szGlGetProgramInfoLog
call wglGetProcAddress
test rax,rax
jz GetNames_Error
mov gpGlGetProgramInfoLog,rax

jmp GetNames_End

GetNames_Error:
lea rcx,szErrLoadExtension
call WriteLog

GetNames_End:
EPILOG
GetNames endp


