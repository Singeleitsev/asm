;======================================================================
Spell64 proc num64:QWORD, hwnd:QWORD, lpszCaption:QWORD, lpszText:QWORD
;======================================================================

;Translate the Hexadecimal Number
;From RCX = Binary Value 
;To ASCII String and show it by a MessageBox
;Arg1: RÑX = Source Value
;Arg2: RDX = Handle of the Calling Window (may be 0)
;Arg3: R8 = Pointer to szCaption for MessageBox
;Arg4: R9 = Pointer to szText db "RCX Value: 0000.0000.0000.0000h",0
;Out: MessageBox with uType = MB_OK + MB_ICONINFORMATION

;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;LOCAL xxx:QWORD

and rsp,-16 ;Align the Stack
sub rsp,20h ;Create the Buffer

;Store Values
mov num64,rcx
mov hwnd,rdx
mov lpszCaption,r8
mov lpszText,r9

;Find the Last Significant Byte of szText
;szText must contain "0000.0000.0000.0000h"
;And therefore at Least 20 bytes are non-zero
;r9 = Start of szText
add r9,13h ;Skip 19 non-zero bytes

lbl_Spell64_CheckFor0:
inc r9 ;Next Byte
cmp byte ptr [r9],0
jne lbl_Spell64_CheckFor0

sub r9,2 ;Address of the Last Digit in the String that ends with ...,"0h",0

;Put in RCX two counters at once:
;CH = 4 External Cycles and CL = 4 Internal Cycles
xor rcx,rcx ;Clean the Container
mov ch,4 ;Set the External Cycles

Next4Digits:
mov cl, 4 ;Set the Internal Cycles

;Extract the Least Hexadecimal Digit (4 bits)
NextByte:
mov rax,num64 ;Load the Source to Changeable Container
and rax,0Fh ;Leave the least 4 bits only

;Convert the Hexadecimal from Binary to ASCII code
;If ax contains [0;9] then add 30h
;If ax contains [A;F] then add 37h
cmp ax,9
jg add37h
add ax,30h
jmp SetByte

add37h:
add ax,37h

;Store the byte
SetByte:
mov byte ptr [r9],al
ror num64,4 ;Rotate the Source to the right by 4 bits
dec r9 ;Next Digit of the Destination String
dec cl ;Decrease the Internal Counter
cmp cl, 0
jg NextByte

dec r9 ;Skip the Address of the 4 Digits Separator Point
dec ch ;Decrease the External Counter
cmp ch, 0
jg Next4Digits

ShowMessage:
;sub rsp, 20h
mov rcx, hwnd
mov rdx, lpszText
mov r8, lpszCaption
mov r9, 40h ;uType = MB_OK + MB_ICONINFORMATION = 0 + 40h
call MessageBoxA
;add rsp, 20h

;Normal Exit
lbl_Spell64_End:
add rsp,20h

;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave

ret
Spell64 endp
