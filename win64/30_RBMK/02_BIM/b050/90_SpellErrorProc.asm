SpellError proc lpszErrText:QWORD, lenErrText:QWORD
;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov lpszErrText,rcx ;Store the Received Address
mov lenErrText,rdx ;Store the Received Length

Call GetLastError
mov nLastError,rax

mov rdi,lpszErrText
add rdi,lenErrText
dec rdi ;rdi = Address of the Last Digit

xor rcx,rcx ; Clean the Counter

jmp @f ;Temporarily jump
;mov rax,nLastError ;Is Already There

lbl_CalcOneByte:
xor rbx,rbx
mov bl,al
cmp bl,9
jg lbl_Over9
add bl,30h
jmp lbl_StoreHexDigit
lbl_Over9:
add bl,41h

lbl_StoreHexDigit:
mov byte ptr [rdi],bl
shr rax,8
dec rdi
inc cl
cmp cl,3
jl lbl_CalcOneByte

@@:
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
