DrawGLScene proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov rcx, 4100h;GL_COLOR_BUFFER_BIT Or GL_DEPTH_BUFFER_BIT
Call glClear

Call DrawAxes
Call DrawObject
Call CameraMove

mov rcx,ghDC
Call SwapBuffers

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
DrawGLScene endp
