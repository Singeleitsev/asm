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

;3.1. Attribute location 0 (aPos)
lea rcx,szGlEnableVertexAttribArray
call WriteLog
xor rcx,rcx 
call qword ptr[gpGlEnableVertexAttribArray]
lea rcx,szOK
call WriteLog

;3.2. Attribute location 1 (aNormal)
lea rcx,szGlEnableVertexAttribArray
call WriteLog
mov rcx,1
call qword ptr[gpGlEnableVertexAttribArray]
lea rcx,szOK
call WriteLog

;3.3. Attribute location 2 (aColor)
lea rcx,szGlEnableVertexAttribArray
call WriteLog
mov rcx,2
call qword ptr[gpGlEnableVertexAttribArray]
lea rcx,szOK
call WriteLog

;4. Bind Vertex Buffer
lea rcx,szGlBindBuffer
call WriteLog
mov rcx, 8892h ;GL_ARRAY_BUFFER
mov rdx,VboVerticesID
call qword ptr[gpGlBindBuffer]
lea rcx,szOK
call WriteLog

;5.1. Position: location 0, size 3, offset 0
lea rcx,szGlVertexAttribPointer
call WriteLog

xor rcx,rcx ;attribute location 0 (aPos)
mov rdx,3 ;size
mov r8,1406h
xor r9,r9 ;normalized = GL_FALSE
mov qword ptr[rsp+20h],STRIDE
mov qword ptr[rsp+28h],0 ;offset 0 in VBO
call qword ptr[gpGlVertexAttribPointer]

lea rcx,szOK
call WriteLog

;5.2. Normal: location 1, size 3, offset 12
lea rcx,szGlVertexAttribPointer
call WriteLog

mov rcx,1 ;attribute location 1 (aNormal)
mov rdx,3 ;size
mov r8,1406h
xor r9,r9 ;normalized = GL_FALSE
mov qword ptr[rsp+20h],STRIDE
mov qword ptr[rsp+28h],12 ;offset 12 in VBO
call qword ptr[gpGlVertexAttribPointer]

lea rcx,szOK
call WriteLog

;5.3. Color: location 2, size 3, offset 24
lea rcx,szGlVertexAttribPointer
call WriteLog

mov rcx,2 ;attribute location 2 (aColor)
mov rdx,3 ;size
mov r8,1406h ;GL_FLOAT
xor r9,r9 ;normalized = GL_FALSE
mov qword ptr[rsp+20h],STRIDE
mov qword ptr[rsp+28h],24 ;offset 24 in VBO
call qword ptr[gpGlVertexAttribPointer]

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


