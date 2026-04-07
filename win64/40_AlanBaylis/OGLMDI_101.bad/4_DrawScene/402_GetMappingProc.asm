;Set the Cube's Polygons
GetMapping proc

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

lea rdi,vbo ;ex-Cube Vertices
xor rcx,rcx ;Counter

vbroadcastss xmm4,dword ptr[f32_100]
vbroadcastss xmm5,dword ptr[f32_200]
vbroadcastss xmm6,dword ptr[f32_1]

lbl_NextUV:
;Convert to float range -100..100 to 0..1:
;u = (x - minX) / (maxX - minX)
;v = (y - minY) / (maxY - minY)
;(coord-(-100)) / (100-(-100))
vmovups xmm0,xmmword ptr[rdi] ;junk,z,y,x
vaddps xmm1,xmm0,xmm4 ;junk,z+100,y+100,x+100
vdivps xmm2,xmm1,xmm5 ;junk,(z+100)/200,(y+100)/200,(x+100)/200

;Determine face (0..5) = vertex_index / 4
mov eax,ecx
shr eax,2 ;eax = face index

;Select u and v based on face
cmp eax,0
je lbl_GetMapping_Front
cmp eax,1
je lbl_GetMapping_Back
cmp eax,2
je lbl_GetMapping_Top
cmp eax,3
je lbl_GetMapping_Bottom
cmp eax,4
je lbl_GetMapping_Right
cmp eax,5
je lbl_GetMapping_Left
;None of the above
jmp lbl_GetMapping_End ;If error

lbl_GetMapping_Front:
;u = x_norm, v = y_norm
vmovss dword ptr[rdi+18h],xmm2 ;u = x = xmm2[0]
vpextrd dword ptr[rdi+1Ch],xmm2,1 ;v = y = xmm2[1]
jmp lbl_GetMapping_Shift

lbl_GetMapping_Back:
;u = 1 - x_norm, v = y_norm
vsubss xmm3,xmm6,xmm2
vmovss dword ptr[rdi+18h],xmm3 ;u = 1-x = xmm3[0]
vpextrd dword ptr[rdi+1Ch],xmm2,1 ;v = y = xmm2[1]
jmp lbl_GetMapping_Shift

lbl_GetMapping_Top:
;u = x_norm, v = z_norm
vmovss dword ptr[rdi+18h],xmm2 ;u = x = xmm2[0]
vpextrd dword ptr[rdi+1Ch],xmm2,2 ;v = z = xmm2[2]
jmp lbl_GetMapping_Shift

lbl_GetMapping_Bottom:
;u = x_norm, v = 1 - z_norm
vmovss dword ptr[rdi+18h],xmm2 ;u = x = xmm2[0]
vsubps xmm3,xmm6,xmm2
vpextrd dword ptr[rdi+1Ch],xmm3,2 ;v = 1-z = xmm3[2]
jmp lbl_GetMapping_Shift

lbl_GetMapping_Right:
;u = z_norm, v = y_norm
vpextrd dword ptr[rdi+18h],xmm2,2 ;u = z = xmm2[2]
vpextrd dword ptr[rdi+1Ch],xmm2,1 ;v = y = xmm2[1]
jmp lbl_GetMapping_Shift

lbl_GetMapping_Left:
;u = 1 - z_norm, v = y_norm
vsubps xmm3,xmm6,xmm2
vpextrd dword ptr[rdi+18h],xmm3,2 ;u = 1-z = xmm3[2]
vpextrd dword ptr[rdi+1Ch],xmm2,1 ;v = y = xmm2[1]

lbl_GetMapping_Shift:
add rdi,20h
inc rcx
cmp rcx,18h ;24 vertices
jl lbl_NextUV

lbl_GetMapping_End: ;In case of error during the Fase selection
;Epilogue
leave
ret
GetMapping endp


