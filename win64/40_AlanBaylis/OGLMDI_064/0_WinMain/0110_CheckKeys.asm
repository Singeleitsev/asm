lbl_CheckKeys:

lea rsi,key

cmp byte ptr [rsi+20h],0 ;VK_SPACE
je @f
call SetVertices
call SetPolygons

@@:


