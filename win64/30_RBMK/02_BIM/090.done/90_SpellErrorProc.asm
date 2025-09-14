SpellError proc lpszErrText:QWORD, lpszErrCode:QWORD
;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov lpszErrText,rcx ;Store the Received Address
mov lpszErrCode,rdx ;Store the Received Length

Call GetLastError
mov nLastError,rax ;Get Source
xor rbx,rbx ;Clear Buffer
mov rcx,4 ;Set Counter

lbl_CalcOneByte:
mov bl,al
and bl,0Fh
cmp bl,9
jg lbl_Over9

add bl,30h
jmp lbl_StoreHexDigit

lbl_Over9:
add bl,37h ;41h-0Ah = 37h

lbl_StoreHexDigit:
mov byte ptr [rdx],bl
shr rax,4
dec rdx
dec cl
cmp cl,0
jg lbl_CalcOneByte

mov rcx,ghWnd
mov rdx,lpszErrText
lea r8,szMainWndTitle
xor r9,r9 ;MB_OK = 0x00000000L
Call MessageBoxA

add rsp,100h
;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave
ret
SpellError endp
