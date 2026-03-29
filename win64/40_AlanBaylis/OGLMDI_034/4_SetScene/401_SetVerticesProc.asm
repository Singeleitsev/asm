SetVertices proc
;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;and rsp,-16 ;Align the Stack
;sub rsp,100h ;Create the Buffer

;Set the Cube's Vertices
lea rdi,vtx ;rdi = AddressOf vertex[0].x
mov eax,042c80000h ;100.0f
mov ebx,0c2c80000h ;-100.0f

mov dword ptr[rdi+00h],ebx ;vertex[0].x = -100.0f
mov dword ptr[rdi+04h],ebx ;vertex[0].y = -100.0f
mov dword ptr[rdi+08h],eax ;vertex[0].z = 100.0f

mov dword ptr[rdi+10h],eax ;vertex[1].x = 100.0f
mov dword ptr[rdi+14h],ebx ;vertex[1].y = -100.0f
mov dword ptr[rdi+18h],eax ;vertex[1].z = 100.0f

mov dword ptr[rdi+20h],eax ;vertex[2].x = 100.0f
mov dword ptr[rdi+24h],eax ;vertex[2].y = 100.0f
mov dword ptr[rdi+28h],eax ;vertex[2].z = 100.0f

mov dword ptr[rdi+30h],ebx ;vertex[3].x = -100.0f
mov dword ptr[rdi+34h],eax ;vertex[3].y = 100.0f
mov dword ptr[rdi+38h],eax ;vertex[3].z = 100.0f

mov dword ptr[rdi+40h],ebx ;vertex[4].x = -100.0f
mov dword ptr[rdi+44h],ebx ;vertex[4].y = -100.0f
mov dword ptr[rdi+48h],ebx ;vertex[4].z = -100.0f

mov dword ptr[rdi+50h],eax ;vertex[5].x = 100.0f
mov dword ptr[rdi+54h],ebx ;vertex[5].y = -100.0f
mov dword ptr[rdi+58h],ebx ;vertex[5].z = -100.0f

mov dword ptr[rdi+60h],eax ;vertex[6].x = 100.0f
mov dword ptr[rdi+64h],eax ;vertex[6].y = 100.0f
mov dword ptr[rdi+68h],ebx ;vertex[6].z = -100.0f

mov dword ptr[rdi+70h],ebx ;vertex[7].x = -100.0f
mov dword ptr[rdi+74h],eax ;vertex[7].y = 100.0f
mov dword ptr[rdi+78h],ebx ;vertex[7].z = -100.0f

;lbl_SetVertices_End:
add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
SetVertices endp

