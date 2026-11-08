;-------------------------------------------------------
;parseString – Reads a string into a destination buffer.
;Input:
;esi = source pointer
;edi = destination pointer
;Output:
;esi = updated source pointer
;edi = updated destination pointer
;Destination buffer contains the null-terminated name
;----------------------------------------------------

parseString proc

call skipSpace

;Safety check – prevent buffer overflow
mov ecx,3Fh ;maximum length = 63 bytes and Delimiter

;Copy name until delimiter
lbl_CopyByte:
mov al,byte ptr [esi]
cmp al,21h ;Left ASCII Range Border
jl lbl_Done
cmp al,7Fh ;Right ASCII Range Border
jge lbl_Done

;Copy character
mov byte ptr [edi], al
inc esi
inc edi
dec ecx
jnz lbl_CopyByte

;End of name
lbl_Done:
mov byte ptr [edi],0 ;null-terminate

;esi = end of source name, at the delimiter
;edi = end of destination name, at the delimiter

ret
parseString endp


