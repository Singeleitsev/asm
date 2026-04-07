lbl_CheckKeys:

lea rsi,key

cmp byte ptr [rsi+21h],0 ;VK_PRIOR
je @f
;if (Zoom < 1)
movss xmm0,Zoom
comiss xmm0,f32_1
jge @f
;Zoom += 0.001;
movss xmm0,Zoom
addss xmm0,f32_0p001
movss Zoom,xmm0

@@:
cmp byte ptr [rsi+22h],0 ;VK_NEXT
je @f
;if (Zoom > 0)
xorps xmm0,xmm0
comiss xmm0,Zoom
jge @f
;Zoom -= 0.001;
movss xmm0,Zoom
subss xmm0,f32_0p001
movss Zoom,xmm0

@@:
cmp byte ptr [rsi+26h],0 ;VK_UP
je @f
;VerticalShift += 1;
inc VerticalShift

@@:
cmp byte ptr [rsi+28h],0 ;VK_DOWN
je @f
;VerticalShift -= 1;
dec VerticalShift

@@:
cmp byte ptr [rsi+27h],0 ;VK_RIGHT
je @f
;HorizontalShift += 1;
inc HorizontalShift

@@:
cmp byte ptr [rsi+25h],0 ;VK_LEFT
je @f
;HorizontalShift -= 1;
dec HorizontalShift

@@:
cmp byte ptr [rsi+20h],0 ;VK_SPACE
je @f
call SetVertices
call SetPolygons

@@:


