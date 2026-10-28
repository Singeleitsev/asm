parseObject proc pCurrentSource:QWORD
PROLOG 100h

;Store the Received Argument
mov pCurrentSource,rcx

LOG_TEXT szParsingObject

lbl_Done:
mov rax,rcx ;Return the Current Pointer

lbl_End:
EPILOG
parseObject endp

