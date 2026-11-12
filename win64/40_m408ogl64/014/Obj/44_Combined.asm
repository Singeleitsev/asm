findOrAddCombinedVertices proc
PROLOG 100h

;Bridge to the Vulkan layer
;Temporarily 1 combined vertex per index
;BuildGeometry emits unique VNC per face-vertex

mov rax,gpVertices
mov gpObjCombined,rax

mov rax,gpIndices
mov gpObjIndices,rax

mov eax,gnTotalIndices
mov gnCurrentCombinedCount,eax 

mov eax,gnTotalIndices
mov gnCurrentIndexCount,eax

lbl_Done:
mov rax,1
;jmp lbl_End

lbl_End:
EPILOG
findOrAddCombinedVertices endp


