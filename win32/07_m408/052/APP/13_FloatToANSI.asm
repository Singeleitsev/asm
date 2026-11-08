;Converts a 32-bit floating point to a string of ANSI bytes
;Input: binFloatValue = bit pattern of IEEE-754 float
;pszOutput = address of the string buffer

;GPRs only implementation

;In .data section, we have the pre-set strings:
;szZero db "0.0000",0,0 ;Two dwords
;szNaN db "NaN",0 ;One dword
;szInfinity db "Inf",0 ;One dword
;szOverflow db "Too far",0 ;Two dwords

FloatToANSI proc uses ebx esi edi binFloatValue:DWORD,pszOutput:DWORD
LOCAL intPart:DWORD,fracPart:DWORD
LOCAL exponent:DWORD,mantissa:DWORD
LOCAL intBuf[16]:BYTE
LOCAL fracBuf[8]:BYTE 

mov esi,dword ptr[binFloatValue] ;esi = bit pattern of (-1234567.1234)
mov edi,pszOutput ;edi = address of the string buffer

;1.1. Detect the Sign
bt esi,31 ;CF = bit 31 of esi (the sign bit)
jnc Extract

;1.2. Write the Minus sign unconditionally,
;because it is the most probable case.
;If later Zero case will be detected,
;Then we'll overwrite the Minus with "0" character
mov byte ptr[edi],02Dh ;ASCII Minus Sign
inc edi

Extract:
;2.1. Extract exponent
mov eax,esi
shr eax,23
and eax,0FFh ;eax = exponent field E (0..255)
mov exponent,eax
;2.2. Extract mantissa
mov ebx,esi
and ebx,007FFFFFh ;ebx = mantissa field M (23 bits,no implicit 1)
mov mantissa,ebx

;3. Special / Boundary Cases
test eax,eax
jz Exp0 ;E = 0: Zero or Subnormal
cmp eax,255
je Exp255 ;E = 255: Infinity or Not a Number

;4. Reconstruct the exact dyadic value: |v| = S * 2^k
;We don't compute |v| as a number
;That's the whole point of the IEEE-754 bit route
;mov ebx,mantissa ;It's still there
or ebx,800000h ;Implicit Leading 1 (24 bits)
;mov absv,ebx

;5. Compute the true binary point shift
;relative to the 23rd bit of the mantissa
;Real exponent: Power = Exponent - 127
;The binary point shifts either left or right
;relative to the 23rd bit of the mantissa.
;Shift = 23 - Power = 23 - (Exponent - 127) = 150 - Exponent.
mov ecx,150
sub ecx,eax ;exponent 

cmp ecx,0
jle ShiftLeft
cmp ecx,24
jge WholeIsZero 

;0 < Shift < 24
;Both Integer and fractional Parts are Present
mov eax,ebx
shr eax,cl ;Implicit Leading 1 (24 bits)
mov intPart,eax

;Extract fractional bits with the mask
mov edx,1
shl edx,cl
dec edx ;(1 << cl) - 1
and ebx,edx ;ebx = fractional bits only
jmp ScaleFraction

;Shift >= 24 (Less than 1.0)
WholeIsZero:
mov intPart,0
jmp ScaleFraction

;Shift <= 0 (Large Integer)
ShiftLeft:
neg ecx
cmp ecx,32
jge Overflow ;n >= 32: shift count would be masked by shld/shl

;Safe 64-bit shift: compute significand << n in EDX:EAX
xor edx,edx
mov eax,ebx ;eax = significand (24 bits)
shld edx,eax,cl ;edx = bits shifted past bit 31
shl eax,cl ;eax = low 32 bits of (significand << n)

;If EDX != 0, the value >= 2^32 and does not fit in 32-bit intPart
test edx,edx
jnz Overflow

mov intPart,eax
xor ebx,ebx ;fractional part is 0 for large integers
xor ecx,ecx
jmp ScaleFraction

