;fragment.asm

;Fragment Shader SPIR-V (output red colour)

;Magic 0x07230203, version 0x00010000
;Output: red colour (1.0, 0.0, 0.0, 1.0)

;glsl
;#version 450
;layout(location = 0) out vec4 outColor;
;void main() {outColor = vec4(1.0, 0.0, 0.0, 1.0);}

frag_spv \
db 03h,02h,23h,07h,00h,00h,01h,00h,01h,00h,08h,00h
db 08h,00h,00h,00h,00h,00h,00h,00h,11h,00h,02h,00h
db 01h,00h,00h,00h,0Bh,00h,06h,00h,01h,00h,00h,00h
db 47h,4Ch,53h,4Ch,2Eh,73h,74h,64h,2Eh,34h,35h,30h
db 00h,00h,00h,00h,0Eh,00h,03h,00h,00h,00h,00h,00h
db 01h,00h,00h,00h,0Fh,00h,05h,00h,00h,00h,00h,00h
db 04h,00h,00h,00h,6Dh,61h,69h,6Eh,00h,00h,00h,00h
db 0Ah,00h,00h,00h,10h,00h,03h,00h,04h,00h,00h,00h
db 07h,00h,00h,00h,03h,00h,03h,00h,02h,00h,00h,00h
db 0C2h,01h,00h,00h,05h,00h,04h,00h,04h,00h,00h,00h
db 6Dh,61h,69h,6Eh,00h,00h,00h,00h,05h,00h,04h,00h
db 0Ah,00h,00h,00h,6Fh,75h,74h,43h,6Fh,6Ch,6Fh,72h
db 00h,00h,00h,00h,47h,00h,04h,00h,0Ah,00h,00h,00h
db 1Eh,00h,00h,00h,00h,00h,00h,00h,13h,00h,02h,00h
db 02h,00h,00h,00h,21h,00h,03h,00h,03h,00h,00h,00h
db 02h,00h,00h,00h,16h,00h,03h,00h,06h,00h,00h,00h
db 20h,00h,00h,00h,17h,00h,04h,00h,07h,00h,00h,00h
db 06h,00h,00h,00h,04h,00h,00h,00h,20h,00h,04h,00h
db 08h,00h,00h,00h,03h,00h,00h,00h,07h,00h,00h,00h
db 3Bh,00h,04h,00h,08h,00h,00h,00h,0Ah,00h,00h,00h
db 03h,00h,00h,00h,2Bh,00h,04h,00h,06h,00h,00h,00h
db 0Bh,00h,00h,00h,00h,00h,00h,00h,2Bh,00h,04h,00h
db 06h,00h,00h,00h,0Ch,00h,00h,00h,00h,00h,80h,3Fh
db 2Bh,00h,04h,00h,06h,00h,00h,00h,0Dh,00h,00h,00h
db 00h,00h,00h,00h,50h,00h,07h,00h,07h,00h,00h,00h
db 0Eh,00h,00h,00h,0Ch,00h,00h,00h,0Bh,00h,00h,00h
db 0Bh,00h,00h,00h,0Ch,00h,00h,00h,41h,00h,05h,00h
db 08h,00h,00h,00h,0Fh,00h,00h,00h,0Ah,00h,00h,00h
db 00h,00h,00h,00h,3Eh,00h,03h,00h,0Fh,00h,00h,00h
db 0Eh,00h,00h,00h,0FDh,00h,01h,00h,38h,00h,01h,00h