parseGroup proc
PROLOG 100h

LOG_TEXT szParsingGroup

lbl_Done:
mov rax,rcx ;Return the Current Pointer

lbl_End:
EPILOG
parseGroup endp

