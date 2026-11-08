;rdi = gpMaterialUBOMap (dest,128-byte stride)
;rsi = gpBuffer_newmtl (src,168-byte stride)

repackMaterials proc
PROLOG 100h

mov rsi,gpBuffer_newmtl
mov rdi,gpMaterialUBOMap
mov r10d,gnCount_newmtl
test r10d,r10d
jz lbl_done

lbl_loop:
;Kd (offset 0)
mov eax,[rsi+OFFSET_KD+0]
mov [rdi+0],eax
mov eax,[rsi+OFFSET_KD+4]
mov [rdi+4],eax
mov eax,[rsi+OFFSET_KD+8]
mov [rdi+8],eax

;Ks (offset 16)
mov eax,[rsi+OFFSET_KS+0]
mov [rdi+16],eax
mov eax,[rsi+OFFSET_KS+4]
mov [rdi+20],eax
mov eax,[rsi+OFFSET_KS+8]
mov [rdi+24],eax

;Ka (offset 32)
mov eax,[rsi+OFFSET_KA+0]
mov [rdi+32],eax
mov eax,[rsi+OFFSET_KA+4]
mov [rdi+36],eax
mov eax,[rsi+OFFSET_KA+8]
mov [rdi+40],eax

;Ke (offset 48)
mov eax,[rsi+OFFSET_KE+0]
mov [rdi+48],eax
mov eax,[rsi+OFFSET_KE+4]
mov [rdi+52],eax
mov eax,[rsi+OFFSET_KE+8]
mov [rdi+56],eax

;Tf (offset 64)
mov eax,[rsi+OFFSET_TF+0]
mov [rdi+64],eax
mov eax,[rsi+OFFSET_TF+4]
mov [rdi+68],eax
mov eax,[rsi+OFFSET_TF+8]
mov [rdi+72],eax

;Ns (offset 80)
mov eax,[rsi+OFFSET_NS]
mov [rdi+80],eax

;Ni (offset 84)
mov eax,[rsi+OFFSET_NI]
mov [rdi+84],eax

;d (offset 88)
mov eax,[rsi+OFFSET_D]
mov [rdi+88],eax

;Tr (offset 92)
mov eax,[rsi+OFFSET_TR]
mov [rdi+92],eax

;Pr (offset 96)
mov eax,[rsi+OFFSET_PR]
mov [rdi+96],eax

;Pm (offset 100)
mov eax,[rsi+OFFSET_PM]
mov [rdi+100],eax

;Pc (offset 104)
mov eax,[rsi+OFFSET_PC]
mov [rdi+104],eax

;Pcr (offset 108)
mov eax,[rsi+OFFSET_PCR]
mov [rdi+108],eax

;illum (offset 112)
mov eax,[rsi+OFFSET_ILLUM]
mov [rdi+112],eax

add rsi,SIZE_NEWMTL_METADATA ;168
add rdi,128 ;repacked stride
dec r10d
jnz lbl_loop

lbl_done:
mov rax,1
EPILOG
repackMaterials endp


