lbl_CheckKeys:

;if (key[49])
lbl_Key1:
lea rax,key
add rax,31h
cmp byte ptr [rax],0
je lbl_Key2
;if (Zoom < 1)
movss xmm0,f32_1
comiss xmm0,Zoom
jbe lbl_Key2
;Zoom += 0.001;
movss xmm0,Zoom
addss xmm0,f32_0p001
movss Zoom,xmm0

;if (key[50])
lbl_Key2:
lea rax,key
add rax,32h
cmp byte ptr [rax],0
je lbl_Key3
;if (Zoom > 0)
movss xmm0,Zoom
xorss xmm1,xmm1
comiss xmm0,xmm1
jbe lbl_Key3
;Zoom -= 0.001;
movss xmm0,Zoom
subss xmm0,f32_0p001
movss Zoom,xmm0

;if (key[51])
lbl_Key3:
lea rax,key
add rax,33h
cmp byte ptr [rax],0
je lbl_Key4
;VerticalShift += 1;
inc VerticalShift

;if (key[52])
lbl_Key4:
lea rax,key
add rax,34h
cmp byte ptr [rax],0
je lbl_Key5
;VerticalShift -= 1;
dec VerticalShift

;if (key[53])
lbl_Key5:
lea rax,key
add rax,35h
cmp byte ptr [rax],0
je lbl_Key6
;HorizontalShift += 1;
inc HorizontalShift

;if (key[54])
lbl_Key6:
lea rax,key
add rax,36h
cmp byte ptr [rax],0
je lbl_KeySpace
;HorizontalShift -= 1;
dec HorizontalShift

;if (key[VK_SPACE])
lbl_KeySpace:
lea rax,key
add rax,20h
cmp byte ptr [rax],0
je lbl_NextChild
call SetVertices
call SetPolygons

;jmp lbl_NextChild