ScaleFraction:
;ebx = fractional bits,ecx = scale (2^ecx)
test ebx,ebx
jz NoFraction

;float < 0.00005 rounds to 0.0000
cmp ecx,38
jae NoFraction

;64-bit shift requires cl < 32. If cl >= 32, pre-shift ebx right.
cmp ecx,31
jbe DoScale64

;cl >= 32: pre-shift ebx right by (cl - 31), then set cl = 31
sub ecx,31
shr ebx,cl
mov ecx,31

DoScale64:
mov eax,ebx
mov edx,100000
mul edx
;Shift right by cl across the 64-bit pair (cl <= 31 here)
shrd eax,edx,cl
;eax = floor(ebx * 100000 / 2^ecx)  (5-digit-or-less value)

;Round-half-up to 4 digits: add 5, then divide by 10
add eax,5
xor edx,edx
mov ecx,10
div ecx
;eax = rounded 4-digit fraction (may be 10000)

;Handle carry out of the fraction
cmp eax,10000
jb StoreFrac
sub eax,10000
inc intPart
StoreFrac:
mov fracPart,eax
jmp EmitInteger

NoFraction:
mov fracPart,0

EmitInteger:
mov eax,intPart
test eax,eax
jnz ProcessDigits

mov byte ptr [edi],'0'
inc edi
mov ebx,10
jmp EmitDot

ProcessDigits:
lea esi,[intBuf + 15] 
mov ebx,10
xor ecx,ecx ;ECX will be digit count

LoopInt:
xor edx,edx
div ebx
add dl,'0' 
mov byte ptr [esi],dl
dec esi
inc ecx
test eax,eax
jnz LoopInt

;Copy digits to output
CopyLoop:
inc esi ;Move back to the first digit
mov al,byte ptr [esi]
mov byte ptr [edi],al
inc edi
loop CopyLoop

EmitDot:
mov byte ptr [edi],'.'
inc edi

;Output exactly 4 fractional digits with zero-padding
mov eax,fracPart 
mov ecx,4 
lea esi,[fracBuf + 4] ;ESI points to end of fracBuf

LoopFrac:
xor edx,edx ;Clear EDX for DIV
div ebx ;EBX is still 10
add dl,'0'
dec esi
mov byte ptr [esi],dl
loop LoopFrac

;Copy fraction to output
mov ecx,4

CopyFrac:
mov al,byte ptr[esi]
mov byte ptr[edi],al
inc esi
inc edi
loop CopyFrac

mov byte ptr [edi],0
jmp FloatToANSI_End

Exp0:
;E = 0,M = 0: Zero
;E = 0,M != 0: Subnormal,treated as 0
mov edi,pszOutput ;Reload the address to wipe out the "-" sign if it's set
mov eax,dword ptr[szZero+0] ;"0.0000",0,0
mov dword ptr[edi],eax ;"0.00"
mov eax,dword ptr[szZero+4]
mov dword ptr[edi+4],eax ;"00",0,0
jmp FloatToANSI_End

Exp255:
;E = 255,M = 0: Infinity
;E = 255,M != 0: Not a Number
test ebx,ebx ;mantissa = 0?
jz Infinity

;NaN:
mov edi,pszOutput ;Reload the address to wipe out the "-" sign if it's set
mov eax,dword ptr[szNaN] ;"NaN",0
mov dword ptr[edi],eax
jmp FloatToANSI_End

Infinity:
mov eax,dword ptr[szInfinity] ;"Inf",0
mov dword ptr[edi],eax
jmp FloatToANSI_End

Overflow:
mov edi,pszOutput ;Reload the address to wipe out the "-" sign if it's set
mov eax,dword ptr[szOverflow+0] ;"Too "
mov dword ptr[edi],eax
mov eax,dword ptr[szOverflow+4] ;"far",0
mov dword ptr[edi+4],eax
jmp FloatToANSI_End

FloatToANSI_End:
ret
FloatToANSI endp


