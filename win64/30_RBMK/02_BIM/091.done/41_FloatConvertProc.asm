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
fld f32_Value ;st(0) = f32_Value = float(-1234.56789)
fabs
fst f32_Absolute ;f32_Absolute = st(0) = float(1234.56789)
;fxtract
;fstp f32_Exponent ;Integral Part of a Logarithm
;fstp f32_Mantissa ;Fractional Part of Logarithm

;mov ecx,f32_Value
cmp ecx,f32_Absolute ;float(-1234.56789) != float(1234.56789)
je @f ;Skip if Not Negative

;lbl_TypeMinus:
;lea rdx,lpszOutput
mov byte ptr [rdx],02Dh ;ASCII Minus Sign
inc rdx

@@:
;fld f32_Absolute
fmul f32_10000 ;4 Decimal Digits in Fractional Part ;st(0) = float(12345678.9)
fbstp bcd80_Absolute ;bcd80_Absolute = int(79563412h)

;Integer Part
;This Multi-Digit String can't be Built with a Cycle
;Because the Integer Part Consists of Four Digits Only
;And the Last Digit is Set with the Specific Algorithm
;Because the Last Digit can't be Omitted even it is Zero
lea rax,bcd80_Absolute ;rax = addressof(First Byte = Last Two Digits = 79h)
add rax,3 ;rax = addressof(Last Byte = First Two Digits = 12h)
;mov rdx,lpszOutput
xor r10,r10 ;Clean the Buffer
mov r10b,byte ptr [rax] ;r10b = 12h
shr r10b,4 ;r10b = 01h
;and r10b,0Fh ;Leave the Least Digit Only
mov rbx,r10 ;Create a Buffer in RBX to Check for Leading Zeroes
cmp bl,0 ;If Digit 1 is a Zero Then Skip it
je @f
or r10b,30h ;Turn into ASCII
mov byte ptr [rdx],r10b ;Store the First Digit to the Text String
inc rdx ;Next Byte in the Output String
@@:
mov r10b,byte ptr [rax] ;r10b = 12h
and r10b,0Fh ;r10b = 02h
add bl,r10b ;Buffer of Leading Zeroes = Digit 1 + Digit 2
cmp bl,0 ;Skip Digit 2 if Both Digit 1 and Digit 2 are Zeroes
je @f
or r10b,30h ;Turn into ASCII
mov byte ptr [rdx],r10b ;Store the Second Digit to the Text String
inc rdx ;Next Byte in the Output String
@@:
dec rax ;Next Source Byte, i.e. Previous Byte in the Memory
mov r10b,byte ptr [rax] ;r10b = 34h
;Shift to the Greater Semi-Byte = Greater Digit
shr r10b,4 ;r10b = 03h
;and r10b,0Fh ;Leave the Least Digit Only
add bl,r10b ;Buffer of Leading Zeroes = Digit 1 + Digit 2 + Digit 3
cmp bl,0 ;Skip Digit 3 if All Three Digits are Zeroes
je @f
or r10b,30h ;Turn into ASCII
mov byte ptr [rdx],r10b ;Store the Third Digit to the Text String
inc rdx ;Next Byte in the Output String
@@:
mov r10b,byte ptr [rax] ;r10b = 34h
and r10b,0Fh ;r10b = 04h
add r10b,30h ;Turn into ASCII
mov byte ptr [rdx],r10b ;Store the Forth Digit to the Text String
inc rdx ;Next Byte in the Output String

;Decimal Separator
mov byte ptr [rdx],02Eh ;ASCII Point Sign
inc rdx

;Fractional Part
dec rax ;rax = addressof(Third Two Digits = 56h)
xor rcx,rcx ;Counter
mov cl,2 ;Limit Fractional Part to 4 Digits = 2 Bytes
xor r10,r10
lbl_GetFractional:
mov r10b,byte ptr [rax]
shr r10b,4 ;Shift the Greater Semi-Byte = Greater Digit
and r10b,0Fh ;Clean the Outside
or r10b,30h ;Turn into ASCII
mov byte ptr [rdx],r10b ;Store Greater Digit
inc rdx ;Next Byte in the Output String
mov r10b,byte ptr [rax]
and r10b,0Fh ;Clean the Outside
or r10b,30h ;Turn into ASCII
mov byte ptr [rdx],r10b ;Store Least Digit
inc rdx ;Next Byte in the Output String
dec rax ;Next (i.e. Previous) Source Byte
dec cl ;Cycle Counter
cmp cl,0
jg lbl_GetFractional

;Mark the End of the String with the Zero Byte
mov byte ptr [rdx],0

add rsp,100h
;Since the Proc has NO parameters
;Assembler will add this epilogue automatically:
;leave
ret
FloatConvert endp

