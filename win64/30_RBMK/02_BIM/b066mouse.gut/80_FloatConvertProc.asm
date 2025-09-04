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
fld f32_Value ;st(0) = f32_Value = float(-123.456789)
fabs
fst f32_Absolute ;f32_Absolute = st(0) = float(123.456789)
;fxtract
;fstp f32_Exponent ;Integral Part of a Logarithm
;fstp f32_Mantissa ;Fractional Part of Logarithm

;mov ecx,f32_Value
cmp ecx,f32_Absolute ;float(-123.456789) != float(123.456789)
je @f ;Skip if Not Negative

;lbl_TypeMinus:
;lea rdx,lpszOutput
mov byte ptr [rdx],02Dh ;ASCII Minus Sign
inc rdx

@@:
;fld f32_Absolute
;Integer Part must be Truncated: fisTTp
fisttp i32_IntegerPart ;i32_IntegerPart = float(123)
fld f32_Absolute ;st(0) = float(123.456789)
fisub i32_IntegerPart ;st(0) = float(0.456789)
fmul f32_10000 ;4 Decimal Digits in Fractional Part ;st(0) = float(4567.89)
;Fractional Part must be Rounded, Not Truncated: fisTp
fistp i32_FractionalPart ;i32_FractionalPart = float(4568)
;Convert to Packed BCD
fild i32_IntegerPart ;st(0) = i32_IntegerPart = float(123)
fbstp bcd80_IntegerPart ;bcd80_IntegerPart = 2301h
fild i32_FractionalPart ;st(0) = i32_IntegerPart = float(4568)
fbstp bcd80_FractionalPart ;bcd80_FractionalPart = 6845h

;Integer Part
lea rax,bcd80_IntegerPart ;rax = addressof(First Byte = Last Two Digits = 30h)
add rax,1 ;rax = addressof(Last Byte = First Two Digits = 01h)
xor r10,r10
mov r10b,byte ptr [rax] ;r10b = 01h
;We know that our Integer Part Consists of Only Three Digits
;So We Proceed with the Least Semi-Byte
and r10b,0Fh ;r10b = 01h
mov rbx,r10 ;Create a Buffer in RBX to Check for Leading Zeroes
cmp bl,0 ;If Digit 1 is a Zero Then Skip it
je @f
or r10b,30h ;Turn into ASCII
mov byte ptr [rdx],r10b ;Store the First Digit to the Text String
inc rdx ;Next Byte in the Output String
@@:
dec rax ;Next Source Byte, i.e. Previous Byte in the Memory
mov r10b,byte ptr [rax] ;r10b = 23h
;Shift to the Greater Semi-Byte = Greater Digit
shr r10b,4 ;r10b = 02h
;and r10b,0Fh ;Leave the Least Digit Only
add bl,r10b ;Buffer of Leading Zeroes = Digit 1 + Digit 2
cmp bl,0 ;Skip Digit 2 if Both Digit 1 and Digit 2 are Zeroes
je @f
or r10b,30h ;Turn into ASCII
mov byte ptr [rdx],r10b ;Store the First Digit to the Text String
inc rdx ;Next Byte in the Output String
@@:
mov r10b,byte ptr [rax] ;r10b = 23h
and r10b,0Fh ;r10b = 03h
add r10b,30h ;Turn into ASCII
mov byte ptr [rdx],r10b ;Store the Third Digit to the Text String
inc rdx ;Next Byte in the Output String

;Decimal Separator
mov byte ptr [rdx],02Eh ;ASCII Point Sign
inc rdx

;Fractional Part
lea rax,bcd80_FractionalPart ;rax = addressof(First Byte = Last Two Digits = 68h)
add rax,1 ;rax = addressof(Last Byte = First Two Digits = 45h)
xor r10,r10 ;Counter
mov r10b,2 ;Limit Fractional Part to 4 Digits = 2 Bytes
xor r11,r11
lbl_GetFractional:
mov r11b,byte ptr [rax]
shr r11b,4 ;Shift the Greater Semi-Byte = Greater Digit
and r11b,0Fh ;Clean the Outside
or r11b,30h ;Turn into ASCII
mov byte ptr [rdx],r11b ;Store Greater Digit
inc rdx ;Next Byte in the Output String
mov r11b,byte ptr [rax]
and r11b,0Fh ;Clean the Outside
or r11b,30h ;Turn into ASCII
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

