ConvertFloat proc f32_Value:REAL4, pszOutput:DWORD
LOCAL f32_Absolute:DWORD,bcd80_Absolute:TBYTE

;Extract the absolute
fld f32_Value ;st(0) = f32_Value = -1234.56789
fabs
fst f32_Absolute ;f32_Absolute = st(0) = 1234.56789

mov edi,pszOutput

mov ecx,f32_Value
cmp ecx,f32_Absolute ;-1234.56789 != 1234.56789
je NotNegative

;ShowMinus:
;edi = pszOutput
mov byte ptr[edi],02Dh ;ASCII Minus Sign
inc edi

NotNegative:
;st(0) = f32_Absolute = 1234.56789
fmul f32_10K ;4 Decimal Digits in Fractional Part ;st(0) = 12345678.9
fbstp bcd80_Absolute ;bcd80_Absolute = Binary-Coded Decimal(79563412h)

;Integer Part

;This Multi-Digit String can't be Built with a Cycle
;Because the Integer Part Consists of Four Digits Only
;And the Last Digit is Set with the Specific Algorithm
;Because the Last Digit can't be Omitted even if it is Zero

lea esi,bcd80_Absolute ;esi = addressof(First Byte = Last Two Digits = 79h)
add esi,3 ;esi = addressof(Last Byte = First Two Digits = 12h)
xor edx,edx ;Clean the Buffer to store the Current Digit

;Digit0:
mov dl,byte ptr[esi] ;dl = 12h
shr dl,4 ;dl = 01h
mov ebx,edx ;Create a Buffer in EBX to Check for Leading Zeroes
cmp bl,0 ;If Digit 1 is a Zero Then Skip it
je Digit1
or dl,30h ;Turn into ASCII
mov byte ptr [edi],dl ;Store the First Digit to the Text String
inc edi ;Next Byte in the Output String

Digit1:
mov dl,byte ptr[esi] ;dl = 12h
and dl,0Fh ;dl = 02h
add bl,dl ;Buffer of Leading Zeroes = Digit 1 + Digit 2
cmp bl,0 ;Skip Digit 2 if Both Digit 1 and Digit 2 are Zeroes
je Digit2
or dl,30h ;Turn into ASCII
mov byte ptr [edi],dl ;Store the Second Digit to the Text String
inc edi ;Next Byte in the Output String

Digit2:
dec esi ;Next Source Byte, i.e. Previous Byte in the Memory
mov dl,byte ptr [esi] ;dl = 34h
;Shift to the Greater Semi-Byte = Greater Digit
shr dl,4 ;dl = 03h
add bl,dl ;Buffer of Leading Zeroes = Digit 1 + Digit 2 + Digit 3
cmp bl,0 ;Skip Digit 3 if All Three Digits are Zeroes
je Digit3
or dl,30h ;Turn into ASCII
mov byte ptr [edi],dl ;Store the Third Digit to the Text String
inc edi ;Next Byte in the Output String

Digit3:
mov dl,byte ptr [esi] ;dl = 34h
and dl,0Fh ;dl = 04h
add dl,30h ;Turn into ASCII
mov byte ptr [edi],dl ;Store the Forth Digit to the Text String
inc edi ;Next Byte in the Output String

;Decimal Separator

mov byte ptr [edi],02Eh ;ASCII Point Sign
inc edi

;Fractional Part

dec esi ;esi = addressof(Third Two Digits = 56h)
xor ecx,ecx ;Counter
mov cl,2 ;Limit Fractional Part to 4 Digits = 2 Bytes
xor edx,edx
GetFractional:
mov dl,byte ptr [esi]
shr dl,4 ;Shift the Greater Semi-Byte = Greater Digit
and dl,0Fh ;Clean the Outside
or dl,30h ;Turn into ASCII
mov byte ptr [edi],dl ;Store Greater Digit
inc edi ;Next Byte in the Output String
mov dl,byte ptr [esi]
and dl,0Fh ;Clean the Outside
or dl,30h ;Turn into ASCII
mov byte ptr [edi],dl ;Store Least Digit
inc edi ;Next Byte in the Output String
dec esi ;Next (i.e. Previous) Source Byte
dec cl ;Cycle Counter
cmp cl,0
jg GetFractional

;Mark the End of the String with the Zero Byte
mov byte ptr[edi],0

ret
ConvertFloat endp


