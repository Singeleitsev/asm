;vertex.asm

;Vertex Shader SPIR-V (simple pass-through)
;Magic number 0x07230203
;Version 0x00010000 (SPIR-V 1.0)
;Input: vec2 at location 0 (inPos)
;Output: gl_Position as vec4(x, y, 0.0, 1.0)

;glsl
;#version 450
;layout(location = 0) in vec2 inPos;
;void main() {gl_Position = vec4(inPos, 0.0, 1.0);}

vert_spv \
db 03h,02h,23h,07h,00h,00h,01h,00h,01h,00h,08h,00h,0Ch,00h,00h,00h
db 00h,00h,00h,00h,11h,00h,02h,00h,01h,00h,00h,00h,0Bh,00h,06h,00h
db 01h,00h,00h,00h,47h,4Ch,53h,4Ch,2Eh,73h,74h,64h,2Eh,34h,35h,30h
db 00h,00h,00h,00h,0Eh,00h,03h,00h,00h,00h,00h,00h,01h,00h,00h,00h
db 0Fh,00h,07h,00h,00h,00h,00h,00h,04h,00h,00h,00h,6Dh,61h,69h,6Eh
db 00h,00h,00h,00h,0Bh,00h,00h,00h,03h,00h,00h,00h,10h,00h,03h,00h
db 04h,00h,00h,00h,07h,00h,00h,00h,03h,00h,03h,00h,02h,00h,00h,00h
db 0C2h,01h,00h,00h,05h,00h,04h,00h,04h,00h,00h,00h,6Dh,61h,69h,6Eh
db 00h,00h,00h,00h,05h,00h,05h,00h,0Bh,00h,00h,00h,69h,6Eh,5Fh,70h
db 6Fh,73h,00h,00h,05h,00h,04h,00h,0Dh,00h,00h,00h,67h,6Ch,5Fh,50h
db 65h,72h,56h,65h,72h,74h,65h,78h,00h,00h,00h,00h,47h,00h,04h,00h
db 0Bh,00h,00h,00h,1Eh,00h,00h,00h,00h,00h,00h,00h,47h,00h,04h,00h
db 0Dh,00h,00h,00h,0Bh,00h,00h,00h,00h,00h,00h,00h,13h,00h,02h,00h
db 02h,00h,00h,00h,21h,00h,03h,00h,03h,00h,00h,00h,02h,00h,00h,00h
db 16h,00h,03h,00h,06h,00h,00h,00h,20h,00h,00h,00h,17h,00h,04h,00h
db 07h,00h,00h,00h,06h,00h,00h,00h,04h,00h,00h,00h,17h,00h,04h,00h
db 08h,00h,00h,00h,06h,00h,00h,00h,02h,00h,00h,00h,20h,00h,04h,00h
db 09h,00h,00h,00h,01h,00h,00h,00h,08h,00h,00h,00h,3Bh,00h,04h,00h
db 09h,00h,00h,00h,0Bh,00h,00h,00h,01h,00h,00h,00h,20h,00h,04h,00h
db 0Ch,00h,00h,00h,03h,00h,00h,00h,07h,00h,00h,00h,3Bh,00h,04h,00h
db 0Ch,00h,00h,00h,0Dh,00h,00h,00h,03h,00h,00h,00h,2Bh,00h,04h,00h
db 06h,00h,00h,00h,0Eh,00h,00h,00h,00h,00h,00h,00h,2Bh,00h,04h,00h
db 06h,00h,00h,00h,0Fh,00h,00h,00h,00h,00h,80h,3Fh,36h,00h,05h,00h
db 02h,00h,00h,00h,04h,00h,00h,00h,00h,00h,00h,00h,03h,00h,00h,00h
db 0F8h,00h,02h,00h,05h,00h,00h,00h,3Dh,00h,04h,00h,08h,00h,00h,00h
db 10h,00h,00h,00h,0Bh,00h,00h,00h,51h,00h,05h,00h,06h,00h,00h,00h
db 11h,00h,00h,00h,10h,00h,00h,00h,00h,00h,00h,00h,51h,00h,05h,00h
db 06h,00h,00h,00h,12h,00h,00h,00h,10h,00h,00h,00h,01h,00h,00h,00h
db 50h,00h,07h,00h,07h,00h,00h,00h,13h,00h,00h,00h,11h,00h,00h,00h
db 12h,00h,00h,00h,0Eh,00h,00h,00h,0Fh,00h,00h,00h,41h,00h,05h,00h
db 0Ch,00h,00h,00h,14h,00h,00h,00h,0Dh,00h,00h,00h,00h,00h,00h,00h
db 3Eh,00h,03h,00h,14h,00h,00h,00h,13h,00h,00h,00h,0FDh,00h,01h,00h
db 38h,00h,01h,00h