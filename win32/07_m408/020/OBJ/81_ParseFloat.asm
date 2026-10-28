;-----------------------------------------------------------
; ParseFloat - Convert null-terminated ASCII string to float
; Input:  esi = string pointer (must be at least one digit)
; Output: esi = updated pointer, xmm0 = float value
;-------------------------------------------------------------
parseFloat proc

call skipSpace

xorps xmm0,xmm0 ;result = 0.0
xorps xmm1,xmm1 ;sign = +1.0
movss xmm2,f32_posOne ;multiplier for sign

;Check sign
cmp byte ptr[esi],2Dh ;Minus sign
jne @f
movss xmm2,f32_negOne
inc esi

@@:
;Integer part
xor eax,eax
xor ebx,ebx ;intPart = 0

lbl_IntLoop:
mov al,byte ptr[esi]
cmp al,30h ;ASCII "0"
jl lbl_IntDone
cmp al,39h ;ASCII "9"
jg lbl_IntDone

xor al,30h
imul ebx,ebx,0Ah ;Multiply previous number by 10
add ebx,eax
inc esi
jmp lbl_IntLoop

lbl_IntDone:
cvtsi2ss xmm0,ebx ;xmm0 = float(intPart)

;Fraction part
cmp byte ptr[esi],2Eh ;Period sign
jne lbl_FracDone
inc esi

xor eax,eax
xor ecx,ecx ;fracPart = 0
xor edx,edx ;digits = 0

lbl_FracLoop:
mov al, byte ptr[esi]
cmp al,30h ;ASCII "0"
jb lbl_FracDone
cmp al,39h ;ASCII "9"
ja lbl_FracDone

xor al,30h
imul ecx,0Ah ;Multiply previous number by 10
add ecx,eax
inc edx
inc esi
jmp lbl_FracLoop

lbl_FracDone:
test edx,edx
jz lbl_ApplySign

;frac = frac / 10^digits
mov ebx,edx
movss xmm3,f32_posOne ;divisor = 1.0

lbl_DivLoop:
mulss xmm3,f32_0p1
dec ebx
jnz lbl_DivLoop

cvtsi2ss xmm4,ecx
mulss xmm4,xmm3
addss xmm0,xmm4

lbl_ApplySign:
mulss xmm0,xmm2 ;apply sign

;esi = updated pointer
ret
parseFloat endp


