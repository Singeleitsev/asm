;-----------------------------------------------------------
; ParseFloat - Convert null-terminated ASCII string to float
; Input:  rsi = pointer to string (must be at least one digit)
; Output: rsi = updated pointer, xmm0 = float value
;-------------------------------------------------------------
parseFloat proc
PROLOG 100h

call skipSpace

xorps xmm0,xmm0 ;result = 0.0
xorps xmm1,xmm1 ;sign = +1.0
movss xmm2,f32_posOne ;multiplier for sign

;Check sign
cmp byte ptr[rsi],2Dh ;Minus sign
jne @f
movss xmm2,f32_negOne
inc rsi

@@:
;Integer part
xor rax,rax
xor rbx,rbx ;intPart = 0
xor rdx,rdx ;digits = 0

lbl_IntLoop:
movzx eax,byte ptr[rsi]
cmp al,30h ;ASCII "0"
jl lbl_IntDone
cmp al,39h ;ASCII "9"
jg lbl_IntDone

xor al,30h
imul ebx,ebx,0Ah ;Multiply previous number by 10
add ebx,eax
inc rsi
jmp lbl_IntLoop

lbl_IntDone:
cvtsi2ss xmm0,ebx ;xmm0 = float(intPart)

;Fraction part
cmp byte ptr[rsi],2Eh ;Period sign
jne lbl_FracDone
inc rsi

xor rax,rax
xor rcx,rcx ;fracPart = 0
xor rdx,rdx ;digits = 0

lbl_FracLoop:
movzx eax, byte ptr[rsi]
cmp al,30h ;ASCII "0"
jb lbl_FracDone
cmp al,39h ;ASCII "9"
ja lbl_FracDone

xor al,30h
imul ecx,ecx,0Ah ;Multiply previous number by 10
add ecx,eax
inc rdx
inc rsi
jmp lbl_FracLoop

lbl_FracDone:
test rdx,rdx
jz lbl_ApplySign

;frac = frac / 10^digits
mov rbx,rdx
movss xmm3,f32_posOne ;divisor = 1.0

lbl_DivLoop:
mulss xmm3,f32_0p1
dec rbx
jnz lbl_DivLoop

cvtsi2ss xmm4,ecx
mulss xmm4,xmm3
addss xmm0,xmm4

lbl_ApplySign:
mulss xmm0,xmm2 ;apply sign

;rsi = updated pointer
EPILOG
parseFloat endp


