FloatConvert proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov ecx,zCam
mov rdx,lpsz_zCam
lea r8,sz_zCam

finit
fld zCam
fabs
fst Absolute32
;fxtract
;fstp Exponent32 ;Integral Part of a Logarithm
;fstp Mantissa32 ;Fractional Part of Logarithm

;mov ecx,zCam
cmp ecx,Absolute32
jne lbl_Negative

lbl_Positive:
mov Sign32,0

;mov byte ptr [rdx],02Bh ;ASCII +
;inc rdx
jmp @f

lbl_Negative:
mov Sign32,1
lea rdx,lpsz_zCam
mov byte ptr [rdx],02Dh ;ASCII -
inc rdx

@@:
;fld Absolute32
fisttp IntegerPart32
fld Absolute32
fisub IntegerPart32
fstp FractionalPart32

movss xmm0,Absolute32
movss xmm1,IntegerPart32
movss xmm2,FractionalPart32

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
FloatConvert endp
