FloatConvert proc f32_Value:DWORD, lpszOutput:QWORD
;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov f32_Value,ecx
mov lpszOutput,rdx

finit
fld f32_Value
fabs
fst f32_Absolute
;fxtract
;fstp f32_Exponent ;Integral Part of a Logarithm
;fstp f32_Mantissa ;Fractional Part of Logarithm

;mov ecx,f32_Value
cmp ecx,f32_Absolute
jne lbl_Negative

lbl_Positive:
mov i8_Sign,0
;lea rdx,lpszOutput
;mov byte ptr [rdx],02Bh ;ASCII +
;inc rdx
jmp @f

lbl_Negative:
mov i8_Sign,1
;lea rdx,lpszOutput
mov byte ptr [rdx],02Dh ;ASCII -
inc rdx

@@:
;fld f32_Absolute
fisttp i32_IntegerPart ;<-- Integer Part must be Truncated: fisTTp
fld f32_Absolute
fisub i32_IntegerPart
fmul f32_10000 ;4 Decimal Digits in Fractional Part
fistp i32_FractionalPart ;<-- Fractional Part must be Rounded, not Truncated: fisTp
;Convert to Packed BCD
fild i32_IntegerPart
fbstp bcd80_IntegerPart
fild i32_FractionalPart
fbstp bcd80_FractionalPart

;Integer Part
lea rax,bcd80_IntegerPart ;Last Byte = First Two Digits
add rax,1 ;Limit Integer Part to 3 Digits = 2 Bytes
xor r10,r10
mov r10b,byte ptr [rax]
and r10b,0Fh ;Clean the Outside
mov rbx,r10 ;Store Digit 1
cmp bl,0 ;Skip Digit 1 if Digit 1 is a Zero
je @f
add r10b,30h ;Turn into ASCII
mov byte ptr [rdx],r10b ;Store Least Digit
inc rdx ;Next Byte in the Output String
@@:
dec rax ;Next (i.e. Previous) Source Byte
mov r10b,byte ptr [rax]
shr r10b,4 ;Shift the Greater Semi-Byte = Greater Digit
and r10b,0Fh ;Clean the Outside
add bl,r10b ;Digit 1 + Digit 2
cmp bl,0 ;Skip Digit 2 if Digit 1 and Digit 2 are Zeroes
je @f
add r10b,30h ;Turn into ASCII
mov byte ptr [rdx],r10b ;Store Greater Digit
inc rdx ;Next Byte in the Output String
@@:
mov r10b,byte ptr [rax]
and r10b,0Fh ;Clean the Outside
add r10b,30h ;Turn into ASCII
mov byte ptr [rdx],r10b ;Store Least Digit
inc rdx ;Next Byte in the Output String

;Decimal Separator
mov byte ptr [rdx],02Eh ;ASCII .
inc rdx

;Fractional Part
lea rax,bcd80_FractionalPart ;Last Byte = First Two Digits
add rax,1 ;Limit Fractional Part to 4 Digits = 2 Bytes
xor r10,r10 ;Counter
mov r10b,2 ;Limit Fractional Part to 4 Digits = 2 Bytes
xor r11,r11
lbl_GetFractional:
mov r11b,byte ptr [rax]
shr r11b,4 ;Shift the Greater Semi-Byte = Greater Digit
and r11b,0Fh ;Clean the Outside
add r11b,30h ;Turn into ASCII
mov byte ptr [rdx],r11b ;Store Greater Digit
inc rdx ;Next Byte in the Output String
mov r11b,byte ptr [rax]
and r11b,0Fh ;Clean the Outside
add r11b,30h ;Turn into ASCII
mov byte ptr [rdx],r11b ;Store Least Digit
inc rdx ;Next Byte in the Output String
dec rax ;Next (i.e. Previous) Source Byte
dec r10b ;Cycle Counter
cmp r10b,0
jg lbl_GetFractional

mov byte ptr [rdx],0

add rsp,100h
;Since the Proc has NO parameters
;Assembler will add this epilogue automatically:
;leave
ret
FloatConvert endp

