;-----------------------------------------------------------
; ParseFloat - Convert null-terminated ASCII string to float
; Input:  RCX = pointer to string (must be at least one digit)
; Output: RAX = updated pointer, xmm0,xmm1,xmm2 = float values
;-------------------------------------------------------------
parseFloat proc
PROLOG 100h

lbl_SkipSpace:
cmp byte ptr[rcx],20h ;Space
je lbl_SkipSpace_Inc
cmp byte ptr [rcx],9 ;Tab
jne @f
lbl_SkipSpace_Inc:
inc rcx
jmp lbl_SkipSpace

@@:
xorps xmm0,xmm0 ;result = 0.0
xorps xmm1,xmm1 ;sign = +1.0
movss xmm2,f32_1 ;multiplier for sign

;Check sign
cmp byte ptr[rcx],2Dh ;Minus sign
jne @f
movss xmm2,f32_neg1
inc rcx

@@:
;Integer part
xor rax,rax
xor rdx,rdx ;intPart = 0

lbl_IntLoop:
mov al,byte ptr[rcx]
cmp al,30h ;ASCII "0"
jl lbl_IntDone
cmp al,39h ;ASCII "9"
jg lbl_IntDone

xor al,30h
imul edx,edx,0Ah ;Multiply previous number by 10
add edx,eax
inc rcx
jmp lbl_IntLoop

lbl_IntDone:
cvtsi2ss xmm0,edx ;xmm0 = float(intPart)

;Fraction part
cmp byte ptr[rcx],2Eh ;Period sign
jne lbl_FracDone
inc rcx

xor rax,rax
xor r8,r8 ;fracPart = 0
xor r9,r9 ;digits = 0

lbl_FracLoop:
mov al, byte ptr[rcx]
cmp al,30h ;ASCII "0"
jb lbl_FracDone
cmp al,39h ;ASCII "9"
ja lbl_FracDone

xor al,30h
imul r8d,0Ah ;Multiply previous number by 10
add r8d,eax
inc r9d
inc rcx
jmp lbl_FracLoop

lbl_FracDone:
test r9d,r9d
jz lbl_ApplySign

;frac = frac / 10^digits
mov edx,r9d
movss xmm3,f32_1 ;divisor = 1.0

lbl_DivLoop:
mulss xmm3,f32_0p1
dec edx
jnz lbl_DivLoop

cvtsi2ss xmm4,r8d
mulss xmm4,xmm3
addss xmm0,xmm4

lbl_ApplySign:
mulss xmm0,xmm2 ;apply sign

mov rax,rcx ;Return updated pointer in RAX
EPILOG
parseFloat endp



parseFloat3 proc
PROLOG 100h

;r
call parseFloat
movss xmm3,xmm0
;g
mov rcx,rax
call skipSpace
mov rcx,rax
call parseFloat
movss xmm4,xmm0
;b
mov rcx,rax
call skipSpace
mov rcx,rax
call parseFloat 

;Store Color Components to xmm Registers
movss xmm2,xmm0 ;b
movss xmm1,xmm4 ;g
movss xmm0,xmm3 ;r

mov rax,rcx ;Return updated pointer in RAX
EPILOG
parseFloat3 endp



