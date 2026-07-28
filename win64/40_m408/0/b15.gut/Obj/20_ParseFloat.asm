;-----------------------------------------------------------------------------
; ParseFloat - Convert null-terminated ASCII string to float
; Input:  RSI = pointer to string (must be at least one digit)
; Output: ST(0) = float value
; Modifies: RAX, RBX, RCX, RDX, RDI
;-----------------------------------------------------------------------------
ParseFloat proc
PROLOG 100h

xorps xmm0,xmm0 ;result = 0.0
xorps xmm1,xmm1 ;sign = +1.0
movss xmm2,f32_1 ;multiplier for sign

@@:
;Skip spaces
cmp byte ptr[rsi],20h ;Space
jne @f
inc rsi
jmp @b

@@:
;Check sign
cmp byte ptr[rsi],2Dh ;Minus sign
jne @f
movss xmm2,f32_neg1
inc rsi

@@:
;Integer part
xor rax,rax
xor ecx,ecx ;intPart = 0

lbl_IntLoop:
mov al,byte ptr [rsi]
cmp al,30h ;ASCII "0"
jl lbl_IntDone
cmp al,39h ;ASCII "9"
jg lbl_IntDone

xor al,30h
imul ecx,ecx,0Ah ;Multiply previous number by 10
add ecx,eax
inc rsi
jmp lbl_IntLoop

lbl_IntDone:
cvtsi2ss xmm0,ecx ;xmm0 = float(intPart)

;Fraction part
cmp byte ptr[rsi],2Eh ;Period sign
jne lbl_FracDone
inc rsi

xor rax,rax
xor edx,edx ;fracPart = 0
xor r8d,r8d ;digits = 0

lbl_FracLoop:
mov al, byte ptr[rsi]
cmp al,30h ;ASCII "0"
jb lbl_FracDone
cmp al,39h ;ASCII "9"
ja lbl_FracDone

xor al,30h
imul edx,0Ah ;Multiply previous number by 10
add edx,eax
inc r8d
inc rsi
jmp lbl_FracLoop

lbl_FracDone:
test r8d,r8d
jz lbl_ApplySign

;frac = frac / 10^digits
mov ecx,r8d
movss xmm3,f32_1 ;divisor = 1.0

lbl_DivLoop:
mulss xmm3,f32_0p1
dec ecx
jnz lbl_DivLoop

cvtsi2ss xmm4,edx
mulss xmm4,xmm3
addss xmm0,xmm4

lbl_ApplySign:
mulss xmm0,xmm2 ;apply sign

EPILOG
ParseFloat endp
