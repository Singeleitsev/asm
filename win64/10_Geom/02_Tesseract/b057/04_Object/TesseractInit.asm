
;There are two Buffers for the Vertices
;the Front Buffer (v3D) which is used
;as the source for Drawing
;and the Back Buffer (v4D) which is used
;as the storage of the Previous Position.

;Get the Initial Coordinates (v0)
;from the Read-Only Memory
;to the Changeable Front Buffer (v3D)
;and simultaneously re-arrange them.

;Initial Structure is Convenient for
;describing the Geometry by a Human:
;x0,y0,z0,w0, ..., x15,y15,z15,w15
;Operational Structure is Arranged for
;proceeding with the AVX-Extention:
;x0, ..., x15, ..., w0, ..., w15

lea r8,v0
;add r8,0 ;x0 - Source
lea r9,v3D
;add r9,0 ;x0 - Destination

lea r10,v0
add r10,4 ;y0 - Source
lea r11,v3D
add r11,40h ;y0 - Destination ;16 coordinates * 4 bytes

lea r12,v0
add r12,8  ;z0 - Source
lea r13,v3D
add r13,80h  ;z0 - Destination

lea r14,v0
add r14,0Ch  ;w0 - Source
lea r15,v3D
add r15,0C0h  ;w0 - Destination


mov rcx,10h ;16 Vertices
lbl_LoadBuffer:
mov eax, dword ptr [r8] ;x
mov dword ptr [r9],eax
mov eax, dword ptr [r10] ;y
mov dword ptr [r11],eax
mov eax, dword ptr [r12] ;z
mov dword ptr [r13],eax
mov eax, dword ptr [r14] ;w
mov dword ptr [r15],eax
add r8,10h ;Source - Next Point
add r9,4 ;Destination - Next Coordinate
add r10,10h ;Source - Next Point
add r11,4 ;Destination - Next Coordinate
add r12,10h ;Source - Next Point
add r13,4 ;Destination - Next Coordinate
add r14,10h ;Source - Next Point
add r15,4 ;Destination - Next Coordinate
dec cx
cmp cx,0
jg lbl_LoadBuffer
