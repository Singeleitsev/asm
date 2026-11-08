;-------------------------------------------------------
;parseString – Reads a string into a destination buffer.
;Input:
;rsi = source pointer
;rdi = destination pointer
;Output:
;rsi = updated source pointer
;rdi = updated destination pointer
;Destination buffer contains the null-terminated name
;----------------------------------------------------

parseString proc
PROLOG 100h

call skipSpace

;Safety check – prevent buffer overflow
mov rcx,3Fh ;maximum length = 63 bytes and Delimiter

;Copy name until delimiter
lbl_CopyByte:
mov al,byte ptr [rsi]
cmp al,21h ;Left ASCII Range Border
jl lbl_Done
cmp al,7Fh ;Right ASCII Range Border
jge lbl_Done

;Copy character
mov byte ptr [rdi], al
inc rsi
inc rdi
dec rcx
jnz lbl_CopyByte

;End of name
lbl_Done:
mov byte ptr [rdi],0 ;null-terminate

;rsi = end of source name, at the delimiter
;rdi = end of destination name, at the delimiter

EPILOG
parseString endp


