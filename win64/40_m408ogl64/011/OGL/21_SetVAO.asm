SetVAO proc
PROLOG 100h

;1. Create VAO
lea rcx,szGlGenVertexArrays
call WriteLog
mov rcx,1
lea rdx,VaoID
call qword ptr[gpGlGenVertexArrays]
lea rcx,szOK
call WriteLog

;2. Bind Vertex Array
lea rcx,szGlBindVertexArray
call WriteLog
mov rcx,VaoID
call qword ptr[gpGlBindVertexArray]
lea rcx,szOK
call WriteLog

;3. Bind Vertex Buffer
lea rcx,szGlBindBuffer
call WriteLog
mov rcx, 8892h ;GL_ARRAY_BUFFER
mov rdx,VboVerticesID
call qword ptr[gpGlBindBuffer]
lea rcx,szOK
call WriteLog



;4. Enable Vertex Attrib Arrays
lea rcx,szGlEnableVertexAttribArray
call WriteLog

;4.1. Attribute location 0: aPos (vec4) — offset 0
xor rcx,rcx 
call qword ptr[gpGlEnableVertexAttribArray]
;4.2. Attribute location 1: aNormal (vec4) — offset 16
mov rcx,1
call qword ptr[gpGlEnableVertexAttribArray]
;4.3. Attribute location 2: aDiffuse (vec4) — offset 32
mov rcx,2
call qword ptr[gpGlEnableVertexAttribArray]
;4.4. Attribute location 3: aSpecular (vec4) — offset 48
mov rcx,3
call qword ptr[gpGlEnableVertexAttribArray]
;4.5. Attribute location 4: aAmbient (vec4) — offset 64
mov rcx,4
call qword ptr[gpGlEnableVertexAttribArray]
;4.6. Attribute location 5: aEmissive (vec4) — offset 80
mov rcx,5
call qword ptr[gpGlEnableVertexAttribArray]
;4.7. Attribute location 6: aProps0 (vec4) — offset 96
mov rcx,6
call qword ptr[gpGlEnableVertexAttribArray]
;4.8. Attribute location 7: aProps1 (vec4) — offset 112
mov rcx,7
call qword ptr[gpGlEnableVertexAttribArray]
;4.9. Report Success
lea rcx,szOK
call WriteLog



;5.Vertex Attrib Pointers
lea rcx,szGlVertexAttribPointer
call WriteLog

;5.1. Attribute pointer 0: aPos (vec4) — offset 0
xor rcx,rcx ;attribute location
mov rdx,4 ;size
mov r8,1406h
xor r9,r9 ;normalized = GL_FALSE
mov qword ptr[rsp+20h],STRIDE
mov qword ptr[rsp+28h],0 ;offset 0 in VBO
call qword ptr[gpGlVertexAttribPointer]

;5.2. Attribute pointer 1: aNormal (vec4) — offset 16
mov rcx,1 ;attribute location
mov rdx,4 ;size
mov r8,1406h
xor r9,r9 ;normalized = GL_FALSE
mov qword ptr[rsp+20h],STRIDE
mov qword ptr[rsp+28h],10h ;offset in VBO
call qword ptr[gpGlVertexAttribPointer]

;5.3. Attribute pointer 2: aDiffuse (vec4) — offset 32
mov rcx,2 ;attribute location
mov rdx,4 ;size
mov r8,1406h ;GL_FLOAT
xor r9,r9 ;normalized = GL_FALSE
mov qword ptr[rsp+20h],STRIDE
mov qword ptr[rsp+28h],20h ;offset in VBO
call qword ptr[gpGlVertexAttribPointer]

;5.4. Attribute pointer 3: aSpecular (vec4) — offset 48
mov rcx,3 ;attribute location
mov rdx,4 ;size
mov r8,1406h ;GL_FLOAT
xor r9,r9 ;normalized = GL_FALSE
mov qword ptr[rsp+20h],STRIDE
mov qword ptr[rsp+28h],30h ;offset in VBO
call qword ptr[gpGlVertexAttribPointer]

;5.5. Attribute pointer 4: aAmbient (vec4) — offset 64
mov rcx,4 ;attribute location
mov rdx,4 ;size
mov r8,1406h ;GL_FLOAT
xor r9,r9 ;normalized = GL_FALSE
mov qword ptr[rsp+20h],STRIDE
mov qword ptr[rsp+28h],40h ;offset in VBO
call qword ptr[gpGlVertexAttribPointer]

;5.6. Attribute pointer 5: aEmissive (vec4) — offset 80
mov rcx,5 ;attribute location
mov rdx,4 ;size
mov r8,1406h ;GL_FLOAT
xor r9,r9 ;normalized = GL_FALSE
mov qword ptr[rsp+20h],STRIDE
mov qword ptr[rsp+28h],50h ;offset in VBO
call qword ptr[gpGlVertexAttribPointer]

;5.7. Attribute pointer 6: aProps0 (vec4) — offset 96
mov rcx,6 ;attribute location
mov rdx,4 ;size
mov r8,1406h ;GL_FLOAT
xor r9,r9 ;normalized = GL_FALSE
mov qword ptr[rsp+20h],STRIDE
mov qword ptr[rsp+28h],60h ;offset in VBO
call qword ptr[gpGlVertexAttribPointer]

;5.8. Attribute pointer 7: aProps1 (vec4) — offset 112
mov rcx,7 ;attribute location
mov rdx,4 ;size
mov r8,1406h ;GL_FLOAT
xor r9,r9 ;normalized = GL_FALSE
mov qword ptr[rsp+20h],STRIDE
mov qword ptr[rsp+28h],70h ;offset in VBO
call qword ptr[gpGlVertexAttribPointer]

;5.9. Report Success
lea rcx,szOK
call WriteLog



;6. Unbind
lea rcx,szGlBindVertexArray
call WriteLog
xor rcx,rcx
call qword ptr[gpGlBindVertexArray]
lea rcx,szOK
call WriteLog

;7. Success
lea rcx,szVaoSuccess
call WriteLog

jmp SetVAO_End

;SetVAO_Error:
;lea rcx,szErrSetVAO
;call WriteLog

SetVAO_End:
EPILOG
SetVAO endp


